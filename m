Return-Path: <linux-gpio+bounces-35506-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJCYKBx262kQNAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35506-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 15:54:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAC545FD3C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 15:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89D3A30812CE
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9693D6463;
	Fri, 24 Apr 2026 13:48:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2133.outbound.protection.partner.outlook.cn [139.219.146.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6E40DFB9;
	Fri, 24 Apr 2026 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038532; cv=fail; b=E7MTBnM7Mm6Y4UHfoh5tfWwF6EU3/3VKjfVAKgIH6V8+/HJwES+X2XiVwnG2G1W+nmVaf2ilA23DBhfjQhZ0IKGlHg1a2/0Z7Dzl0h/zCdvfuPPO89q19VD6GJsnwNS6vjRFmlFyHiDbthmpVpxtX16DvrSjZ7YkXIKxp/BlhI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038532; c=relaxed/simple;
	bh=SsBk5DNRvXgaZsPVPDY/6Tx01QazJgPPCCMyJjuOV3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q9BYgQA16j0WacYbRJ3rDwnH1QeIOP1LdEi0uOdPTAQNMmfOCvJQ4oiuJDggOs795HjUu9lVzgpek3Hn2gEltrCy/A1bpe6MlFsquICtMEG6PfSR3OuTtQQeZsaOy+CJ/WFV/6SkjR6t5Qs7qLFWfE0q1++uxW6WIF/d5qLyTn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyZ5BqASd2cIla2hRbrwb9Ab97oQsZ1MPsyx5aQr9RlIM4ys82sWi/AyVznOOZtSpU/AlEpOOunwVqi0F5qwqOdbZ38nDYPbrqFAfpX6r8HudaBlOVUtEuiMTf/1WeunsBmL1Nbx2JxtQ3QRIgRWM+XhzvmxHv7/UzUx2Gz1SD2Mhoqr5zCfkxh/USpRaCEwk0NmfIKkx0JhAqHqfXsnXRRH1VNj/jkPSqdVziGDxzPWsdlKoW18dgevFrEQPyC6io85JwuTxxEDA3D+aO5tT2yTCeCkH6DYvYnA1F3qoPDemGRppzqVb8BRRenq8VluZgfjsd8MmCMxZUC6uPTD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soP57gcHE6gfZflTaOcdeFk5gwBp45RMSx5fr0POoTQ=;
 b=Ljb5m4HWi+E3TXL4TnQ/RyC7jWLY8NFNWLYYcFtTvqDW7ZAtVOoFMNzOUTFrWnPydc8pgc9TknWrzLEu2JWCczsaSQq5LyMczomAt6E4VyRDFHaBrHSqZb0jQ/8FNYueaFk9/v/PvfJDbZpip4kMqqnYqZ+Bdl31WL+JCORtcZDm5KtvxUblrXTsXl1/AJHP67ndozrE1QiCo7KzgocrCbkrb/Y8NXCAiQTAutMpuxwtdlJSChC054vb1fogRHQ0nlQvT9a3pkVUaVmoh5jZ5FNk1rOT6bpsOvAJD2f8Okrj2YZ5mu1s72qP9u9aJwDknr2OUJ9/ZyWK0r1WFy7w5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:53 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:53 +0000
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
Subject: [PATCH v1 11/20] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
Date: Fri, 24 Apr 2026 04:13:21 -0700
Message-Id: <20260424111330.702272-12-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8337a677-bc0b-4ff1-a8ae-08dea1f291aa
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gGHoa+8t0Uue4e8iZH7seqPyCd6XMB0GrEFWEWBJSSvkAzPNwTXI2uopwNMvdacLsXqjU3C7NrrXoSkekqgRRXmZm3+y+maLbqazw7DvE9ipYVKB5vWRKjXXrtPT0G8rTWbgxY5g9+xlZmOf1KhVJ0keKdo42Y8U4DCzdCaxjqobY4XLZYUBGKcRaAfOhsCdcqaau5VYzznT9yErKQErIRu35wh+irr5qQj2xoBJpCLN4iXecRNMIHXct98IADtIMsKi7mfpcXxKTg5XZNRAjK1IfZWvYzF7AnXDONWMBeousdlpNHSDX5cRIXgu8Xrk+fj2w0P+QZtAeBAAaV2/siR4Q1QQCYzoqrQ6VFRmKjdx6/iav12FwFUf7nO/dcXEbcF3m8zodSEFOiCZvNVM/wVx9/8Y1NW7odCVIflZZFE6xPrWrkSQ0gXV/SrsMjnwevTbxVnJb1S8Ycf5PMj4eNCISwVf+vCs1+TCW7Ys946X3iUzGOmPnfxoFnXTln6HLhhdL9CnjWBiFyYOF+Nq6TxF2WnyDmweSM6iydI9uYzCPtIytP7VLgwpIZ+Pb4P1RTFqB9ZbuKAL3YWjp1KeXA5Cgg1/LwiJuwlBlg4Fvpk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A1RSck5rSVaAv74rmlWDCZgmsop0VL3hyYCcfHJTYyBBH6GKp+BWof5LP6Di?=
 =?us-ascii?Q?nPXFTgSTiKcFdKkb44z5i9nElbTnFDVSmk/Xur9p/Goj18/YzxKJWFPjKRAS?=
 =?us-ascii?Q?wlzg/EzJu9BbAXD5QV5m6ZRwB1OBqtNnbEEJtZw1+sQEah10xP4oKgAaWEVP?=
 =?us-ascii?Q?hUk6PCfwM6kIwW+NdRKB6ilRdfDZ7pVrVP/3BSgOtRnpEeuHMJrqZIy38OR8?=
 =?us-ascii?Q?7Ev0N8TmscjKW93EuQtzaRJT/GXU9SXdxZ+2P+Pn1qR21ZIT2IcWz2qMfG27?=
 =?us-ascii?Q?vPa/LG5tdZ4oY9OjLcNZnCOe3/CmJm0te/u059DIx6tdcSPy9nduLmxuIf7l?=
 =?us-ascii?Q?z4bsXHv2gvIc/H9jKl1koHRUFC9Hy0P7mvc4KMO7oO8wCjtE3OLe9MNhyQra?=
 =?us-ascii?Q?zF1OpN5MpJlklM2mUKurVh42VhVFTaVzyNhOJaxArVVzvz3tERIgVURoAeTc?=
 =?us-ascii?Q?4ER+PxCbATbF3nLs4TlcZT/Gr64G2cf2SapMcF2F7mT4rh4BrGr0wTO6JdEc?=
 =?us-ascii?Q?NneoqkUBHpJuUUYF45RJDoBRp3Qcbokn8F6/hQJc9HQOhn6RyY5mHYiTCMPI?=
 =?us-ascii?Q?nxfWo08Ypc7fq11fz3MlXkTGZYt6gpBDA8E+eRU1PqRBOjcpLJmyswbX51sD?=
 =?us-ascii?Q?gC3QgbjOKi0Dqny7+b1jMlub0BRRX2i7kTPcE3JFiwImdyU0AK2dSEAw7uDA?=
 =?us-ascii?Q?KFiaW28qWS/3DxxV1e+E1WpP0N/PdMVvsz730BG6dfgKxXLqevKOtIKntn0J?=
 =?us-ascii?Q?O8MpMGjqzDA0z3O5lkcbhpjpTcWozf3lnMRzYElQS4zUWa0BY6QNbbieCgsi?=
 =?us-ascii?Q?oViAoZaRl/5Bb06ANxhxBdLunU95wwjo2GGKS2moevOvo2OKqLSmcGmVRtSX?=
 =?us-ascii?Q?giwRZXcz8A6pdnuxwm90Bupt6SCScBELus2hOUPetnd2yTNvfxZVqc5Z+uKh?=
 =?us-ascii?Q?CLpAxX6NSDo4onz8GMaa8/Zj2I2nY+Ps7b/hUAFfIAPJ+7vGfOAP7IcqEvWg?=
 =?us-ascii?Q?tx1PgwkS8j7cFcwPANFCuHIVI/MpU9i38+iD2KjvYjO56MFyYfBN3T1nbZcP?=
 =?us-ascii?Q?zmu/UUT4Sc4rvIpTAY5tvo1wjQIWFH2IAmZ+PtuSLzFz6sU44HsktoOUB4zA?=
 =?us-ascii?Q?2SsRRWTEf7AKvnriYdcmfzXoDs+8pv/PKg+mJZ0J48q+8Giy6I/9DCAE9lmM?=
 =?us-ascii?Q?r2NQvMn+cUizowd2iN/EALeQDhveokBrHN88roq0yekzOc89LVCVuFPM+Sfh?=
 =?us-ascii?Q?TK8vEXjvGzxhuhDRmD62+B4Nf+m8jX9jrgI27jZtygn8konDAcoxbMrqmdTP?=
 =?us-ascii?Q?NlUZA0YPUGCbV6z62O8rHqH+caChwWuYHrU/gMWkyvv//mQRHQjIOvrycDVX?=
 =?us-ascii?Q?bBtT7P7Zu1KL/HHQ7zoN2seBslB5XjRxjQWKgamX1lXXBoHotcA5i3YvPJkJ?=
 =?us-ascii?Q?d3spTxhKY8A9kb6qmWWe6/ehzrnOOQKuJkqFvpKLBpFgPLpt7BvKkXYnLrBY?=
 =?us-ascii?Q?GwAKW7WAL+s7y2cU7UdX1YHBPUs4vMl2+6nCvv6zKIbVbieMSA6chV8KwXLt?=
 =?us-ascii?Q?7Dk/yv6Yz523yOgtxf7uJ75uBWY4PZGR5RKcVBP2ql0u4iWAVzH/JLHdN7kY?=
 =?us-ascii?Q?dPwgfJGzcg8WZ71KLA5ebdMR7uIzzkYiJk8fBjdFsacEFebSoYVPYbWrFfJ2?=
 =?us-ascii?Q?taVzpW+YvRvESOb+J3UwZg7LRvah8hCInTeo0emsnNIglbT27llA+5RcJ3g8?=
 =?us-ascii?Q?PqGcscuJuKiVxjNo73aAIaQW218fW8vS2dbwnZdss8jEB2yrPYw1?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8337a677-bc0b-4ff1-a8ae-08dea1f291aa
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:53.2291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ce4IUuPr3BH11KCOnqukvE/H3VgOQZhFQUZtepGIxZPYYcA3n8RcvqYnR5Qvm4Gt359Qvst+E4qPL2kQowEm5O08ORkLj+K8WVNnJLvKKh9fBzQRi0bwerWfGROWu8Gh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: 1EAC545FD3C
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
	TAGGED_FROM(0.00)[bounces-35506-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:email,11b42000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 217 ++++++++++++++++++
 1 file changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
new file mode 100644
index 000000000000..b2af4df874df
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
@@ -0,0 +1,217 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per1" pinctrl domain.
+
+  The "per1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-1 Pin Controller, there are 36 multi-function GPIO_PADs. Each of them
+  can be multiplexed to several peripherals through function selection. Each iopad has a
+  maximum of up to 3 functions - 0, 1, and 2. Function 0 is the default function which is
+  generally the GPIO function. Function 1 and 2 are the alternate functions or peripheral
+  signals that can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
+  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down
+  bias, drive strength, schmitt trigger, slew rate, and debounce width.
+
+  This domain contains 4 IO groups which support voltage levels 1.8V and 3.3V
+  gpioe-spi - comprises PAD_GPIO_C0 through PAD_GPIO_C4.
+  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
+  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
+  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
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
+      - const: starfive,jhb100-per1-pinctrl
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
+  gpioe-spi-vref:
+    description: |
+        Voltage reference value for the IO group "gpioe-spi"
+        0: voltage reference value for 3.3V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 2]
+    default: 0
+
+  gpioe-qspi0-vref:
+    description: |
+        Voltage reference value for the IO group "gpioe-qspi0"
+        0: voltage reference value for 3.3V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 2]
+    default: 0
+
+  gpioe-qspi1-vref:
+    description: |
+        Voltage reference value for the IO group "gpioe-qspi1"
+        0: voltage reference value for 3.3V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 2]
+    default: 0
+
+  gpioe-qspi2-vref:
+    description: |
+        Voltage reference value for the IO group "gpioe-qspi2"
+        0: voltage reference value for 3.3V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 2]
+    default: 0
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
+          starfive,debounce-width:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            default: 0
+            description:
+              Debounce width 0 = Disabled, Others = 80ns*N stages
+
+          starfive,drive-i2c-fast-mode:
+            type: boolean
+            description:
+              Enable I2C fast mode drive
+
+          starfive,drive-i2c-fast-mode-plus:
+            type: boolean
+            description:
+              Enable I2C fast mode plus drive
+
+          starfive,i2c-open-drain-pull-up-ohm:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              open drain pull-up select
+            enum: [600, 900, 1200, 2000]
+            default: 600
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
+        pinctrl_per1: pinctrl@11b42000 {
+            compatible = "starfive,jhb100-per1-pinctrl";
+            reg = <0x0 0x11b42000 0x0 0x800>;
+            resets = <&per1crg 0>;
+            interrupts = <61>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per1 0 0 36>;
+        };
+    };
-- 
2.25.1


