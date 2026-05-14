Return-Path: <linux-gpio+bounces-36838-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB3gB2mzBWoHaAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36838-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:35:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31C541128
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D6EB302867B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B613C0A13;
	Thu, 14 May 2026 11:29:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2123.outbound.protection.partner.outlook.cn [139.219.146.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C403BF69D;
	Thu, 14 May 2026 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758140; cv=fail; b=oC5ZEY8AczXzHi08hckG7ZQEWYk/YI/SRbMl+nfKl/JWWwC2kDwBhT4hNt6jumd2sEryp5NEdCwyBCzP2Y7eeqLWylRnqzLafv5UqTQWavvNB3tVM8gYv36WuQFH5IwaAOp2KMz4tV6kM7K+hMXIMnag4pv/1EH7dytxBLs/GEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758140; c=relaxed/simple;
	bh=qC+fhM2BQWxfCTZNwy5hubclzHGMU+8PKY5yyBW9RW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=onrvpIqnNWaAfbq9tCO70l79Fm3RtCpUs+I3967lCtJ0W4ww+I5vMUhpjkc2CJAhI7zbgXRUSolK4Nc+fiTeqAQbEiQ1YzmK0eaGJwmCetKf/PPlkUMtqfM8zlCMcY+rnlMaCGAQ1TEr8Fc1Xx0bk4MHyRxL05yZAErmt5a2SH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBvmm1bscSjiwwK/9yWbQIwpUYih+kDGa0NjPYO5Yi5BCxrHX4xijO/2i9Re5wTcoHTEaK/qt2EpTD0CSNeijcII9Ov3J7mpTedIYBehEe37qbWeUkErtBjzDGqZKgfBhgXv8/UyabygkaejJWzCPgjjQZ9zV8G4gMUM7fmroHCBeg07nF5FlcYdfLDdX3VjJ1nV4m45yhA9PWxy+MZhq5AbB2yBMosM8+j8g8/4ReGzS3OPB7ZYWGdIiMhQ7UxKWDqrAYA547FJEsSFrgrXli1BnxGsXvkIoyR4c9AdMPVMB+M4fB5qorBJJAcSIB1cXob5/qxRR+lJtIl2cX8Nqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hamHcuoI77Fdf5mGHuQsPXg31kLNjBAo3lpP5G++Hog=;
 b=lGe0qzb9nhd7IK9Lh7ryNssFLpYSjc1vxXuhw8VB6gSNOSki/G8BHl0b2UObCeqCLesWMuq0oo2S+4t19UY5szDxxkA9oSo4hqNCgplHMJwugUl26htzIfbx1OJ/nRTPlytKjnORRPplq69j8YVxyo2o+JcInFRepiehmgcTxh8iYGs/bzRl5FZtOk6KJarIJzSBSnCW9g3BcW8q/A1dqwU5nhxrTkRIBZXsNw+HnYocPTGoRGwmBknBoRjoTzDwVww/okMrfpA0xu2+1Y/t+8BxnyPlXMOPwjrUOzpVwvhhSqthRo9nT0tSJSXjYdycbLV4q7zGg3iTKNIZ6tJrTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 11:12:54 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:54 +0000
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
Subject: [PATCH v2 20/22] dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
Date: Thu, 14 May 2026 04:12:16 -0700
Message-Id: <20260514111218.94519-21-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 14099480-fc4e-40af-4345-08deb1a9bf25
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|921020|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	H7XI1nk0wpJ4aWGExZ2SqjMSN9E7Ptt1Z0THesxKoHhNVzo4T6Gnab2yBFg1S9ApLYPw0mzPoSkTshk6iwv5aF06C9nvC7e3KP/nSKM2fUTE7iIbyVyIpCU6SLJfYXsVFSKa9/qmRnFk14akNXAv19kygJXElmG2hcG975NEsOJ22sFIjd0hXaQpkDj40mUQs1YO9LDFLjVGuwjzWmxhThuCuObUDcB7Mx8fcG9Vlo2m2uCETv0OWVIKMY1xer0rkcjNe3z+z06MoDY8pwUoxRAkGZDTyHkwaU0bl9oSUxhccU44X6Znf4oaP8Nn/9F/Jf3mmn1k3kWIZFuy/V7s8Y47of0qjG4I7tBFBCmIkCGPGKhqY//iOnurfdUjaNzXXyMV3HuPZIkSrrOFbfYAGOIZ8h+io0pA7V6TktcUKqcDjkflcyoD46w841OHUapzc7fyYN7qPF4qtWqaTjBZFRimWXx6Zc43K+TYZ9A9eU9J4r+3esHkdJLyuNw0GanhKGuW+MSsvn+7N3PAXHzLxs4tQyJjIjPfQHbV93QuO7SXclJhTGhrRW4HkCr8uXmxMLMC67D+4wrFVNXvkwO62w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(921020)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RMbocLscELM3shqQ56tFWhmMFWYWcJtkNcf9D8cj9avMEP3SM9XphRGOb2yO?=
 =?us-ascii?Q?XF+6ZRj0hMbZYCsLzwbsdtYjrZXZrv/nqr5feL6M3rQMnzRzOfI8oNCcELnA?=
 =?us-ascii?Q?z64dTdZZ55M4U20flptLcbkqJU5X09pGoC8G/pDJ46t3QVXoWIM9ZUrI1pbI?=
 =?us-ascii?Q?tNBBo57VWwipqOqDScClNQaXZnFR+SL5CFdOFZ75t8mqElz7cwKCAw2UGGHF?=
 =?us-ascii?Q?wiYTc/ptJdPJ7xNbqdff+uD/2Nk8Ef85M+wK0VSbvRtcS0wGvMUB5nVZaWO8?=
 =?us-ascii?Q?ozU0zb3VdmfCqH+VuLt4C2MO3sp+SElOvmpqAwMe4WHCIKxaMOuFo1CsanKv?=
 =?us-ascii?Q?1WtHDwNEnMFnZUNZm1fNCB0uyFJoVro53WgGTTZNnxxEt/pfBxnItCCQuD00?=
 =?us-ascii?Q?WZneDoRA5Ub+aMVMVyB1T+05uiF/8XT1f96dqCmm355y7kHERnJUxHMBNfXU?=
 =?us-ascii?Q?BTVGme2Fd4j/HKDOAxOOwNmJ8JDdYu+APjyvg0ppReRxN1LGi/AZ+7ID8Ehr?=
 =?us-ascii?Q?jwU45lmMSQpX/seR0eLmCpK4AdFnmMa0HacIdGTOAOtSRPQKuLY71ijn5ZkC?=
 =?us-ascii?Q?KpK4E5OeXxLz7D9XLZ8WkYghy3Mp1AghgOCV48BKlgIf7sIy9GuLCNMNNXL3?=
 =?us-ascii?Q?bhO8UV9RSyc9B+Ci6924OWa17ifgxs+JY/kGvHpBDcVo7OE1v4XYj6u+ujqF?=
 =?us-ascii?Q?/VULratypbBMJI45mQtxStQa4JDRdv94PB/T5N8ihcyWUqi9MQHlyXiH4W5b?=
 =?us-ascii?Q?eb/juqO86idFeFulvcXiEFvT6AWaT/dW56xxfQxSgjOI6Cy7azzofkRakYFo?=
 =?us-ascii?Q?7P6POW52i89aOYsEcqE/UrBlo2suvVmGpqm4rFLhBsl7czAvGFXfExSpMo92?=
 =?us-ascii?Q?xaP981fbKQTH+DbrPzyNE7TC2ZLzSWsyQegP0y1cFkVRUgXyxtywqKlhA4AJ?=
 =?us-ascii?Q?6ERydusZG88tfUQTmewxlTKyiypqko+AwlYY3Js8cLdKYVqoYokQi+pm7bKf?=
 =?us-ascii?Q?4v4W1Y0DXpjAge6xB88ShAXXvT0fNip8I/JLPzYOKa6MiDtObIpyyiRaiEPj?=
 =?us-ascii?Q?02bl1rSIvMQZX9pPRgi1dZe+5F5rNVuTKr6vN6puCCtPMp9k5+10BAzHlMlM?=
 =?us-ascii?Q?lRANje0yyTB2+wrsC11NEnZbvdyY6OKNHTeXXjATggS/m1bUcc2Q7mWhGsBB?=
 =?us-ascii?Q?DKgOQwtu8N0XRF/gjzt1inBJE04gwMPpPgQ3Tzajj6mQpi9Tq1bDpY44IAEI?=
 =?us-ascii?Q?Etr9KOEynK7TXmCF+qBhNCe5/+79LkTWrQipHqwZ7pT9cBQoUJN/rDR7rArV?=
 =?us-ascii?Q?ojRFvE2IFmBPYApfiiCYJyebM4cD7q6TiVBi+HIImyQuFZSeVctqisUqa/xf?=
 =?us-ascii?Q?UPd0ppdUoAwpjkd92Dwd48Rb72PyKH+o4WYuNFykNy8YsydTbsOYZXoYksQd?=
 =?us-ascii?Q?+7ntEnDoLmJptwvXBfZZc88Any6tBwczph5JMsP6AEcwRtxO8U0L/eFPY6dn?=
 =?us-ascii?Q?xxNgIBD14c7dWGfovW67DzLW74jsacbygP3wz9kjOy9ooORiCHdHC9IbjmQa?=
 =?us-ascii?Q?a3A6UcLkjGDVCZ+LYSe0R6REG45eZ20ytFeJuBFlmVI/xxRePjfcx5v74U0T?=
 =?us-ascii?Q?f7Zoo8og/p0OQ2kAfCfR32UIxySkTKCn4HCvTRJoSjwhsRYMXf52ntPvNUL9?=
 =?us-ascii?Q?BQ0uye90hBXKW1FPnTMf3OS+ApGfrHc2DXvhbbx/ibM4ARTz0K0qYxAxBZtb?=
 =?us-ascii?Q?wD9FLgOhOc+TXQpe5IT5bbZ4NPq1VugnwXrQX9R00nomV9d78sOQ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14099480-fc4e-40af-4345-08deb1a9bf25
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:54.8759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sN6cl9aljB/bwDWqb2WoFIoZ3VbS/L8CndU6BEJA7GIvuMkd0+3Nietso71jhyLQ21756MijmsB1Dy7xaQGvFyh20/23qcjk0buZf39USs3t8rj3cmtCPv03PIBlbx2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-Rspamd-Queue-Id: AA31C541128
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
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36838-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,11c42000:email]
X-Rspamd-Action: no action

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 173 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
 2 files changed, 187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
new file mode 100644
index 000000000000..a1e5e09c06b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per3-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-3 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per3" pinctrl domain.
+
+  The "per3" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO interrupt handling.
+
+  In the Peripheral-3 Pin Controller, there are 11 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 2 functions - 0 and 1.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 is the alternate function or peripheral signal that can be
+  routed to an iopad. The function selection can be carried out by writing
+  the function number to the iopad function select register.
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
+      - const: starfive,jhb100-per3-pinctrl
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
+            enum: [ gmac_mdio, gmac_rmii, gpio ]
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
+        pinctrl_per3: pinctrl@11c42000 {
+            compatible = "starfive,jhb100-per3-pinctrl";
+            reg = <0x0 0x11c42000 0x0 0x1000>;
+            resets = <&per3crg 6>;
+            interrupts = <64>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per3 0 0 0 11>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 5573b5b0420b..05fbb8e0343c 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -230,6 +230,20 @@
 #define PADNUM_PER2POK_GPIO_D47				16
 #define PADNUM_PER2POK_GPIO_D48				17
 
+/* per3 pad numbers */
+#define PADNUM_PER3_GPIO_E0				0
+#define PADNUM_PER3_GPIO_E1				1
+#define PADNUM_PER3_GPIO_E2				2
+#define PADNUM_PER3_GPIO_E3				3
+#define PADNUM_PER3_GPIO_E4				4
+#define PADNUM_PER3_GPIO_E5				5
+#define PADNUM_PER3_GPIO_E6				6
+#define PADNUM_PER3_GPIO_E7				7
+#define PADNUM_PER3_GPIO_E8				8
+#define PADNUM_PER3_GPIO_E9				9
+#define PADNUM_PER3_GPIO_E10				10
+#define PADNUM_PER3_GPIO_E11				11
+
 /* pinctrl hog power-source value */
 #define JHB100_PINVREF_3_3V				0
 #define JHB100_PINVREF_2_5V				1
-- 
2.25.1


