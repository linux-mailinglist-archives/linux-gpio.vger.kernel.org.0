Return-Path: <linux-gpio+bounces-35491-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAANBHhY62nQLgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35491-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:48:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EBE45DFEA
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D605E301BECD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED4A3BF677;
	Fri, 24 Apr 2026 11:47:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2130.outbound.protection.partner.outlook.cn [139.219.17.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703EB2DCF45;
	Fri, 24 Apr 2026 11:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031265; cv=fail; b=aRmU4sJMCeyTVivgoFLTPZTMj5EO11lyY5EiOYyoalzKxl2snxQFh6bOhS4EMzu0mU9Bv/BmfUlcxFSeYyXG7BZ9JTaS378Mcg4R91W7JV35WEWIewXU6IQYopxHMdgkPVT5TzKDXJADDh6knc4ZAidDPCkW+YS4CpgKe7+Ibtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031265; c=relaxed/simple;
	bh=GGxuhSrJdqamxbG7mY+36jSp4oY07O0jiJP69BbUyhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H2hj99kvUVMBwnQEHYLnWLM3R8X5qFkzY/XamMCpijSFEpHVmmLWgfLx7o2OSNF0qLVDvb2JZos+dmruzzOOvBNVeplmTxuMm7mK0GqGXO+aWS+PhjQF6Ay9OZuPDi07aY4TbAmsgZhKSAsgxYIzXX4FVQD6YWF7lBmtv1ErjLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTty2DsQivkPbOZ1oI7o0bYw82PgWle1JsxXLc9Ft5EiDeFO1xgosu12NJudzYWPMnuaVo3c0AnB/0MeDPCDqeEmysJBKVil8wd5xekn9A2dW/WFkjCjvWhTV8UrQmivmmgbNAAqcUXRYvyHct2ZUvtxDzSSbVxMPhRs9AUP4NHdcUnI26uPBbA3gYNv4pMOS1BvOW2/Lp6OBPkryOOmnF6+ue/J1lfVzwhAwpRu/rpU5DHl+gOSvi6bTh+bbWMvGToiHN7R3EPmwJHyOIPDTu5AKM0DZu+6NmAC1sK+OubqaVX8j106PiPz9HRBXmYv826BoZbbsvapUUD3+CWXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Osveb/IzrQcb80Y3N3gWuTCmO/TOMydOGOaKT/LPi9g=;
 b=JJQH+yvMzcs3YQGjlrd/xbu5jiH346gbBRT4E3nxVBSNK23sEUaBv4UbAy/t8yJhlB0DEL3PiLDVG/pJYm2Q7UyZffgq4zmq08DaPb8O720AjswTagCLZJD4jbrAgolyVPEZ9gIapqPqg85oyUTzN3jDYcKaJujtpMJWEzcogQbEE1em20FOZe4mPbOqnEM3Lcb0PKVeNpFK2hTGQzhkSflxJZkIowca2EW45J+l2N/HDMlNtVwRDh3QkSWsE4nd8uVqkPWocdxVX3ZbovEw6qikUMyglFYAG0AiXa4ilir3kVJTvNYMMPv7j5MRaEcDEMzDt1fJHQxng3sU3bnaFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:55 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:55 +0000
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
Subject: [PATCH v1 13/20] dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
Date: Fri, 24 Apr 2026 04:13:23 -0700
Message-Id: <20260424111330.702272-14-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1156:EE_
X-MS-Office365-Filtering-Correlation-Id: e92f4463-269a-4669-2527-08dea1f29341
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a0pD1o+R/BSHtlAQNAFrZKfTaYDyU9VNCHrDRg/7BzRxIKLwJGqMjFCziyqZ6lu5a3dXPTsJ2cvHgpzen3ZH8O5zqsHdQPbNw8pvbOEOapNbeVlx8qsJiJlXq+9yvUjrZyUvyTs5KCCi+WGOc2rdVJKbZivzv+ytR1yfT5UI7b1c1twphnSIJnPo8ndymCIeHUO5C7moQ5NTJ46IHutJlpejDb8fNrqBu0SR4DNdhvIHwBNb1ZKW0aoEgLIc1zQGicxNoXtMIoD+G2351Gm/KK/5dUzhG12AV7nGVl20t+5a33AXkLLP2ttqhcWBii3jsd+GRPjJ6P0faKweVVmSsCnSja7LqeHNIN5hCUSEQYgvQPbeQsC4ajKNM41sPfgufYEMkhkT4ngAnHkS9cKtG105OtTTXdnkG9ss8AyvkoGQQwR3XxiHPCOZFb73u83HfgmF50LMm/TyLE2PWT8MQcWREZp1PwEqJXwJGl1ygXGGuUOQ6EO36JzQiC+/PPuZS4UMu+AgLFB4xloEXqedoGGLSlX5aVStQ+dvp8nDpPyZ5R9pt611KM3WTuz2ZRZxINHit7K1WqZoeAiiYEhpwz7TBifWafpkodc1hKHtY7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JpsUTflhFb/hc5J8CRQwusOGseNnK8ZhENYDxprBDi3Se/p6bQOkoaDSN3W+?=
 =?us-ascii?Q?m//p8j0d4pw/gBaWlrVSGSBLpm6UWKV1IRsfVOu8x1lMUs1Btmws8+NW8hoN?=
 =?us-ascii?Q?hk2epkIcIbmjML+9i9t9jGSUarqJPja6DuGuXn92biVT81XJ7l+VdHJ+SBim?=
 =?us-ascii?Q?SqGMZUr81NpMi0qtQxfFSzJTt4ACJH/lrbY2qZyqXiBf6Bw2N7E4VOzbwHSI?=
 =?us-ascii?Q?8rd2eQIsdtGMoukYEE0z/82fW3kZb+pptMRhXmK+vti90kSlPlniLc2TfvEM?=
 =?us-ascii?Q?LNTejBu/pccJvwTW3HQUBFe8y4X+hvx3GO3XmtcZKGUqE5oblO27fguMyRCu?=
 =?us-ascii?Q?U/sIVKcBKKzY5mm8KPoGM2J3bOldQfEGuIutYa+6PXg9oe5sevPWDwj3OtP5?=
 =?us-ascii?Q?3A9jBngRcGo81X2IPjZgw2Qizqf4LcagFusUwUGGLWy/hyrbd4g+j7SLyl7k?=
 =?us-ascii?Q?HjYvhjfQIH3bfbEvhqKMQDw5EZWP5goTdZwGuyLDhJA379zzYlqEvke/cDNC?=
 =?us-ascii?Q?pA/NthVNmIifvLepS99Ly/sruReE/pT3LZpwns0K49VGZ+3TUDL61Cba/Zlz?=
 =?us-ascii?Q?h+HSflAP6BzXdO6X1OGwSvAiyxDdQ52hWcjI8IbFA+N/AtD1qkRQyVGHeb3d?=
 =?us-ascii?Q?X8fu2W05d5xMd3ijFimTsbA4QPri+5NcJN0fAG44NaY1VmV3HCHlfND/Cr3h?=
 =?us-ascii?Q?P4uD4ZyH9QWxtIxK4VXKgW7EPRJqfmGMtcgKRzWuYNUaPa6pcvBtPfb2cn8k?=
 =?us-ascii?Q?q+VA8K8rcndCkVzzXfSoV2mLnbxehVonXV0USaVUeSF4GZC6e++6w/kF6MQe?=
 =?us-ascii?Q?qoG9pbNLJbCeqdFx9NzhxzNVdd+CL/wAIt9TwYamIBUl21NeBbTNj8+No9cE?=
 =?us-ascii?Q?TenQRNQV4QQP4WLahMELAEqPJN+GvgepqQqy+fDG15AK7DP2tV6uylaCmjwC?=
 =?us-ascii?Q?bRLLHu6PvLtHvM1O/9Bgf63YEJ65lOIyI+jeuCSjQSVo0E6v2JahRPyeLNEA?=
 =?us-ascii?Q?UCp4aMQhb+HmHEPj6wRKb5Y1VQnHs9d0YSDGBq5BBLKeTcBHr25G1QllLuC1?=
 =?us-ascii?Q?I+b4FuZIZo/e0oj4VboIFhia+7Q9LR6R+6yiFicOsM3RxtiBhQN1WfwBW4Pk?=
 =?us-ascii?Q?m0kvABt5BiO77o+wYm2u7kX42MIqVw7mPp9XK27rnVSGDHGUft7beyXcYbZu?=
 =?us-ascii?Q?sF9WZ+Sh99lZ6R40e05DYZQ77a8atWsPpLHLtX0HYP8tobHTIG0KvrY7fPCq?=
 =?us-ascii?Q?tUsFnkJWoLYJ9BvLv5RfzORpUCEAEdY71+DsY1BZBn4NEJ/mBCFcyIflqfvC?=
 =?us-ascii?Q?IHMKPxdDMSG/VQZUcF+1u2VD/afdNWspTTlSRVPCsnO9KhumjnyUoL/KOFTr?=
 =?us-ascii?Q?3N8n62N/g0x+ntwrsHhpc4wwRa5ABM62vNVkdC6FLU1BLXI70LwFmn0J6a1X?=
 =?us-ascii?Q?TIFlah/NZAPruEtKb6Gz61FJ4fTFNNpLxpBRLyoB/tG+k40kG+rLNyOAsMzT?=
 =?us-ascii?Q?OvHRc975TP5KziMDgFmnBxqG9Z++9+W9lYqyJccGh1LaRtEN55XP8EQvcIoX?=
 =?us-ascii?Q?c6h4eX2MBEqHtp2Bkh2bPkasrx3Qh4r9FXZeYSJk6yGLjBHoFkjs839W79Or?=
 =?us-ascii?Q?cO+1Q1MlLmc/5ZuO6MQjWd9fsoNDA5XB9zodZdieXRsN4QafESRSc+CQlLFc?=
 =?us-ascii?Q?BK/eaL4+OqbQAeZS15eHSbIGBWlNkUn0KeZYtL9DoRGEXmtFbwtQCFRU7mmk?=
 =?us-ascii?Q?oe3JaTZBkNMXm8HQqm/4YebRNC/rOGiTMKExVfMXuiJASmffEiLE?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92f4463-269a-4669-2527-08dea1f29341
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:55.8872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahgIU/aPrugQkLpsuJps9NTSYZW6nJBOftJrKCo8JqFP2hyo2N3l2tco4ywNgSx+e2y1ktf9UCIiM2WgtnwiwCRfDeYor15xfrHOhMGh7WWBUiWuGaLYhzxLaZSmKr3G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: A8EBE45DFEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35491-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,11bc2000:email]

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
new file mode 100644
index 000000000000..0dad00b7365b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per2-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-2 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per2" pinctrl domain.
+
+  The "per2" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-2 Pin Controller, there are 31 multi-function GPIO_PADs. Each of them can be
+  multiplexed to several peripherals through function selection. Each iopad has a maximum of
+  up to 4 functions - 0, 1, 2, and 3. Function 0 is the default function which is generally
+  the GPIO function. Function 1, 2, and 3 are the alternate functions or peripheral signals
+  that can be routed to an iopad. The function selection can be carried out by writing the
+  function number to the iopad function select register.
+  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down
+  bias, drive strength, schmitt trigger, slew rate, and debounce width.
+
+  This domain contains an IO group which support voltage levels 1.8V, 2.5V, and 3.3V
+  1. gpionw - comprises PAD_GPIO_D19 through PAD_GPIO_D30.
+
+  Each of the above IO groups must be configured with a voltage setting that matches the external
+  voltage level provided to the IO group.
+
+maintainers:
+  - Alex Soo <yuklin.soo@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-per2-pinctrl
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
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names: true
+
+  gpionw-vref:
+    default: 0
+    description: |
+        Voltage reference value for the IO group "gpionw"
+        0: voltage reference value for 3.3V
+        1: voltage reference value for 2.5V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
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
+          trigger enable/disable, slew-rate and drive strength.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        unevaluatedProperties: false
+
+        properties:
+          pinmux:
+            description: |
+              The list of GPIOs and their function select.
+              The PINMUX macros are used to configure the
+              function selection.
+
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow (half frequency)
+                1: fast
+
+          starfive,gmac-vsel:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            default: 0
+            description:
+              RGMII mode voltage select 0 = 1.8V/3.3V, 1 = 2.5V
+            enum: [0, 1]
+
+          starfive,debounce-width:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            default: 0
+            description:
+              Debounce width 0 = Disabled, Others = 80ns*N stages
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
+        pinctrl_per2: pinctrl@11bc2000 {
+            compatible = "starfive,jhb100-per2-pinctrl";
+            reg = <0x0 0x11bc2000 0x0 0x400>;
+            resets = <&per2crg 0>;
+            interrupts = <62>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per2 0 0 31>;
+        };
+    };
-- 
2.25.1


