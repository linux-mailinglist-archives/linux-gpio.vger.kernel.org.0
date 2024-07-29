Return-Path: <linux-gpio+bounces-8403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 485A393EA60
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 03:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDFD51F21730
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 01:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FED02F25;
	Mon, 29 Jul 2024 01:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VLOzAA29"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn2079.outbound.protection.outlook.com [40.92.43.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5961C14;
	Mon, 29 Jul 2024 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.43.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722214926; cv=fail; b=K7dUREczaEeeIo3MghMRs112tbpTOTOnqsohmoAKOxSyD6pUkDqbd2hzEDslEhYEVh/RiekaNd8ts7zqaR4hsuOtshGJDBCNO+1QkIvewjkCZMgQbkCRcY0nrWhkz7YW+nIlccxa2hskDrBLODX3z5CKzIhSZLEGZv/HnjDfVvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722214926; c=relaxed/simple;
	bh=PPnE7bVYOeS8LetCy5vKy0EeKfBRy79VtVC+VML2OcI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YHFd2pLnCxw7jhPsGLCfh3ueOZSQiNaKQF8j4Q5f0wGIprkP7ii31dUghR0Yl+Mbcifxv/3sLNtLXxmteAcI5zYZamFUTBMEQz8+GKRStXaVMMFJXwth0rgUymA/5o4iiULKM250omRFhyD3rT9mMW5czBrZRq6BGst95b1ZqGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VLOzAA29; arc=fail smtp.client-ip=40.92.43.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+8iPfzuyHy83Vz7IHZXi/cNfbGosFjwLOdKDLp44APjl7/h305zbk1zUxnZvz3+34UyG/DgwfaEdUGtczxe9ZN3n4d3vIkuLkhDEOqUc8P71cMLjZTRyzRSkTtDo3SNFbCLA9+JfYuxOnUOs2aa6ChMvOrhdp96Q84rknRQ1omgY59Ie39qPEHkvJpjy+5WCklhHp8Y3tI707js+ZOJNA8pD/TU9T+I4KMzT8VRLms76q8iuuhxgFVAkzgGqKQIuknxGpJk0lpimqJO5VtF1FrhnVQiZLLCL/hH5c9IXoz/Axn5VoeUGcst5l91wVNTp5ZHfAP3doBRMrGcn3HRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD/5j7U73VpBTb2YWZQp005DHmQSkPACYirVO4xXnGM=;
 b=ShjPsYxZOCKPqTvnBmhgg1eowosrVD1TIfn0D7W8PsKBAavOm2tedvbViwT82MN255LCSDuq3Qv4jOJqMpmOKtI10f45aBDpYTWp/Zg4Q1nLwY+eqVEKtaSQygaCH+5xHKTjguGU4Pk4rnVPp08nBBramweWGi8jP+bOHxnvn71vFdf4SeEcVCtposS+/khyDMXg7emluATCB2TfYjOIGYRHKqwT5ADxFLL2ek8hC8E8HIwJ6e1/9TC1BIfVNU+rgA9QN8fAy87NrKi/Vxd/iaHgo60W2RMdKFzAPA1gmykJFvvvuIBL1/H1f+G1IZfixlzTXh8ONbaseKS+Uuof7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD/5j7U73VpBTb2YWZQp005DHmQSkPACYirVO4xXnGM=;
 b=VLOzAA29PH3vZs5xNI9vNFItGC5l02gmfoJ7y0dtLmV25Sb6/Vx5Fw9K/gUQ8mZdsRZd7+yN7GnL7YQ1JEVFV+v4UFeT96jzr1Cr0lgwqoqDFAoy+Z9Zs53dD3GIbjQi+4jcBznPaYy7Xg5rCp8Uvs+2FD9JjKsdE+2aGEFO2fLh1ugHXda6GtAFKEwImAwt+h559h3odRD0RblmYvdmypyl4uXKVZcCqGihywr5HhJMFAGmvviiXRFjD9upjwI7z/WmDm1BmWJuATWBS4g8m1R2tJThi0Or3LdZ3tSmj1Ojgs4t9EvIUbC5DwahXqPvlQ40klDsW2ObjkCyRHxK3g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7300.namprd20.prod.outlook.com (2603:10b6:408:232::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 29 Jul
 2024 01:02:01 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 01:02:01 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/7] riscv: sophgo: Add pinctrl support for CV1800 series SoC
Date: Mon, 29 Jul 2024 09:01:38 +0800
Message-ID:
 <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [4aY9L8EWsxGCiW3ggauIxEwCzZw4XdaPAt2yNS8YBO0=]
X-ClientProxiedBy: TYCP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::11) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240729010139.648085-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c64829-4344-475f-4a33-08dcaf6a0d96
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599006|8060799006|461199028|19110799003|3412199025|4302099013|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	1SXeZ+9MiEjefGY0iIZ5e/lT9216g579IpczjMoUIaI/xnMKR0WnOw54BmmFyqRH88kcXOIoV97RDBsNYA59E8rwZtIJ94J/ZXThyD+wSENOF2KcYyZdSx1p+RAnvkiwZtBjDS+NepyR4jUafimNYBdXkofec9OXIQPH9Oj5/gdj9W6BnQx4RvfKHHmhfxp5X5cCdAMOehmXdEXYLXAvsdYspYO7GZw8C8BGhBZ/CR9wILJkDzdsaRdPfTa1lagvOSm3zzcivzQSO6CrguD32KM8o0s0AksSDf00m8lL0v4ipwp2AvijrWnvjm4OgR3OejWl49Eji64riixSW3lN58xuTg+oo+zIAdsH5bk1ZMjgBAlspYUKy5jULw6zLk+hGJVM7OX3MvXQJ2XUN19y4RkahC54F0je1Ym2pbFKBWxaU/GtO1BLCvO8zQBmcrRsL511ryyKNtPibsNeHUW6bMwmJ21u1LEfuxA31d1VoBsYjqMSLqE/ggjPX2E2CTKukgTBrNPB2mQijZwVPOWMxT+bZtVqowAulaiwPni4oOJT/t1AyEEKeeDMPuCihsRR9TM3iX6NwIepfECrI/g3R8Qp9+hdMP91XYGwz/jXfOCk/GlJsFOtFgRqYOgCQpe51017FdmAoqVQBBG9FKwvMfdU3kIytTU2JI+MPwuHKvQDcam6TeZrxO9uL4N4jdXKO9Xo9+E5NIXs+WCMOxs6QrwuL0bkfJDY39vhWmkA8ig5+fR7kMs6xp2wokua8cwkB+pd+MCaPoXvznDqgli6e/ddsG++MQ1Y+OTkn8Y68tNwH04p16fNYXtCJdbV7xEt
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5scg0Pf7y//6R7ok9NwntRaITCqKn3NziXokDn0yWFq9zj9Xq5JDBG8h1igb?=
 =?us-ascii?Q?Aspeh3Ju/cWHienVnuDQUiTd8iYjlYvLnRlFLb8yvd1YVmlHY6OOBb6i9ona?=
 =?us-ascii?Q?TMzVNKY+2yKJyb5w2FtxF0vSwWRzfAkow+1QtG14RZH4l6bJAJ0/i9DVCFlR?=
 =?us-ascii?Q?vAaS/E5osvxu+StfpK2JzycYnLixyARfgcjBEDWEE/r3+lJdfeiGOUHG+bpu?=
 =?us-ascii?Q?w/zFcnaOlV4r2gMuKo/XbbhrJkgnE+emUDZsQ+WCKA6JKnoySKooffi8y7KR?=
 =?us-ascii?Q?UJvu4xQNsE623ZquBiphB1tnrk8QauFBFmry9DRm+HvlyTWwXo8GCUxwWqKy?=
 =?us-ascii?Q?+Vi4YaH47XtK0/i5NsMLJSVeg+21dZNhVuBWZKJVqWspPcfOc7m3AkjsSk2N?=
 =?us-ascii?Q?Y4uSnwcek7lBf79P2LU2otKuqNsBeN4jg0ikRLuAGu7JhxlTSEe9g0xhg0rf?=
 =?us-ascii?Q?TdaZ5apenm53Sfo/k+rYpyuS5nFXzocOfJWjG0IcripKXKjbeWe5JvIBDqcS?=
 =?us-ascii?Q?EIE/Nws9RttiRUXH+IVL7MtDu2b64+YQacO5bSnnA6VemR7wxhy57LMkTDqJ?=
 =?us-ascii?Q?QNL1HZZE9zmgTqDC2Vi2nqxu6VcoqcgnuxXAQVjr5th9DoPm/++1N9Dhzh7K?=
 =?us-ascii?Q?Iv/f0z0UxQH+Mdb04MP+6kJEWhwFQyqDlERvPmHnc1RUMLFys6A7AW+1wa41?=
 =?us-ascii?Q?bJ6+R2oEkEzNTDi/VxKp7/CI2Cm8pUh27wZKqKB3YTXdlmb0k3IxwMFyR38T?=
 =?us-ascii?Q?GcL8Ge3azh9K9MBLo4Vh/+t3xcntaPrU3pZh0IqZxK24RwK5Vq3MNTXTJn8G?=
 =?us-ascii?Q?SUywWCqcs+YfVTOitfZMwWlTABOiBQpOPECe7/7LAJHbMAlspjT59esFZuEX?=
 =?us-ascii?Q?eQDVTaXjtAtHtyJqz884QFv6G+i85yav7w7gmSzfjPkQdDlM+KlWVyovkV4r?=
 =?us-ascii?Q?6YsIeNOw4KdvZ/Ix432asUmCqcBa/UzUcwMoqxwak9v3RXdTiDGbnj9v5dV7?=
 =?us-ascii?Q?iKvyUNYsyiAhDk0Xhnt5AmYqsQXOhuOlvd0f9u/i1jJr8Ie5f1jC050mQx5S?=
 =?us-ascii?Q?irp3K7GDWZoxP9ZqT5eeUcLFJ0Vlz4+eoSYtTNNhYblzPoH/I7WVr8UbYfjA?=
 =?us-ascii?Q?j9BgAcmzgvIaitQcYtOkhCby4V3RI7SizjHAVfrCtgtiaGlpbp+cJ+E2JxgI?=
 =?us-ascii?Q?PyB+WWBy51Y4BDibaQBEjJ5cuSbL2M4JOXqZb0io3BGKFXFsTycGOJS2bqNE?=
 =?us-ascii?Q?BV2yKWhYW/ovUBCmTwSU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c64829-4344-475f-4a33-08dcaf6a0d96
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 01:02:01.2179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7300

Add basic pinctrl driver for Sophgo CV1800 series SoCs.
This patch series aims to replace the previous patch from Jisheng [1].
Since the pinctrl of cv1800 has nested mux and its pin definination
is discrete, it is not suitable to use "pinctrl-single" to cover the
pinctrl device.

This patch require another patch [2] that provides standard attribute
"input-schmitt-microvolt"

Note: As current documentation is not enough to guess the pin
configuration of Huashan Pi, only the pinctrl node is added.

[1] https://lore.kernel.org/linux-riscv/20231113005702.2467-1-jszhang@kernel.org/
[2] https://lore.kernel.org/all/IA1PR20MB495346246245074234D337A6BBAC2@IA1PR20MB4953.namprd20.prod.outlook.com/

Changed from v2:
1. remove unused export function.
2. drop "drive-strength" and only use "drive-strength-microamp" in
the binding.
3. drop unnecessary ref in the binding.
4. drop unnecessary entry for binding example.

Changed from v1:
1. replace attribute "sophgo,bus-holder" with standard "bias-bus-hold".
2. replace attribute "input-schmitt" with "input-schmitt-microvolt".
3. add vddio operations support to report pin state.

Inochi Amaoto (7):
  dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.
  pinctrl: sophgo: add support for CV1800B SoC
  pinctrl: sophgo: add support for CV1812H SoC
  pinctrl: sophgo: add support for SG2000 SoC
  pinctrl: sophgo: add support for SG2002 SoC
  riscv: dts: sophgo: cv1800b: add pinctrl support
  riscv: dts: sophgo: cv1812h: add pinctrl support

 .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 120 +++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  49 ++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  10 +
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  10 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/sophgo/Kconfig                |  54 ++
 drivers/pinctrl/sophgo/Makefile               |   7 +
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c      | 462 +++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c      | 771 ++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c       | 765 +++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h       | 155 ++++
 drivers/pinctrl/sophgo/pinctrl-sg2000.c       | 771 ++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2002.c       | 542 ++++++++++++
 include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 ++
 include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 +++
 include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +
 include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 +++
 include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 ++
 19 files changed, 4133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
 create mode 100644 drivers/pinctrl/sophgo/Kconfig
 create mode 100644 drivers/pinctrl/sophgo/Makefile
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv1800b.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv1812h.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv18xx.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv18xx.h
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2000.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2002.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h


base-commit: 0066cdb6d7427d785e1a878070c4990384b93508
prerequisite-patch-id: 11fce0bb5b2e9784ec7d6086d5d5e9979360384f
prerequisite-patch-id: 3d5f38fdb9d8250dd9872ab72ab7a438281b4a03
--
2.45.2


