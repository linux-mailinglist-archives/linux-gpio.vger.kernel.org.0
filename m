Return-Path: <linux-gpio+bounces-37869-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2WYtMCHEH2qRpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37869-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:05:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E81634810
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:05:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37869-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37869-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 091FD304F9F4
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424CE3FE658;
	Wed,  3 Jun 2026 05:55:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2132.outbound.protection.partner.outlook.cn [139.219.17.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC613FCB3D;
	Wed,  3 Jun 2026 05:55:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466129; cv=fail; b=tSG873viEyjaPdVbCHtedqM0hgMbjF6ELpnGua7yn+m8nG0naBtio1ftlkSEnUFdTAZgPWTWh4s+wNdvXUEDfyLwK4JyGwdL37v/rD9kRlZp2bKAuzHxLrdh98SKAsTy1iv3NhG3SV+SUEirmt1vKHnm8io5cF4+JAdlK8I6xZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466129; c=relaxed/simple;
	bh=vDBIKXBexp50pw+lT9JHebPVIXZ9MqSfrDnhB7clpNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o3A7AFEdPNH+EUDUu2hiXawcikqw9bVya/aN+nAtA0Ui71ib+tUdvr2kwWrE0D6cVRLT5LqJ5mhk8L23axaKHvDrJaORoiT1AH9k2iRmE0yzIyd2CTm1ue/FEjtB1uYtHoPE8ybT3x5iLqg9OmUnKygywqx5SuVC6V1mN+/JG4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.132
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6q57KN3EfIh/GTAV0R52/FAOEkZUdDTyZ6L+rRog1thM8is57KuEgQaR/2jj8iTyD1f8BywJ+OWHuyztAuz7ATlBH7YSn1goV8wOPJ0ycHeAXLDBAPwlFTXQQGL/YVsNmhVNWmNZfLFOOLuZ5Do3EVY/ojgZfIroQ0ZecMcg7gDECU1+8mXD7KeZjODRgtP+hOKpZaQSjR77PnmjJIt0b33RKBMS5e54d0xK8kZVZw1pXfxj/9+/cUSBStHENgnnvcwLNB4R6CIhExZHGIiptUJGoEeG/PzEylbMp5UCO2UJodMvisPw4ooC87Vl/8P00e4nRnB2UtdrMrM8r/Epg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zed9DjaRSx9SmkjAvCxa8sKpY4JDfS4fURVwArDq5JE=;
 b=NiWNZ3YyfzbSrLh3AymrtBcqpSazro2g9/WyFq17CkqDcvqOFhoXwvS/06+FdPiZPTiNmLf6L7Xak9vPiO+dRvQF7k17HlglqMPnWcS84/IQDYE9Umi8bj/EQnPjsHyFJxXsKxtiJEwUQ7u+VkkdqH/J0TSgbkeKoJ3/vFUoNm6T4pbivvAw2yHTa16sVOLDtL7PZmtc61MMulGqtP09Ppmvhwn1Eu7czI2GVgiqUWPJA8S2wZfOVugMg24eEmf34jFeQj/2zT27/FpgwcMxg/SJM7BAAg3K1+l44kGPmWiEvK3UJG369A5tms167Tcn9lLvZwvSWo/jHxN1bfR4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:21 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:21 +0000
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
Subject: [PATCH v3 16/21] pinctrl: starfive: Add StarFive JHB100 per2 controller driver
Date: Tue,  2 Jun 2026 22:53:42 -0700
Message-Id: <20260603055347.66845-17-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: bd76e081-47db-4da2-7e33-08dec1348ea7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|5023799004|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	97qc1wL20nRLFnmbgsnHy2+n1yhsqyPfZMIkfJydLPt7Z6eBAfkEO5MWSiHGrdPt0+xDeDEb/Zdw30ER58ojvp6Jv38Oud9mRu+NIs9lV9vziR9EpuU57/pN8Uv7LUegB+9oJ+9IxEsskssJsa8XVbXjl7tF3dpsZ7Cto8/8QNy26Ne4yU33aRtYa+RfW7UHjEH8BX6j/BE/iHPSEO0F/AmaPRC+VlQ8qa7hnGwdt8pQWb7Xax/T/GISz59jHanq1+alZS4moHzTVmBfV+rNc+XWf3rTv93bcziOeX8bx39N5M9U5Ctm67TVvnMIglE5xD4tRDuYxxXICPjNoFHKrUsmzV3rT4gKBifWoSkWKxYnaFPDbwk+lQ9pqBh73L7jT2scBCtrGwe5ghxWkFFSgElM8/x9D9C7YIgInuqdpzb5ziBWiLIHK8XMNmr2SGWXxKSbXmuC7RLrHdmrEbotFSBc+pGh5KoaisHnvPHjtgKBa+5wdeLmMhi6FlqSPN5G8bmBpP3sxfJRi9r6Uhqn6IPWRNdoZ9P9VnzE545PVL5/+8x43mUTMiC/Ax6DaawCHHklWEQ91FQ0GzeLm2yKpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(5023799004)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qsQBhtlhEYCC/AE5mJWt0SvU7WoOVTmPdn5EKwHwf/Ro+HsJgKRlR+F+DdTl?=
 =?us-ascii?Q?VFYPV8ov6AfULShZhbGllE50eT+ljAkwT68gSxcqpcW6T6CWLU6xXLyNYNwS?=
 =?us-ascii?Q?eVLvr1tIGdGV5RGuhkUg4t+7fmXCgxfdg0dzsbMUwxHPA6PY/vEj5KKI0T6A?=
 =?us-ascii?Q?YWn496/i1MRL+qPgdQwJGbMuZ72RwCJucqoyRZ2kbWphuquZGGPVYnQpqwSz?=
 =?us-ascii?Q?nHcHVMt2wtivwVhrtEVLBjAWtYXb3XyUG0SccqzsK6YU2cszS0PXWkYflzK3?=
 =?us-ascii?Q?3JlciWLhee59iUgVLWmIiaPUVotDLj8HWgr88ik1tGqV9ONeq3+sWC0Qfezz?=
 =?us-ascii?Q?EwA+Fb6wFarVlz2gsvQ61cjyk9jzR2avghwWgec3+5CYwNgLprmX7fB9Oxbx?=
 =?us-ascii?Q?G/yzmKpf60E4BhKEOWmknfd+qQ0eUEUt+RxfI5qIwDcH9y9XBLzPbvIZxpEX?=
 =?us-ascii?Q?KlxyJMlPFtcfDccPifyOE4PSP1RZrcLGwXTbdRwWSsocBQKBTZqGhwgQ1t+S?=
 =?us-ascii?Q?dyRX4h9xQ2gdJ3FnrBcXInfBFDwZ4iOa0nwkkjXJSZpoosFObrvHtSlofJBT?=
 =?us-ascii?Q?0RQxDeAMEK51x0TuAIRcwns7CnO0Z62apDGalScpVPNSd1Xx4C5QpIzDaIto?=
 =?us-ascii?Q?V5jGZuhxpRr4E6uwMJq+8dKhjFPmf9VR6PyltYf04Y9sQKKKqaZZXQF4DZqv?=
 =?us-ascii?Q?k8W8e3BHj+z3BpFpOf8poFrtSXB0zlas9yNSjwPd2UjdDo9MO47v87PoHjf6?=
 =?us-ascii?Q?sniSpF9yVcGF8iCNaiIrFwHX36MVIAtZbzDxfneRT3X5jfK2wk8pdqqKN/NG?=
 =?us-ascii?Q?m1hbSEoNg0LKzJXe2mxfwght/rUjXwRilY5TPmdVXCNbChOPpNQZzX7TzFcO?=
 =?us-ascii?Q?wW2vnxirSgjg4ahv0shP0yQDzzy3IUmTjjkZJZxyyXMf0tyhCmmZiho37bA9?=
 =?us-ascii?Q?PJfN3Si12whtpLqozTuILHuryQE5rYMQr9x5by/kewXPFbTkx8P31MO5TTlb?=
 =?us-ascii?Q?UOZp0DuuFGI1SxRY9GknmZvX5E2rqZbtyXYQ2cQwYwexpUvFPkWGms5Tdsel?=
 =?us-ascii?Q?N/NRgzLwIQvucBfiVdDb3SFP7QLl7y5LQSd5a+HYHf4SEzFcnkdSifN9V53f?=
 =?us-ascii?Q?uBNc5BWwZtKIE0R/vfgEVsaa7TdDl2TO04zxEWsJqJ7mRnifP4RFu9o3Sclh?=
 =?us-ascii?Q?R0YHxXQ3F6zKtKjj9JgMhbE1eCBcWO0cwu4XtQjfYrAQsTM2BDYdOq+VlcZ/?=
 =?us-ascii?Q?0EMOgj7DICrFS9WwPhM82T3mCg1KrlnzjKx6eWtV3OOTGLeBdYja9EmrW52P?=
 =?us-ascii?Q?9qCwBBpiP7DHJSxKBolBV098C6xl9JmUGcUSTbXsg/4/uueJ6RgJborjFJfd?=
 =?us-ascii?Q?0sOhBYyLGEFh8CNtmU6KwqrcbV3F83mfMe6Dj2EwoXUyENJPqkPFgqCOxZ86?=
 =?us-ascii?Q?wZHL5zOwEcF8a7IJWOzbzO0XrHxDzz7rp/Mq0MZvM2swLJjlqtat6kUq6cwy?=
 =?us-ascii?Q?b4nC1NFpELz+jFUK1TSzjN4WlZVJDtcAsWjKBNUGfcTBTyY0NFXDGztYwRo8?=
 =?us-ascii?Q?r/Quy22T8FmSLw+K85kmpPUH1uJjTXTxfFONnOQYy81u/VX9bPV32EY29Rc+?=
 =?us-ascii?Q?Su7+jZfW7/mNIvepIMFZd1xjF9UBm3POoMDgW1lTsG0dlM7ZkiorP3Bpf/WZ?=
 =?us-ascii?Q?HbGuX6CznyqDJMVgzrPG0X+Clu1/AFGK0u9RjrTkT1/n3uFXRnG0FnfJd0Lu?=
 =?us-ascii?Q?QClCOlrQKnam7ouqttzm67cnUvN+EC91HYA8RLzivd+4nWpxuS6d?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd76e081-47db-4da2-7e33-08dec1348ea7
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:20.9721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UnwP3tfgkQVFXJGn5ORIJ2NaZOxZZ5JIMWlX88KBOBn6HK1rgoP8dCsPCiBvy2GoTixirQIqBkif7CMW0pEeNNJ0BgVcgU2cUc+dKcQg0kqQrV2+p5aZhyjEh0pTUyL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
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
	TAGGED_FROM(0.00)[bounces-37869-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0E81634810

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per2.c   | 126 ++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index c3889a152f6c..edc3b6d9c8d7 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -79,6 +79,18 @@ config PINCTRL_STARFIVE_JHB100_PER1
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2
+	tristate "StarFive JHB100 SoC Peripheral-2 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 6beef7e313ef..33213bd1919f 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
new file mode 100644
index 000000000000..030c68beed6b
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_per2_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 15, .pin_cnt = 1, .name = "gpio", .gpio_func_sel = -1 },
+	{ .pin_start = 16, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per2_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 19,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 8 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start			= 19,
+		.pin_cnt			= 12,
+		.input_enable			= { .shift = 0, .width = 1 },
+		.slew_rate			= { .shift = 1, .width = 1 },
+		.vsel				= { .shift = 2, .width = 2 },
+		.reserved			= { .shift = 4, .width = 11 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per2[] = {
+	{
+		/* gpionw */
+		.pin_grp = {
+			PADNUM_PER2_GPIO_D19,
+			PADNUM_PER2_GPIO_D20,
+			PADNUM_PER2_GPIO_D21,
+			PADNUM_PER2_GPIO_D22,
+			PADNUM_PER2_GPIO_D23,
+			PADNUM_PER2_GPIO_D24,
+			PADNUM_PER2_GPIO_D25,
+			PADNUM_PER2_GPIO_D26,
+			PADNUM_PER2_GPIO_D27,
+			PADNUM_PER2_GPIO_D28,
+			PADNUM_PER2_GPIO_D29,
+			PADNUM_PER2_GPIO_D30
+		},
+		.num_pins = 12,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_2_5V) |
+			 BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+struct starfive_pinctrl_regs jhb100_per2_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per2,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per2) },
+	.func_sel		= { .reg = 0x8c, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x80,
+	.output_en		= 0x84,
+	.gpio_status		= 0x88,
+	.irq_en			= 0x94,
+	.irq_status		= 0x98,
+	.irq_clr		= 0x9c,
+	.irq_trigger		= 0xa0,
+	.irq_level		= 0xa4,
+	.irq_both_edge		= 0xa8,
+	.irq_edge		= 0xac,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per2[] = {
+	{ .func = "fan_tach",		.val = 1 },
+	{ .func = "gmac_rgmii",		.val = 1 },
+	{ .func = "gmac_rmii",		.val = 2 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2_pinctrl_info = {
+	.name			= "jhb100-per2",
+	.pl_desc		= jhb100_per2_pl_desc,
+	.crl_desc		= jhb100_per2_pinctrl_rl_desc,
+	.regs			= &jhb100_per2_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per2,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per2),
+};
+
+static const struct of_device_id jhb100_per2_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2-pinctrl",
+		.data = &jhb100_per2_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2-pinctrl",
+		.of_match_table = jhb100_per2_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


