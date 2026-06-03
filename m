Return-Path: <linux-gpio+bounces-37863-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eS9pEhbFH2rMpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37863-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:09:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B02AF634894
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:09:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37863-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37863-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3697330D3570
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CBB3F7ABC;
	Wed,  3 Jun 2026 05:55:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2132.outbound.protection.partner.outlook.cn [139.219.17.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775EB3F4DD4;
	Wed,  3 Jun 2026 05:55:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466122; cv=fail; b=awNVRuBzGOd4H998/YDcQGG39D7d7TOvShjcU6frm1qiUuG/RYoR2Vt7I1BHbDMYQ+lfSzzg4ruV1Ptk9mJLC1KBmdbSL6SRzSBII3MCJYQ1gjGAI2/AADzFyt9fyTCktW20fhRfKunhJcaR+n4MsaCHQgM8YHYwg/00zKJ0O+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466122; c=relaxed/simple;
	bh=md29tVv4vRLLBQsnYuOXar90il4HPZ+i/NrWElOuQWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d0WqXpP8FaxsEc/hifddaWSomzEIqe2HnGL3HXePLNRu32PAfFPQ1zW58TbQhaXbasdplhhwKTMoY+puwxY80rLwiQHWR6oGzOU9mZD6oRcDuv+s7w+JQmrwzD6ceLxPKawCiAvAco9kHpY2SVxvEmXu7hDMoViP3TarhrgKj+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.132
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhZXhPjVS8rbpwAdZFhe3wLTGo7FmONrgODvGIFOM/c5ofu1kB73Wk15XD4k57iSXVffWM1Kiw5vJ00xOXn5sprpL/D9EAq2Cz7zZCcFr/teBGmLbh9kxEtLSRa7KIFD+fgyYUDFh8/McF4QsnXH2kPR577uzbIQROZVgZJR6r3Ko7bXBMeHcoIEUSEzS5+kZnwLCSI3vas/0oMciMT7mWv80lQlSksKA9LJRhbsO67B2krQor3YjnvbOqC3yZfo6K99XHLJExLZz2DLTxNcriKPX3POOQ2J2oLtOT/CkCfFkuCbLxcVMOF6PiPkmvvxpe7xuwTrGT0CR0Zblag96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29ZgbLHy/2gAn69JEEWbm0PmDO9AP9/w56jCKRRe/Wc=;
 b=cW9zhvUW1bCzYYxTvIQC+6cHy7FQgnnR4JllprGXLOgT2PoTFvUHCH9DdBCj5C33SGoy03n37WwqDld+iovFCqS8giP5XraInHppYNeB1id008t5BQQOVc7fW7Ja3a2ejESw/EVNwuR13fs4zMebluRWAzxgiM6w8t75Tb/sJ0toAXCx4NrM9FYUW7K2tnC3PqCHNANiXfBdRid3kdg0fMc1sfC3mLEkIY8jsvlFf0JPpGjtn1Q7XCRMYE5Yk8wWhWAAP3BUCeejcRJbH6a6wMF5VMYx/vPVh/7ji+NnZVVue3cSo7tQY9ohcYQlZOF9utsgB4sjW6Grc0DbnxqJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:08 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:08 +0000
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
Subject: [PATCH v3 06/21] pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
Date: Tue,  2 Jun 2026 22:53:32 -0700
Message-Id: <20260603055347.66845-7-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 344d1de7-9a48-452d-5a20-08dec13486fc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|5023799004|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Fl7hFcerg9RuBIdwU/gbvlTY5vWWHgjdAu8+0/Dr75zMesaVY2nFDEBiNfZ/CTvlcO/nGMJJrm1WSCC3ctLjYH6aNqfwVByT+DjsEQFmHuQpuS0LnBy8TwUNHkFESRKxmwnqL7FvfT3HxFfo6a/35F1L8dNFVd9jcrku4zQuywjZRxNjwHhmrus/u4aMMtoERMYgEjw2U0vnfSj8BCjwJFxxYAoqy6QLf+mhxOZxoiH9sW/0Dzb6KlwPHhIpmGs8/vXjxZJxm4jVZloMpkEf9VYJPhc6l01gjk60uEZwFqla3iINqtCn8GqUS+KHCAxettPXG6yOWGDUXKroH1uFcHbrKHzzh08AOthBg7VhKvkoRVWbLb/ebJV0uOMcoN2M8A63k6YbGXVLmKcDP6h5ubFk0W+jto0ISdiVT+XS1sPlyEjXwF7RBPDAGia8SJGg0+aG9TO/f5achzUhzvcTGRd8LIgJUwmVPvlU4P+qJjUwNMTBc1WrHUu06G/hBJ8LxY+8ToItnVbkRkTH6rHdkV1y2qjVTC77pLqr5iyX6ImhvwriqLYh2zKUq/uY2bd0hR3/Vu3EiLUukSgwBPXUKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(5023799004)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jHDfJJf/aiMgeYOf5LXqsFd01fdLPzN7653M5/urE05d/SiPAEUZGD6KQD+J?=
 =?us-ascii?Q?qQ1D3goRzl6qeoIPfQK/N6B1EnWod/aX3abfZySbwxwRqkbc6LyAx4igciF7?=
 =?us-ascii?Q?DwT8ZXtxt34zAiPEEXjaJvULD74rqP7FbwZr51Gc1ZNSRA6ajl/f2XQEsaTZ?=
 =?us-ascii?Q?ZNfUEXxMyqSmvKuN7gEErU+gdN9ZudUAuieZG0cU9eTScQhImkVRqXDg+u+O?=
 =?us-ascii?Q?SpeWr0SWouMdaxU4ImlmhUayznC2iJImzfQfQyMXrV3bEiTw2vPVRj7xpd3R?=
 =?us-ascii?Q?I0kNrAIrIvhqaXSZFhxH44f5xrdk7onwi9XYa+X4WfU0W7c7Fc0DOnLYjEC2?=
 =?us-ascii?Q?2Hq0Ld224RP73p+9ncyp9rqjm660W02n3ToULtS7llxXc6I4J+nvnuz1hsrJ?=
 =?us-ascii?Q?+/+ZAcDZ/3wGQEGTJ8zc5sRqRI30fhQOY5l/koo/rsx0PGlyMtRKlK1Z5Zr+?=
 =?us-ascii?Q?KQkX0dgqE9HtOHJt/bBRWKyaAwhkjQKg8VzIa670QqzYxGJTKrwajaje/KvU?=
 =?us-ascii?Q?OFFtJu+aVG+pjFn4+ZuyzTVT38ogr5Wds+AsrLBKsWgVMxAUp/L+jf4j9xI4?=
 =?us-ascii?Q?YO5BN6toP0/EBweo2/SQPNNpH8v53iwWVdTK7evDK2UBAH5fmh+LGrfbq+UK?=
 =?us-ascii?Q?OIHdFNf902gi1GLVUmRuO81Jvp28B5ycUESty4qKB2sAfDli29B7HswPIU+X?=
 =?us-ascii?Q?5e+wjc6HeP6G5nfnFfJlRCI8tXPwMttQgGZwKhy807qf5KTAsLU+bER2/ri2?=
 =?us-ascii?Q?YKYtTi5LfS1pvEvEv0ttIfMC77JwauIcCgm8vu+xTiiuv2FqQttfET1qkNvZ?=
 =?us-ascii?Q?TcFwD8igEQQbHrY9+6tg+Mzv4+5iCw48TZ6Cw/h1ka3MYOqoReHINltp9IAI?=
 =?us-ascii?Q?wMwKiTI0oikRVeoXBSEdHM1wqTYuW4RxfeW+CSJf7ls7aC9LOAGAJlFkOD4n?=
 =?us-ascii?Q?L+Tl1SmAvV9nBrRr424otLJIdtC/sqx1neioxEN/Gp2E4S2XoqarZh4XRIfg?=
 =?us-ascii?Q?POA+zDHDNYckisZcGg44pt/X9awrODbVVyQXYnzC0ooI2TWSurBG9N5rAwrf?=
 =?us-ascii?Q?ptgrEggQ7A409H4UU6uQX0baWCbqIm1FB6g5KefaR1yYrYNKQHuDRuUQR7Sg?=
 =?us-ascii?Q?EV7akTYCctKN2XE83IQANIJlSVUsLW1CMOpj/+HJ/U25cdl7Ro68AyyhTa0c?=
 =?us-ascii?Q?IUQCFw1V+fQGG8CkfXQ0Y0L5+g03vBI8DMiFrU8KOmO3D3dbkfSzDkmFizR+?=
 =?us-ascii?Q?KSYA/5qzuRMeFaI6YhetSRcEEG3tsfm1lor7Z59egENhXNLLQUn1A/03aG+B?=
 =?us-ascii?Q?64W/EckW0/8HoMzSkFe9VcdKcg2tZw92xrjr80umXJwyG3EvrueftvIUj5aa?=
 =?us-ascii?Q?OSdzj0fYLIR744VRbEH61+EmA4s42d6bu+Kt97FFRCr4xF5A36bUXzk4n/ws?=
 =?us-ascii?Q?xU6KYu6LQnpR1WePqk7jJbqSnctubsyIgrnOGjwI/ldgrI69MlL7KAxsWDkh?=
 =?us-ascii?Q?OCKUcjPzI5X2X02TKPQiH43lxpmrlVzrtrTmvmPhMV5Q54mKYXs2tZodNtIf?=
 =?us-ascii?Q?wup1Eq8NOY4tqofVQJ1EX9bOzrr5UvSSkkFe2WKFzh/lMyPEPtMSVorb/OpK?=
 =?us-ascii?Q?h+4KqMQWCudO19FcATlm4v5oWNi7Mex5HallGucwBL4jYciECwja2daJgX6s?=
 =?us-ascii?Q?8YCKyReH35zfRh0/KeVy4+8EWfUx32u2jjWjNf14dyRP4kQwEd7tBGFeiZKY?=
 =?us-ascii?Q?AE7XZnbwXbuQt/B4R47NX0SZQy2UWtKPVJNmx1o5k2CMRDPIoVi9?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344d1de7-9a48-452d-5a20-08dec13486fc
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:08.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvwDVQADW4pPBW8LIb0WK5EkU3iwh9i0F2SIjEV3q7aM4ONfgQFk0pfJv4+vd8hFbOKm3fQrjVijqk78dJlWFn0e+zwd1TwF0MFZ0T46ex9C67wNHwQO6SFkBoDBLhMT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
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
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37863-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B02AF634894

Add pinctrl driver for StarFive JHB100 SoC System-0 Host(sys0h) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 12 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  | 97 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 548a1b133f81..1c87f64830ed 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -66,3 +66,15 @@ config PINCTRL_STARFIVE_JHB100_SYS0
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS0H
+        tristate "StarFive JHB100 SoC System-0 Host pinctrl and GPIO driver"
+        depends on ARCH_STARFIVE  || COMPILE_TEST
+        depends on OF
+        select PINCTRL_STARFIVE_JHB100
+        default ARCH_STARFIVE
+        help
+          Say yes here to support System-0 Host pin control on the StarFive JHB100 SoC.
+          This also provides an interface to the GPIO pins not used by other
+          peripherals supporting inputs, outputs, configuring pull-up/pull-down
+          and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index c0d368f413bc..b26156a6d0eb 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
new file mode 100644
index 000000000000..80dc35321a95
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 host domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys0h_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi0_reset", .gpio_func_sel = 1 },
+	{ .pin_start = 8, .pin_cnt = 4, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys0h_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 12,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 8 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+struct starfive_pinctrl_regs jhb100_sys0h_pinctrl_regs = {
+	.func_sel		= { .reg = 0x40, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x34,
+	.output_en		= 0x38,
+	.gpio_status		= 0x3c,
+	.irq_en			= 0x44,
+	.irq_status		= 0x48,
+	.irq_clr		= 0x4c,
+	.irq_trigger		= 0x50,
+	.irq_level		= 0x54,
+	.irq_both_edge		= 0x58,
+	.irq_edge		= 0x5c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0h[] = {
+	{ .func = "espi",		.val = 1 },
+	{ .func = "espi_reset",		.val = 0 },
+	{ .func = "espi0_vw",		.val = 1 },
+	{ .func = "espi1_vw",		.val = 2 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A10) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A11) },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A15) },
+	{ .func = "scap_trigger",	.val = 3 },
+};
+
+static struct jhb100_pinctrl_domain_info jhb100_sys0h_pinctrl_info = {
+	.name			= "jhb100-sys0h",
+	.pl_desc		= jhb100_sys0h_pl_desc,
+	.crl_desc		= jhb100_sys0h_pinctrl_rl_desc,
+	.regs			= &jhb100_sys0h_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys0h,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys0h),
+};
+
+static const struct of_device_id jhb100_sys0h_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0h-pinctrl",
+		.data = &jhb100_sys0h_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys0h_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys0h_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys0h-pinctrl",
+		.of_match_table = jhb100_sys0h_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys0h_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-0 host domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


