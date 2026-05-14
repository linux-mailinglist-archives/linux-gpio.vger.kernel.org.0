Return-Path: <linux-gpio+bounces-36818-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HOdCuWvBWpLZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36818-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:20:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E129540E68
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FD32302167C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BA33B6C1E;
	Thu, 14 May 2026 11:12:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E3737998C;
	Thu, 14 May 2026 11:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757169; cv=fail; b=IsyrF1TgW1nGY/JjjxJxe+ZX5xny/nhTCa+55cIx+3uw8lk0scrgdqqAJWVXJEuNgZu8x4AsRocMdax3Aeb/S0iXIp3/BB8lrCO42+Y+P7mgxiy09SlWkTOymmh/FWO1Fb2VtDNFNGbIA5zxtzfHGRXG4IoFTVJDGz91/afdfm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757169; c=relaxed/simple;
	bh=qsGCB760mgFFhTFIeD69WJUpr+5psmHpD0Vs/zNa3UY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uwjyJX1cJeXJZgxAYqY9KeUuePJWeSk85oFCcoFFfdNvP+nHACr5bQk1G5oCXircsTwXV0qcQ4W/qWN0/157+QszinPi+l4sM66cOWfR1NS7m3iNeS9u9GgnASc7/XOOjrJsZNSapUqnUuuj9CVjcfbFMU7KKmLZkzoHiN4jKEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3ZEs2mjgEe3bezVBu+Cuo+fpbw4GAAGvfS0yLWY3+HscevagJx/DSi9BU/9aAEDRoDGkqMR11AnnDA3ARWIQ/ibW3mMCz+mnzuWl4PQylxX0gQZ3Qj4FPSZDEG7UZ/AfiqgWpzvbqMLOws439ua0lkYI+ls7BIoO5/lJSaK1nc6Gge0vJ7qSv/S4+hj9Pa4sO9f2e9dR1fENdE/HmIsKocHzX2ZSPuIQP0whz3tB77FOZSqw2RgVHzoHX21uw+SC2+MKLAfbg2wUxxHgCsfdp0+saJr7gJK2hPsUpb7vj3nrXUTFNFb/0ifoiTl0u4BGOrD1soF/7Ka3JzHnSjv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmxKQpXMRSuKAe84Y1lpFVAaXf4q4PiNCBlu997kHfg=;
 b=NqmVEy3PbWmKsZlzyYLVW7DBCrVqcLO2vu1tExDuvNmihyN7CU5f4hcZMkXlGo/OxbcVeyW57gcun3OrXdbHIjm3i0u8lFUw5IiTJOa3R8flr+fQ7Z/Oxdzrpf+FpzVYOO7WikzQJ0JC00tzCA8IsaazgpzramGHF5hngUf4tRwfa6AvfzsoHU9ybXFSog0+trbFsK3T24kmbHox6lAL0M/NVZCO4SWAke7vst8xInCxBAzxJ/dZULmQDh7j4l8fnmjAiPNUvyuKitSfZaAqMPbd/UjbMvCW74tey7dOY5pPJ+1kJWBkBhoCHZ5DMYs+C16ZC0qo8xAlpFTW9Z/XyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:33 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:33 +0000
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
Subject: [PATCH v2 01/22] dt-bindings: pincfg-node: Add property 'input-debounce-nanoseconds'
Date: Thu, 14 May 2026 04:11:57 -0700
Message-Id: <20260514111218.94519-2-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 192abae9-2406-4a2c-42df-08deb1a9b224
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UubFojR8cbNnJZYgNzj7rg3L5qFxXyKHDjsPNb8oCHSYOZ+xlW+IjGLevzj6mfnG9vbEuF+k+91Ixe9WoZ4nSfy0QadS3DQ0eozZvV35F9+UihCG7U44zqAUQOV20ocHmm222lhyPu8GqoXF7mI+EWPtMje2H61aawh3UYN/JtW/JyBlh/a8Q2/RjBnyQex9NxIDTRvfB2NZN0XSyku2IjV5tPVWNyRaYgrT9S1WzIoFlT+M7IJ5g8ywY8zxarSgB0D0eWA3RTgdH882IfVypz+mcE/n7Zx/ao3R7GpTsGyblcCiUtUN+GpVIgmc5+8f8JFboHFhp/nU+WGQkKy9MATgYZXN/pT8zfsKa5X0Y+Ow6WnLu5GLuQzacDJnt8lSWN1dj7aERjWd8VU86DBt3cAphtWjX1+9xWgR0e5gCtbZ/SxVW1vZoSu+/lnz6JOfCM/uSLQqK39u0GVO+Hs0XdQ9QlLdocPUv+Fbzjd3giPgp2C5uNm1UHdJYcE+Zw6JX8dip5kZ1K4UON19J8t8zV1mBB89uisTpV/Vwdrvr1f3bpCc/+TDBYjeZ8IdOoCm8psIsd6oGF09lqj70ZgWaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4mVvU+hf3xthepRFHCLOu58027W6rhtan097heGTKbsrHGq72/3NNSrF2+qM?=
 =?us-ascii?Q?MNN5362sWHyZ47iXuHhsvIkqofEgQzaU2bdLlmnlhZYCDNKkNHRG4h7ylEYL?=
 =?us-ascii?Q?Dd/zdLABeurX42gomh0AhKOuboao5r0JesYo32kDhXuPbfRgjzNb2xSe2gDE?=
 =?us-ascii?Q?mZPQLxNbvSipQSpMLjEihEiIO7L27Cb3Z/hYBIyDLQEzRNVSOKJma8/gcDDn?=
 =?us-ascii?Q?F0XMFALyofTme6N/+YLm5DSdvg5RNOPpkWziyIeQ2AOEtXtDP1YzMAUCJTgU?=
 =?us-ascii?Q?NcxXTDFRyrFCEyvvv83UH6Azjz6Qce6VkIKN23hHZjjyQQUD5uv+d9hl0goX?=
 =?us-ascii?Q?FZq8SmuHxtbl+oGwU10i3bZIU6krjt57gdmbesjC8I9IMb7GT/JQu97pK5R3?=
 =?us-ascii?Q?VxUpchILzW6/388HqDHdXaBueV6KptO4aiJxrmy7spqlXfHl0pVOlbTpjLi9?=
 =?us-ascii?Q?5I9zh+eMQjn2BLUlHqU2ctHpE39yWDHO4aEuiEC5Mk83HjVriLOooc6QsAcs?=
 =?us-ascii?Q?re+V3dDHIKGuDmyJCF1L/4z3lGOOBkhWkIPjVUwVP6OSiahpRCBL9ISzMO+W?=
 =?us-ascii?Q?X86ecgwiBmufIvWhpgQn9TmT/GCEZ/qfyN2O+0t03QOy2zZM1HgFfj10uYn+?=
 =?us-ascii?Q?KMYKlVkWCVC+Py5oj404BrmyoAJcefpLTYq2YQFG7bHwj7hjlfp1cFEJKYGZ?=
 =?us-ascii?Q?OpgKmU+ncGCcPXM0ItY1xKk+5yMg2+XJefWLnxH2W0rYwNYqNyD7MCgMfulv?=
 =?us-ascii?Q?W+b8rWrkeaopG/O6gAXXRkWxkNQoVQsMCw1n73zuhtiYD66+G5XGIKbNqR6N?=
 =?us-ascii?Q?Bm+gH4nWE819kNaBmsuExLyLQ2xnQuzO29XkjbznQJB/vwPlsKDfatHJA2yY?=
 =?us-ascii?Q?/mDJ0XMr3ABFj5YU/icfqO886uKpE3R72U64SVK++wAu05l5OfhYWMbUg/cC?=
 =?us-ascii?Q?xTuLAIPFDHTwCNiJ1YugYFvNIrWZsWVOBzzBca/w1oXvBeq1A0fSVOb1FXkr?=
 =?us-ascii?Q?tzJ+IePl/VXUzpItKvno33hV/YqyJiG+DUBY//v42vD6K3JVSkGomSxIuxh/?=
 =?us-ascii?Q?y6pruSefy2iIK2vCk9+De+h9Js4tU/C8LbQhGn0IrCjZSKRF2lYxuL6//ki7?=
 =?us-ascii?Q?tZmJFT00Iiw1tNnkncRZYT8LEyUoqlhCUJfOPHybZm/7qOUeJi5gCi7iiTAW?=
 =?us-ascii?Q?T8KtULhNpLmz16nuNMaQfuq8Ttz/sR1xKFY+5lh3BdJlX4O8Od7TornXRt1P?=
 =?us-ascii?Q?18ZwZiaql3tw3FOyqRSGmqkNw97X/1nPDo3gue4+9ArRWM1+cOtqAFPZBmnL?=
 =?us-ascii?Q?5Ip5PEq4cw+r7SufG/r4RNF8py8OhBzeqBUziQGwCYmDqB8ApONC/g02G9Lt?=
 =?us-ascii?Q?lSOKhrrvtKScSNnrLDE7DwxBPalnjG3aAqV00AFG7d/XH1hv2DFpY7dT9UWo?=
 =?us-ascii?Q?62egNWrdMEhdlwtkH4CuyzOBmukUiS0Qs2qd2pUl0XNyaMIhL+1ZTrg4KJye?=
 =?us-ascii?Q?RthzXeVrcZuqJTuux1PwBcPoddNu+3JAp/a+Yz+jkb55M/LyTI/F7HNXPpi7?=
 =?us-ascii?Q?ZTAFC5GRIxbe0g5sFYFvadMum0QZcxR03Riy7l0ARmFG2BjOvxI7nTXDN87X?=
 =?us-ascii?Q?B2HFwWd+UtYpCG2npBooz177GRMdZSGd/G9IEZf/XexeUuFAcVkekg5NKTBV?=
 =?us-ascii?Q?+6QuLk0bf3HwpNsw61kl+Xg0gU7U2YZUzz6Xy3fkW4ja3ph3NRbireFdVSVO?=
 =?us-ascii?Q?aVhHvNUC6Tb/DHi9NuV/FJmXpxLkTyn01cdbHMyBCxeOH9iHdnRa?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192abae9-2406-4a2c-42df-08deb1a9b224
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:33.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrWq7JYeqrpWA/ZkU0hSJU/BFB8TOvpm/cNA08ZxmHs+kAq0RuQoLNUZLADzOnwMV7kqzuFRwjw1mzroW9GgJ+snSaDlC15PmpzBCaibwaDHnj6rt+hW5AN/bms7N2AY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 8E129540E68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36818-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.865];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add the property 'input-debounce-nanoseconds' to specify debounce time
in nanoseconds as an alternative to the existing 'input-debounce' which
uses microseconds. Make the new property unavailable when the existing
property 'input-debounce' is selected to prevent conflicting definitions.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../devicetree/bindings/pinctrl/pincfg-node.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index 97dbce8a261f..4db66cdf438c 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -104,6 +104,11 @@ properties:
     description: Takes the debounce time in usec as argument or 0 to disable
       debouncing
 
+  input-debounce-nanoseconds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Takes the debounce time in nsec as argument or 0 to disable
+      debouncing
+
   power-source:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: select between different power supplies
@@ -214,6 +219,13 @@ allOf:
         input-schmitt-enable: false
         input-schmitt-microvolt: false
 
+  - if:
+      required:
+        - input-debounce
+    then:
+      properties:
+        input-debounce-nanoseconds: false
+
   - if:
       required:
         - drive-strength
-- 
2.25.1


