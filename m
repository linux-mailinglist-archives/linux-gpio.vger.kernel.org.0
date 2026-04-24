Return-Path: <linux-gpio+bounces-35488-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBgSL4JY62nQLgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35488-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:48:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1F445DFF9
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 752BC3034E2F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A997A3C0630;
	Fri, 24 Apr 2026 11:46:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2122.outbound.protection.partner.outlook.cn [139.219.17.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F42D3BBA12;
	Fri, 24 Apr 2026 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031200; cv=fail; b=mhnE0pDNWSLRIAdQzgMhYqWOQegrbNhkmqZWiIJtklkSUmTQTdSSsDy3K73XZV7pr7xh1wI36157MLbjFCRkrlyjtrL6uB8vI2TtczOCp21NFKLCrCwevEs8VEofW+/eHICpTQRf9++TGGQ39FdxdzFTnSf6/8QILqhGF1kuUBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031200; c=relaxed/simple;
	bh=0wRc+V3JubbXRc5omebesdqbd9Vh4+OhA8ZrxcFEzrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pu5jQXPypF3fOaR/aanZDBED2DkYZAindnRaZEDgpzS2uGs8pa5Agu/f80nFOAh+goazoIZhzM6SmG7je1mQflPzwiu6gyGB42KWtwVRDFlTOyYtHHhlvnLH3gXGMDbhbRqnnBzar4AKnr+own8E3n47qEq0BQSxbXD1a5jHWu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI2ZMOqvOFAedlRButz7a9b59ly/XgCWbzLwxEqNP0zSy3vs5YHyimNPa4AWILwy14gLjWM2/EuAnXFwD+nsv0+oCzDOQ6ncpoZhMDr4m1UpbH/n6NHYTIwyBiqfZqEardJ9+qryGsnoOlBNHN/mUo9CMnnUPh0xUoZdGEFdwtgyZgfojD7ntTRy3ItRyLujmTesGANRzkGsygu+e90zoyARZR8zfwNSz1enRMPOMZ/OtAKKHTW/FWmEJ4yUWjjX5RGo9FZgnF5qFN75d2XAPuLABZoaXYr4I01bO9D6Ikm7yGXHQrEQssiNOZObxsccpd0n5o2EpoLXPIqpwiJyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6QdrEMe9Se+RyrFmUtPpHA80qjMbEPZkCoFi3NoTHI=;
 b=bdj7JOaBwKIVAKS4dLWbyBbMWLqhP/ZuBi0SRpJ0LaHVdI1Qloa16V+ognVkidCPxy8H32J+kr+n8JSx4jWPxhUFT3/+ox8O6zxcEev0V4bmIgavBQnh6aS+UrfYlEzJh7OfdgS9sWu8Jn8CC8KgH9wxYlSf09TFjEhx8jr7HtM6p2IQCUO3axjWQOrCk3hR9CLysFCoowsWTGalzfdjkfFXNBhstv4a5p1wpBFo5dy0C1ZqSqFaTP59abj+L1zJtJ7mzeAhfM09eKgd4YhsAYay8w59fdjnOMHhgGIEdC9EmUpG91SAxg1JCEVZQyKeaWik8ukyTzD9R1PZJayTng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:45 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:45 +0000
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
Subject: [PATCH v1 05/20] dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
Date: Fri, 24 Apr 2026 04:13:15 -0700
Message-Id: <20260424111330.702272-6-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8023c409-8a1d-4955-2790-08dea1f28ccc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rC0gpqOquMgD+tbUebcK0KFvh6WZQvBNtAVJcDAyW1wbusBPDUcqavsPwWbxQUhSfnmO7l5wR+DEAuRK4w/L7TqRnShXh8eJ8tOsfr/rHVyKoHAFS/ZusCD9BgARZ/5xkg3PVeb0/8w+0v2FpF8kAVaABi5Tv7qIq5pjxT0XD3XOOLHauZvRS+6MpuHwNNcn1Ev8yZEOJiuYnZ4UM3ple1Ko2VJ8w4Ydg3tRhtVTSfKEj3zyFP6ihJ3oBEK1Igh0iHZfjGSqE07/P5PWTf5as6v/vJrIyWAln3PfftzLFF7ZWmSyNtYyB0qUx+875VS5kdOXPCD7Y4M5pIkFKtvIDnEGbp7ujx6IDCZ92HKZhYcbjh231Ck6GS0rqnmkcXPcisjqnYN0IjTnzXnSRYu6QDGRgRcWT4jHLjH1VlS0zHstSglWceGlQiK/np8mhbQr0cs7BHyycWUNYRbmT6KLZlvDRbXRHFrLsFNeIQvHXTxwk8dhGm76Qmv1PUR3FkkSAwdCvSy9gbT+Jq9xiCJzzmDdu0WawIGeiUcXHRtPC7OnqsL22onVcVqu4DguEWIo5jnCcpj9cy9oiU8w2H6pGqwBS+Tctf4EVGLZNag5kz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JAzlFHp3jWsrwGR77lq+ouV3AL1ZB9snlN2+rS/9GJGfcqT3WvEfeM/2lWj0?=
 =?us-ascii?Q?rwy+MajfQDxofAIg5xqukdrLAcRqe9cG5BKYshdcNSqc8tL2cZS6X14r0AFF?=
 =?us-ascii?Q?lkanoYBpxYxutEWiwLm6AXAzQ4ZMjY1RKRXy+2PL0tMl+S9HDfwtndML6WD3?=
 =?us-ascii?Q?mXAqEOPnQ6PvOT+TOLhoO1ppeXVgM/7AeiWu8kTJEBVE9NkNePyXhvUly1Si?=
 =?us-ascii?Q?jNQRZ+qxvl6QTkaPYmldL8mNmVEdzvPVJ6NEJAaPLg10pJNQZP2nQPBHYu1P?=
 =?us-ascii?Q?PTCWccIy1HlX+ZsfSV/yDcDAkEQoEjwQrcPEWtIjTu8XhIzeIqPxglUtz8TE?=
 =?us-ascii?Q?YOv0Zi5l1/+SeJ7vuYbdIWPw2cOjGWhfh1tLIS7bxD+WJlP2pOlqwAssGo3e?=
 =?us-ascii?Q?wZanYq6qFDR1Ou5Waq25C9mTm7RKhgC72QJhFRZZgf86g3J4QpQ43tIQri/0?=
 =?us-ascii?Q?3EK3jaX1FsvfMv9fQo+ueTt49rkfcnksPh6pWO3IdrNpHpzUdCQVWsJwjrFG?=
 =?us-ascii?Q?ILlGQvGxuQSOijgyJQPh35cemUC/ME6WYZraqrxNnUGRYM9wOhbMqnUZ9xBn?=
 =?us-ascii?Q?A85PiajFH87bsDWwC9dIbiHsvDPdRJ25nDj/hfKYRQ/wZGdFHvNYeDV3GPoE?=
 =?us-ascii?Q?7DnRyKTfAmWabpV90JRMd5I3akQdOBKjP2aUu+kOexN/psrWIsmHOSmFstD5?=
 =?us-ascii?Q?Bw7ggxXsB9ITF8x7f1FUBR6j82AaIx8tlNVOaVNOtY+6RoRNootuWxdhcGx1?=
 =?us-ascii?Q?PkdaRXh1upIJ3YVFtA+ok5NZzTUpZjoR34kzoFgATT9Tpd9gTI/A691VuY6F?=
 =?us-ascii?Q?bvLS35rkC4N0PEcKoGeu8kWmYauoA/ldQmIpEtOcXpFLqCypbB6vGv9U+sAy?=
 =?us-ascii?Q?FrKdAiImaD2ZmF+C4A0EqaehDOLf0UJxb2b0oZdtzW5JJVuvnY1zQCgOTHQq?=
 =?us-ascii?Q?p7WNx9vke1Yi1MUE9LTPJqiZGrdIpiMFvvHIAHWVHtKCZGP++NKbgKt8k5IQ?=
 =?us-ascii?Q?JHqFGEK8VB3d6guiWnxlcEIoxve0aDBwN9H/Pn185OSLAFgVvc4fh8lDHS5A?=
 =?us-ascii?Q?+qY29W6mJjyZqNKp7in8s6iJRsDnQpXm3nya+nzBLNJAaNtdBVB7xOtzCMaq?=
 =?us-ascii?Q?prtcL+G1oRa/jcAGiNFylXWvtaUHneXXh0qcUmuF4ZWTT3trf1m/hKJkzZ/E?=
 =?us-ascii?Q?ZOKuZgHEMICRtxAkSAvMIPLezJJ2NlmHXbj/hkJ1wwNEaC7kqkiPvm1ZFq+A?=
 =?us-ascii?Q?2VuQhrQ3yOO+CuR39/aGwUIgVRnDE/WI5B2420SOwsm/jY32er6miO2XvcPo?=
 =?us-ascii?Q?JweOHb6ESDmLTPs9OI6L0f4eFrhDCX3P1vAGgkkXyVr4E9CimjdM5mtiVI9z?=
 =?us-ascii?Q?7AuH7XbMdfPTZJMKlQAMYKRtBFWOBD7deUMLnI7WsPfmrl2o62kXS8Z5ILuC?=
 =?us-ascii?Q?OuKUo+c1FUVaKPWVyHtgKueEdeNBIVnO1HE46RcUYNPgugp35IJKVjxDOgTt?=
 =?us-ascii?Q?EDw89ZIB9j65nHx6ABYmJxsRCj+aZ1CAiltI6czWTPmfJoNBeyc+txft6NtJ?=
 =?us-ascii?Q?AUKm158RjIJx4JnBZ84qyEYYShLWKg/7cjnUGdb2Z0nxxvGz6MO3yCNDX/af?=
 =?us-ascii?Q?/6B7R6Q6tfhQ5Fo3E0w30zs9GjWbo78dsNpesk2/ZESJWnD2G70wTeYwekYH?=
 =?us-ascii?Q?YOdaEhJ64BpkssXRwqWZezjGnZ0cCvG4CHngxJ68s/r5MFkm5oTydO5jK0Dh?=
 =?us-ascii?Q?q9z0GghNORm2F5hDbP08nlzOjIyES27yZhIC3cZANV+M8bgZHlau?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8023c409-8a1d-4955-2790-08dea1f28ccc
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:45.0603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukXRMPgHM3E5PUSVmV9bBPKKudsWoHaWJueCJxYGoAr1FI8mc2WCninHY1E9DGHn92RNkDqTgHuW12V9UGyqGDkfc+9zavlrmNqRehGV9Kds5Eu7qggWQyIktnIAwzwo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: 1A1F445DFF9
X-Rspamd-Action: no action
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
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35488-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.199.153.168:email,devicetree.org:url,starfivetech.com:mid,starfivetech.com:email]

Add pinctrl bindings for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml | 155 ++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
new file mode 100644
index 000000000000..b297f48ecdf8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
@@ -0,0 +1,155 @@
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
+  In the SYS1 Pin Controller, there are 8 multi-function GPIO_PADs. Each of them can be multiplexed
+  to different hardware blocks through function selection. Each iopad has a maximum of up to 4
+  functions - 0, 1, 2, and 3. Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal). Function 1, 2, and 3 are the alternate functions
+  or peripheral signals that can be routed to the iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
+  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down
+  bias, drive strength, schmitt trigger, slew rate, and debounce width.
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
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys1 0 0 8>;
+        };
+    };
-- 
2.25.1


