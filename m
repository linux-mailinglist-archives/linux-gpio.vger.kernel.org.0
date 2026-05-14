Return-Path: <linux-gpio+bounces-36833-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EusCz6yBWqeZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36833-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:30:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8146054104E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E255C3042267
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FBE3C0A00;
	Thu, 14 May 2026 11:27:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2103.outbound.protection.partner.outlook.cn [139.219.17.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1277A3A5E7C;
	Thu, 14 May 2026 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758064; cv=fail; b=CnEidXQ6XmP/wQHuS1AU1vWJjpm+mEHgwClcs4ZIvubAcEU4w8rPvMEFVW58AZyQjZi9YR481xX6PlrPHZEn2IjJ/GwumCBUnMvcI9kaBSGOzhDBGmhy99f3/VCM9mMf1adaQ8qlt8oI/v4nfR8HOuFtbDqbGJFnHErDi/jlEoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758064; c=relaxed/simple;
	bh=Hf88o0mCBwYm4pYNk97QY+fw6AnF7nEyG/ICXNS9icA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IZ/KBjTecUY5iRH8sb+sGD+48YHSRpKVUz4V7dw4NzZM6fcYRurL41/h1ZwwMqSm3Qm8YC2fhc74CWNszwOfdrlv/d1SrH0DPefSHDNv7UQT/cZBHXBVN+bwAe19KumqfUnSKP+qgChuf73h+X4RQVCwzm56nbEqUrNqyfo6umU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cchObIolGhlDJVJOG6yWyRw8bdTRbpy932xjQ5JiV/iS0KDktMMLNjW+SJWvgGI0xdg9Pnu0PKTjCeYu5m/fe0FRHEjpJSzO8PaAvczcvh+lvPFIY7SqRgumK2PnJXj89CHLMsyLeZF80sIJ4QQA7d6PUaRs8WPo+Y/2IiJ95pawaXlRDVcK5E+Xz3Vz1+iZ8SPJOVG9XikDo83HU11msXBb7MmeJa4rhEJPDSft9uZJQIzvNpSj2fWabITYdKhCyBCnpusWh6KiwDFT3IzBPSJXQFmIo+F37yd1tbnM8f1RfR0ydWnDubdUc9JINGPLpZbWtPPP7lvzfGGQ9uAAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOKeqgSC4ctTAMPWhq7q/BVl+QwZSoQZEByuZC9ACSI=;
 b=MgMw6Vm8kCrR8EHh9P8SFj96AK3JTTHDukAHTWC2Bq2u5NDSUnDKIfO8Vq6OLTX9qhigDkOeit7C5HnJNGmrzqac89bksH0bB0sANflsir6RilNb5tEWFTPbci6bhfzAaN087wV82xs6UAfJfuKNlcQPULpRUUDDe00NeLMENTUFcuHCUcxybqXvxLk+s9gQ3s6l/4yGe/knx0yf5fuBGhApQG3WYZ4HYthlCikllTTryTLzLbrsfXHyJf1v7LxRmByPRmoTQOAfR0E/Cxrudv4/GtfXgWuiXoPGl4Uq0aHIQhLQ0B8aSkChG06rpO0kS13aBR8/ji7wmyTh5XPUtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 11:12:41 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:41 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 08/22] dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
Date: Thu, 14 May 2026 04:12:04 -0700
Message-Id: <20260514111218.94519-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
X-MS-Office365-Filtering-Correlation-Id: d91ee286-b81d-4f53-c855-08deb1a9b6e6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|921020|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	iRVVjEMtRg5P+y6+A09bX9td0HE2NC4oCSySCkKYn69glx7CSy1Zkx9nOHcOFAzlLvT7e7pkDP0rP8FstDlTv2pEO5Mbmb6X2vzapL7pQraqciHIfT8GtW+HHKP+TBMJOokM8ODstadt6insJtENel2NSiSrw1ErZbqQbjfcqtpMgvpWEctDuYB9e9QXebnTiFx5lWJHf9OTKWShFuKXLnA9Kuf931ih0fqkdstNq6Ah8b79PpmugJqCRSvjysUhUA+6iFdExYf//7wXSNEaOULfjio3qMfgDZydkFTxEimr6/9cJE3l/9dKLvhpDM81sq7hT8gYcj97whZDwK3Q+kAEyvNETl9M1teY7U5C/IPqyO08QFoECjXF6G30xxY46ZtoxysZqYRtrj9D4v6idLgCuyxKp/B5HtTOmkpDQCZ9BARzO4ummF+jt0n+sUt9pHy6Jq4fIu+gMY+XT3liwVFBXqdy0WYuEvlBXLLsA93NYHVluj+qoPh+TARBBozpIdABuSxcsfVhrOX5lLGbhr6/oXAfH1lJaru1+XNaWQVrIkIdcJ9Hg7J3fXIyX2kCKYovPGvdPnt2z5mfWIcmZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(921020)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GVJwOfljs+KDkO19sOtPp0Y/PPgkpCUWUPdFPERqBH0zKo2csTrRZWrW06jd?=
 =?us-ascii?Q?w3AoA5FmrbBj5SgPSxtLeOG7Ib/0/iqS2i2sdFvCpBeRhIkrbfPjvhwXW/Rt?=
 =?us-ascii?Q?SZoj/EwQGjA6r8mUvQqFa2gyZVdFG6i5uAdJ1FZLDyMMcY0+4U4Khwul5ru5?=
 =?us-ascii?Q?6/ckwblJws4D5yuB5wn5w9DaLgMcG9uomhNf8udYXUXzoO5YMsm9XzDrjjhj?=
 =?us-ascii?Q?0efVIJfp0+VFUnvRC9+zGD4nXuGK4C/DpZ79wWOwFU/wS22SCC1i5HkMrq7a?=
 =?us-ascii?Q?Sh1HUWTHs34+EofNdBZmECJdcYZRn7yPxcuIGiGbbloYh6A065ls3nFQdy5+?=
 =?us-ascii?Q?wW76aF9dvilN55qyLe2ynaw/9jPHPz0d8LvBe3axtvCkwwphWGw7tXZrjWHj?=
 =?us-ascii?Q?N1/n9yL6Wz5mlMTXphf1w/xVJt8xFyQe1MSeT5Ftxg3dYYZgrfOwoYh7evoH?=
 =?us-ascii?Q?n3jt8aH44YlPjfGr4PwLezvIPvBwheKAJruMkyg4RkzAyQFLbucXQhGX/7q/?=
 =?us-ascii?Q?J/o0urpvoW5OiC3CGmctRQYnxvlbSbzTxox4v6AT2hJ9pEO/W4e9PZAgPRCH?=
 =?us-ascii?Q?eNwvpDh1fknMqLgoab/JVOOWCsjjg0RT1/JcLwQZ5R5nkMLtXP1yb7L4f8tb?=
 =?us-ascii?Q?lGWk2yMwUgueP7MjyMK/Qar37B/B1Fq899WWAchWSMN2ZKkuZCJ3AP2BiQYW?=
 =?us-ascii?Q?Wh/ONXXielkFTl/WhOUrqS72TZ/IrbK+z0XhHCSr/gB7cg9KxU27f3On4U0J?=
 =?us-ascii?Q?ueI3VasiupU3+vfxWxMrMuCflHTW9QTrJNyw06wFTSWk3K2Jdhz2ie+LILz/?=
 =?us-ascii?Q?p1oXXFDY2DVaXi041OFXQ2y4haMU91ztRU6+Lsdx9p25ZEtvlcYA7QfrPd6e?=
 =?us-ascii?Q?sIN2GRkySlWHfVwwVT+o+gvupZdZtgGtO7aqN/2opYsmx/KlGmJjNBl5mlju?=
 =?us-ascii?Q?gRiA8nJFWb7W0zG/FgwkgP3MWj2T7DUqbZAb39X9Pkn1Bn2LHQVev67o/gDQ?=
 =?us-ascii?Q?dks6TVkbkM+Jwkmyp+TFVZUI/TEukSK0SACeRZBVqm+VMuIP0nSauCzVCs4P?=
 =?us-ascii?Q?Lz0Krd2pQ5yeRTh8tAImxGJ98m9HRdow8u3Al6Wnw7XcJF3+0HMsHigmGfo8?=
 =?us-ascii?Q?mVcNmAqNApkqFluK6GRjxhmxSl2HRhVdow0r1/2xCjzQtZ0KML7NXYJeZ81e?=
 =?us-ascii?Q?mnvn6UWNdtbtZc87mVMQorf/UzmoonuGhElkxg+Z2jz0wxamx7InD+cmGLqv?=
 =?us-ascii?Q?cd9W9ImFrpYXNFN4L853agVs9H3fvYIubonEErYcKIzsPAcZqFMNKS+XSYx7?=
 =?us-ascii?Q?FHWWFw+JErCeXBilbnZy2Nr2Rb5RGp/Q59jtSl9CgWxUuFp8gIpG7waKg1QQ?=
 =?us-ascii?Q?8O6gqPKXEq5kE8qQQAvzYC27ePn7cnWCe/Y3XU0DGLgvzJ1yvkyCpC+O2gqK?=
 =?us-ascii?Q?MRxqalSfRWsr2NfivypZkKeUFg1TMmETlU+9Whc8dPZNcursV3ebJH+mkHok?=
 =?us-ascii?Q?M2KkHZTm+CEYRE0sqDbubZnSTi28G0bYJtKaaUJBzcwZEw3/Kq4HIQ/gDWbI?=
 =?us-ascii?Q?SD3Mkmy/zKjFr/EFd6+RjExCXwuBBS2uFCifn0tl0DzWT0QNWIwdNGtY9XdD?=
 =?us-ascii?Q?SImHmamVisOQcLupHQIXpwwV2vAJiQffDcbhCMaeq/VbDuVUbLk7ZHJje9Gr?=
 =?us-ascii?Q?SEUKhvOOGs6ukguH+C5k/JeQwZAfcVDg0wGlUDVUrvi5pE6NRu5caledeTCc?=
 =?us-ascii?Q?XdQteFdqIHoRCGHyvBXuZxaR8htzlU3HubEtO4VN8zjZsD3Qax/q?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91ee286-b81d-4f53-c855-08deb1a9b6e6
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:41.0604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlxiHy/pJzxv75WP2Bi9/CdINyBltc4rPft+Xlq8XSMJuggjRURLijzfXiV+dnFFrtTHpRUkYfUfkSEAlaplseW+UInSHLpm+CGKlAMFnto+pw5O586dVZ5LSzlhoQoS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-Rspamd-Queue-Id: 8146054104E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36833-lists,linux-gpio=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.903];
	DBL_PROHIBIT(0.00)[0.199.153.168:email];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Action: no action

Add pinctrl bindings for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml | 175 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  10 +
 2 files changed, 185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
new file mode 100644
index 000000000000..f9a7998d11cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys1" pinctrl domain.
+
+  The "sys1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS1 Pin Controller, there are 8 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate,  input
+  debounce nanoseconds, power source and drive type  (open-drain or push-pull).
+
+maintainers:
+  - Alex Soo <yuklin.soo@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-sys1-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 3
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 3
+
+  gpio-ranges: true
+
+  gpio-line-names: true
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available in the domain. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          function selection, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate, input debounce nanoseconds,
+          drive-open-drain, drive-push-pull, power-source and drive-strength.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        unevaluatedProperties: false
+
+        properties:
+          pins:
+            description:
+              The list of IOs that properties in the pincfg node apply to.
+
+          function:
+            description:
+              A string containing the name of the function to mux for these
+              pins.
+            enum: [ espi, espi_reset, gpio, host0_port80, host1_port80 ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [ 600, 900, 1200, 2000 ]
+                description: Pull up RSEL type resistance values (in ohms)
+            description:
+              For normal pull up type there is no need to specify a resistance
+              value, hence this can be specified as a boolean property.
+              For RSEL pull up type a resistance value (in ohms) can be added.
+
+          drive-open-drain: true
+
+          drive-push-pull: true
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-debounce-nanoseconds:
+            minimum: 0
+            maximum: 4294967295
+
+          input-disable: true
+
+          input-enable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          power-source:
+             enum: [ 0, 1, 2 ]
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow (half frequency)
+                1: fast
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl_sys1: pinctrl@13081000 {
+            compatible = "starfive,jhb100-sys1-pinctrl";
+            reg = <0x0 0x13081000 0x0 0x1000>;
+            resets = <&sys1crg 2>;
+            interrupts = <58>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys1 0 0 0 8>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 38d5a94e92e3..30704a5a3418 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -28,4 +28,14 @@
 #define PADNUM_SYS0H_GPIO_A14				10
 #define PADNUM_SYS0H_GPIO_A15				11
 
+/* sys1 pad numbers */
+#define PADNUM_SYS1_GPIO_A16				0
+#define PADNUM_SYS1_GPIO_A17				1
+#define PADNUM_SYS1_GPIO_A18				2
+#define PADNUM_SYS1_GPIO_A19				3
+#define PADNUM_SYS1_GPIO_A20				4
+#define PADNUM_SYS1_GPIO_A21				5
+#define PADNUM_SYS1_GPIO_A22				6
+#define PADNUM_SYS1_GPIO_A23				7
+
 #endif
-- 
2.25.1


