Return-Path: <linux-gpio+bounces-37875-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dUR+GizFH2rVpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37875-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:09:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3C6348A3
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:09:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37875-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37875-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE887302C802
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 06:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0BB3F4DD4;
	Wed,  3 Jun 2026 06:09:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2113.outbound.protection.partner.outlook.cn [139.219.17.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6948D3CB2CF;
	Wed,  3 Jun 2026 06:09:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466982; cv=fail; b=Su8J8Nx3ZADbcADjFpEmJLYdFlFPCgNQZ0DJaLeLbsOrBrB3NqVD7/WctYhPmOkODEs820JuCOMbYca/zozT8bePKkuwWkygVUWsV5nO7N5D3iav+XkZvere37Mbee/1LittVThcx6T4Phm/INmrlA+4ubJC0WtAcdF28EeYa/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466982; c=relaxed/simple;
	bh=9G/ILWmPpwc/UO+Yk4v1wYHAuz5C0l1PRggMhpG4Ua8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JK9/d22kRZKzK0UGclzRuBHCiXeQ5V6uv9MmDFtPTLldrImpUr50zy2XA3zxQ5LgBUD+vRLa6TS4OOxXbqEL3US/2GrA6WQygCu14HElduIjQT6Q1jJ+frsSKI4ev23FAwXyVK4+sOTvmsi1vkTBw7z4j1ctR9B2hucAHtHpFUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgMduDjIvD1xFIZvzdGQ3jNP2MXR+WGlkmjVGWF9hds1/3cd9VplcnyqqdzUw5rmoWFB3IhXgrs5ZlKaoi1WMmGoJcwTM8ZAcBM4G6onX3+o16nnqf9C9yHn5X8xHN1WQI8SykmcGypJcVc9bgz6CkH3IhZphi3VLygsgtK8DYba2g0ujllDJu377vTRlV7EIgdK8DpWjeoNMXc6jwV1G2CnfewOBXe0dZRr0FChdbM3/GHbHnqZxsOTAirdDaoNKhz1ah3likNMPUk0WTSxxwEV4nmBc4blLSk/1jR3UW1MISCbD1RMYEXS41HIArfC8DH1Mi5cJwYFaFs9cWAF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzuxpJAL8jStQzoMYlnEmtobevwBFQ4zcB6w6buW3uI=;
 b=IlpSUy4ghxHTleEj46wozDfgRz6WSA0WBausQPuVO8Uda+958WkEpRICe7EVHG4gx6iE41+TzqlQApe8VMxfS3TsaELnOR2IT/ikhZnkS6oC+6F66hfySdd5JspGFoEKhXGQR7S/Swlu1rAYZl9xK64hzgvN50i/j2MTgzryJQeWerUft1Z4jZAOMZ2UFIKYvltoki8u1FgphucucfWpqiluS8c6ePp0AFWWbHonIXRQS/etWllIG4ZLl50UTMHDJ0CLmirPE2sffzN4lqQfV6QLNBBZR0wq09R7w1yLcjO7voyXMtZXurXF2rS1zwYGHMZyh/VRc1MnpmB+4DdiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:02 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:02 +0000
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
Subject: [PATCH v3 02/21] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
Date: Tue,  2 Jun 2026 22:53:28 -0700
Message-Id: <20260603055347.66845-3-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: cc148277-b50d-4c1e-c9a9-08dec13483c5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	0V3arIO3FWgi+yboYht2z3m2nh5OSErDOzg8PzwHMUK5hlTYVIjP+xbduvW3wAc2OTmVJC6nsh96U8x2Ihj1uQ3nFIqWOT0CpCCHaYEX1UxzZrY+rP3N4ATYPFfYwHCxRymHnJILbOrXLrbnpo+CIZGXMODnZOhHGHnxegx50+ZDz+HABpIom1vlwFwsYZQ6hx5PMANnGZj8Q6EAm/2gCwZIfZqTtQQwgJCwkHYxHSbXJ5HLTCFS+AIpJxDqVkg5ntpP6Vj90HD2eqRD6vyWgB0isiM+eCmcnAYS01UVEbpiLAu04DTZamZ9jUgaZFOEOFw+tbrZtkLgLH8djMs1L4vEVrY2c5W79oCh4IqW3VmdO7YblJ2KbWg/4kcD3iC83fZ1UGGaY42rMbT/4dLMTBABJzBgNKsESY7BPLEWtuHTGCJYMCt78KR7Bea6rAbVKq4kBex40TtKD+yIGmiiKnk2jPiKgT2VJxo4vRAvNtHLRDIkqSIoLX4aZ8jat0+ztrMna0VgjgzNN5p2nbvaEdAQi/ScDJKPknWN3U3AiaItVHvb3pA26QVG+OoZESrfaqlo/KB2NA5TV47zZ8/OWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xFPO+hQNTHxpIZMFzfNxVlxFofqAd8lFTYH0YRYMjhs3OxKBVFsx4fCFI7z3?=
 =?us-ascii?Q?f2s7P9uHDtzN5tzk57ZY/1uzLK0GZcVJFaOre9S6SE+hQYuosc7hPhUXch2K?=
 =?us-ascii?Q?9JyoSr3sDJkfgf0JaBekxlY7MoqCkZC0PAgxK654vUfYN5UzaO5buu4w6dsj?=
 =?us-ascii?Q?VHJfPpzBbKeurhN8Dv+eicIZT8DnmcRfcS6qUR2YX1dHSWrSL+BKdFzavMTe?=
 =?us-ascii?Q?XfiKM2Ycp29uW1unsmmUkh1TxZRGV+GrFd/oNwqxuHqR6BhA7t38fVlIbyv6?=
 =?us-ascii?Q?Hr1A7Kx5no0QEiTyxYJIaXiJ9qrVHycwKglsD+QpVwRJahU5GSRjNyGmL1Ky?=
 =?us-ascii?Q?4w8BM9Y5pKBOmnZe6MTlz+NRYT+bdNrOOwMqoApK6DVBS5XlLgTbpX+PYJiy?=
 =?us-ascii?Q?Lf7syYafnQcXzRr8xnZ5waSfm/FzIx6Zrfi6MfCE2YC753KJHSMd0sFvrE3k?=
 =?us-ascii?Q?7cvWMbT16e8ILj0W0EvHWqohEbQW3TFCHfBoh95dghVDPDqOU9A8kUMxB46c?=
 =?us-ascii?Q?r2lZdPJy8u0iQBOnBzXuxxI7x8tDMULlIeZIt/dBwV+nYJ/nljKqSB9MmRny?=
 =?us-ascii?Q?mC9pz1DTlGfiRY5sG9ft80Ej5Di1jxZq8MiartuWZ7t9WTiDmeUnuqV8tack?=
 =?us-ascii?Q?AiBD+qN0hpe+iiKblk17QKtLL6sUBJoM7riU/m2749LP68jPSaxyIkw1BOm5?=
 =?us-ascii?Q?nB7+y9qG8SkS4xsJ9TB2AVHxCbW3xrPWuz4EeSXf6ZVxReEYQ7M3cQ1Mm5Oi?=
 =?us-ascii?Q?ok6+YIEa+o10Lg76F4i7j/52Xeo5B1+okuKWdx+1/5Qrxt38eYuTHkx1Q0wI?=
 =?us-ascii?Q?w36AumdxYwcUqVTxywaseuDZjFx8JOmz/0kDYzjoXO5RPfyFmSSr9WohUam/?=
 =?us-ascii?Q?oUOSX5ggzdiTr+BG0QnZBKt4sffxPQa9qzyi7ZXmFKzDfT2SGZd5IvxzqJhk?=
 =?us-ascii?Q?Mto6OOr105iRJZbtK66Xi4uLSsKqbk7qiiOXu+5ssmYXamps9RQ8HZeM/+WZ?=
 =?us-ascii?Q?jsOD3TeYeiqY9EAAodrNQ75pOM1tRI3UfKfvly02MfwhROfgFq56PxRM7seM?=
 =?us-ascii?Q?ReiETxdu0rZWQ1LeM4APnKLgGeDMWZ0sSRO3z9p401IVEma+z41iLt/nwV8X?=
 =?us-ascii?Q?evrNHorf0iWO5gxxZ8jSYucA4rHDO8QPQscMnTc8pTZG/FfaohkvdVjxKp6p?=
 =?us-ascii?Q?+WU8Qnict18x0UxbxpQoQC7RX2EDCm6h8etPW+uQHT3CYC7+NMtWr8WrDRZz?=
 =?us-ascii?Q?8AirB1IeyCV1uEZFHvrI8vQ4TB4hiv9xUEmBfV1dIIknBh1TzMPSKIsiFx3m?=
 =?us-ascii?Q?89ilQ5+GjWWUMjz7rPNPOmMFgxlbY3MoI9ZzPJQz3yLk8w1ID8iUJmOvvWZ4?=
 =?us-ascii?Q?qg4KnBcMsq6/02lgKeTKirF5mjfCG2jQlNeE34pMVR8qdFqV9H/Vv1diX0C/?=
 =?us-ascii?Q?QY3G1HBCOdIaZL0aSVMJfI3obv8vOlGnLMbLp6AbCEh9inN+ZJ+lHsa7z7mz?=
 =?us-ascii?Q?Spy50C9zAQnW/ms66xCY+3GnxGo1K2KHphJBJGa/2aTpRZYZaAy42cxKHr40?=
 =?us-ascii?Q?i6PndhiBdA/EZ2cDcrxuUACEC7T0hwxa5YqDJk1DIe2nyjhxmy2hUc59z9u2?=
 =?us-ascii?Q?aV7pmnCTot5+oJDLBdVzvWyLE0L+efCBUvkpRdkOA0iwIsu74BG3xvkkN26M?=
 =?us-ascii?Q?S8+I8bJxrN7gHnVUQajM9zJe3k/2pKhR84iIPWiaZhnGAiO/ghWguZvLF9Ma?=
 =?us-ascii?Q?BzyXwWl+LcdR3NVVh5kr2oHQSdYsavevKtO+5MQZ0AwSxr4fjxnr?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc148277-b50d-4c1e-c9a9-08dec13483c5
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:02.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eD7Z3mCZVItYZcHemyXgiHAIUV0TOBXS6R46N1K1dgx6dlke0R29K1xUBBYKtjAdt7J6X3tNhp1zwxEkmXYI1tTLZfUdcoG6iWpCf12HeSXiG+lYmRK7Bhay/mmzOyIm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-37875-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24A3C6348A3

Add 'input-debounce-ns' to the generic parameters used for parsing DT
files, along with the corresponding configuration parameter
PIN_CONFIG_INPUT_DEBOUNCE_NS. This allows debounce time to be specified
in nanoseconds as an alternative to the existing 'input-debounce'
property which uses microseconds

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 64ed28309788..9d67e2d26e28 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -43,6 +43,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH, "output drive strength", "mA", true),
 	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH_UA, "output drive strength", "uA", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
+	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE_NS, "input debounce", "nsec", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT_UV, "input schmitt threshold", "uV", true),
@@ -185,6 +186,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
 	{ "drive-strength-microamp", PIN_CONFIG_DRIVE_STRENGTH_UA, 0 },
 	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
+	{ "input-debounce-ns", PIN_CONFIG_INPUT_DEBOUNCE_NS, 0 },
 	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
 	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
 	{ "input-schmitt", PIN_CONFIG_INPUT_SCHMITT, 0 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index a5d4b2d8633a..1df63c732b99 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -71,6 +71,10 @@ struct pinctrl_map;
  *	which means it will wait for signals to settle when reading inputs. The
  *	argument gives the debounce time in usecs. Setting the
  *	argument to zero turns debouncing off.
+ * @PIN_CONFIG_INPUT_DEBOUNCE_NS: this will configure the pin to debounce mode,
+ *	which means it will wait for signals to settle when reading inputs. The
+ *	argument gives the debounce time in nsecs. Setting the
+ *	argument to zero turns debouncing off.
  * @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this does not
  *	affect the pin's ability to drive output.  1 enables input, 0 disables
  *	input.
@@ -143,6 +147,7 @@ enum pin_config_param {
 	PIN_CONFIG_DRIVE_STRENGTH,
 	PIN_CONFIG_DRIVE_STRENGTH_UA,
 	PIN_CONFIG_INPUT_DEBOUNCE,
+	PIN_CONFIG_INPUT_DEBOUNCE_NS,
 	PIN_CONFIG_INPUT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
-- 
2.25.1


