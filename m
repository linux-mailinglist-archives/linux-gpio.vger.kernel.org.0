Return-Path: <linux-gpio+bounces-37856-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t2RJMGTDH2pqpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37856-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:02:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E66347B3
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:02:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37856-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37856-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10E6330D19FD
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FC43E5587;
	Wed,  3 Jun 2026 05:54:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2104.outbound.protection.partner.outlook.cn [139.219.146.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92559314B8F;
	Wed,  3 Jun 2026 05:54:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466055; cv=fail; b=PA2DLz0tIxPuHh6oDEYFlNpBb5E5vEL1ifrCv/WbvZBarj4jESX0F2BiB2HBSJqaDNQfnIRjgB7LwvZVy2MGs5H/iYQzG46EF/8viV7ak5KE60JDiW8jDbSfldsMWUC2FgWHV2ylmZXftJ0PLo5FTvaC+UouAEfpYlzfG6j/Dvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466055; c=relaxed/simple;
	bh=qSjJSxill+aYC4YMXbLjCdApuf1+w8D9rhKHcgG4cE0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ByYdaM0ObEMHRuFKNYF4TeYDKWg2hj6NOBj2xa1xT8TrHuodKdUKXheTZUGeQajycXbt9Mfdg2qBJUstlqNrQZoTwRu+fiiWqq0RcvsfHMzqgLVnaqHYD8BIDFax7dhEnY/+Sr251mz0bZTkq74Qr3v7mFTiBVLuTM97awDE4K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.104
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7dkn23T3NYoNaq26jteqC2IRJUnAeUfTQjpz8UkcZSkjO4Xt3Vcdzvlnpdt+GEJEkmPN4FOLjEaTyQWM3LFsqAtKOgNEz4dyDtYCpiM3OJqUsELdYRdrQqbaMo7kXmWEwhrJ+S4GYBs6APetgQ2gDpFkua5gvB7LLLljSGmnJSXLwbeypQ1w3KJKIuXCkE2ebzqjpb0ZLXh8iPOzAIWTv93Xm+CP87GuE8EMZ1+NpQJnSVtpltUJGainipLqG29AaNuEY+b5v50Ch857d+xlkq3+7kYxbMbY9IuEEL8xtvgpCF5XM3FEjWmcDcwlOJExC/LuLDaJTQXrV7S/5vcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUAyJOi2cZKOPkHkQuAc18TOTRAIwCYzYcY0flwtofA=;
 b=alpq1Zru0kT8Nb/8nOB7zOZrEjHZnH8842rK4DJ3VRtm/rdatBBpATnG3NGQtlKDMiTVo86GsqB6IMK0XSjDnlfOjQC+LjTu1SL6AeKcg1vzU4dR1AisCHucWhT4disSHmyEpUuWwFSewSzJ1Xyt68PVEj/VherF2/+fVqGogcIpOjXJkejD7d83f3NyNBFOlSXSZyaIi2IP9+SvWsVnXKoGXBuFLtPgiZzkT4mh5msOuBpg55NDuADPdDJhhaChsbTBW7JGk7Bx1n7SrNs5NsJxHP3zrjhPGgpZtQ7VVjq3enE+mgC6YUKL0c+CKGljrKUflU/Rd691pea4r9nXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1171.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:00 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:00 +0000
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
Subject: [PATCH v3 00/21] Add basic pinctrl drivers for JHB100 SoC
Date: Tue,  2 Jun 2026 22:53:26 -0700
Message-Id: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1171:EE_
X-MS-Office365-Filtering-Correlation-Id: 32150fa4-fe10-4609-8552-08dec134823a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|56012099006|5023799004|6133799003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	VuZrJ18/9ckBneAlTMh6FwaaOq0qxYS5WU7SYu+KdTVhGMQcqP7QfzRtBM31PfQanlAiRHwznnyZvS8/5zy6/kajFyU/UrpSCGpbQDMzgdP4JNFn4R+MBjfR52PxiKo2QKM0WHlx3X71zDcT6OvKI91fEz0pdPV389FPJ05Cy68Q+zP1JE8Aw9qkoc6uIRYAzw4YHSGI8lO1MrHgSYu0BHBrtWUPM2sukZLXkz1k+tvqXJldwWNO0Omq1MqLD2aD93osow4M8UieurtqrzRClOdzzmjK2sMW2E8Z/OqfbhQ0ihKGgJHcjSZgyrm1+UqHYeaH8dvc/lGXkIXcWpixn0vXTonwsosUDZzd5VXrXY57kcuGdQXtrEYtASsEPD7ihYziehYgT4tWhUKzUtoaYPrqDRvNNTk09FXhLyLD6KnqFqz0w3Wcq2YXY6OXnRthCPUPpHKNBN/QC53y8Cazc+Ktec3ooNjjNrbgFnGsKm+Y2Bo2Ul9RAArikDU1gGmv5fGog61X49M+3g9DijEhs9Aa7mziq1cm10SHnuPDBJR1UekLPRq+g2svLfhS9ZFKApt61uyTAYOLnhPX0MiKvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(56012099006)(5023799004)(6133799003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yf/rW2QpW5b1nwk+zBTktFO7O/3kCmVKRM6f/45VZPuxTVtw0MgfrSDn4Krc?=
 =?us-ascii?Q?CpF2mFo5aOwiGs7676zr+teZPJGX6yuY4FTpO9Y2Ss765FaOgNjtdZ3SCFnZ?=
 =?us-ascii?Q?WfZrwzfhiYV8YBlmxXn9flTf82cfChInwrTcDitFQNWsu2/+10ObpFPhYEXP?=
 =?us-ascii?Q?yp6MNWvo2hzGiLzRpzwkOLfrL1/dsFAegYR75lzHU8dK+cXh/mt4QMzY8lo0?=
 =?us-ascii?Q?hNWNNQrb/17nZz1lAexVtYPRIrVnVHvAmWD9zq3SsBFdTsj1oMyi2YOw4fkm?=
 =?us-ascii?Q?nGTaWfwXhRJK5sGn5mgKDlX/Hm/2o79ggCPRKNDblbdi1ZbJbDoi1Do7S9B4?=
 =?us-ascii?Q?lA49P95Rzt1Yif+gMiAggWomhQMj5SkM3QjQarhHP+4A++NgHbZ6KcbGPf7u?=
 =?us-ascii?Q?QxortM8RtVgSVfEh5ehRl2cNq8J9b/osY4FCMiyqny00snBZM8budugPHOkj?=
 =?us-ascii?Q?2Qs3eF/z6aR2bWO81oMZ2i2ETx7RHRuSZYoDCsFgwCsTdqvRFhfesEcHmeQ0?=
 =?us-ascii?Q?ITerY1N1Mqze0Vg/dwMAZjLvf1amUuM7fiyWy+OW6EwLLy2wkoE1lsM5oyci?=
 =?us-ascii?Q?DY8aIQ/kdSyFMXl+cf64s/CJXFVNkBiQzjb8mO72LhF9lKcDLU8FhDO5iCrL?=
 =?us-ascii?Q?DEdeGMqQJWXIHd39p+DNOvMlNBTTKEckTIpWpo5AhqM5NLelBFcmtUQMzTcr?=
 =?us-ascii?Q?SPmlKwyrsUrd8ld/Yb4f6Hx+vJ3s3l3qDggat0+eCblTB2820jdnuP0ZSqb/?=
 =?us-ascii?Q?JUV9QE8K/i5atwCSQtxIvzAEDQnuCI+br7O6IYslAOgKhDKJ4I0tuP6pdO62?=
 =?us-ascii?Q?YUqPjbvYnRL1ujWRsEM6YJb4Bq23j+HpVpI4xKmF5kghf7zMnrpq0qWyO3vI?=
 =?us-ascii?Q?s74WmSZUEbx671/rM7xipJuK866FWapOp07q53719nJOyYismo7Q1jjYPYva?=
 =?us-ascii?Q?UWq+RrhqtRJyMegR2T3/ZaN2CfDwQcSzHzyez8argCNflRWEFt+ZJq0XUmeg?=
 =?us-ascii?Q?EXlhu51GKkoKO+WKHomN/jW0eUuFLQ3jAMqN0F6TD4MCcgakxQvaJvyYlxxv?=
 =?us-ascii?Q?S4yBqY71+zh5Frtn5Ajbb5mmsj20poVc4+y41HEDaSYoyM2lZinLKe6+Rsbp?=
 =?us-ascii?Q?T/TGjDOJiW/px5nbwRHGTbr6KPynJUYBASLNXlIyIMBPUUphwJ7Z5gbIspE/?=
 =?us-ascii?Q?qBJsDtT/XaQIYL6FNSVMexpxyXcE/mOW/yVNL8LhPqSSLUv4ijmifou6T54n?=
 =?us-ascii?Q?8/+ugAFxZe4egvGxUEPpHMVOOug1mr/uKqZWu630Vy6/X4JMqViLSzBzGYc9?=
 =?us-ascii?Q?1iWBPlRjQ2b9IasvOy33vr9ysxBWc7YGnQfv09vwp19ucqXbplu4t5FY0lmm?=
 =?us-ascii?Q?njaw3E0niUQ33+iPxzON97zmBWpNsMTuZlW2rMRyZ0efYFiA5QDcPxwe+Id6?=
 =?us-ascii?Q?UiblzBp7EJhpYpD8zH/8aN0WZa1D7ROWDYT6/CbMtc7JoDg1WSA9LXpiOBrr?=
 =?us-ascii?Q?cZ0mNMadopxIxnHJTwy481JQASXBIMUQyHnTIcH8aN7Z4bILgHTKFa5PcLOt?=
 =?us-ascii?Q?nUqbABD3d3L8wFB+p/TlkFIrO6bQphyr5BVwAWskaW9hJZclCfnB1fQa+70i?=
 =?us-ascii?Q?9h1AxVx3ER2qrrLCvQdkPVJC/OmF93dOGuGzb1hXuPUrr56v2V3WbsrXi3dP?=
 =?us-ascii?Q?jguYjtX16qbg/MnlrCGlxvulyEHLyjpQgNw74df8+VZ26eZNhcTXpVgkmB9r?=
 =?us-ascii?Q?uNDXrHac2wxbXCCPmJwT45d6L5JmvgMmGrQ9YzJ7UVDQeWy18KI9?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32150fa4-fe10-4609-8552-08dec134823a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:00.1841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TuM8gzkLw5qiaPQlz2B1UZYfxHAsbLGRx1W8XM61v5IroOzPab+mEnmWaJrlRFSrjjE+gSR8LDnW/1KVjO7T7aVIiZs6jsCrjUSZTwdpNPBXw5kBhC55UUBjR2OOY39g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1171
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37856-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:from_mime,starfivetech.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 175E66347B3

The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
per2, per2pok, per3, adc0, adc1, emmc, and vga.

In the current series, we will only add the following pinctrl:
 - sys0, sys0h, sys1, sys2
 - per0, per1, per2, per2pok, per3

The remaining pinctrl will be implemented in future series.

This series depends on the series:
https://lore.kernel.org/all/20260508053632.818548-1-changhuang.liang@starfivetech.com/

Change since v2:
- Remove v2 PATCH 3

PATCH 1/2:
- Replace input-debounce-nanoseconds with input-debounce-ns.

PATCH 4/6/8/10/12/14/16/18/20:
- Replace unevaluatedProperties with additionalProperties.
- Add the description for power-source.

PATCH 5:
- `jhb100_pinconf_group_set()` invokes `jhb100_pinconf_set()` to
  reduce redundant code.
- Add `jhb100_pincfg_pin_vref_set()` to handle pin voltage configuration.

PATCH 7/9/11/13/15/17/19/21:
- Add `numpv` to record the number of elements in the `struct pinvref_desc` array.
- Remove the `name` member of `struct pinvref_desc`.

PATCH 22:
- Replace the pin group voltage configuration with individual
  pin power-source configurations.

v2: https://lore.kernel.org/all/20260514111218.94519-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260424111330.702272-1-changhuang.liang@starfivetech.com/

Changhuang Liang (21):
  dt-bindings: pincfg-node: Add property 'input-debounce-ns'
  pinctrl: pinconf-generic: Add property 'input-debounce-ns'
  dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per2 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per3 controller driver
  riscv: dts: starfive: jhb100: Add pinctrl nodes

 .../bindings/pinctrl/pincfg-node.yaml         |   11 +
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml |  179 ++
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml |  178 ++
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml |  168 ++
 .../starfive,jhb100-per2pok-pinctrl.yaml      |  159 ++
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml |  165 ++
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml |  161 ++
 .../starfive,jhb100-sys0h-pinctrl.yaml        |  160 ++
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml |  161 ++
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml |  169 ++
 MAINTAINERS                                   |    9 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |    3 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |   23 +
 arch/riscv/boot/dts/starfive/jhb100.dtsi      |  110 ++
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/starfive/Kconfig              |  115 ++
 drivers/pinctrl/starfive/Makefile             |   11 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   |  154 ++
 .../starfive/pinctrl-starfive-jhb100-per1.c   |  165 ++
 .../starfive/pinctrl-starfive-jhb100-per2.c   |  126 ++
 .../pinctrl-starfive-jhb100-per2pok.c         |   97 +
 .../starfive/pinctrl-starfive-jhb100-per3.c   |  119 ++
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  123 ++
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  |   97 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   |   93 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c   |  134 ++
 .../starfive/pinctrl-starfive-jhb100.c        | 1607 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  152 ++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  252 +++
 include/linux/pinctrl/pinconf-generic.h       |    5 +
 30 files changed, 4908 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
 create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h

--
2.25.1

