Return-Path: <linux-gpio+bounces-8529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06B0945573
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 02:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73C1C1F22B6D
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 00:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8F4848D;
	Fri,  2 Aug 2024 00:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="fP5jeYT2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2092.outbound.protection.outlook.com [40.92.40.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99691446DB;
	Fri,  2 Aug 2024 00:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722558875; cv=fail; b=MOdn248AS0E+lc13fi8Yy/W04/WYsSpYhdgJMc7teU88FPmctnVrMlSjGZXUKDfm2pQaHYGFuW5iit5n2EEdQkMCef7NYmcQplihm7ZO+8E1B3IOTx6vQmp749exFHUI+pURIiFQQAAbzF4py8fEr34diCssWix3rREFU58ITj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722558875; c=relaxed/simple;
	bh=d2weiz2G1AjP4+K4NCZZp8CridG1Y0Tyt2yqRUu+UlM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=i2uMXIgfPYc6OaEygZ3OmFMYeh7ia7hyq04pR2U/cjD+JuSqADr/FC4xxYIVy2ROqVx05x7/ilrSfrw39U6kLMCj4GQkJIP0kVQY87qDZUCcDS858F/H36OBsxVZFm3yUfQMc76WfDsa8Wo29evkGqcvp0eZbvxMQUmrD9fDpQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=fP5jeYT2; arc=fail smtp.client-ip=40.92.40.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snHTeD9I0ObQsByqlytRmrKIUr72imjZHybnnWATthG40ys/BDJdPzq1vf5MFqIhIgbrPF+cyAukpl6SW5GZGYyjd0i4ypdEc3OVM4eFXhzWf8kJYq3ETNWVllmOkF5t8EdvaH0T5+rcCJxSYlANe4fRthvKMyp1spWDRfSU7G+Chq7jSWWTYVcvz/TXGMyxTwMC3PtSRGpRggzuY0nvq79cRunC8eFg4vYHJwop8nxKL4AaUBUf1Oy7wZXeABevy/8PRoU6SHsmhNQaGhb3TG3npmIHazblTWiIvcs3acc1bHt+B160In/CWUIjFw00zBpmkCuDHJAn+OOCwR09UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wi2OMoaXaX5iYSHefeHaOV0rcGBbjxi7WQsFSUiUw1c=;
 b=uNe/QPp+olJrQCgIpYI20L5q0PcP6Ti+S+N3Fup1UJhaCr6V6WM0EOzi1YUQPEYOOETWkDabkFIFAaSXhDjL1A4VOYifd8qUeKWBnRuvX4CnMBax9GTxnE6xsmoX6qp6DSARxPoEdVnng/h1t8aBHkTHz44ic1GgRZhtr79asLclw8LyIDjnoLzw6azlE43VpHR1jKhQGWyFxXbkKleYVTi9TLkgZilgHCgZbmxKzuzQ8GCppQbDAqf9w9w085+izKXja9pZiJPagGLxpVq6oFq8+yxrdQKBSAPY5WSZzZDxYbXkl4+j7x6RY/ioQqFNo6xNylgBgYSNpxNleiF9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi2OMoaXaX5iYSHefeHaOV0rcGBbjxi7WQsFSUiUw1c=;
 b=fP5jeYT2tlGz5fUJpAzymGE/sjKb7kmFg183IGMTi4ChH++HChl+DCQBYzd8/o8jKJXCe57nN5l+yUHOzvnh1tUL4Oroi5+3MbIM9diG2lm9gQuZeoq72GUtk/ME27Qx33Bf/2VkZYQZDs7CG2vbNzBpB62HeDr65YlTEJCmYDrVLkoYKoeNQW3UVxPFxhXBn/esSc4U6YPpLLkC0CZnSSOT5c1lNYCrUlc9bwGS2XAwisUmgOxtCa2h7hf8OZIMixW8DFX7jLlPhqnRG9HH6SsgWNAGFnE7p7B1Qn094idECu1h0YJgS8Efetid3gmhkGQ0JjrHunVUO/E1c0MHTQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA1PR20MB4954.namprd20.prod.outlook.com (2603:10b6:208:3ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 00:34:30 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 00:34:30 +0000
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
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/7]  riscv: sophgo: Add pinctrl support for CV1800 series SoC
Date: Fri,  2 Aug 2024 08:33:58 +0800
Message-ID:
 <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [pdmcTQRqeTaqL3c/xMGD5LM1l8yj5fYpcHIugoTmZDQ=]
X-ClientProxiedBy: TYCPR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240802003400.259366-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA1PR20MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8b1e94-f1cf-4507-b02f-08dcb28adf31
X-MS-Exchange-SLBlob-MailProps:
	RlF2DIMZ1qVJI9dA1sfQcjWnjRf3kWhs5HdwS4GbeEN0QbV22OPlmbjuFMNLebraQ9LcMqII0ZDisIWWkhHmVDWSrSdCt+TFakqkRWUEg8KMgq6t1qDRH+noeP8j7W/f0lCo+gfca2OmdUfCvjOG8DHEODet2BHm4fapAC/n89jPHzY81qxQHdafuz9Ndeh5EMAN92Isz94tb1eCysvVo27B3ush9e8DQZowY2Y96bnV1maKeM97tyK1oszZwrpvRRMr/cZyKAj7qarzu/DY8ISTpTJ/FXtdOYOTbB491VFxhqPvKn5Zoj024+eEgcbj4a8G6128PgsYxdahZjWNn5QZtcB8O/4qQbZe8Jiuqv2vlWfMOEX8STNZhO04IMmfxKziLQh7RdbgFtbx1VlGjKpEwktMWwlYz9DUzIyG762B+MkTkJ4oYcodIxXUU+bM21eRBckDxFeXULyR0Ok4OFal9D+aUgpo63GYgsokA0DXgS1vewS2x/ttiBg96qT3tJBGiPK07Srj9PKrNqaLY2/0IxxOF5r5mudNvJGATLA2W06ZZKKiiVQOkI44n61L4c16fsZYdxQt6zCh5NMUYXo7JzrNKMYOI24Gp+Hi2RtkEeAZnvx2EM9fAgvOil5bjnQGnOWcNIT9pFxKZbLYdukUPLJSqqloeSO2Z5atf7DxGOf6V93O1Gh8USVXMaAZw4hoq9DwHL86FfqpSRKC3HvbISHceWpNhnypxwLscXCU7CupG4jye663OQ19ZYutdL12icL4y0e9ciwSCnWNZHftz9UsGFWG1BqXh+iUwlx0mWZiBjVfpxAUZqgAGYo/7zrtR5342hRO/xPTMOqxw/SLzqtnxtqB
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|8060799006|461199028|1602099012|440099028|4302099013|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	6rzrRHAnqunv07EE1DBaOnUBVG1IQFdShkD03kmtEnxTmkGJyaVQB4NYGcHuO8ACDwN7TcI+/139qLDOBrCOy+XkrgWdMdepaw6iLGuTyuXCA7yb+NlSrLdGFs3K3N57HLI3umUNRkX5iuWaLrMQ9HwtzuoEggRnNoYOOKtlVzUefePnk8Ov5/gY6s9GNdOsWJvJ+Dvhip3aGLO5k3AgbmZ0s5XFlesWE1GNxLR57cBzYsqPv1/KQBc28QxgldJk/py5fCDHMEBvdEMkwchWAitif0iEgFh48CLrZ9I4HAP62+3tay743uhFAlGLAop5r9A3lw7LA6z2l81o2dO6utM2QwcqD0f46pvTxBn3+VmVFxC3atylRHK6BU8Zpuci7zpqvVmtR1sX+rhP4TqmlHnuzBJj/qixjEBLE3hVWGzGFW8Uyl+AhGDxVCkuYx85nDzaDZqbHJrAr/VBPlkvHUV4PyCnL60/Z8GhkjnroyJfyD4VSez7WnPldY8yfR7W9O5tPBfQaV3z0X8TYDNM1Cxspfb9z+/NPkg3yMvcKZ7lBYZcYkSRXFuMF9LUe1sRbJZqVa2IrW45by/93VmQVRiGjvH4txSlG6qhP90iVbcIOV5hLPHGA7f5kquEh3UOMMQTlHjQEspS31wQeWWzN7fnS7gK+r9hI1cYcD7eekP5/aLDdhL2WGFGIs94zNxApbMPmWtYLWkOXxpSZVpxcHChoyDX1NOkyqfST9Ws76XS+D75oWmpQfBUYe+y+J/3Re4LUHw9aOpEZFqZZ4j1K5bVNc7bVpuCCVcX85z9t85mPNGOq1Er7logyX5rdH/k
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pQVcY9Jin/QweA9CYiFJ9VngZKgU+deCZHEfqTyxHl6LJ7lNT6Yl2CV/Qhik?=
 =?us-ascii?Q?63Ngvw/wqSpYR2MqXfNPKBb4mdsbr5LkXQAsaKvQ6E9fye41o47CHpsrDlnT?=
 =?us-ascii?Q?Uej1fjNj4yQgmxtsbQxI55VVyq/iZM6qcqZbK2NHbzgGEHcIFqydp45OuMgM?=
 =?us-ascii?Q?VpP+xfga6NRTFJahIYOAXpfD8JymrM7BkuiYA1B7o3hfYDIWYBxxFrYy9gcV?=
 =?us-ascii?Q?d2phWP/e6VjVqgidKWzl3ECJ+UpgAtjHxFBE/bptOyUmAzhtws1fEpoKk3HF?=
 =?us-ascii?Q?GNCYBTeKQiVGCsW/9btmEPwnKc5UfrJ0RqALxSWkpl5WcxINQideykQV77Mt?=
 =?us-ascii?Q?HNIYZBQtsFBGylzr6dgejiKANqeTeXBZLndG/tIi+yHo/eg8PvCRmrU+I58y?=
 =?us-ascii?Q?trEtzACiyQs+MvTHJnk2Sl5OM6FXM00Pt0PaRt6C+WMfsNTC7HzqZg7V9+Dh?=
 =?us-ascii?Q?5+8CYcoo3Y8Ps4Kfcby/lTaAu4o7dIYwq96o1XkXB1MCd/Jdc/Upm1/8pGHm?=
 =?us-ascii?Q?8msu4Qd85hZkKPNoUYpJkwAKmvVtIMPBzooZnLh8VGFAzJxbAHnM2vy9bESP?=
 =?us-ascii?Q?h3sWnBvJM9Fn0IZ9CKMtReZnIUPS8aHwAacJx3MbQH8Ul8IGBXgvAuwEKxbL?=
 =?us-ascii?Q?syFFv2U3xKkJf+eFKlRdV/ja7CSbXW5ZDZIuPd7unfkET8wraQmkUi8Q93vg?=
 =?us-ascii?Q?O9BF1/n1OUkz2EBiOlaAlrLB3WOts55WOs6CNsjyHV8+M7rfo5gnloLLCy/t?=
 =?us-ascii?Q?XM4f7D+FiVeDC1dpNL6fYeZ/stEBiB0fA+hbWriKUiQxR8yXxVlFDZful+qQ?=
 =?us-ascii?Q?pJ4yaHUw8aPJzGvF/CdO1lh0SmJWNocngeGc0HbHFeAj05iPuERjFvMGNpdh?=
 =?us-ascii?Q?gh/GgRJ1VhP9d+viYEPcAGFYc/yKhpKfTlTKFD0ulWSxGW8T2AOTkPRIl1UE?=
 =?us-ascii?Q?7g9EyIoxU0oRGA9DV8n0C5Oc/jgF5G9iXolaS7WIWSO5PTjcPzttkAGDcTr3?=
 =?us-ascii?Q?mpIgorDhi3vK4yL/LqbeMS7I7ZpU16i78BiW2sro4gyQypl9uhoBot2gkGtv?=
 =?us-ascii?Q?D/nnlw4J2hpywpo0LQYeCTVtt9XWe7gO6rRVSdDfvRvRvg/C+0mHaGXNUREC?=
 =?us-ascii?Q?3KXmbrXaB83yc6aoQCc0Vjs7xyP/cNbfOdOUntwuyVBHXXcBZ2oGjh0Wy/re?=
 =?us-ascii?Q?fEW3u9/y6kus62yKVztV4GNn8vlbMQzDrTNGFi1qnCxgSEjky2OKTN/YEs+B?=
 =?us-ascii?Q?eKMmVnBX76LPXIlkLsn8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8b1e94-f1cf-4507-b02f-08dcb28adf31
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 00:34:30.3391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB4954

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

Changed from v3:
1. binding: drop unnecessary type
2. binding: use right ref for pin node.
3. binding: remove mixed spaces and tabs.

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

 .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 122 +++
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
 19 files changed, 4135 insertions(+)
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
2.46.0


