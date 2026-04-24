Return-Path: <linux-gpio+bounces-35505-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMz2DbJ162kQNAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35505-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 15:52:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3ED45FCD5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 15:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F40923005761
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB403D903A;
	Fri, 24 Apr 2026 13:47:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2139.outbound.protection.partner.outlook.cn [139.219.146.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C640DFB9;
	Fri, 24 Apr 2026 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038464; cv=fail; b=HaG/BUan8+JZG+TaytB281uGW2IYb1WiOvGt/+xDmQxOAhLNOHMqe34lOUr+08FcBV59lcJBV2UGVP8JCZwgTRvPZ5U3D3jUh0nJEgpEqz0MNaaYCFNFBRFi2Rv7UCi+y4BecvG9lZ+WEy0TNiaisvKHI7mhUYrLbjrk7oy3fow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038464; c=relaxed/simple;
	bh=a1rfbai5QASHqx/JrOH+7ms6Srhok58nO/nWrzMij6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MYsRZQ41tOYAtEXVNexeWrEJjyxuL5iFUHC5ic/VEqruVcKGFM0vi2pRMWtXJRa/7F9utsHP8OMd4ma6tzrgmK4XmGvXHUJd5vOMgLqTZfkAcsFGIzkMWO6Jgbl5/H0+mVyrPiBpefzFS48xwgHqj5DQFc34qsAZh9cZ4LIAmQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALTf1Ou3v1zKyVby/uYZTS9s8hQtvJfGFRmaqcZO+T8935xbXu3fKqBzJnQ4+5zmtBKG/TbsN80mtM3BXNP/0gP9xBubMEzuQsscGwZfSURHZp/GP4RksM0sV9kXALDGhpzHuihzYov3tILP3SgrgFII3ZrKPxTfZOtU4EJmQe5MzSow+ob3Sqk5QeBy0/bknl/dAURYvV/Ghu3B846QsmwbL2Gjjgc+S0MRDgEqrpzBYjDm5I2acp/KSCqJLCgqq0iUMr4Xmtkzt4v0y/7vVHJ/CozE0Iz1CbH3dAQGSUG68ujkGfc319PezNE7ovidJBjlRH6Ho6Z8aQsukDgkpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3pnt8FSDsoGUBVyPuNQecALRlIxztwY/BF+cRdUHFE=;
 b=TnMp5cjsVUGS3p9yPQYQQeQQ1KNvuexyfsESAXcxF0S2yu41nZElZa2XvbbchT8Gxvh1hMQky0Nf/bC1TEzzo0T/js50YiMVu/q4J/rKdZ8ZpgXbRllvJGDH6Gw4G/Hm7oeCQHR6VanmIOlSTD56UsZ9C4vVI3hPHRtCAYnPVnqAFPbc0uDqCa+XbBrv5dg1WJSgYbtRyKaAyq+PDdwF3O5iY6zRoaNIXB19ZwzSDBnqfRhjpHLkYGXWSLYerpC1Prur5GpWUjAhTDO0MjP8KU+Zw8Hj4GDCRq6w7IytJB29RNjVtLGSfiGXzc8RnKkFyc5htF4EagsELeqcEFipOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1299.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:39 +0000
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
Subject: [PATCH v1 01/20] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
Date: Fri, 24 Apr 2026 04:13:11 -0700
Message-Id: <20260424111330.702272-2-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1299:EE_
X-MS-Office365-Filtering-Correlation-Id: 794e887d-9d9d-490d-0401-08dea1f28987
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ql1dKTttiL661g8wvR31C9KBlEeRJQmeDIqylYI7/kvVOzOB58Lc4IhfDSGADHdeM8jZPlXoEjvuXGc6cHKTGRQpQOkgQXtiPHuAyZv7E5mI+IKw+q/h55LAVZZ+5wkarlEWvicFv1ytpgUzXzejBHvpN3lj2stxuvxXN5HJFFVDqGslmvd3EGOsRGmzBo5xkEenIvlkU8TyIl32B53K7BzpCcsfQ1/4z735SOuwHLjXqXWQeDHpZDqgEIeDJnVJWnlTzZ26qr4AtXI5fgtFQzYP/pA6SC4PFzW+/VRjeBkeY2GDR1lqR8jKlin/lvloToWZOY6V04kbgPuDZ7UQdy05HNgDU6CyIRNH5LsGVovWX4bLcBF2A/T6jT2ZSdf6eXSl8F3smWzV99skkZId9pbI65PRGdP60tILTqfVYarxLYtMylHgFEO2XLdA/Obr0PS5dFwvBYjFkEtAMOfO/V1rfoIdHm24HV8Ze45oKau+ab5fBkcXPwmy5GcZSiFWiYP0LivcJgnV97sM8sY4hlNUOe5BBW3dAgAWP6K421OhpuKW+mU+SNJOfhFeymmTutYiiHOJOA4+oFbSZ09ZbDT1LHyef5Fr3a7TGxbamIU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WCjnSp5Jj+eBvqCYu6RGMd1Gpr7dV00sW7RDiY2F8a9Zw8VR+L8o5XdAgoiY?=
 =?us-ascii?Q?jb7zhXL5nmED/z3ftM309QLqxusNNTf15qs56QcYSseiqGMuu6VIh5cStSBC?=
 =?us-ascii?Q?6U7MSo+Gstch9EnvrTMRqY4q5FpopheohhyrMUQWSKfDyXBpcW9/FaAJfltR?=
 =?us-ascii?Q?uXxMSX+NhfqdHzWYH6ft4z7uxW1dFQR54zzIfDQGhx2oy+9rdmnhXhVo9nVH?=
 =?us-ascii?Q?qcbXQV3/ejG2noEOaBbxhNKHUcwrqtj+8Nxgjr5P99J2xThpwqxbdEDVxlfY?=
 =?us-ascii?Q?DdEJHIwfqSKOaUIlpD6O5IboASLE4ofM2cl9l8BrG7tQa7WqkVeIdirGE56Q?=
 =?us-ascii?Q?/txo+nMup5j6BOr+pJdPatZmohzWwIXxA+CyrjrCQjZIBAWVkEdG7k51SpVS?=
 =?us-ascii?Q?MwVXFu+E0gg6APrVpk3cizWq1TskTn7m528V7tEIh2PLOxBM7eA7NeJ4NiFh?=
 =?us-ascii?Q?NU7kFb4BopGrMz8oJ8AwIHtEm9O1SM9QPRYsPuV5Nds7ll6xfpol1YRA7lDC?=
 =?us-ascii?Q?g3vbUBgMoi0Pz7fm3PvUN5LQKY7cyo2GFUtWCksRg5xa/T417d2BLscnJVA7?=
 =?us-ascii?Q?48oPUBidid1ovUunpGI/HhVq+tb5JP1fuA28AjmoHy27ICWFe4phApbk7VTe?=
 =?us-ascii?Q?5vdAqOFm7sDZ1pzfth1vfhQ7VWYk0j6A4YfziPmgM9niQVXplnAN5109D8k2?=
 =?us-ascii?Q?flmZom1IicreNQzcH1cpU6YdaxY0MJajIjGZXtENgVS1PiRWGgaFv2gAJoyq?=
 =?us-ascii?Q?P609yVS53fKW60D9V4lmvulBfUsLqZezkE5wUMceaM0fMO5S75rabDWOscvr?=
 =?us-ascii?Q?hf2y+GgbiCC8108iEKL2SLSVOcFgWCQShrjofLTxxI8LogUyssgDhfaGrstF?=
 =?us-ascii?Q?DUDOINtD+5fawgZYWe1Pg7SI2HbjiHaOsVeIvZ0XCeVXNIfy5e2muRjKVGc1?=
 =?us-ascii?Q?KTeTdJEDKHGxongGcrP38TnXyDihqpjPs4E7WDefCSdH6bv9kRuJleFIGN0u?=
 =?us-ascii?Q?EmZ6NhO3KukEWCemYI3T4OGqVFShAuskQFOsgzc5pGHHU53F5zh+EqG2XsZJ?=
 =?us-ascii?Q?nNmYLwTsLqfKH3G1bBgziHXsY8l4/gkUkBCei9y3siJi0mvpx1d53xL1vE/S?=
 =?us-ascii?Q?2K1KI0qAyIIuu3tjHvFZ9ymRY8dSRdVCTn6FcnzcRrvo/odhyQeHhR3sKJKO?=
 =?us-ascii?Q?kpAHCVXQIBGUrNqsF/aPn5PAFL/4lP8BXaGnubrg21BBAUwEEz9RH8pdUJCt?=
 =?us-ascii?Q?bKXvatf6PBlydRt5WDGeZBE18XHi0HhwjrfxdCaoPT+SwjaaSz4H6b737+Uu?=
 =?us-ascii?Q?f4hyFCXQCaDblcGNf+/h4+mPWedswPBnyWnZlICHkZEA1Z1G3q2GRgoH1r+a?=
 =?us-ascii?Q?20tJE4xvTIx0kLvwoME323lYhbiJM0hlkWgKDzhS9dLmI7r5wbn3e3IuVXva?=
 =?us-ascii?Q?x94sD/NCQzi+8+weIoGz+o69fwscfUlMlU7dW9N6fiPOuwqqsn/ye1N0YeTz?=
 =?us-ascii?Q?IFsmj1cxMdKR+9Cf5zRWNuVW08yBlBMf/T6oTgUzD5FPZNRQcE939F7M78wb?=
 =?us-ascii?Q?KM6MOHbtWXcialNkn66Fx5j2hjPgZN1K1C7BlKMJWsvv7TWmINHX37tbibsT?=
 =?us-ascii?Q?6MlsSqstB7S3wSSkdUULE8LcQvQt2P456wmt1WVW8rVi5PTjsE5/rgxz1FSX?=
 =?us-ascii?Q?KSOnW7xXj34N64F6Z+XFHLeCuOFFt5NHveZ0eIQ/3kI9KqvB7AwzhQ+5a+wY?=
 =?us-ascii?Q?VJqP8nulA5PZnnek5jI+HTrbkeGS///K2EC30iwCURSvnyGy1IDy?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794e887d-9d9d-490d-0401-08dea1f28987
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:39.5857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/z1a4HmHtSOf7KVa2BjnYdiT7kueB+a+WKvh5e62X0LNo/a5HQxusEXDL9RT9p28nKvEc9q/NlaCpRphyok6zXb9SnGuDwliWWfi+UbAGXTlNZopLyGkF0BgDiUPDwG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1299
X-Rspamd-Queue-Id: 8C3ED45FCD5
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
	TAGGED_FROM(0.00)[bounces-35505-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.199.149.192:email,starfivetech.com:mid,starfivetech.com:email]

Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 155 ++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
new file mode 100644
index 000000000000..21be5717cb74
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0" pinctrl domain.
+
+  The "sys0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs. Each of them can be multiplexed
+  to different hardware blocks through function selection and each iopad has a maximum of up to 2
+  functions - 0 and 1. Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal). Function 1 is the alternate function or
+  peripheral signal that can be routed to the iopad. The function selection is carried out by
+  writing the function number to the iopad function select register.
+  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down bias,
+  drive strength, schmitt trigger, slew rate, and debounce width.
+
+maintainers:
+  - Alex Soo <yuklin.soo@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-sys0-pinctrl
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
+        pinctrl_sys0: pinctrl@13080000 {
+            compatible = "starfive,jhb100-sys0-pinctrl";
+            reg = <0x0 0x13080000 0x0 0x800>;
+            resets = <&sys0crg 2>;
+            interrupts = <56>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys0 0 0 4>;
+        };
+    };
-- 
2.25.1


