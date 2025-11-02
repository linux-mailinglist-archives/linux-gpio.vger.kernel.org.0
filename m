Return-Path: <linux-gpio+bounces-27925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C6C28F45
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 13:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54A5E3B06FA
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 12:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DC0268688;
	Sun,  2 Nov 2025 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhftFBmO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F81D555
	for <linux-gpio@vger.kernel.org>; Sun,  2 Nov 2025 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762087233; cv=none; b=nK3h0ZRb9rKASVpK4srWK57+JlSVF7wvAbd8Nh8VvruAshN94KsMCnG9dj7fIn3Okzi+77gHbNIgKZJUo+mQxIVkgvFsS8eY0R4Qqn/B3pF4nKDaHV2JMUZ00cCjqGzCbeaaslt/wvqpZfhic9xUo9qYqhU9kQ6HKtkao3ekZwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762087233; c=relaxed/simple;
	bh=56hrATg5XJvUBq9buDirgfWAxL55Ck2zUPx/zrw9qIo=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:Subject; b=sjAU7gEcqkpxP638tW0iJ3oNzKLMI4osy0WzVHHhlLd59cJRZvYEMYYK1N1PCPIpi687HhXVqyU2F9yVeNQCJ6YDF11q3VgjkhXoiFQoT6D/VyhB22ph+dGTGQjB7V15+HItnyX9Y9FOwfBFLr29o7lw0+p/1ONtz/QmXT3dYRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhftFBmO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDF3C4CEF7
	for <linux-gpio@vger.kernel.org>; Sun,  2 Nov 2025 12:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762087232;
	bh=56hrATg5XJvUBq9buDirgfWAxL55Ck2zUPx/zrw9qIo=;
	h=From:Date:To:Subject:From;
	b=AhftFBmO7AsSxjlJCIwbTXTLsbkJjZfPPrH1L5XyI0GUTlxstLSelY/+Rj4E5CxsB
	 kpR4SVth0Cy+SkvnS+1Imca9lz76SdPu9b/nqxacJIbHXNZtmKviEznEsKtdyD+PVY
	 fj1Ni6ikzK+3Q1/epXKIa+a6NS7ym9EOlubLcbsani1Zu9hi9nivm1t8jgaQoSBRw3
	 OqG6LQ7bMAP7FhS3P6vkO8TxhwfpAJMf0Kr4J6gQc3ENY+gdT4FWicjphgHCjrPpj0
	 bcWpc020RJF2b6v9VChIw0K6gYcYC87ZdYltLSH5Uscc5lZ0jOTXpZloXbkndZ3xG7
	 NZowHjJvvrAYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F09443809A00
	for <linux-gpio@vger.kernel.org>; Sun,  2 Nov 2025 12:40:08 +0000 (UTC)
From: linux4all via Bugspray Bot <bugbot@kernel.org>
Date: Sun, 02 Nov 2025 12:40:05 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org
Message-ID: <20251102-b220733c0-57e8f5019609@bugzilla.kernel.org>
Subject: amd_gpio AMDI0030:00: failed to lookup the [default,sleep] state
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: GPIO/Pin Control
X-Mailer: bugspray 0.1-dev

linux4all writes via Kernel.org Bugzilla:

OS: openSuSE Leap 15.3

Hardware:
  Board Info: #2
    Manufacturer: "ASRock"
    Product: "A300M-STX"
    Serial: "M80-CA020800030"
    Type: 0x0a (Motherboard)
    Features: 0x09
  SMBIOS Version: 3.2
  BIOS Info: #0
    Vendor: "American Megatrends Inc."
    Version: "P3.70"
    Date: "11/02/2020"
    Start Address: 0xf0000
    ROM Size: 16384 kB
    Features: 0x0d03000000013f8b9880
      PCI supported
      BIOS flashable
      BIOS shadowing allowed
      CD boot supported
      Selectable boot supported
      BIOS ROM socketed
      EDD spec supported
      1.2MB Floppy supported
      720kB Floppy supported
      2.88MB Floppy supported
      Print Screen supported
      8042 Keyboard Services supported
      Serial Services supported
      Printer Services supported
      ACPI supported
      USB Legacy supported
      BIOS Boot Spec supported
  Processor Info: #16
    Socket: "AM4"
    Socket Type: 0x31 (Other)
    Socket Status: Populated
    Type: 0x03 (CPU)
    Family: 0x6b (Other)
    Manufacturer: "Advanced Micro Devices, Inc."
    Version: "AMD Ryzen 5 3400G with Radeon Vega Graphics"
    Serial: "Unknown"
    Asset Tag: "Unknown"
    Part Number: "Unknown"
    Processor ID: 0x178bfbff00810f81
    Status: 0x01 (Enabled)
    Voltage: 1.5 V
    External Clock: 100 MHz
    Max. Speed: 4200 MHz
    Current Speed: 3700 MHz
    L1 Cache: #13
    L2 Cache: #14
    L3 Cache: #15
  32bit-Memory Error Info: #17
    Type: 0x03 (OK)
    Granularity: 0x02 (Unknown)
    Operation: 0x02 (Unknown)

dmesg 
[    0.000000] Linux version 6.17.6-jk (root@Cirrus7) (gcc (SUSE Linux) 12.2.1 20220830 [revision e927d1cf141f221c5a32574bde0913307e140984], GNU ld (GNU Binutils; SUSE Linux Enterprise 15) 2.39.0.20220810-150100.7.40) #1 SMP PREEMPT_DYNAMIC Thu Oct 30 10:35:02 CET 2025
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-6.17.6-jk root=/dev/mapper/2Tb-root splash=silent resume=/dev/8Tb/swap quiet mitigations=auto amdgpu.noretry=0 mem_encrypt=off




[    0.384543] io scheduler bfq registered
[    0.384712] amd_gpio AMDI0030:00: iomux not supported
[    0.384716] amd_gpio AMDI0030:00: try to register 183 pins ...
[    0.384719] pinctrl core: registered pin 0 (GPIO_0) on AMDI0030:00
[    0.384721] pinctrl core: registered pin 1 (GPIO_1) on AMDI0030:00
[    0.384724] pinctrl core: registered pin 2 (GPIO_2) on AMDI0030:00
[    0.384726] pinctrl core: registered pin 3 (GPIO_3) on AMDI0030:00
[    0.384728] pinctrl core: registered pin 4 (GPIO_4) on AMDI0030:00
[    0.384730] pinctrl core: registered pin 5 (GPIO_5) on AMDI0030:00
[    0.384732] pinctrl core: registered pin 6 (GPIO_6) on AMDI0030:00
[    0.384733] pinctrl core: registered pin 7 (GPIO_7) on AMDI0030:00
[    0.384735] pinctrl core: registered pin 8 (GPIO_8) on AMDI0030:00
[    0.384737] pinctrl core: registered pin 9 (GPIO_9) on AMDI0030:00
[    0.384739] pinctrl core: registered pin 10 (GPIO_10) on AMDI0030:00
[    0.384741] pinctrl core: registered pin 11 (GPIO_11) on AMDI0030:00
[    0.384743] pinctrl core: registered pin 12 (GPIO_12) on AMDI0030:00
[    0.384745] pinctrl core: registered pin 13 (GPIO_13) on AMDI0030:00
[    0.384747] pinctrl core: registered pin 14 (GPIO_14) on AMDI0030:00
[    0.384749] pinctrl core: registered pin 15 (GPIO_15) on AMDI0030:00
[    0.384750] pinctrl core: registered pin 16 (GPIO_16) on AMDI0030:00
[    0.384752] pinctrl core: registered pin 17 (GPIO_17) on AMDI0030:00
[    0.384754] pinctrl core: registered pin 18 (GPIO_18) on AMDI0030:00
[    0.384756] pinctrl core: registered pin 19 (GPIO_19) on AMDI0030:00
[    0.384758] pinctrl core: registered pin 20 (GPIO_20) on AMDI0030:00
[    0.384760] pinctrl core: registered pin 21 (GPIO_21) on AMDI0030:00
[    0.384762] pinctrl core: registered pin 22 (GPIO_22) on AMDI0030:00
[    0.384764] pinctrl core: registered pin 23 (GPIO_23) on AMDI0030:00
[    0.384765] pinctrl core: registered pin 24 (GPIO_24) on AMDI0030:00
[    0.384767] pinctrl core: registered pin 25 (GPIO_25) on AMDI0030:00
[    0.384769] pinctrl core: registered pin 26 (GPIO_26) on AMDI0030:00
[    0.384771] pinctrl core: registered pin 27 (GPIO_27) on AMDI0030:00
[    0.384773] pinctrl core: registered pin 28 (GPIO_28) on AMDI0030:00
[    0.384775] pinctrl core: registered pin 29 (GPIO_29) on AMDI0030:00
[    0.384777] pinctrl core: registered pin 30 (GPIO_30) on AMDI0030:00
[    0.384780] pinctrl core: registered pin 31 (GPIO_31) on AMDI0030:00
[    0.384782] pinctrl core: registered pin 32 (GPIO_32) on AMDI0030:00
[    0.384784] pinctrl core: registered pin 33 (GPIO_33) on AMDI0030:00
[    0.384786] pinctrl core: registered pin 34 (GPIO_34) on AMDI0030:00
[    0.384788] pinctrl core: registered pin 35 (GPIO_35) on AMDI0030:00
[    0.384790] pinctrl core: registered pin 36 (GPIO_36) on AMDI0030:00
[    0.384792] pinctrl core: registered pin 37 (GPIO_37) on AMDI0030:00
[    0.384794] pinctrl core: registered pin 38 (GPIO_38) on AMDI0030:00
[    0.384796] pinctrl core: registered pin 39 (GPIO_39) on AMDI0030:00
[    0.384797] pinctrl core: registered pin 40 (GPIO_40) on AMDI0030:00
[    0.384799] pinctrl core: registered pin 41 (GPIO_41) on AMDI0030:00
[    0.384801] pinctrl core: registered pin 42 (GPIO_42) on AMDI0030:00
[    0.384803] pinctrl core: registered pin 43 (GPIO_43) on AMDI0030:00
[    0.384805] pinctrl core: registered pin 44 (GPIO_44) on AMDI0030:00
[    0.384807] pinctrl core: registered pin 45 (GPIO_45) on AMDI0030:00
[    0.384809] pinctrl core: registered pin 46 (GPIO_46) on AMDI0030:00
[    0.384811] pinctrl core: registered pin 47 (GPIO_47) on AMDI0030:00
[    0.384812] pinctrl core: registered pin 48 (GPIO_48) on AMDI0030:00
[    0.384814] pinctrl core: registered pin 49 (GPIO_49) on AMDI0030:00
[    0.384816] pinctrl core: registered pin 50 (GPIO_50) on AMDI0030:00
[    0.384818] pinctrl core: registered pin 51 (GPIO_51) on AMDI0030:00
[    0.384820] pinctrl core: registered pin 52 (GPIO_52) on AMDI0030:00
[    0.384822] pinctrl core: registered pin 53 (GPIO_53) on AMDI0030:00
[    0.384824] pinctrl core: registered pin 54 (GPIO_54) on AMDI0030:00
[    0.384826] pinctrl core: registered pin 55 (GPIO_55) on AMDI0030:00
[    0.384827] pinctrl core: registered pin 56 (GPIO_56) on AMDI0030:00
[    0.384829] pinctrl core: registered pin 57 (GPIO_57) on AMDI0030:00
[    0.384831] pinctrl core: registered pin 58 (GPIO_58) on AMDI0030:00
[    0.384833] pinctrl core: registered pin 59 (GPIO_59) on AMDI0030:00
[    0.384835] pinctrl core: registered pin 60 (GPIO_60) on AMDI0030:00
[    0.384837] pinctrl core: registered pin 61 (GPIO_61) on AMDI0030:00
[    0.384839] pinctrl core: registered pin 62 (GPIO_62) on AMDI0030:00
[    0.384841] pinctrl core: registered pin 64 (GPIO_64) on AMDI0030:00
[    0.384843] pinctrl core: registered pin 65 (GPIO_65) on AMDI0030:00
[    0.384845] pinctrl core: registered pin 66 (GPIO_66) on AMDI0030:00
[    0.384846] pinctrl core: registered pin 67 (GPIO_67) on AMDI0030:00
[    0.384848] pinctrl core: registered pin 68 (GPIO_68) on AMDI0030:00
[    0.384850] pinctrl core: registered pin 69 (GPIO_69) on AMDI0030:00
[    0.384852] pinctrl core: registered pin 70 (GPIO_70) on AMDI0030:00
[    0.384854] pinctrl core: registered pin 71 (GPIO_71) on AMDI0030:00
[    0.384856] pinctrl core: registered pin 72 (GPIO_72) on AMDI0030:00
[    0.384858] pinctrl core: registered pin 73 (GPIO_73) on AMDI0030:00
[    0.384861] pinctrl core: registered pin 74 (GPIO_74) on AMDI0030:00
[    0.384863] pinctrl core: registered pin 75 (GPIO_75) on AMDI0030:00
[    0.384865] pinctrl core: registered pin 76 (GPIO_76) on AMDI0030:00
[    0.384867] pinctrl core: registered pin 77 (GPIO_77) on AMDI0030:00
[    0.384869] pinctrl core: registered pin 78 (GPIO_78) on AMDI0030:00
[    0.384871] pinctrl core: registered pin 79 (GPIO_79) on AMDI0030:00
[    0.384873] pinctrl core: registered pin 80 (GPIO_80) on AMDI0030:00
[    0.384875] pinctrl core: registered pin 81 (GPIO_81) on AMDI0030:00
[    0.384876] pinctrl core: registered pin 82 (GPIO_82) on AMDI0030:00
[    0.384878] pinctrl core: registered pin 83 (GPIO_83) on AMDI0030:00
[    0.384880] pinctrl core: registered pin 84 (GPIO_84) on AMDI0030:00
[    0.384882] pinctrl core: registered pin 85 (GPIO_85) on AMDI0030:00
[    0.384884] pinctrl core: registered pin 86 (GPIO_86) on AMDI0030:00
[    0.384886] pinctrl core: registered pin 87 (GPIO_87) on AMDI0030:00
[    0.384888] pinctrl core: registered pin 88 (GPIO_88) on AMDI0030:00
[    0.384890] pinctrl core: registered pin 89 (GPIO_89) on AMDI0030:00
[    0.384892] pinctrl core: registered pin 90 (GPIO_90) on AMDI0030:00
[    0.384893] pinctrl core: registered pin 91 (GPIO_91) on AMDI0030:00
[    0.384895] pinctrl core: registered pin 92 (GPIO_92) on AMDI0030:00
[    0.384897] pinctrl core: registered pin 93 (GPIO_93) on AMDI0030:00
[    0.384899] pinctrl core: registered pin 94 (GPIO_94) on AMDI0030:00
[    0.384901] pinctrl core: registered pin 95 (GPIO_95) on AMDI0030:00
[    0.384903] pinctrl core: registered pin 96 (GPIO_96) on AMDI0030:00
[    0.384905] pinctrl core: registered pin 97 (GPIO_97) on AMDI0030:00
[    0.384907] pinctrl core: registered pin 98 (GPIO_98) on AMDI0030:00
[    0.384909] pinctrl core: registered pin 99 (GPIO_99) on AMDI0030:00
[    0.384910] pinctrl core: registered pin 100 (GPIO_100) on AMDI0030:00
[    0.384912] pinctrl core: registered pin 101 (GPIO_101) on AMDI0030:00
[    0.384914] pinctrl core: registered pin 102 (GPIO_102) on AMDI0030:00
[    0.384916] pinctrl core: registered pin 103 (GPIO_103) on AMDI0030:00
[    0.384918] pinctrl core: registered pin 104 (GPIO_104) on AMDI0030:00
[    0.384920] pinctrl core: registered pin 105 (GPIO_105) on AMDI0030:00
[    0.384922] pinctrl core: registered pin 106 (GPIO_106) on AMDI0030:00
[    0.384924] pinctrl core: registered pin 107 (GPIO_107) on AMDI0030:00
[    0.384926] pinctrl core: registered pin 108 (GPIO_108) on AMDI0030:00
[    0.384928] pinctrl core: registered pin 109 (GPIO_109) on AMDI0030:00
[    0.384930] pinctrl core: registered pin 110 (GPIO_110) on AMDI0030:00
[    0.384931] pinctrl core: registered pin 111 (GPIO_111) on AMDI0030:00
[    0.384933] pinctrl core: registered pin 112 (GPIO_112) on AMDI0030:00
[    0.384935] pinctrl core: registered pin 113 (GPIO_113) on AMDI0030:00
[    0.384937] pinctrl core: registered pin 114 (GPIO_114) on AMDI0030:00
[    0.384939] pinctrl core: registered pin 115 (GPIO_115) on AMDI0030:00
[    0.384942] pinctrl core: registered pin 116 (GPIO_116) on AMDI0030:00
[    0.384944] pinctrl core: registered pin 117 (GPIO_117) on AMDI0030:00
[    0.384946] pinctrl core: registered pin 118 (GPIO_118) on AMDI0030:00
[    0.384948] pinctrl core: registered pin 119 (GPIO_119) on AMDI0030:00
[    0.384951] pinctrl core: registered pin 120 (GPIO_120) on AMDI0030:00
[    0.384953] pinctrl core: registered pin 121 (GPIO_121) on AMDI0030:00
[    0.384955] pinctrl core: registered pin 122 (GPIO_122) on AMDI0030:00
[    0.384957] pinctrl core: registered pin 123 (GPIO_123) on AMDI0030:00
[    0.384959] pinctrl core: registered pin 124 (GPIO_124) on AMDI0030:00
[    0.384961] pinctrl core: registered pin 125 (GPIO_125) on AMDI0030:00
[    0.384963] pinctrl core: registered pin 126 (GPIO_126) on AMDI0030:00
[    0.384965] pinctrl core: registered pin 127 (GPIO_127) on AMDI0030:00
[    0.384967] pinctrl core: registered pin 128 (GPIO_128) on AMDI0030:00
[    0.384969] pinctrl core: registered pin 129 (GPIO_129) on AMDI0030:00
[    0.384971] pinctrl core: registered pin 130 (GPIO_130) on AMDI0030:00
[    0.384973] pinctrl core: registered pin 131 (GPIO_131) on AMDI0030:00
[    0.384974] pinctrl core: registered pin 132 (GPIO_132) on AMDI0030:00
[    0.384976] pinctrl core: registered pin 133 (GPIO_133) on AMDI0030:00
[    0.384978] pinctrl core: registered pin 134 (GPIO_134) on AMDI0030:00
[    0.384980] pinctrl core: registered pin 135 (GPIO_135) on AMDI0030:00
[    0.384982] pinctrl core: registered pin 136 (GPIO_136) on AMDI0030:00
[    0.384984] pinctrl core: registered pin 137 (GPIO_137) on AMDI0030:00
[    0.384986] pinctrl core: registered pin 138 (GPIO_138) on AMDI0030:00
[    0.384988] pinctrl core: registered pin 139 (GPIO_139) on AMDI0030:00
[    0.384989] pinctrl core: registered pin 140 (GPIO_140) on AMDI0030:00
[    0.384991] pinctrl core: registered pin 141 (GPIO_141) on AMDI0030:00
[    0.384993] pinctrl core: registered pin 142 (GPIO_142) on AMDI0030:00
[    0.384995] pinctrl core: registered pin 143 (GPIO_143) on AMDI0030:00
[    0.384997] pinctrl core: registered pin 144 (GPIO_144) on AMDI0030:00
[    0.384999] pinctrl core: registered pin 145 (GPIO_145) on AMDI0030:00
[    0.385001] pinctrl core: registered pin 146 (GPIO_146) on AMDI0030:00
[    0.385003] pinctrl core: registered pin 147 (GPIO_147) on AMDI0030:00
[    0.385005] pinctrl core: registered pin 148 (GPIO_148) on AMDI0030:00
[    0.385006] pinctrl core: registered pin 149 (GPIO_149) on AMDI0030:00
[    0.385008] pinctrl core: registered pin 150 (GPIO_150) on AMDI0030:00
[    0.385010] pinctrl core: registered pin 151 (GPIO_151) on AMDI0030:00
[    0.385012] pinctrl core: registered pin 152 (GPIO_152) on AMDI0030:00
[    0.385014] pinctrl core: registered pin 153 (GPIO_153) on AMDI0030:00
[    0.385016] pinctrl core: registered pin 154 (GPIO_154) on AMDI0030:00
[    0.385018] pinctrl core: registered pin 155 (GPIO_155) on AMDI0030:00
[    0.385020] pinctrl core: registered pin 156 (GPIO_156) on AMDI0030:00
[    0.385022] pinctrl core: registered pin 157 (GPIO_157) on AMDI0030:00
[    0.385025] pinctrl core: registered pin 158 (GPIO_158) on AMDI0030:00
[    0.385027] pinctrl core: registered pin 159 (GPIO_159) on AMDI0030:00
[    0.385029] pinctrl core: registered pin 160 (GPIO_160) on AMDI0030:00
[    0.385031] pinctrl core: registered pin 161 (GPIO_161) on AMDI0030:00
[    0.385033] pinctrl core: registered pin 162 (GPIO_162) on AMDI0030:00
[    0.385034] pinctrl core: registered pin 163 (GPIO_163) on AMDI0030:00
[    0.385036] pinctrl core: registered pin 164 (GPIO_164) on AMDI0030:00
[    0.385038] pinctrl core: registered pin 165 (GPIO_165) on AMDI0030:00
[    0.385040] pinctrl core: registered pin 166 (GPIO_166) on AMDI0030:00
[    0.385042] pinctrl core: registered pin 167 (GPIO_167) on AMDI0030:00
[    0.385044] pinctrl core: registered pin 168 (GPIO_168) on AMDI0030:00
[    0.385046] pinctrl core: registered pin 169 (GPIO_169) on AMDI0030:00
[    0.385048] pinctrl core: registered pin 170 (GPIO_170) on AMDI0030:00
[    0.385050] pinctrl core: registered pin 171 (GPIO_171) on AMDI0030:00
[    0.385051] pinctrl core: registered pin 172 (GPIO_172) on AMDI0030:00
[    0.385053] pinctrl core: registered pin 173 (GPIO_173) on AMDI0030:00
[    0.385055] pinctrl core: registered pin 174 (GPIO_174) on AMDI0030:00
[    0.385057] pinctrl core: registered pin 175 (GPIO_175) on AMDI0030:00
[    0.385059] pinctrl core: registered pin 176 (GPIO_176) on AMDI0030:00
[    0.385061] pinctrl core: registered pin 177 (GPIO_177) on AMDI0030:00
[    0.385063] pinctrl core: registered pin 178 (GPIO_178) on AMDI0030:00
[    0.385065] pinctrl core: registered pin 179 (GPIO_179) on AMDI0030:00
[    0.385067] pinctrl core: registered pin 180 (GPIO_180) on AMDI0030:00
[    0.385069] pinctrl core: registered pin 181 (GPIO_181) on AMDI0030:00
[    0.385071] pinctrl core: registered pin 182 (GPIO_182) on AMDI0030:00
[    0.385072] pinctrl core: registered pin 183 (GPIO_183) on AMDI0030:00
[    0.385075] amd_gpio AMDI0030:00: failed to lookup the default state
[    0.385077] amd_gpio AMDI0030:00: failed to lookup the sleep state
[    0.386162] amd_gpio AMDI0030:00: amd gpio driver loaded
[    0.386270] ledtrig-cpu: registered to indicate activity on CPUs

View: https://bugzilla.kernel.org/show_bug.cgi?id=220733#c0
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


