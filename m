Return-Path: <linux-gpio+bounces-36829-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG/+FF+xBWqeZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36829-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:26:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D7540FB3
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A647730EDFD5
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CACF3BFAED;
	Thu, 14 May 2026 11:13:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D713C3421;
	Thu, 14 May 2026 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757190; cv=fail; b=FdIJlNhGX053gL/qL3zZMxxOW1x1xxAI9oMyt+4coa11zemkL07M4TKJ+C/OZMoVs7zsz+J9hu9E9Xuu9u198GZzUenglhlixqLjfi706MiLXm3zc/Xwuq3JxdfxL7/EWKJtO6hRiMfx+m8Gw+18wCWinqEnZ7lEjE8WhTcn+w8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757190; c=relaxed/simple;
	bh=bsfZAceMGPbMpVi0+x9UXYijYxl0KJkrj7KEQofSaEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bMQPnumtjuE66vyS4MZS6SRGUShApb2R9FEdjNS5pI3Z7uOxTcvkjouFJ0s3iUYLsgQUkBroqiJguXSSkQc/SRiAE/E6lQxeeXQcJD8LbTDT8hZd1v2yE7H0ebAj4Qge+N77DaZoy+Jsy4FAfwmbvs+89QVuwFKa+pPwu6DWiDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R86psCVezcSIP1lKUO/Rig7iYKrCogI9Jgn6RmSLPY3mj/uyB7OSsA1hpsnqoD7AxYGJH0jG/8inz5Ej9QSfGZUwxkDUlWUfJuC4tQMS0nNKEfz1haG3MBqG+7CjgP05vWjqfgEV0dNahSvO0A4ftHS/5hefJPJRZjJwHmy1ChG+5FshGtKL+Cx1WkYULaRP4Vubvji9QMozBb+ilUWSYWQ9Er5ONWMuxzqJEm2msXD7kLwnyafTm234quSHkgyCSvY/7A64zTxN7+UBGbhIarhPF4KVdYQ2uxu+ebvEQ0rmjZ/ZBCxvyQmJs1wKx1r9v2wG1JOtCZMqy8mhIjF1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9pDVrydxquEowDgVENPEodx9Jq6uySds0RAgEWfEjM=;
 b=j5AEGwXNIonkMsUf5qMyYoieoq3l4fEq5Kxfmt5lt1rdkFwc2BHEziUF2s6gvSZiJ30K/zm90yIuPjON4u/aSDFHRT2a09iI2pccjL+V/2Q8j7tEpPcgikbCzEbeeghs9HdTKWoaUx2eJ6lgC9HXKKWsBC5Yx/Ua9Gp0dHLVQyE5X31pVh8pN5mx8dor2+DwAa3dbvyXc/xMWH2ZuQq9xk+VDT6GYEJ36i/Oulm74/Z0LmA7ugosLMrw324bC6fuBbM52kgbwEmYw+FvYHn8JKj2x8Cek8WGeLq/M5vHbRnZ9kW+CYVm6ib27MgWFOoahyvlGdbwPvc/o0LpsFIYTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:52 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:52 +0000
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
Subject: [PATCH v2 18/22] dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
Date: Thu, 14 May 2026 04:12:14 -0700
Message-Id: <20260514111218.94519-19-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 67c31cf9-6c40-483d-21f1-08deb1a9bdd5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wHZdCHxcmwc+ZPHL0a6+r9QxTXcM4JvlWr0F6abuSjbc0i79cMxeYyeLXbR8ssLJhjzGrozV1Urtu9dMNHt2cIUAk1uxQEFPsHkYP9qxVcKCwBjXHRlUC1jNple3/ngLgvVaPAa56VXUXDL7eBpy8ajIEW+wtNbDrr7JFetvQZ/8NoLu9tjoYdUxlFCFrDTfoggWqa0HWnZ1TigvAz9ruBb5tmjXGY3wUb3wFpEUCcIlsXCIbdWbzls6NHeoJfg4YoMlahdkcobtNUnck/JeVtEYOqmfG+3VX9FFHaJQcZZBbvIZ0wfWZKD9Gh3+9DCYNyA6dUWtVjjXwsB3LDTXL8oQYKOyEVexvMvAxFM4I5b/kdGesITbXXhh9BeAS321oHF+LmoPmIGPhZ8kduLMGxCVF8W8/YjKK6rkEbwu5QDHAdKXJdy7zfqoHWuXoo20arvQWZIspb0iG4pgjox2/9WyFRXwxlgXKFLLSD3cTE7Sg1FKcFOl146hT1CWJGnptJN7COShR9SujPyZMJ0Jw4Xoa2I5JUcjw6vEUwba67DLP2ME1H9Y5LG3AqouaM5Hf2ezkMZhepn/iOHhzxmsfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iYk/7yn/B55yolIlmVroJHbecjKbCsMZu3Sj7FgneCrZ8esLTwbeFZCb7Gdi?=
 =?us-ascii?Q?+HX4MzWUEGj2lL/c7onynIhL4wKNxHy83QXlblma90rbR6v+7d/XnACoRX9L?=
 =?us-ascii?Q?pXrAYzCAd0zsEeNavzIiqOD7DucrFSRChlWvBoSYxJEgGt7v1PUMmSGrCoxM?=
 =?us-ascii?Q?lsckFrx7QX4ZMmYqApC7ZfpMiZfVdEyjIE0nDfFYcplOEWNYGfqSWrw3ZLY0?=
 =?us-ascii?Q?+aGy+TGCt3bn4/jDDY7QtsdDpPEBSRU8UF1UcgAUCmtOR2IvjrAYd2dVXMNH?=
 =?us-ascii?Q?hYYg6ANITMUKppHLVfUWtfB/8HNrsbuanzIFj3awax9nn49hAPhMY+OQoowV?=
 =?us-ascii?Q?Vul0K8b2vhWKC2a2HceX2pYeTzBi49dNyUVAFvFHvpf9Ydykhed6B4s1zJJa?=
 =?us-ascii?Q?sKqHZF8WA9Y2vBbqZdLgpIZTJhy7wY+8Fb9GXbNvGz9IDqagbHupBn+sUAIP?=
 =?us-ascii?Q?Q0B3xr3jtns6RxsMM4RI5zgMUHwMiHt7zGxAKinDE+2qae1mp6MqW6tg9d1/?=
 =?us-ascii?Q?94GtmG2b8WIJS290LOe6CzmKbVgY//Jk6hTfZWj5/AMMSaz9P/o/s6PLsFOp?=
 =?us-ascii?Q?8iDViWaeaHK4jqKWgO00ckB+cRktxAB6Kr4RmcL7MzmI46uq631lAsTYAZ5n?=
 =?us-ascii?Q?36JOyhkBFwVm7FtMTc85YNSAPhfndnQz2Zaiz1k4sygHPcjbogv8jCevfTFy?=
 =?us-ascii?Q?9UQZHWFvocVFP9MgrsxtiCqRAZExiP+FsqAiDow8WqQTCA5YDHI1EPCEYv4Z?=
 =?us-ascii?Q?WO2n0Yu3Y6fhSw+g7TjLoybabB8ZiSfxlByPDNwGFvo9+TXXsOs9RrOmBSRT?=
 =?us-ascii?Q?HNYIYl00GORacJerZ9nssCCTz3DfQZJlnEXpukJzimi2vdVqt/+CGAvlFsM7?=
 =?us-ascii?Q?ANlKdH+f84F22d4/hMr7GFM1kPsoBma5uMxgq/PE0aFWceuTJD7NWI0mprVm?=
 =?us-ascii?Q?vT6YgtSJ2Q7itPg+Wq0zg2oJie2pxM369i4rZ5I1YWrmMhvi6G6XdidNUevT?=
 =?us-ascii?Q?EqY0xztiU6pSYXLGDvvyeIvgFOj+lgZJa8l7xNW366YxiDIqOn/lz9+1c+pi?=
 =?us-ascii?Q?Cz0YQ+jkg0bVvpZYcB/hgub/F1jwa+YboG/42X9wQKuJ2vbuBbJICdSAiPnt?=
 =?us-ascii?Q?k0AWnAaIamzJsmclNEiD3dE+YXpkXw3WJo09vX2Fph8IM0y7HKvV3iRShDaZ?=
 =?us-ascii?Q?u0+bSvcwjby7aQ6B+jdGxzdxZbA8Ty/X0M0myw3tcZ0j8dx1mxTGWk0Xo0bq?=
 =?us-ascii?Q?13rUfdy/xXBYjxvvSWVXNwjbAidzdHHRDfuq/kIuwtK5/oDeoS2xnV2gDmxv?=
 =?us-ascii?Q?orBG2XUZYW5HD83p3d2oSmQDxVhVpqa4nZrBvTaHhpHhClkF7lVg1nhtH2IA?=
 =?us-ascii?Q?0qZ5ZQQnGxdkoR5wy4ozIvL5q97St4xPDeZpFF7lf7OT5vi4w3IiiOYL1YPh?=
 =?us-ascii?Q?zVm5Xgt0Yh6iaCvhU5ZT8kFnlEwvCbjk9k8PR5fdxWI8ug7FnFjw5bUr4jeT?=
 =?us-ascii?Q?uUMaNIiaHgAzbbxmWYrVHzGVIirGOWsrkGgs5LTCWx79qp6OLui14kbD1alY?=
 =?us-ascii?Q?39DDhWrSVHA7ySzJBw/4DXfB3pZ6+y/RA+6jhZwfrv+J0fDCgH0PC7NWjk/r?=
 =?us-ascii?Q?abmAAXxfcKU6aIRJWoXIKJXvIqlaExtbrPDjO2eLeYxqzbmSuSb98fFykR+H?=
 =?us-ascii?Q?d/0tOUBpM7eS8TPoe0xsa0cQ1ZgzpB8vJy68SBq3c686VXkvqgVJpNLrSRmr?=
 =?us-ascii?Q?cOg4l07bfvlcaxQYWhXTwLvTqK7BMMX5f8l3HhUZZ9hS76dWKBMb?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c31cf9-6c40-483d-21f1-08deb1a9bdd5
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:52.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0fTUP6IwcBVCWvLfQnHJREYQ/rAVumONg4OdjU+MExP2iijKJCHJP/QkkLdNUV217o+gI/LpQVQatjKleUqZ3Hu6/jfocQS+bWtWMgXWZ2ffiDvnIEdfesEStTQO1U8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: CA7D7540FB3
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
	TAGGED_FROM(0.00)[bounces-36829-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.905];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,11bc2400:email]
X-Rspamd-Action: no action

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-per2pok-pinctrl.yaml      | 173 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  20 ++
 2 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
new file mode 100644
index 000000000000..7ffebf6b1bcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-2 Power OK Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "bper2pok" pinctrl domain.
+
+  The "per2pok" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO interrupt handling.
+
+  In the Peripheral-2 Power OK Pin Controller, there are 18 multi-function
+  GPIO_PADs. Each can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function or generally the GPIO function.
+  Function 1, 2, and 3 are alternate functions or peripheral signals that can
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
+      - const: starfive,jhb100-per2pok-pinctrl
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
+            enum: [ can, gpio, host0_port80, host1_port80, passthru, pwm ]
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
+        pinctrl_per2pok: pinctrl@11bc2400 {
+            compatible = "starfive,jhb100-per2pok-pinctrl";
+            reg = <0x0 0x11bc2400 0x0 0x400>;
+            resets = <&per2crg 1>;
+            interrupts = <63>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per2pok 0 0 0 18>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 6a80c56304e8..5573b5b0420b 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -210,6 +210,26 @@
 #define PADNUM_PER2_GPIO_D29				29
 #define PADNUM_PER2_GPIO_D30				30
 
+/* per2pok pad numbers */
+#define PADNUM_PER2POK_GPIO_D31				0
+#define PADNUM_PER2POK_GPIO_D32				1
+#define PADNUM_PER2POK_GPIO_D33				2
+#define PADNUM_PER2POK_GPIO_D34				3
+#define PADNUM_PER2POK_GPIO_D35				4
+#define PADNUM_PER2POK_GPIO_D36				5
+#define PADNUM_PER2POK_GPIO_D37				6
+#define PADNUM_PER2POK_GPIO_D38				7
+#define PADNUM_PER2POK_GPIO_D39				8
+#define PADNUM_PER2POK_GPIO_D40				9
+#define PADNUM_PER2POK_GPIO_D41				10
+#define PADNUM_PER2POK_GPIO_D42				11
+#define PADNUM_PER2POK_GPIO_D43				12
+#define PADNUM_PER2POK_GPIO_D44				13
+#define PADNUM_PER2POK_GPIO_D45				14
+#define PADNUM_PER2POK_GPIO_D46				15
+#define PADNUM_PER2POK_GPIO_D47				16
+#define PADNUM_PER2POK_GPIO_D48				17
+
 /* pinctrl hog power-source value */
 #define JHB100_PINVREF_3_3V				0
 #define JHB100_PINVREF_2_5V				1
-- 
2.25.1


