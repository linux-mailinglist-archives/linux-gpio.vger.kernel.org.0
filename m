Return-Path: <linux-gpio+bounces-8029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE494926EFF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 07:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EA5E2850F8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 05:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA11D145B23;
	Thu,  4 Jul 2024 05:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ibG412OP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2047.outbound.protection.outlook.com [40.92.40.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9839A125BA;
	Thu,  4 Jul 2024 05:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720071951; cv=fail; b=Tv5R4ydDSrIih5KY9lPWACqVjNPugErlwb2NryOqf6T/9YibaPaoIYx6WakvHSctleDUaE3yNN1QjpFCthmWf8LRlcD+9j3kZ91RijmR7v+48Ly6CeU78T4TtcXxptPA1gZpkjyiF4ySNF79hvSV3kvkjjC3icm/Hs/wS7+rKKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720071951; c=relaxed/simple;
	bh=hI2yumXjQE+f1CsLqrfIElTQ7PiabE6hIj9ie+vmD1M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YiyY4+ycwy0CA6rYZQHyTHdzJ73FfuIHvI8cHkXyA+/m87Z2l136Rxc1HmGgZweva0oUl4G++ROSKc/rLMi62uzBwZKWQ7G5SWnfBaG3koQmfmNcwsk4gforN+AHkqrCa/ynmeTrOQ3ljQEY0OX+QsgjNXlgjbr+BWoKqLaqX8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ibG412OP; arc=fail smtp.client-ip=40.92.40.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crkVc/QNJKoNKLDLZrk6Lh7y1soYP56jXIhQ8u1TCUGMDWtuV8CNBWwJT/gZRqNBl58DLskp+aINYteK0UenuN8ZQ7F8kAmDhTQNoPvodIY7SYQX9VhRM6bAUdVT+plzBFKcU7pXZSeL0Wl229AS4PKBXJkhh7e6cHZfX10AVUnseBhY3B4U8+IQdvaFl6UvcAv9oFHuIOPCIbvNvr++fvJotuMtP1Y52Ob+HKF/wCLS/KHKZJt8c0+ra92FjcSXr2r6N5PtaFlbVDw2S5LzSB2PpC9yP/k+cXMka3S/JFgbFrXOvFR3KQImVqxc06XqqH3zxwPyw56ekXbUpBVy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5uwAOMtpsE5wyh6SZMg06XWgjowKMZtAURC1iqV2is=;
 b=Ba49+qqyFPNBhjB9a3+Je9PHiSB9jACLdKVt4igCO4bCeB1/nPJrGOzJLrETHshiOQUS4KAWX76jd+IFAvCvuwn4/eJE2QY+HuWzrODLOWU+Da3DV24jwe3KWlWX54WEBnUD7ZTfs2wkTYOb5Xdixoj1fFsx576CRqXOXMLc91qhhaM7p5bJ9+tLx7evBGREMqPdF7QU3SsOmpSjgQZqZ2QaogAI9IMVupyfHAu5ZXH0CDa5H7TimXx/pY28GCh6+cfF87YTO6N3+J5Wp0TkZeqIrW32Fh5ncZO86qsHAECkqV6Z+u2NV2zFAo8FugsY+PW46WbrmuQwj3YxI0jo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5uwAOMtpsE5wyh6SZMg06XWgjowKMZtAURC1iqV2is=;
 b=ibG412OPxJ5EatQf8cB0OsMxBWApKSq2kJ2DB5+PnSgr5qZ0s5RotErBYX7iXqbH7SpPn4FrpoyYiAxfm0LsQ6oBFXJIpVwkWYGBVgewj1/cOyy1b82eGPcq+IkwZCxTDh/avtwHh0gLzpvy8+vEVRaYvF6TIfdddmlx9tBv1BZQ+KoZgdl7NCzMNcNZ1J2c5wG04gqDyXPIXv9sHrKHjhLjGz0jR5VD42v4uSvxh5YBD7Z/xAcT5rS+9NL8aZ1ZmWnK9x08z8Pn6wGmki6E4dz83A3WXjfRFFk8Rb4jk3fyn5NYIjqD4pJp6aAPtwrwbPlhAmnP/6aHYTtKlitXgA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW4PR20MB4293.namprd20.prod.outlook.com (2603:10b6:303:184::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Thu, 4 Jul
 2024 05:45:45 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 05:45:45 +0000
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
	Haylen Chu <heylenay@outlook.com>,
	Drew Fustini <dfustini@baylibre.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/7] riscv: sophgo: Add pinctrl support for CV1800 series SoC
Date: Thu,  4 Jul 2024 13:45:09 +0800
Message-ID:
 <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [0R0MGjUVV0AEhp7Lj9CWfpfsIH1/59L6jvdHDr8IrfY=]
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240704054511.1739404-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW4PR20MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f9143b-cf5e-4270-dab9-08dc9bec8c1f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|4302099013|440099028|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	7gDKqukGXcCywU6gR95KFbESaujbR7/PFyxUg16R11HKLd8yOvcXpjI2BkqO2Yk4mzSLTuIcNM9L6XsDNcxuQlndhGYriKJZznrkD3FzdD/m89PUDeAPvkUzFuz4fDfj2MBV0ASIidWWwT/pZmC17HfLZdELziFfbJJQXOMWJCiMF/kW5s5Wrq2WeBPlsIeBj/h8OCHj1uTJmVhgnYXJCPcFEG6twcUCXjCmsr+Oe9Cd2eQwEop4II71UURSTVHmAWi28J3RVALjCU9Iq6PR+9upsBz4aHYLD+2yEhQPxn/rQFyoyBi4D11hXifKFrj7980m7pLyKIXOnsYsjUnL40QliBZxfq7IPuPu3QHrN/1so7Wq/VK84bY8gmi0WhvYr04oOvtVnn07ODvEmzThovFkgBcDi92JwAxvMgyVo0hHku52EpSr59BC9/jTKk/bVmDAAWoMehFxzlFAmNW/0/amWbbMD+YqP9+jFhZafQJYXz+UmzsxcE7/oRT9MRd0tfeKvIHLslHSDbrFLmQ1LP+OcYOfyAq3/XbkDrb/QT/mPBvv4rLfw47mVzivqYW5/bpfMVvdLeQ4gSEMJhIMLSki3Px0uZ+Z2PG16W0GvMEpJzgySOpTz0+tgfhbLylYmSXAum14Lzd9Stgy/t8TLZ71Rff6Eq8mohYX5V99PpLGTkXmRiZBi6g0ldASuRFNRGSj7N75NWNgvkzyOySJ2d3VKqbszkDf/c9qpkMwZCFT5+oUjdudLd89f9EwndY2
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I0CxYNSzMNQh6G2RptAK5GS6NetlMFf2GXkiz/Hfn7X+V95WqKAE3KLiD9h0?=
 =?us-ascii?Q?/qRd8aQFkucb7Cq7oBxsPvzoGKn/xL3x7PZdfx0mrdMYKJixENqhDbiJTe4S?=
 =?us-ascii?Q?eo3UkR+Uf22CB7yCzOyokMokBmpVnLyfjjtu3Z8NJboVMnhIDANIfNgPjEjV?=
 =?us-ascii?Q?hK4cs2Wr90naWB8t4vfELg6BNOzSzA3A8BJpGXwe0RoHDnlIWiTdglPE13Nm?=
 =?us-ascii?Q?dOzh9u3XtaxhKDVQuLAYeb7x1oR5MmT5Mhrjsuv6+Ql2Kj9uaOBU+JOkKUQs?=
 =?us-ascii?Q?rZT9BDwq5QxrhI7PlQgJz5Ge9Gl4lpfq5LwmBEoqx2iR3Ecj0MXbbXkecNok?=
 =?us-ascii?Q?dkwb6EvoB3KWpti243NTGpwOxFSl59F65WMrJ1r0JStL6jqqHNa31oWb5DQA?=
 =?us-ascii?Q?SVxZ2IJTTZmlTeX5MgGzgHx5schZsiyawMar1URKf+Eo8ak4jhUw+EkVoq0/?=
 =?us-ascii?Q?9oPZ5W3OypjzenMxDjCFJg8Ajr/0Qd6sT3oC9XBmBwUt6F0T4IeNmueqotn+?=
 =?us-ascii?Q?jUY0BvP6nDYAwvgKBnRLab1R3JZ0Sx/tLSSxoDZq5gFakxDZZofgdR2Ew9ht?=
 =?us-ascii?Q?J+KlhsEm42PekFhrTUbXgyqd6HB5GvWAugirqPb0OP30+Z6VS7lW2yO18fGN?=
 =?us-ascii?Q?B7okDGrnQMCd5bisAB0fQaGRmjyYXjLS1N8H+5tPmtmkAx6NbA5XwhyMmYB/?=
 =?us-ascii?Q?E0K3U+qYaH4Voow3/Tdt4JsYeNWygI61p3fsMCa7V/+3yWKNeZXW4t9eSTSX?=
 =?us-ascii?Q?1wFXINky+xHIYzpKaP9e2NK07XPzbHReAzbdoT2Wy6Kxy0KtD4vHORxO2IdF?=
 =?us-ascii?Q?hQ6s3B0ErRRLp20zkWTFcIeJNdpHRryakDffyDTzKcZEwZKXoF0dPRnsWVq1?=
 =?us-ascii?Q?Z3OqtALabq99KhKWLxOX20lgjAm7pGnQfdhXuE8JDBhSf58HGZdIBgPGjUfj?=
 =?us-ascii?Q?veQxhz/LGDFQmNFijTsZyITAel2UvvRUiD193ri1cocHiExSGrLOCeQl8tUR?=
 =?us-ascii?Q?FU43WlvfqXPRI3sJNCOJZPlPfNb9gulhf15nkrdcSmrt+X1oYnlf8r9VcNuZ?=
 =?us-ascii?Q?us/xlYlE4mMlY5iyni9ko/iqkIAjgflqPqG/VvGQkYZVXkT7wdqgq6ob4YEn?=
 =?us-ascii?Q?WxCMXwCxq4/wlpWoFlnPzl/mNqBvesYZU8l/ygUiFtyGiUNrB/Rx3YyvwG8G?=
 =?us-ascii?Q?kv1bPktl8hsIUc/DaXDNxsmYPEarSkH2wCY/dwlfLaJP+IL0496mUngb033o?=
 =?us-ascii?Q?kJHiYZkXIoehkfSjpZ+Y?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f9143b-cf5e-4270-dab9-08dc9bec8c1f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 05:45:44.7433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB4293

Add basic pinctrl driver for Sophgo CV1800 series SoCs.
This patch series aims to replace the previous patch from Jisheng [1].
Since the pinctrl of cv1800 has nested mux and its pin definination
is discrete, it is not suitable to use "pinctrl-single" to cover the
pinctrl device.

Note: As current documentation is not enough to guess the pin
configuration of Huashan Pi, only the pinctrl node is added.

[1] https://lore.kernel.org/linux-riscv/20231113005702.2467-1-jszhang@kernel.org/

Inochi Amaoto (7):
  dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.
  pinctrl: sophgo: add support for CV1800B SoC
  pinctrl: sophgo: add support for CV1812H SoC
  pinctrl: sophgo: add support for SG2000 SoC
  pinctrl: sophgo: add support for SG2002 SoC
  riscv: dts: sophgo: cv1800b: add pinctrl support
  riscv: dts: sophgo: cv1812h: add pinctrl support

 .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 120 ++++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  44 ++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  10 +
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  10 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/sophgo/Kconfig                |  54 ++
 drivers/pinctrl/sophgo/Makefile               |   7 +
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c      | 293 ++++++++
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c      | 596 ++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c       | 642 ++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h       | 126 ++++
 drivers/pinctrl/sophgo/pinctrl-sg2000.c       | 596 ++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2002.c       | 373 ++++++++++
 include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 ++
 include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 ++++
 include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +
 include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 ++++
 include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++
 19 files changed, 3288 insertions(+)
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

--
2.45.2


