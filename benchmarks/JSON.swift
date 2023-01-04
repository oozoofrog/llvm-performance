
import Foundation


/*final public class Accelerator {
    public let uuid :String
    public init(json: JSON) throws {
        uuid = try json.getString(at: "uuid")
    }
}*/

final public class JSONMap : Codable {
    public let key0 : String
    public let key1 : String
    public let key2 : String
    public let key3 : String
    public let key4 : String
    public let key5 : String
    public let key6 : String
    public let key7 : String
    public let key8 : String
    public let key9 : String
    public let key10 : String
    public let key11 : String
    public let key12 : String
    public let key13 : String
    public let key14 : String
    public let key15 : String
    public let key16 : String
    public let key17 : String
    public let key18 : String
    public let key19 : String
    public let key20 : String
    public let key21 : String
    public let key22 : String
    public let key23 : String
    public let key24 : String
    public let key25 : String
    public let key26 : String
    public let key27 : String
    public let key28 : String
    public let key29 : String
    public let key30 : String
    public let key31 : String
    public let key32 : String
    public let key33 : String
    public let key34 : String
    public let key35 : String
    public let key36 : String
    public let key37 : String
    public let key38 : String
    public let key39 : String
    public let key40 : String
    public let key41 : String
    public let key42 : String
    public let key43 : String
    public let key44 : String
    public let key45 : String
    public let key46 : String
    public let key47 : String
    public let key48 : String
    public let key49 : String
    public let key50 : String
    public let key51 : String
    public let key52 : String
    public let key53 : String
    public let key54 : String
    public let key55 : String
    public let key56 : String
    public let key57 : String
    public let key58 : String
    public let key59 : String
    public let key60 : String
    public let key61 : String
    public let key62 : String
    public let key63 : String
    public let key64 : String
    public let key65 : String
    public let key66 : String
    public let key67 : String
    public let key68 : String
    public let key69 : String
    public let key70 : String
    public let key71 : String
    public let key72 : String
    public let key73 : String
    public let key74 : String
    public let key75 : String
    public let key76 : String
    public let key77 : String
    public let key78 : String
    public let key79 : String
    public let key80 : String
    public let key81 : String
    public let key82 : String
    public let key83 : String
    public let key84 : String
    public let key85 : String
    public let key86 : String
    public let key87 : String
    public let key88 : String
    public let key89 : String
    public let key90 : String
    public let key91 : String
    public let key92 : String
    public let key93 : String
    public let key94 : String
    public let key95 : String
    public let key96 : String
    public let key97 : String
    public let key98 : String
    public let key99 : String
    
    enum CodingKeys: String, CodingKey {
        case  key0 = "key0"
        case  key1 = "key1"
        case  key2 = "key2"
        case  key3 = "key3"
        case  key4 = "key4"
        case  key5 = "key5"
        case  key6 = "key6"
        case  key7 = "key7"
        case  key8 = "key8"
        case  key9 = "key9"
        case  key10 = "key10"
        case  key11 = "key11"
        case  key12 = "key12"
        case  key13 = "key13"
        case  key14 = "key14"
        case  key15 = "key15"
        case  key16 = "key16"
        case  key17 = "key17"
        case  key18 = "key18"
        case  key19 = "key19"
        case  key20 = "key20"
        case  key21 = "key21"
        case  key22 = "key22"
        case  key23 = "key23"
        case  key24 = "key24"
        case  key25 = "key25"
        case  key26 = "key26"
        case  key27 = "key27"
        case  key28 = "key28"
        case  key29 = "key29"
        case  key30 = "key30"
        case  key31 = "key31"
        case  key32 = "key32"
        case  key33 = "key33"
        case  key34 = "key34"
        case  key35 = "key35"
        case  key36 = "key36"
        case  key37 = "key37"
        case  key38 = "key38"
        case  key39 = "key39"
        case  key40 = "key40"
        case  key41 = "key41"
        case  key42 = "key42"
        case  key43 = "key43"
        case  key44 = "key44"
        case  key45 = "key45"
        case  key46 = "key46"
        case  key47 = "key47"
        case  key48 = "key48"
        case  key49 = "key49"
        case  key50 = "key50"
        case  key51 = "key51"
        case  key52 = "key52"
        case  key53 = "key53"
        case  key54 = "key54"
        case  key55 = "key55"
        case  key56 = "key56"
        case  key57 = "key57"
        case  key58 = "key58"
        case  key59 = "key59"
        case  key60 = "key60"
        case  key61 = "key61"
        case  key62 = "key62"
        case  key63 = "key63"
        case  key64 = "key64"
        case  key65 = "key65"
        case  key66 = "key66"
        case  key67 = "key67"
        case  key68 = "key68"
        case  key69 = "key69"
        case  key70 = "key70"
        case  key71 = "key71"
        case  key72 = "key72"
        case  key73 = "key73"
        case  key74 = "key74"
        case  key75 = "key75"
        case  key76 = "key76"
        case  key77 = "key77"
        case  key78 = "key78"
        case  key79 = "key79"
        case  key80 = "key80"
        case  key81 = "key81"
        case  key82 = "key82"
        case  key83 = "key83"
        case  key84 = "key84"
        case  key85 = "key85"
        case  key86 = "key86"
        case  key87 = "key87"
        case  key88 = "key88"
        case  key89 = "key89"
        case  key90 = "key90"
        case  key91 = "key91"
        case  key92 = "key92"
        case  key93 = "key93"
        case  key94 = "key94"
        case  key95 = "key95"
        case  key96 = "key96"
        case  key97 = "key97"
        case  key98 = "key98"
        case  key99 = "key99"

    }
    
    public init (_ key0_: String,_ key1_: String,_ key2_: String,_ key3_: String,_ key4_: String,_ key5_: String,_ key6_: String,_ key7_: String,_ key8_: String,_ key9_: String,_ key10_: String, _ key11_: String,_ key12_: String,_ key13_: String,_ key14_: String,_ key15_: String,_ key16_: String,_ key17_: String,_ key18_: String,_ key19_: String,_ key20_: String,_ key21_: String,_ key22_: String,_ key23_: String,_ key24_: String,_ key25_: String,_ key26_: String,_ key27_: String,_ key28_: String,_ key29_: String,_ key30_: String,_ key31_: String,_ key32_: String,_ key33_: String,_ key34_: String,_ key35_: String,_ key36_: String,_ key37_: String,_ key38_: String,_ key39_: String,_ key40_: String,_ key41_: String,_ key42_: String,_ key43_: String,_ key44_: String,_ key45_: String,_ key46_: String,_ key47_: String,_ key48_: String,_ key49_: String,_ key50_: String,_ key51_: String,_ key52_: String,_ key53_: String,_ key54_: String,_ key55_: String,_ key56_: String,_ key57_: String,_ key58_: String,_ key59_: String,_ key60_: String,_ key61_: String,_ key62_: String,_ key63_: String,_ key64_: String,_ key65_: String,_ key66_: String,_ key67_: String,_ key68_: String,_ key69_: String,_ key70_: String,_ key71_: String,_ key72_: String,_ key73_: String,_ key74_: String,_ key75_: String,_ key76_: String,_ key77_: String,_ key78_: String,_ key79_: String,_ key80_: String,_ key81_: String,_ key82_: String,_ key83_: String,_ key84_: String,_ key85_: String,_ key86_: String,_ key87_: String,_ key88_: String,_ key89_: String,_ key90_: String,_ key91_: String,_ key92_: String,_ key93_: String,_ key94_: String,_ key95_: String,_ key96_: String,_ key97_: String,_ key98_: String,_ key99_: String) {
        self.key0 = key0_
        self.key1 = key1_
        self.key2 = key2_
        self.key3 = key3_
        self.key4 = key4_
        self.key5 = key5_
        self.key6 = key6_
        self.key7 = key7_
        self.key8 = key8_
        self.key9 = key9_
        self.key10 = key10_
        self.key11 = key11_
        self.key12 = key12_
        self.key13 = key13_
        self.key14 = key14_
        self.key15 = key15_
        self.key16 = key16_
        self.key17 = key17_
        self.key18 = key18_
        self.key19 = key19_
        self.key20 = key20_
        self.key21 = key21_
        self.key22 = key22_
        self.key23 = key23_
        self.key24 = key24_
        self.key25 = key25_
        self.key26 = key26_
        self.key27 = key27_
        self.key28 = key28_
        self.key29 = key29_
        self.key30 = key30_
        self.key31 = key31_
        self.key32 = key32_
        self.key33 = key33_
        self.key34 = key34_
        self.key35 = key35_
        self.key36 = key36_
        self.key37 = key37_
        self.key38 = key38_
        self.key39 = key39_
        self.key40 = key40_
        self.key41 = key41_
        self.key42 = key42_
        self.key43 = key43_
        self.key44 = key44_
        self.key45 = key45_
        self.key46 = key46_
        self.key47 = key47_
        self.key48 = key48_
        self.key49 = key49_
        self.key50 = key50_
        self.key51 = key51_
        self.key52 = key52_
        self.key53 = key53_
        self.key54 = key54_
        self.key55 = key55_
        self.key56 = key56_
        self.key57 = key57_
        self.key58 = key58_
        self.key59 = key59_
        self.key60 = key60_
        self.key61 = key61_
        self.key62 = key62_
        self.key63 = key63_
        self.key64 = key64_
        self.key65 = key65_
        self.key66 = key66_
        self.key67 = key67_
        self.key68 = key68_
        self.key69 = key69_
        self.key70 = key70_
        self.key71 = key71_
        self.key72 = key72_
        self.key73 = key73_
        self.key74 = key74_
        self.key75 = key75_
        self.key76 = key76_
        self.key77 = key77_
        self.key78 = key78_
        self.key79 = key79_
        self.key80 = key80_
        self.key81 = key81_
        self.key82 = key82_
        self.key83 = key83_
        self.key84 = key84_
        self.key85 = key85_
        self.key86 = key86_
        self.key87 = key87_
        self.key88 = key88_
        self.key89 = key89_
        self.key90 = key90_
        self.key91 = key91_
        self.key92 = key92_
        self.key93 = key93_
        self.key94 = key94_
        self.key95 = key95_
        self.key96 = key96_
        self.key97 = key97_
        self.key98 = key98_
        self.key99 = key99_
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key0 = try values.decode(String.self, forKey: .key0)
        key1 = try values.decode(String.self, forKey: .key1)
        key2 = try values.decode(String.self, forKey: .key2)
        key3 = try values.decode(String.self, forKey: .key3)
        key4 = try values.decode(String.self, forKey: .key4)
        key5 = try values.decode(String.self, forKey: .key5)
        key6 = try values.decode(String.self, forKey: .key6)
        key7 = try values.decode(String.self, forKey: .key7)
        key8 = try values.decode(String.self, forKey: .key8)
        key9 = try values.decode(String.self, forKey: .key9)
        key10 = try values.decode(String.self, forKey: .key10)
        key11 = try values.decode(String.self, forKey: .key11)
        key12 = try values.decode(String.self, forKey: .key12)
        key13 = try values.decode(String.self, forKey: .key13)
        key14 = try values.decode(String.self, forKey: .key14)
        key15 = try values.decode(String.self, forKey: .key15)
        key16 = try values.decode(String.self, forKey: .key16)
        key17 = try values.decode(String.self, forKey: .key17)
        key18 = try values.decode(String.self, forKey: .key18)
        key19 = try values.decode(String.self, forKey: .key19)
        key20 = try values.decode(String.self, forKey: .key20)
        key21 = try values.decode(String.self, forKey: .key21)
        key22 = try values.decode(String.self, forKey: .key22)
        key23 = try values.decode(String.self, forKey: .key23)
        key24 = try values.decode(String.self, forKey: .key24)
        key25 = try values.decode(String.self, forKey: .key25)
        key26 = try values.decode(String.self, forKey: .key26)
        key27 = try values.decode(String.self, forKey: .key27)
        key28 = try values.decode(String.self, forKey: .key28)
        key29 = try values.decode(String.self, forKey: .key29)
        key30 = try values.decode(String.self, forKey: .key30)
        key31 = try values.decode(String.self, forKey: .key31)
        key32 = try values.decode(String.self, forKey: .key32)
        key33 = try values.decode(String.self, forKey: .key33)
        key34 = try values.decode(String.self, forKey: .key34)
        key35 = try values.decode(String.self, forKey: .key35)
        key36 = try values.decode(String.self, forKey: .key36)
        key37 = try values.decode(String.self, forKey: .key37)
        key38 = try values.decode(String.self, forKey: .key38)
        key39 = try values.decode(String.self, forKey: .key39)
        key40 = try values.decode(String.self, forKey: .key40)
        key41 = try values.decode(String.self, forKey: .key41)
        key42 = try values.decode(String.self, forKey: .key42)
        key43 = try values.decode(String.self, forKey: .key43)
        key44 = try values.decode(String.self, forKey: .key44)
        key45 = try values.decode(String.self, forKey: .key45)
        key46 = try values.decode(String.self, forKey: .key46)
        key47 = try values.decode(String.self, forKey: .key47)
        key48 = try values.decode(String.self, forKey: .key48)
        key49 = try values.decode(String.self, forKey: .key49)
        key50 = try values.decode(String.self, forKey: .key50)
        key51 = try values.decode(String.self, forKey: .key51)
        key52 = try values.decode(String.self, forKey: .key52)
        key53 = try values.decode(String.self, forKey: .key53)
        key54 = try values.decode(String.self, forKey: .key54)
        key55 = try values.decode(String.self, forKey: .key55)
        key56 = try values.decode(String.self, forKey: .key56)
        key57 = try values.decode(String.self, forKey: .key57)
        key58 = try values.decode(String.self, forKey: .key58)
        key59 = try values.decode(String.self, forKey: .key59)
        key60 = try values.decode(String.self, forKey: .key60)
        key61 = try values.decode(String.self, forKey: .key61)
        key62 = try values.decode(String.self, forKey: .key62)
        key63 = try values.decode(String.self, forKey: .key63)
        key64 = try values.decode(String.self, forKey: .key64)
        key65 = try values.decode(String.self, forKey: .key65)
        key66 = try values.decode(String.self, forKey: .key66)
        key67 = try values.decode(String.self, forKey: .key67)
        key68 = try values.decode(String.self, forKey: .key68)
        key69 = try values.decode(String.self, forKey: .key69)
        key70 = try values.decode(String.self, forKey: .key70)
        key71 = try values.decode(String.self, forKey: .key71)
        key72 = try values.decode(String.self, forKey: .key72)
        key73 = try values.decode(String.self, forKey: .key73)
        key74 = try values.decode(String.self, forKey: .key74)
        key75 = try values.decode(String.self, forKey: .key75)
        key76 = try values.decode(String.self, forKey: .key76)
        key77 = try values.decode(String.self, forKey: .key77)
        key78 = try values.decode(String.self, forKey: .key78)
        key79 = try values.decode(String.self, forKey: .key79)
        key80 = try values.decode(String.self, forKey: .key80)
        key81 = try values.decode(String.self, forKey: .key81)
        key82 = try values.decode(String.self, forKey: .key82)
        key83 = try values.decode(String.self, forKey: .key83)
        key84 = try values.decode(String.self, forKey: .key84)
        key85 = try values.decode(String.self, forKey: .key85)
        key86 = try values.decode(String.self, forKey: .key86)
        key87 = try values.decode(String.self, forKey: .key87)
        key88 = try values.decode(String.self, forKey: .key88)
        key89 = try values.decode(String.self, forKey: .key89)
        key90 = try values.decode(String.self, forKey: .key90)
        key91 = try values.decode(String.self, forKey: .key91)
        key92 = try values.decode(String.self, forKey: .key92)
        key93 = try values.decode(String.self, forKey: .key93)
        key94 = try values.decode(String.self, forKey: .key94)
        key95 = try values.decode(String.self, forKey: .key95)
        key96 = try values.decode(String.self, forKey: .key96)
        key97 = try values.decode(String.self, forKey: .key97)
        key98 = try values.decode(String.self, forKey: .key98)
        key99 = try values.decode(String.self, forKey: .key99)
    }
    
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.key0, forKey: .key0)
        try container.encode(self.key1, forKey: .key1)
        try container.encode(self.key2, forKey: .key2)
        try container.encode(self.key3, forKey: .key3)
        try container.encode(self.key4, forKey: .key4)
        try container.encode(self.key5, forKey: .key5)
        try container.encode(self.key6, forKey: .key6)
        try container.encode(self.key7, forKey: .key7)
        try container.encode(self.key8, forKey: .key8)
        try container.encode(self.key9, forKey: .key9)
        try container.encode(self.key10, forKey: .key10)
        try container.encode(self.key11, forKey: .key11)
        try container.encode(self.key12, forKey: .key12)
        try container.encode(self.key13, forKey: .key13)
        try container.encode(self.key14, forKey: .key14)
        try container.encode(self.key15, forKey: .key15)
        try container.encode(self.key16, forKey: .key16)
        try container.encode(self.key17, forKey: .key17)
        try container.encode(self.key18, forKey: .key18)
        try container.encode(self.key19, forKey: .key19)
        try container.encode(self.key20, forKey: .key20)
        try container.encode(self.key21, forKey: .key21)
        try container.encode(self.key22, forKey: .key22)
        try container.encode(self.key23, forKey: .key23)
        try container.encode(self.key24, forKey: .key24)
        try container.encode(self.key25, forKey: .key25)
        try container.encode(self.key26, forKey: .key26)
        try container.encode(self.key27, forKey: .key27)
        try container.encode(self.key28, forKey: .key28)
        try container.encode(self.key29, forKey: .key29)
        try container.encode(self.key30, forKey: .key30)
        try container.encode(self.key31, forKey: .key31)
        try container.encode(self.key32, forKey: .key32)
        try container.encode(self.key33, forKey: .key33)
        try container.encode(self.key34, forKey: .key34)
        try container.encode(self.key35, forKey: .key35)
        try container.encode(self.key36, forKey: .key36)
        try container.encode(self.key37, forKey: .key37)
        try container.encode(self.key38, forKey: .key38)
        try container.encode(self.key39, forKey: .key39)
        try container.encode(self.key40, forKey: .key40)
        try container.encode(self.key41, forKey: .key41)
        try container.encode(self.key42, forKey: .key42)
        try container.encode(self.key43, forKey: .key43)
        try container.encode(self.key44, forKey: .key44)
        try container.encode(self.key45, forKey: .key45)
        try container.encode(self.key46, forKey: .key46)
        try container.encode(self.key47, forKey: .key47)
        try container.encode(self.key48, forKey: .key48)
        try container.encode(self.key49, forKey: .key49)
        try container.encode(self.key50, forKey: .key50)
        try container.encode(self.key51, forKey: .key51)
        try container.encode(self.key52, forKey: .key52)
        try container.encode(self.key53, forKey: .key53)
        try container.encode(self.key54, forKey: .key54)
        try container.encode(self.key55, forKey: .key55)
        try container.encode(self.key56, forKey: .key56)
        try container.encode(self.key57, forKey: .key57)
        try container.encode(self.key58, forKey: .key58)
        try container.encode(self.key59, forKey: .key59)
        try container.encode(self.key60, forKey: .key60)
        try container.encode(self.key61, forKey: .key61)
        try container.encode(self.key62, forKey: .key62)
        try container.encode(self.key63, forKey: .key63)
        try container.encode(self.key64, forKey: .key64)
        try container.encode(self.key65, forKey: .key65)
        try container.encode(self.key66, forKey: .key66)
        try container.encode(self.key67, forKey: .key67)
        try container.encode(self.key68, forKey: .key68)
        try container.encode(self.key69, forKey: .key69)
        try container.encode(self.key70, forKey: .key70)
        try container.encode(self.key71, forKey: .key71)
        try container.encode(self.key72, forKey: .key72)
        try container.encode(self.key73, forKey: .key73)
        try container.encode(self.key74, forKey: .key74)
        try container.encode(self.key75, forKey: .key75)
        try container.encode(self.key76, forKey: .key76)
        try container.encode(self.key77, forKey: .key77)
        try container.encode(self.key78, forKey: .key78)
        try container.encode(self.key79, forKey: .key79)
        try container.encode(self.key80, forKey: .key80)
        try container.encode(self.key81, forKey: .key81)
        try container.encode(self.key82, forKey: .key82)
        try container.encode(self.key83, forKey: .key83)
        try container.encode(self.key84, forKey: .key84)
        try container.encode(self.key85, forKey: .key85)
        try container.encode(self.key86, forKey: .key86)
        try container.encode(self.key87, forKey: .key87)
        try container.encode(self.key88, forKey: .key88)
        try container.encode(self.key89, forKey: .key89)
        try container.encode(self.key90, forKey: .key90)
        try container.encode(self.key91, forKey: .key91)
        try container.encode(self.key92, forKey: .key92)
        try container.encode(self.key93, forKey: .key93)
        try container.encode(self.key94, forKey: .key94)
        try container.encode(self.key95, forKey: .key95)
        try container.encode(self.key96, forKey: .key96)
        try container.encode(self.key97, forKey: .key97)
        try container.encode(self.key98, forKey: .key98)
        try container.encode(self.key99, forKey: .key99)
    }
}

func decodeJsonData(_ jsonString: String) -> Dictionary<String, [String]> {
    let jsonData = jsonString.data(using: .utf8)!
    var mapL = Dictionary<String, [String]>()
    let decoder = JSONDecoder()
    do {
        let jsonMap = try decoder.decode([JSONMap].self, from: jsonData)
        for eachData in jsonMap {
            let array = [eachData.key1,eachData.key2,eachData.key3,eachData.key4,eachData.key5,eachData.key6,eachData.key7,eachData.key8,eachData.key9,eachData.key10,eachData.key11,eachData.key12,eachData.key13,eachData.key14,eachData.key15,eachData.key16,eachData.key17,eachData.key18,eachData.key19,eachData.key20,eachData.key21,eachData.key22,eachData.key23,eachData.key24,eachData.key25,eachData.key26,eachData.key27,eachData.key28,eachData.key29,eachData.key30,eachData.key31,eachData.key32,eachData.key33,eachData.key34,eachData.key35,eachData.key36,eachData.key37,eachData.key38,eachData.key39,eachData.key40,eachData.key41,eachData.key42,eachData.key43,eachData.key44,eachData.key45,eachData.key46,eachData.key47,eachData.key48,eachData.key49,eachData.key50,eachData.key51,eachData.key52,eachData.key53,eachData.key54,eachData.key55,eachData.key56,eachData.key57,eachData.key58,eachData.key59,eachData.key60,eachData.key61,eachData.key62,eachData.key63,eachData.key64,eachData.key65,eachData.key66,eachData.key67,eachData.key68,eachData.key69,eachData.key70,eachData.key71,eachData.key72,eachData.key73,eachData.key74,eachData.key75,eachData.key76,eachData.key77,eachData.key78,eachData.key79,eachData.key80,eachData.key81,eachData.key82,eachData.key83,eachData.key84,eachData.key85,eachData.key86,eachData.key87,eachData.key88,eachData.key89,eachData.key90,eachData.key91,eachData.key92,eachData.key93,eachData.key94,eachData.key95,eachData.key96,eachData.key97,eachData.key98,eachData.key99]
            mapL [eachData.key0] = array
        }
    } catch {
        print(error)
    }
    return mapL
}

func encodeJsonData(_ map: Dictionary<String, [String]>) -> String {
    var jsonMap:[JSONMap] = []
    for (k, v) in map {
        let e = JSONMap(k, v[0],v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8],v[9],v[10],v[11],v[12],v[13],v[14],v[15],v[16],v[17],v[18],v[19],v[20],v[21],v[22],v[23],v[24],v[25],v[26],v[27],v[28],v[29],v[30],v[31],v[32],v[33],v[34],v[35],v[36],v[37],v[38],v[39],v[40],v[41],v[42],v[43],v[44],v[45],v[46],v[47],v[48],v[49],v[50],v[51],v[52],v[53],v[54],v[55],v[56],v[57],v[58],v[59],v[60],v[61],v[62],v[63],v[64],v[65],v[66],v[67],v[68],v[69],v[70],v[71],v[72],v[73],v[74],v[75],v[76],v[77],v[78],v[79],v[80],v[81],v[82],v[83],v[84],v[85],v[86],v[87],v[88],v[89],v[90],v[91],v[92],v[93],v[94],v[95],v[96],v[97],v[98])
        jsonMap.append(e)
    }
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    if let jsonData = try? encoder.encode(jsonMap),
        let jsonString = String(data: jsonData, encoding: .utf8) {
        return jsonString
    }
    return ""
}

var dict: [String: [String]] = [:]
let THRESHOLD = 99
for n in 1...THRESHOLD {
  let key = "key"+String(n)
  dict[key] = ["key1","key2","key3","key4","key5","key6","key7","key8","key9","key10","key11","key12","key13","key14","key15","key16","key17","key18","key19","key20","key21","key22","key23","key24","key25","key26","key27","key28","key29","key30","key31","key32","key33","key34","key35","key36","key37","key38","key39","key40","key41","key42","key43","key44","key45","key46","key47","key48","key49","key50","key51","key52","key53","key54","key55","key56","key57","key58","key59","key60","key61","key62","key63","key64","key65","key66","key67","key68","key69","key70","key71","key72","key73","key74","key75","key76","key77","key78","key79","key80","key81","key82","key83","key84","key85","key86","key87","key88","key89","key90","key91","key92","key93","key94","key95","key96","key97","key98","key99"]
}
let mapFileName : String = "input.txt" /* Change it to FULL PATH */
let fileManager = FileManager()
let url = URL(fileURLWithPath: mapFileName)
try? fileManager.removeItem(at: url)
let ITER = 999
var encode_elapsed : Double = 0
var decode_elapsed : Double = 0
for n in 1...ITER {
  var start=CFAbsoluteTimeGetCurrent()
  let e = encodeJsonData(dict).description.data(using: .utf8)
  var end=CFAbsoluteTimeGetCurrent()
  encode_elapsed = encode_elapsed + (end - start) 
  fileManager.createFile(atPath: mapFileName,
                       contents: e,
                       attributes: nil)
  let contents = try! String(contentsOfFile: mapFileName)
  start=CFAbsoluteTimeGetCurrent()
  let map = decodeJsonData(contents)
  end=CFAbsoluteTimeGetCurrent()
  decode_elapsed = decode_elapsed + (end-start)
  if let v = map["key1"] {
//    print(n, v)
  }
}
print("Encode Time=", encode_elapsed)
print("Decode Time=", decode_elapsed)

