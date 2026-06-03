Return-Path: <linux-gpio+bounces-37868-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W2lBAjLFH2rXpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37868-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:09:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DB36348AF
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:09:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37868-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37868-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E2AC310783B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D47E3FE352;
	Wed,  3 Jun 2026 05:55:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DEA3FC5C3;
	Wed,  3 Jun 2026 05:55:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466128; cv=fail; b=tYN804Hbksj5D/dcpH1xLFJeWsK0bObhq32kQgMZ13cMOVkXMcz6h/481TUQF6zvMItiROP54Ga+Xg0x9RgpAb5+blUgPGkt3UY+n9W7Wy1rSjd+Tr+dQ1RJQiimATIhHCVhG6eo45cOMiKf5QxpQzHHjlzzHqXHLL9Bd8c8/z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466128; c=relaxed/simple;
	bh=BHONs4zeEMXGWdfm99IcyrfNFNEGCFmy1yHlWuWsNm4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rBtC4ipzilJyXHnwpPLZWfQ+z4mTJpTZ7DknBqtkBhiC7asQBmVGDZNc8W8rE7tH6fTPlHSPSBxzV45kPvRyjdcIr16qknDg8nPDzJYCrPAOUp3ydF73E+IGPQRj/A4NzFcWAeQAGqmDIYNQ+Fuz5xFHHCeCzm4lxGDmKADXUaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckGOPviga1KucjwWtmPc3eO957QKzdevSoji8LIyyXGbSCBey3HrGv0CYV/6tenpdTDMImBsxxPNUakctBkjGuclHix9dwO+S0acppSMAk/V0cJ4Strpq53v3Mu7AR3X8UVjHcgS5aj5cC2G4Zo98WWccUwPXsrGx2CzT9C/pGhDgpZLnk5bAUmJ3ndTJBoFf6RfDJNlCOwuQEYPCUTl91Ky19J/O5xaK/Ne05dQxJS4KiVh3RHKC7NwRtCoV63uKj6Wa22oY2A9XNOW9t+WIQ8ftD8KQ2ijjcSlut7+Gyxc1PR7keDyv57XjHaQ/X9FX00QFtca2CJ5vonCzf3h1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8d4TMqcNnZTwPRQd2w17PuYdpDhDe7yi18uI+A9RhI=;
 b=ca0xZdPb5gX/M8AB9dwuk8OlIRSv8ODNSa+mqZilep6MHew735QZ4dnFMUxE0ZynC9kvfGQeSkK/qN1t6T0DIgGkz7iYTU1kOD7lFGOwBSMgDdmrYgGY3dgXl46VfosV4xbqTlN6b0QK4SKYL7UE125cR2nssssRqQBZx/XhnPegMIAKWaixb+NnXh+u6kB5Rw+hKZmCnTtUzTk+KJFLQ57ZSpZTpxgOr9bA7pmVdhntQMSU3Z441KYfLum6fMLQxP51VFIFPGidu8+SCugi8WTI3qdCh3Y8d4tAtYwbDAnd9sLdBX89//fN/0N8rVzoM2qmN7rO9QAyQ8of6+2DCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:19 +0000
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
Subject: [PATCH v3 15/21] dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
Date: Tue,  2 Jun 2026 22:53:41 -0700
Message-Id: <20260603055347.66845-16-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0002.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::14) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: 230824e5-4440-49af-270e-08dec1348de7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Pfj90NLPNZR3UR/jwjxPkO44iG3Ysvm1tCedVZmRtFcPxSktumHpBITofNe8MP3mYsvdFKurCnBC6OcnCUPFXtw3tZsw2jCz9JFQd6fxjFSS31hzqFpCM/x2ZtwJP++V7diSAvzKtN4P1HF0bu9smISKARn3EEcrybW3JEF/1IefEunHOnVqyCwOjnlii8W/yQYVB4psnLhxv4zWgKG75656mdTcdNAdx5vZWRWekxd/ZdWi/xh8mqmqex1uAqdkSIizWR8AyHvyz8+y5QOaz/AmI3HEuH+qYxR++NWSv0oyq2TNNZnWSWLpdI2DnJi84LGaZ/uI9BYlbqchRL9EUfvL9wY4h3DEM+P1eH/tMMqJP++T/rqsUcuLttpmdPbC2wGkFnxRkWvYg5qOmxQyzJiz+ZG/kH2JIDuaLJvoHLdtde/huMn1TRifwmBkEZ1xV1BUH/vQG7iZqu6Kp4AKY+Asl992HlsmDV6PI3FGg2jmi+3G+zrPRucZ8xCTk/xceFFf5ANJz4JFSul/Yyjlyan3i3mERBee4SIoqXjICYJCVLlsADUAIMNPlfv+e+jj2k372d+TQgeEWBXm/pFxUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DidMvTyxlg8oF2ZmhUq+Z70pTrA81WQLO9SE1JIANP3gZVbaDr+kAnUjcu+y?=
 =?us-ascii?Q?dKsjiCWDd5u/Rx/NHzWi0gQ5+r3Yj3G1aIOT+pTj2gmT/Kio6h48ut2rdq5A?=
 =?us-ascii?Q?ZUk0ISypgy+J/NiyOwNgz+RlP+/lh4TmgmxA6G8WJYeIDufUnCWrQlaw6GXu?=
 =?us-ascii?Q?dYpPHbeZ7McThjazjG1Vf/dlUEjVHNqJpz/jJBq5tUAej7/2PxlwSCeKx7Fn?=
 =?us-ascii?Q?+nqOrD9s0V0kNRa9FIPrReG8L9V+bhyD6FxIgyy5TNvnagsfaWXNIpQhqL1a?=
 =?us-ascii?Q?Mp3fksxVvi0VfIBaThyTX1BPhcuk6y7kSE0d+dldUCnYHJZ8gsd7c7f0pkdP?=
 =?us-ascii?Q?PeqUumrY5lOOCiqntURer/BmBQNCGcxyhl4flFd2WoeHbGXWxnHpNUsnOIcr?=
 =?us-ascii?Q?1cvo9ThyyQOeStD47/ETkhLpB7sU8b+8rH/AFgTPQm2X9KQkASpngYDQO8pP?=
 =?us-ascii?Q?grCCpVR8+q4ypBLyRgNTL9AsHB6ASqkaTC+Mt5hWXXThOIGHPStVEItxP0VR?=
 =?us-ascii?Q?qMgGUop/8PosAydx4K/LsKNfAw2JOaJuW1zsNb8R2xfOmUtMfE0Bph1rKrmq?=
 =?us-ascii?Q?UM4v9Mpl6m2/XDTiLjYua23z63LlXwvmvU+NNol/VasWKa/VZvWVY73yz5tC?=
 =?us-ascii?Q?p6QjQwJVC358TZVXB99lCkl8tzI3NI772a9+sqkphk6OW44Gzi6D99tsXWTO?=
 =?us-ascii?Q?eXyYbZ9Cv5TSIuscqnY7lSxipam/18pRYkQPds7u4IBsx/HvvzdMbQupRC0r?=
 =?us-ascii?Q?k5eQs4PGqn55Kdq7AH/j7QRunCbRRhGE1w6wIZxpjXpneZkdnSc4uFaTlKPO?=
 =?us-ascii?Q?+TrNjFUV81jr1tyFEKNCNOk/sLtHYP1RXor27tF5heGWfiw2NYcrjH6svulQ?=
 =?us-ascii?Q?6HlpT/BIqkUvlcpouR9AmH6xHZWy/8xE+rkeA8ZfRIloBQpKy6M3a265FRuR?=
 =?us-ascii?Q?HW0t8zvCHL5WD4ZV7xNA5xMMLR7USoAvmXbtITjDmhX5opzgBQWIfFGXQCeQ?=
 =?us-ascii?Q?+IjzIYk95gWDVxhiRvkQgzXyXVZlDHYN+ueQr+XibqJ2y6rz3CBGeVi3uVK0?=
 =?us-ascii?Q?ivK6IoZk+Nr0jCfLmKqfcY5MF6/4G3klDuWIihoo4+morPpTlkmlbtgFtR5Z?=
 =?us-ascii?Q?gximAKw4+4PS+4m8Ce1hil7nVitJruKEpK12cmXyVnmhxnJY+9JbdGWPfb1Q?=
 =?us-ascii?Q?C2qBvHodJHN6OlDADDCR4nPctQulba8uFcIENQD0/rFHb+m3rafvJFopJycC?=
 =?us-ascii?Q?+cla0SRi/HjQxq+7ppqBA19HWuy6SLEwDMIHZ+37jyV1wizyseHEYPFCP2Wl?=
 =?us-ascii?Q?VpGc7o9DzbonasXJDHJ4hhptBclRM/rFi+iWAb78qd8s/rDZ2B98+U+b5Ztm?=
 =?us-ascii?Q?O3G1epJ4noyUgcyrsdoTGX0YGk2y+dzrstVoI6OsLyzXxzuNuKB5zazVK24b?=
 =?us-ascii?Q?iRCfbnIE3LuxCkhFP7hNz2gdfPcXLuKAiad9EGHx/S+v9XutR8Zdh0stYgok?=
 =?us-ascii?Q?aCxK6X3AtFnzHTy1Ble7/nnfXI3bSVIGLCWFsuc6QksX6j1Fqxirhglhw5a+?=
 =?us-ascii?Q?rmv449OBqznN8lPhIowvX6rjt0ANjQD9sSPq5OiC+kn0qa/Yc3/AcjDeHnUs?=
 =?us-ascii?Q?/VOYQqH8tFEK4KR6fjTdG4ckHXgmVAvCurmBl+VyjbKj2tz6c3eACmVAue8G?=
 =?us-ascii?Q?wxGNJI1VxJ2DIsZpAz+UOrQpDXwxZ10Sw5vyUXareqKE1uLuZx3X/7fGv0dC?=
 =?us-ascii?Q?umnSKXPThlBdNlT2WfxNzyrAy3k6xJ/cWoSpucIg1ZHrtCW/werX?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230824e5-4440-49af-270e-08dec1348de7
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:19.7147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcmIHYnzxGyApq12JHypRDnUmgsgyHwx4b0baLyY06IkfRhAfqoA23WWr3zblFi2pAHmdFJHlHsWaMQabDdvUZdMrrvBxDJ8v/1xF00GPVi0lmTCEN83CtGv/TRwckNc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
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
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37868-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,vger.kernel.org:from_smtp,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74DB36348AF

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 168 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  33 ++++
 2 files changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
new file mode 100644
index 000000000000..c6d88b6a60e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
@@ -0,0 +1,168 @@
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
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds, power source.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
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
+          power-source and drive-strength.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        additionalProperties: false
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
+            type: boolean
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-debounce-ns:
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
+            enum: [ 0, 1, 2 ]
+            description: |
+                0: power supply of 3.3V
+                1: power supply of 2.5V
+                2: power supply of 1.8V
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
index 54a900a624a3..7aeebcf72b8f 100644
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
 /* power-source value */
 #define JHB100_PINVREF_3_3V				0
 #define JHB100_PINVREF_2_5V				1
-- 
2.25.1


