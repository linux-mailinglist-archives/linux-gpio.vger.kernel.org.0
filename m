Return-Path: <linux-gpio+bounces-36820-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAe+OYuwBWppZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36820-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8931C540F25
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 346D2304C960
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0613BE632;
	Thu, 14 May 2026 11:12:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D443BFACE;
	Thu, 14 May 2026 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757173; cv=fail; b=FvsiHxTK/qDbPhS3DnDIw7bx5Y6Tm36MAfht7nWUHx35MM6Oyto+cygx2ewny1jzHPQvKeVg0fOQI/3iTWvN7JvGf0f1K7u3hh72ob00ATtkbU8b+uVCWOFhqRNOXfs2rtf09hsVmtn5LeP6eCFGEq2bz2HnpBhmCPiH2AAPQxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757173; c=relaxed/simple;
	bh=VC6JEyO4fY9t7O/bt0PdYnnXZdw0qYQP02GWUgoEs58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OVVd5k0I4edZ/+cyrp/XffANzQ2zQwqa3CoVpk2Z3MuxpSD4a/jWAzzqzFyshcrKFCZIf/TSFq+pvOeUsUHoM21/ppTk8+TAT7qp4OwLLN2zIGlvSp8JkP7aosHIEHZpYk9hjIhYfgh/uqzBn+5BprsI0QE3hNw6DfEHB2TvE20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrjwChs57BR+1ap82aJxP73UoRfr2ON66xWPa47ub7hcGr8XFFNUniM1AsIFYO818f6/cr38vn05DyuZOOK0G6BbpzyUxzYcodw8u9aziqHJElIRblDR+KyhfcFcFIRhApagbrZR+CWiOBXl4QULXYTngeq8zJPZZ10lR6Wcc+MEVix4Uib+ert2uk9tg94s3LsrxVLaKjwzuFzenmt5R5odwOsLZldXucXfasVGxR0JbmLO775u39euTzAJ0Id7e/fgxKCQYIG0u6dWoqNupaqgY8vOdfmqWUGJZCCRjBOMmdGObUM3gDbZvQHaSJk8+7Ibk/ICoy+yDZmbEBDMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGa20s0BGR9JxKzc4tqs+isqiS09I+sFe4/JMdE5zm4=;
 b=kLPM+Nbc880dAZJwgHNdBeVznmLi+kPaHFFF+gufHttW9FB1g5+rPNgw8MWRTDyk0wsvibw/bQI0d595Qtd5QJLjcP3fVmtHJRBMm9+uN/8qrrKrG3U4E8x0h2/v562VVAGud3FAiEI5jxmAgGZuHiYFZkIDnpN87oyhMRyNs31Z5xHyZ2bKs2XFy4TpGoETMxN/HEbZyZwAAEnTMGDE/jScv0JoQRnI/DWLF9WP8IP5M9BpcyI+CNciqQ9GOiIp0C/L3gPE7GhDFJsvATZXnAXgVagBZq5CRKLutSSs6yCGGEwswdQ+x4r0OJgAwXP9vHF36giKDw+iAx7ULUnSxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:39 +0000
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
Subject: [PATCH v2 06/22] dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
Date: Thu, 14 May 2026 04:12:02 -0700
Message-Id: <20260514111218.94519-7-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 618b5080-4869-4497-7562-08deb1a9b59b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XKuLGIcaKF7NQo8HO5rEnhdQYpa67h4Gt5+9B4cduxegsfTrPUtYF8//8PV8xlp/B/HwXQwfNk2yX3SvJfDOF5S9j8b2YTd7tgEGD4hBrM8gf/v8AVvqB3d7OH7CAwTUkPpsP1EeEyhUKXdpgO1vka8/zJOpx4hdSmSKQxMFD2f+JlO0tfQprYcDPhj0i58HQJv8gTq4nZyyiUJiogtYFqr2vaNqQfIzqkbYt0ZkZeDj0zBYRh+xe+8NDObYqG0+Xp1EVuP5kIGgL2U51bED8U0uhMYWbkwWfiHMft36ka0WiPx5CJnLt3i8QF4u8HJTkyIgqvzZGXpNjaKn1pX3pD3NgSZhPAOY8QxcPR5xg7sMT6T37R395mI19A3iL4W6LJo9DZPJAYqchco+tybPY65me5SEfecaHDGsZb3UCoFzYAs4J4upP3CiH43zO8mwqjhZUYS1unmIo7RkWTIqAUgXh76myJE8VtI+RYz/BM8SBR4w2Zji3RXjSHwgW0NYIr7cc6YNz3M46Q9dabjv254Bt7xnn6KPSTKFBINZxFzPK50Hth8Wplvb6SOL+jp3kdf8QaU0T8SLppoeXPkgdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bc/uzGbTEQNfHDmAhZX0M/hHXvV0FfmRkZnU9Z140mcr5UgApZXSvciJExsJ?=
 =?us-ascii?Q?D+BabvADXDJYC2CH/jevEV6uO676z2qb/cnObL9rJxO1HwWlES13IJzmy1jH?=
 =?us-ascii?Q?UqMWwsPdoyQvUvQL/KGO/zgX+O23NAZQ2EOeiDc0O+tRGoiWRE8WlA61Ni4o?=
 =?us-ascii?Q?Mfa9w8N6LBvZLpJkLNtun+aKP1xnEP8JxDlWU8RDG1MwWrngEGlGZb4WapZZ?=
 =?us-ascii?Q?R9NtglBfJyz62WR/eJmy+8nPGf9RcOu3cCh1TtNEmCwXR3ztF+HmeYSP9+0c?=
 =?us-ascii?Q?FBcCTG2aIOrQpGBglY6X3UJAz3Cp4uCNhX7815vYE9z7kofoMBQFO+ic4m4m?=
 =?us-ascii?Q?XbZZWjvwwK5rxH1EOSOAdQUq1tWjpd6GTCWQZdWxvxRPMaMV2J/40s4dsNIP?=
 =?us-ascii?Q?NaAcjxi8gCNtWnhkOqbWzaWu1bZ7lI9GirpjE1tmtxF/ldAPGNOTXQcTpfLh?=
 =?us-ascii?Q?N36DCuV2X38AijK4Pmv7a+GenIKMmA075QfxZLWqvGE/F38Y2VVI6+l2ElYS?=
 =?us-ascii?Q?g1UfjXDcCDNjAvOOG2GEQcuI02PqfV4QtyW9hiGnQ0As62Haq9bcmULIFtbZ?=
 =?us-ascii?Q?29jR5/EL73SadZ9zsbAXM7UCllwv94xfCdTZ0lCLLBakA8raFrxPdaeb/9pV?=
 =?us-ascii?Q?cXvARHu+G4bStTu6UQOuPABNkLD3cqhXRSbp40OJ15KhV1JJ6sfbBt1ALqzp?=
 =?us-ascii?Q?Vl/tB4AmwDSEkq19wU2k/WpuGy2eyLtHf0Q8XCPvfe9QBdfS55AD5evriWWr?=
 =?us-ascii?Q?SEgWDBkLxKSMF85PZL8DPe+sO/bxjY1Y4wo+mjN33+Ahkh749jsdSoCSTXZU?=
 =?us-ascii?Q?LjYT3FPfUXB10mrzGN5gintJuHTMktd9iJL/u/BbKO0bk5VZwYGJ4BSOs0uM?=
 =?us-ascii?Q?LMhwnbQqGncIg/G1mbV2IWKpB5UXfjpr875hqZtw4pGLgadrtub5OA9TxLJe?=
 =?us-ascii?Q?jxIC/JsZriuL/Da7aaz2rt3qNAiIhEJ5sc9W2yHCVPFQKtAXX3Xb8QiBvIt5?=
 =?us-ascii?Q?LIEyE37L7fz9BoCsN/a7LDXxrxAoXi/4AfX8+FFKAsGKHR72tEe4n9bgSvbq?=
 =?us-ascii?Q?0pSlSxI0cr49mWv/aos+WqYbOd5RFTdz/+4cF/6dmbd04LxNamY67Cezfa1a?=
 =?us-ascii?Q?hXlU3SsS/khxSsO0xtT6KJH1Ik7IxkuOJRe+2GKdDyrZzT2JFZVS0SVf0A0I?=
 =?us-ascii?Q?8psSnbiw3mktImn1aQK8PUaLznoDsMWy4U7FZd3yTScBNCOJygvIzebfhMlK?=
 =?us-ascii?Q?QhKLlk/YXxIjLu9zFgCY4vkR+UZn4oU7mgBxwfA5YTPYKlJwlfeJKwcpXdWy?=
 =?us-ascii?Q?fmoCAUdf6cjK9A2KPIq8xYdMAZ+73MAA+ZYF6tGD1iU8YqGQDxdnzbKyjt17?=
 =?us-ascii?Q?jkF0LhI4SSNhR4525adHBtO9/95IRGe6Po1LdMK2Ho9JHw56CsfU4y9bUwLW?=
 =?us-ascii?Q?z9X7sssrxPxH/csrjaXT3M+VdOIIn8H2lxGHYmSY7PCoxxTTrffFQisFA7SU?=
 =?us-ascii?Q?9rchCyZPey0wYvB4xhKWYGPpZgB3RbLJw0UIQ83aCPRhFDAGxUfwxEvzQ+6B?=
 =?us-ascii?Q?kEEwggWfdV+rhdMBHbh4RXb4bvM/E7mYngXJTq6z2vwriXZkSZqdVgcCcTZF?=
 =?us-ascii?Q?phk942uuD3W3N3Kv8YcT6klzPHF8BAz+5o6gtm1fYQf3kM7oWiAah7QIrYKG?=
 =?us-ascii?Q?5rmp6jwBABbI8UWNEBAj49E6MjQEx07fPJ4vb826+8yfNRVO+Xli9O1Svi1h?=
 =?us-ascii?Q?+OLo9f4jZcq6379qB6gZNzezawxZ5SJue76F9c5GV23UfAgHM0MQ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618b5080-4869-4497-7562-08deb1a9b59b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:38.8856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCdN/kxuuEQ3qhIZQuTbb7cbSAg1tFJuoWfIJK2x8KRC5ccQ1z66hyKWySK9jAD502Fk4zcPF+DZwXtkLk8RJyH/lYIBdMhedX70fw6REbsoM/BhViSfl17NaUr+U3yk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 8931C540F25
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
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36820-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.895];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.199.152.224:email]
X-Rspamd-Action: no action

Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-sys0h-pinctrl.yaml        | 174 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
 2 files changed, 188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
new file mode 100644
index 000000000000..cace3fdd00ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Host Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0h" pinctrl domain.
+
+  The "sys0h" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0H Pin Controller, there are 12 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Functions 1, 2, and 3 are the alternate functions or peripheral signals that
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
+      - const: starfive,jhb100-sys0h-pinctrl
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
+            enum: [ espi, espi_reset, espi0_vw, espi0_vw1, gpio, scap_trigger ]
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
+        pinctrl_sys0h: pinctrl@13080800 {
+            compatible = "starfive,jhb100-sys0h-pinctrl";
+            reg = <0x0 0x13080800 0x0 0x800>;
+            resets = <&sys0crg 3>;
+            interrupts = <57>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys0h 0 0 0 12>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 6d8f5516a178..38d5a94e92e3 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -14,4 +14,18 @@
 #define PADNUM_SYS0_GPIO_A2				2
 #define PADNUM_SYS0_GPIO_A3				3
 
+/* sys0h pad numbers */
+#define PADNUM_SYS0H_GPIO_A4				0
+#define PADNUM_SYS0H_GPIO_A5				1
+#define PADNUM_SYS0H_GPIO_A6				2
+#define PADNUM_SYS0H_GPIO_A7				3
+#define PADNUM_SYS0H_GPIO_A8				4
+#define PADNUM_SYS0H_GPIO_A9				5
+#define PADNUM_SYS0H_GPIO_A10				6
+#define PADNUM_SYS0H_GPIO_A11				7
+#define PADNUM_SYS0H_GPIO_A12				8
+#define PADNUM_SYS0H_GPIO_A13				9
+#define PADNUM_SYS0H_GPIO_A14				10
+#define PADNUM_SYS0H_GPIO_A15				11
+
 #endif
-- 
2.25.1


