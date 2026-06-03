Return-Path: <linux-gpio+bounces-37858-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HgPPEknDH2pipgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37858-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:01:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B046347A1
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:01:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37858-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37858-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7D42304CDF6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B9B3F4DF1;
	Wed,  3 Jun 2026 05:54:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2104.outbound.protection.partner.outlook.cn [139.219.146.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332AC3DBD7E;
	Wed,  3 Jun 2026 05:54:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466059; cv=fail; b=WcSJcTKGc7VVxfD8HKL26RlWtfe/cjW7/xz606y/5UiDJ8JHOOaWtvCoisoYiOOuoA0oSXHdC4cRUOPM0Imcy0zOd1gelD36U/srsI7KHG5aUfPvI2CMny9sEwR5NcD5AOizguO0ttWhde6Nl2z/edpbJtmLq8UMqbwI2x7osTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466059; c=relaxed/simple;
	bh=F4vbJY2+YJoKdPGbx1nMzDrjyICIBLzk32IR3peYn5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LKQCQPdgMniFk6Yn13ecarqABzGNJjPDfGjvnDJJHVKYvtkmfnWZuFIqasqliF0CJ8QaKEL6mUfkXcM+g4R1eztV7fjTPUDCTEL/H5x9uW+bHcIC7FBjiUWDWcOwMh6/bi3btqX9RyJBmFWnsrxqMaW4iG0VAGmxk8QiVbKK3us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.104
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq0qoeipr7VomSEAhlX7TQSuR3emBoL6iVG78s/skV4Tqc29d1oiQgLbNsDmTN8VRGmej0RC+aBoOGvx8+XmJS4Xu5lf6LWnjvoh+DtsAEO4wMtsP9chgDA07CXaET8Y9+wRFu9L7aAWmY10oM3F6BMZ75jqK68JPqQncSRuxf1dNXsxJpPCBkf8Jiry4mTLYBE4LWJSq99xVxj6TZGSKk+HKY7gkF7/6UFWrBN6NMNBw9glFl9J402WJT415JeZKhFM/z1/WNIodEZNP/lIz3CFgNn5w0/+1dDfUk2KLtpFLJyNuKlxGkTYEgrxUFBoqmuTm7klqUbjt1WNj7T7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaiK0NzSTsBPYbh5UO1oKYlNcqAfuenMhYOrL1wMAWQ=;
 b=U5GijybmLYYF68KXqX3HATXtMXIaW/IzDPypYzh4xjyBz8Kf0jS24UlpnR/7ipfiMmEEbDffpIZ77+MuAQ9kK3Tj+BayWRlh12B6TkTGDflrc5ZAvrV+LCeXcQMLJFq5Fs5Kfp5MeTYJVOe0fAotcU2mvRcmr5B1VwnaDD9jKZadbZnVk5pUmaGtpTlCPx0XXaPxnzjxhYOqFG4bfWYqsQyS5BkwiJV7DN02uDGDEOJluVAJacB7AyYd/NilqCHBI9n6QUtRuGJKgjXORUh9uJ6AYuzpHhryGWCODm3KuK3tfwIyLRuHQCPAYPEAWTpVwpOD8qHOGtjZdWaZ+mVwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1171.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:10 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:10 +0000
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
Subject: [PATCH v3 08/21] pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
Date: Tue,  2 Jun 2026 22:53:34 -0700
Message-Id: <20260603055347.66845-9-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1171:EE_
X-MS-Office365-Filtering-Correlation-Id: 50873460-0aba-42cb-cf48-08dec134887e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|56012099006|5023799004|6133799003|18002099003|22082099003|3023799007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	fkXmnIr34mx4IFaG9oR/FKjBFHbx7F0X/vx1H0rga58pFnt0fhT2nb/cMB5gzrcBzRPd8iFIIBgscEhaxHnt8zQMOsy7xES5s18xNxQDybgdRaOP36WSHlQqK87DzqMj6PnQMRFdpZ9fWx1Eckvy1W6PmSxoBtFYbaJxB5XSabuD8jDms7Mr3PPEQ9g2eWbYkWq5/c8OuKRWbIB5qjHv1kQwJVs0hLO/Ww1/ljKSGl1UC+fGUVLtxnTzenoqgZM2LeCtBuAEPPhrC3C0nxDp+YLqRMtS+5abwFKpAg8QjX0OOjP0a+yO7WpD+UkEDoFwdUfltcWE0gHkobgbGe4k1z35ubU8+TkcnO6CWff4VmtR4pTAJlDLYUlhvRCMDe0C5V1bIQOWhskCfu+e1gCxV03HVIZrC2EhvUyTAEkWoyrdbKX/6yFwOzN9xwBLKi/8Texqhv6Lke3fuiQ2RmbbYJBP7adqcdRYL+NOcTOGfMVV1MxPzZy2y9098v7x9JJcY9odPHQZ6F8dAppM+FQSM5kd1pqh8j2KgkqzgQ+NdTloWOwqe9/v0u71tmu7b0omYwNACMTw2YipaqrEPAxzvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(56012099006)(5023799004)(6133799003)(18002099003)(22082099003)(3023799007)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Cds0Yu7yzlPqsBmXto8dtLe7Bk5xzqqRveLGbUzMne+rSpXdsLR3REoSjxO?=
 =?us-ascii?Q?87uRshL4Y8UQq2GeS2aIvlaea3TJEKucFcKJBLoydm7cHJUXnX4ERK4+4nkf?=
 =?us-ascii?Q?wkOWYkfRRVs3jGjDyD5X29fdYeUduYYEDvbYyZp7ddL7RWJnnGkHhtB9LSjq?=
 =?us-ascii?Q?8TwIVEavCSsurOHqYKHJbUZZksDiBKmNP3sOMy7nO1X5NkfLuJMAYQwmz5r2?=
 =?us-ascii?Q?Gm3azUOd4bfmoJpRbvjfBTSOMs6sdusA1xxg9p007ZMmMCmr3BfsDwkf3jw9?=
 =?us-ascii?Q?/zB7B+cW8w2HZ70o6Pyy4zu/o2TYQiGPjkQJ3upI+4hF3xT/P7+UA14W5Byw?=
 =?us-ascii?Q?USr6HN8yqUR6IC7sFLoYffA8V73ZNaAcE50OjzwSKVjGSOVjNtFcwJitMt3o?=
 =?us-ascii?Q?ZyOqaEtrV2Z8zRhB1DiCgp9DGTPFba7ZQKjf+7A9sRpadHYhLLYv9HuhYEXY?=
 =?us-ascii?Q?BhuKY1w7id8SEcXbFu5bMRBSj9iiF8cz+fLg+sKvUP06uoZw5fuQc+5XcsMr?=
 =?us-ascii?Q?+IwYPPWorMqsecCU7+cRanjdG7nNUIQmdzeQAxZsmQP2wOhWix9/5vsrXy4q?=
 =?us-ascii?Q?zlFCBVBLRw5zkfV1oZgVKytpLluMS1Y4lta1nE0gPFUtyhUr9gUKzQUg1tX4?=
 =?us-ascii?Q?6JrRg21WrgM/WKbTZ+OBxgPxDuem466xl9gRfHe66XAuuHST6u1PPTLJOwcc?=
 =?us-ascii?Q?uMI6eXtcgYPhqVmBSTofGoAXTb8OcdeHCl613dJ/p/wLi6dXMnx8TlzHRi/0?=
 =?us-ascii?Q?CXkQtb3welRTzN159HyvRtEcL4KnbqxyNhl8Dz1TLaGaKyLTzTZ8ijFV4gLh?=
 =?us-ascii?Q?tFNUKWvLKoqEdQgmcHbYCEy8QqBsGK+VpE6EUkkGqw9IRsH/YDZ9gBdi3wqU?=
 =?us-ascii?Q?UBBL0+hgUk4maqYmzq5zC3g89hAsxX0JLxDy9KOPhOrXQFSZFox5TBOZlMej?=
 =?us-ascii?Q?LNwZm5i0doKFpmZTGiatcofbMgKOGVLwcn7QcMHVShbIzO5K2RySLOPpCNDF?=
 =?us-ascii?Q?GSkB5TxofP92RaPjxKnzt9cvTtc/fCWEgL79PskawhdfE7AC/z46smJI4gEc?=
 =?us-ascii?Q?PNDKFL9i6KmyBX/9BR2nIscubC2RXQoVwtohinEy6MBczAfTA4ezBMcXmsW3?=
 =?us-ascii?Q?KB8p+HdCsKqfefGkJoYU0gsda4MLTSuvZmfn7fEifpF7xlljngz9LnKEuB96?=
 =?us-ascii?Q?rIp8U0g7AwK/iToR9nodTOVUkbwbhxwvIP4CgPHGw5qMPROijIJrkCccxESa?=
 =?us-ascii?Q?kSQeQnUJ+RKJf3tHfoQZVRmY780x3yr4ij4cruWsgFkAGRtGuA/NIgff/Kd5?=
 =?us-ascii?Q?Fd5WGx06vHEIUjP7AP0+zJWt3B3oIT8x9CrKI+U+6j4aIDYTIWq/7rn6icjw?=
 =?us-ascii?Q?0/MlCLMToGoGMDWdAi6Z+NEE/suPDx4IMFHQWrTV1po9EgIVV2W6xDVhPMkJ?=
 =?us-ascii?Q?umcxfwEMeXje3qkbFzJbRBqLjPxzTaqh6UGrRYrLPxK0vNsSMgXVF1IiGf2M?=
 =?us-ascii?Q?QdKz1aA2IjPH+2UabloGapGQRnQzazj+KO0ud3wxdtRIIT+GnixPuSrJXo1Z?=
 =?us-ascii?Q?3ew3qMy3ZbHTuDPOCRG9J9NXuWekgMr+mXBQoTckhZjURuvKw/1EmLiHTqzS?=
 =?us-ascii?Q?yA2sBuu0rNVgdpJsinyc80pZ9+PbT2m2gc7y/dw2i6x4Rep9pFADTt5q8B3t?=
 =?us-ascii?Q?uRgjm5P8TQIds/G+DYeKCq6iuxdgdIJGcQTqXfJQ9Nvq+OegBLnizgT0Iypc?=
 =?us-ascii?Q?3WAdebNM8RMZGE9octG+cPJsbVMUR60Z5aZOuodGmRvJ6y8lYfpo?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50873460-0aba-42cb-cf48-08dec134887e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:10.6595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iu5G3DNbfVCIrcZwA8uZl0hK0b7eK2mpkH66+7fNiGQf8VAtyTMwQj0+G8iDaf2gNyMGUhhzL/pQ/QyaEXwPR/4Ieg2MUx4lyi5z3s/RFHcRlPLhwazgXzsWkws3j3e9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1171
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-37858-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12B046347A1

Add pinctrl driver for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 12 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   | 93 +++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 1c87f64830ed..882d621eaf57 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -78,3 +78,15 @@ config PINCTRL_STARFIVE_JHB100_SYS0H
           This also provides an interface to the GPIO pins not used by other
           peripherals supporting inputs, outputs, configuring pull-up/pull-down
           and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS1
+	tristate "StarFive JHB100 SoC System-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE  || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index b26156a6d0eb..8d96cf80d377 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
new file mode 100644
index 000000000000..84ca7b33a5a4
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-1 domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi1_reset", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys1_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 8,
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
+struct starfive_pinctrl_regs jhb100_sys1_pinctrl_regs = {
+	.func_sel		= { .reg = 0x30, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x24,
+	.output_en		= 0x28,
+	.gpio_status		= 0x2c,
+	.irq_en			= 0x34,
+	.irq_status		= 0x38,
+	.irq_clr		= 0x3c,
+	.irq_trigger		= 0x40,
+	.irq_level		= 0x44,
+	.irq_both_edge		= 0x48,
+	.irq_edge		= 0x4c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys1[] = {
+	{ .func = "espi",		.val = 1 },
+	{ .func = "espi_reset",		.val = 0 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS1_GPIO_A22) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS1_GPIO_A23) },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys1_pinctrl_info = {
+	.name			= "jhb100-sys1",
+	.pl_desc		= jhb100_sys1_pl_desc,
+	.crl_desc		= jhb100_sys1_pinctrl_rl_desc,
+	.regs			= &jhb100_sys1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys1),
+};
+
+static const struct of_device_id jhb100_sys1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys1-pinctrl",
+		.data = &jhb100_sys1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys1_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys1-pinctrl",
+		.of_match_table = jhb100_sys1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


