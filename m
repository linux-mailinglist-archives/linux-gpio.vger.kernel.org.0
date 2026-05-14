Return-Path: <linux-gpio+bounces-36832-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHApFG2zBWoHaAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36832-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:35:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBF0541132
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D520F305898F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA543C0A15;
	Thu, 14 May 2026 11:27:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2138.outbound.protection.partner.outlook.cn [139.219.17.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818903BF68F;
	Thu, 14 May 2026 11:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758043; cv=fail; b=N14BWMbo2s4s7o8TTIvJKPqdok7MWnWDaZeFshsQ2wRCNQG16Pvyu1jkAgDQBWYo87JcC7MlKQEy8aUkB/PF05Og/dYbpcQvTxril9Njru8QCLKzxzwuZkxi0Nf55JqqE5/2v6GKSAYuPHn/ZnovIAm/QgM5xG1KoSPuvc6xdHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758043; c=relaxed/simple;
	bh=qkWfs73RD/cdbBuVIsdBxueNzfnHi13iptbAQMbWDhk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ucCflz6T7eWOFDsRNzI4/u+7TA2hs9B17GwaWUaDJmjlvKtN7En81wKYk8J75LjrVzlpTlMh11Gp87TUHeUL9cXZtx/C2dhxH9FMY9F2MydSqoX45cGXwhepFA6MLFTuMYwejuIjQA3vwawsorMdmcH2VvgeiIMLs064/CN/tAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQ3Z1NHogYY+wIiDxa3xyvFjLobHfqIDFd1B7EVxNBagy5R0T5CvJggLUDDXsIkQZB82enCyOgpY+sR6+fAIZYE+9M5o2U9WGVOXDtusHoQvfDxYsy/xsZLCtN45ACMlwFvzSlgjz7XO+A4W4/KNOOb1aqH7MehsgONsv081Afv+G8G7SKaOE5N8bYMIK6/xxnJu86Yow1KAp0VC1cAbOR+Fqd0i6xzqzbZBDgZ9jatOZ3+YMYvexFjRFySdrtOV4NF8C1JmCd6NkZnie4hTAtMsCGRd5UrpUTotqDFXumna3z9KwVn5PvAmyWVK0ujJnQ/hR7PQM78o7lhuOX6Kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLh6tEgCCKpphtiwDjH9fQfwNF0xR02sPhE1yXsz2/I=;
 b=KpH+vGMk6dZhi0N2rNdw6Nt45VLQU054pCIwqg1qDmjnjC+nq/EwnbI404UVracD04/jY+o1biUD3TY5nkhiQI7buFNxWHHFRYzUcDY3fQA5utvvf5ONDgofLRIjzOw00wkeX9ja5y4rQQgs0lge/vVCMp8M6y30Ki3N6/fSIH8RnMKInoiVMz+ny5RrXmedeYOd26oIBiqpLYQ9il3hza7RlYDqWUdcdli6x+bAMfnzOVAtEvE1iONtsLhRKqTEFXQezJEY7vDdXdJVVYs5x3wMWFZTU/oLJoYagOP/3StNqHcgxj74hv6J+6wztlW9IJkgIDQrVd+VzJSxtxfDlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:50 +0000
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
Subject: [PATCH v2 16/22] dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
Date: Thu, 14 May 2026 04:12:12 -0700
Message-Id: <20260514111218.94519-17-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1139:EE_
X-MS-Office365-Filtering-Correlation-Id: be83480e-62dc-4818-5758-08deb1a9bc62
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eNsPN7I6454dkNaNcA5y031SL1Tmx9ByAyEw3AmqqcKKZsbdoQuf4eYfb9JHvRvqNnDMn/TVzTlB8h2YmAEqtzpHGcoqcijEaPeNReLT6twaRSz0RsR3D4Y2InH7CY2uS+zvlb0nSC3LsUhEWQSpHewvsh0qWmeuA2CXDozB9Ful51+f43Fb+G264fZJVwVaI6sSu/CvBSJ4VAWkCbhA/uzo8C32WeMg+QgygmuGUeMb7BemYRbpFCWjrwQ93Nh1l2+uJYzEU6Z6nKXFNXwPdtDh0LchBnKn4NQE6VbYZirW+lxEI8ykBu1IDMDU321jmRviMdtaTrpCZHRVQR8JQXLdicwEr3hAs+A4i+3rDB/4CP98VOMTZ0ef6zvzvf5SoLHJlw4bVGArYRDmSIJK1yQ2aWQ2/VCGd0i2YCXDFgMwlV+a1k6GiTmM1zOm1eGXe5CMi6UjUyBr773jnn9B5jRzOkKJYgz3tXNh6qGLdA8WOSFqJiHaZlrWX3zBpGZJ06C+1FbkZow8ZaK+e85QCqKYqwQTnIN9uSqM0vZYRl0Ah1w3Q/tNG/SNulhsoCgmp/ht48KpweLCQl4oL0w2LA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iZi8JO5S7rzxDaY4NvONIZvyRb4Bqm4+DOgpCzZXDl7bWG+l50SnCWYokAVL?=
 =?us-ascii?Q?zF+loEF2goNNUb/aXbi0fz8OteV6yIB3obfmypucPW2jPGRQm9vMnR1sP8XO?=
 =?us-ascii?Q?3+oXLGMB/e8Y+dwIvKCO0TyjJTkL1kY0Y2DDMxdp9fgaeurMwI9xkBYfC/Zk?=
 =?us-ascii?Q?g5mYCDnfjaj6Z31u8/HBJhFeDfkyNKvbD8thCLPAKzbHvpFUDBibWRg/bH5N?=
 =?us-ascii?Q?wlu32FnhacTbjhbVfAwyX3Mamm9ATSrVWuSgBJcEEvP7ouEEP4q/X8jXrpXZ?=
 =?us-ascii?Q?PRc47Q8gdm/XTFF9ZuNDriQt3Z+LS6vaRXWtt17rrKhV56/ZYEQQT4toxFeW?=
 =?us-ascii?Q?WoTauKkKhBqg3nFFpSYIzCva8lApXoDFDS4WjGBLgqK3gHJuYDWATRQrEmWn?=
 =?us-ascii?Q?qrU0QCHdil1J+XOGSFete003Gr1Yba+/OoxGB4rKdquckaovyYDmBk3a6Eaz?=
 =?us-ascii?Q?L/F5yYn7b7SBMLdrVEPZamiceTbHkBoxxZz6q/c/NdlAN/Zj3mUMNWN2cXNL?=
 =?us-ascii?Q?fmMoTFtTuY9eF0XXzviWayIwRtVnTsFCe+4BhS3MxYbn6tdIrG7nUrk1mNte?=
 =?us-ascii?Q?WlK7ucHPdGBzWtphdG2cULKZin4x4MQpR1CU82ln0fzKAbk/gtJOEBY+6Xgq?=
 =?us-ascii?Q?keoKD1cKdIsnP9yccztsqXmUqAUNPcfv2FbmlB4gGoZEHhMBS6/lA7/mKpCq?=
 =?us-ascii?Q?Lt2UK9Uc2ncz9d6o9sE7saS3OsOfxP6jS2DXXy0xiM0fZEf2IsDAD91B9hbd?=
 =?us-ascii?Q?bH6vtKTa/zRELvB1H1FHl07217+O6GdnsGnREYRpZGa4+eFs9npq1zAPvvMD?=
 =?us-ascii?Q?30Fl91W4lpfSTjVbcmbppDCbApMSJ2M+JkJCx/w0z0jV2EJ14FYaz4aQGmr+?=
 =?us-ascii?Q?IMgtELg93FddlBnrKqJcVZJ/3kvkajju8Rb80GcHGTmA0kbtFLsAhCJ2iOXS?=
 =?us-ascii?Q?jz7hoDyWsJgaLRyWQItWxTCr9+p0/NG4gAs3wnX+9bQ4tTVkAA1NFDIhiK2r?=
 =?us-ascii?Q?j5pZ8iHLkhmrGT9GHuEWrZIVWtGb+73fsBcYOARIbA5kYJzTmpnkURWz55jC?=
 =?us-ascii?Q?aXKHED4d9qSn2+UMFf0nBhYI78dAdQduZ+CJ9vinMawxhKs1MCcVZ0E4rJk9?=
 =?us-ascii?Q?SHB/F+lp1qYT5hveLyn6QzFnv7N3KAGhkFZtj7wxzuRqzxP0Fx2R2RuX8h9V?=
 =?us-ascii?Q?AhOxEbKDi4VlLGvlyuAhb1wq+QVaPT7EC3hJsN7+avP9LiOF4rqtpj8N4tj/?=
 =?us-ascii?Q?mI4IX3foHYlqEpcozbxu3AlIKzOsGakE2kHcGNeyMdwq+sddK65KQN6n5lZt?=
 =?us-ascii?Q?ZkQvnybFYqWccfRpz7njCkA6aya7/ruDBSiNYyF1KjA6/oy/cUKtzEyQaJZ0?=
 =?us-ascii?Q?uFqW2ra28xu+9hBV+Htqj9L4dd1qS97b5yLLb8NM78j0Y+35TZ7Fm/VeveFe?=
 =?us-ascii?Q?sRdmcGMQgfMiWBbSqeEapaBQP7s3RnSQky70Rc2hoCMAyso90pYgCd3j9RUx?=
 =?us-ascii?Q?4um5AaXY6jOY39D1dX/9tRe2aJ3r14miIJ3Pj5ojHMSq5oFeJ8o5dSnfgP2V?=
 =?us-ascii?Q?v2AHqaIsn/LxBpZ6yCRllKPj6zSV1DViuCixBRdFsi2jy65lOMHohVgDly+Y?=
 =?us-ascii?Q?UbfBfWkRIvtV09wFXSezbygWeA2wnbSD+p8+QiRv/r6ozn0bxwJCnr5tEeFn?=
 =?us-ascii?Q?tSxyj2GaPfi+0mBD5wei8hwoqUJAa/zsjkSgXdFb3zARLk0FHo7YrMF6XWxM?=
 =?us-ascii?Q?D6/ILTl8K9gcwPC+IvKbvrsOqAcVZVOxzxKSiGz2NP36oOUjgCwP?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be83480e-62dc-4818-5758-08deb1a9bc62
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:50.2489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ztGBNzmc/ZR0m/J+I4jMg5i7s1tBkl3xuT2Uz832A3NzS3X3njYyYjMOV7rpgGJ2w8YBFVNQrlUTlsvaRPWxSzKvqWqXdy9+NwqCBFTcWjmXE2NuNVLM5jBoNzWfu+l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: BBBF0541132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36832-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.914];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,11bc2000:email]
X-Rspamd-Action: no action

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 175 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  33 ++++
 2 files changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
new file mode 100644
index 000000000000..86684fed69d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
@@ -0,0 +1,175 @@
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
+  In the Peripheral-2 Pin Controller, there are 31 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1, 2, and 3 are the alternate functions or peripheral signals
+  that can be routed to an iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
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
+            enum: [ fan_tach, gmac_rgmii, gmac_rmii, gpio, host0_port80,
+                    host1_port80 ]
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
+        pinctrl_per2: pinctrl@11bc2000 {
+            compatible = "starfive,jhb100-per2-pinctrl";
+            reg = <0x0 0x11bc2000 0x0 0x400>;
+            resets = <&per2crg 0>;
+            interrupts = <62>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per2 0 0 0 31>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index ab3b678dfd4b..6a80c56304e8 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -177,6 +177,39 @@
 #define PADNUM_PER1_GPIO_C34				34
 #define PADNUM_PER1_GPIO_C35				35
 
+/* per2 pad numbers */
+#define PADNUM_PER2_GPIO_D0				0
+#define PADNUM_PER2_GPIO_D1				1
+#define PADNUM_PER2_GPIO_D2				2
+#define PADNUM_PER2_GPIO_D3				3
+#define PADNUM_PER2_GPIO_D4				4
+#define PADNUM_PER2_GPIO_D5				5
+#define PADNUM_PER2_GPIO_D6				6
+#define PADNUM_PER2_GPIO_D7				7
+#define PADNUM_PER2_GPIO_D8				8
+#define PADNUM_PER2_GPIO_D9				9
+#define PADNUM_PER2_GPIO_D10				10
+#define PADNUM_PER2_GPIO_D11				11
+#define PADNUM_PER2_GPIO_D12				12
+#define PADNUM_PER2_GPIO_D13				13
+#define PADNUM_PER2_GPIO_D14				14
+#define PADNUM_PER2_GPIO_D15				15
+#define PADNUM_PER2_GPIO_D16				16
+#define PADNUM_PER2_GPIO_D17				17
+#define PADNUM_PER2_GPIO_D18				18
+#define PADNUM_PER2_GPIO_D19				19
+#define PADNUM_PER2_GPIO_D20				20
+#define PADNUM_PER2_GPIO_D21				21
+#define PADNUM_PER2_GPIO_D22				22
+#define PADNUM_PER2_GPIO_D23				23
+#define PADNUM_PER2_GPIO_D24				24
+#define PADNUM_PER2_GPIO_D25				25
+#define PADNUM_PER2_GPIO_D26				26
+#define PADNUM_PER2_GPIO_D27				27
+#define PADNUM_PER2_GPIO_D28				28
+#define PADNUM_PER2_GPIO_D29				29
+#define PADNUM_PER2_GPIO_D30				30
+
 /* pinctrl hog power-source value */
 #define JHB100_PINVREF_3_3V				0
 #define JHB100_PINVREF_2_5V				1
-- 
2.25.1


