Return-Path: <linux-gpio+bounces-8720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53294EE7A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 15:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70179B21BB5
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 13:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E9A17C200;
	Mon, 12 Aug 2024 13:38:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2125.outbound.protection.partner.outlook.cn [139.219.146.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE628176FBD;
	Mon, 12 Aug 2024 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469909; cv=fail; b=DD+HdRW7fofUANXa3zWJU2ZaksxI3qzPRNS5MPskc4ctdUmAYCmtA6PpkY7afYU1VsRT4YTOR6KHPJIG8luorQxFHyF8w2/ate1xGQUAMrgzGuMUHCCDYPCbJV8GLEtojBr/pdlYYB69oQu1CjCd9MnK2XxIKA4mra4JwKmptu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469909; c=relaxed/simple;
	bh=+iFBzz2G0Syy8uQjZfVwHKKi5kmxZS9YRTdJhsqnADU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=C1MMItIVLAHRec3Rnb/3hdGlnm+WVGHcKqSmd69Zcmfk5sg1RA+Oxq/LleaKyiSPfj7UbcROqeraL2bxWdaFJpg5N1k8iXncEcQAKTLPK2IXrhLhupN0nMGzeAcgyZgFwZcK1o3izIUkuMMKzFu2mM2NhhNCLfZRZ7Wj7ftU0Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+mSAANc5UV0PuQuplwgfUqhj7wZKIEPsNaOtzeZpnAAkOMnF79zlEFaCrusSn8FhAuipxNzob+f39yyAXvu9wLa0acG/i1qSXH8K5TkT6QJ5py6+3TEn+Yp0YMkyLCaX7g2eZA0ytU6SH4atuwsjavrDek3ivB89EkrFNcv8F2qXaqd4RCrA/oMRGOLKU6qJpMhwCBtt9TAD2TZWGIA7BqVmOQM+zZknVrSgtnbIpMem7NdGU3pD1/VHwj68CBn3EMdHlmlrICwNSFInZPbAuW6aLm42k6F2rRiBKU77XxkQdaqR3tIjiZ/lz/7RW7XEgTEhX/zRRHK1BfYG9fckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtTX+siQG+eMTSarMDHELnA25W+WyNzHpnayrRNzufo=;
 b=ZufD12j+BoEW+meD1nbBQ78xhV7yV4BCjzVdCN+UdLftk2kWcJ9CxzEWpetedyYXhbsjtuQvn499oK5lWkufAsvWYmhIMqWloty/mek3TfFpT5A0M0GjNZBCPmOLkfpomEs/KcYoI18ZldkXZhdfvAI8Hjnhx32mUTNjKnXhEt2yfw2jEFgkGJDfnJXRke/hTjz1V5uKLxVDMiOIwC6ypfyN3tfjfeSDAA3Cd03M9cyK5b4BA7/3LKfoSJk+ACT98dScMP6Vj7rYRM738VzkT/NMYuA2dFrsPrmCbLLsIbVOr7WSjgHLqQIbxJKmAqY9LvC57JC12W7hiOB6H4fNTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1323.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 07:02:31 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5a83:8682:b030:e46b]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::5a83:8682:b030:e46b%3])
 with mapi id 15.20.7784.035; Mon, 12 Aug 2024 07:02:31 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] pinctrl: starfive: jh7110: Correct the level trigger configuration of iev register
Date: Mon, 12 Aug 2024 15:01:08 +0800
Message-ID: <20240812070108.100923-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0015.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::9) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1323:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d43eae-d7e7-4e39-54f0-08dcba9cbbe2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|41320700013|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	N5dz4bRrH7QMjmQAJAXPKNxCa0x0qsk141m+zitGDtWGKWENEghpsxO+w2ZodsqgKbvSvdpUIXeBtkhPoa2xO1ENApJL66R+UU3+mTs5tKmqLddv5on8imPQfKFXhNVwi3O+lwUNtCCgQvB0hP8QNX6Xb55hU2qetS3b3xCrz4KaJ+QEWaI6WrnlgqFDhvS1ZnrJHYGsJCPN1dxqLMAXkfabHv3Ici4CS0dpcsZ3uc/JLnD6gqQ+LYDB/4U/7SP7o0kxluJ9JUIxgzCl3D55BnOv2+vNC2M5u4D6xXt5uMKIxyBydEEXMw1LhK1qFN2mTuwo2Ddr4k9717uwpV7nqNIdfNUMTcl54l8N2RJjvnwoeuTcTh0bebiy2YCkcKotFFiK+r80ICUgJDE3c+peenKJc6oXRpx5b46iaj42EuZRRuNeFRQbZXOHwkTdjFeELorJ2Z/7YtCUbN660xCiXccytztIVfi2iyRRJPaFPUeO9yYXJ6fOEM+KTBVwqCBVrKcNZ3Ds1vXl0hGNcitbifRDO99Cv01cRXpJq4D+seIagxVOO9VfGbdUDQvI6uG3XkicjWWhh/PjE6ASp8q0jS235bc7MMgI1lC2EH3TiRdW+L9lHz9M6WhOD6tGQl+2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(41320700013)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H0n8zKCtNT/2UUFHYePJWpG/F8awqMPkBwjgBpRSBiL6FD+bDhbOHDlVXxCI?=
 =?us-ascii?Q?TMNz0fxL2t4pltnCZrOVwUH/LM8NDZZ1jTf/vTh4ttBUQYAYqscQxnsQEb9V?=
 =?us-ascii?Q?hceIxLcKrqjmKXxuk+Y2QxhpNyRQnlMwcQLg23fJ3MWaKhxQyqE5GVZNdA6M?=
 =?us-ascii?Q?bcF4sc9t94XEGZuYK9/AchnjZwIYEWfYTXmmEsDwY59Co1E4D31cBHtxt1Nk?=
 =?us-ascii?Q?7fY8a6zp1/aOuDlbAKvMOgmoemwH5j5EgCwEqAe9VxGT50jFyldy+eIxfb9H?=
 =?us-ascii?Q?F9PsnSylxa3Qa6eUZjEgqkAmicDW+Kbo54EXK5EeW7BPk388xYtNa8uuxvNs?=
 =?us-ascii?Q?0oEDlOln/YTuQsOKnFKB6TqmaYhBV7FdjoNNBgnQUTuaQVr0ZFqHTiFN7dnT?=
 =?us-ascii?Q?pTRUdlKwiLt7bUEe6+y6sjlCRk8IeNoz6NCGydmEP5nsO6z4zs+xaCVup721?=
 =?us-ascii?Q?uDxMRsZD8E4rMEbRl+TKnloq6oRe97utfjRJUOltG0rBFf/kFGdlfhZrLCmb?=
 =?us-ascii?Q?laaf01I7JdfM1uY8SkE6Ai9oJHXroTCWAGJVmwuxlwwGwz8pXp3TVhaeWjUG?=
 =?us-ascii?Q?df0Y7wtmKtJZQFy/3QJcS09IKp4W/OTLroNhbAOFg48r99wR0YM0yiR3PIrd?=
 =?us-ascii?Q?a/NSHeTekpsjmYTvaqqfUZB6d908XZ7lY/sulT9llbnuzPbCuGq0ZuCkR9Vl?=
 =?us-ascii?Q?Xd7dAfw+nMa3TnvLRHqltXjPJLNSt+RmM8W71LfCD2lvO3JJK5ueZN1m+ooY?=
 =?us-ascii?Q?4x8/F1wBpokjMPNwTJzZlmgbbNrsaE7B6kilHzV5nfQKMbM9M2yIrT4p+UCY?=
 =?us-ascii?Q?WuWWuE0aNw24rqO52+qLJZhLtIUVPWYxa3gv2too2EVgD7K08F3fxSJrTWNF?=
 =?us-ascii?Q?RogHY4V2uT4zEFwVlctkA1VaJQLUyiWbcbzRbVPKNXEIqkP+C6hD2euvC2No?=
 =?us-ascii?Q?Xzhs603jopBWdnay+/nsZS9xUDW8PiLyKmqUF6X7m11kv0VtYKfQRUpVsHTf?=
 =?us-ascii?Q?CvspyaX3xhXcLOu/TNQOw5w15fgIPCm2LOvQc6K37RV7VG7AfU+3mOEXwV32?=
 =?us-ascii?Q?lipxCJokkxcuCPJxf1tiV8C4nxJm2/S/ZojZ6b+jrTvSt1Cm4ZUh/XWk97EG?=
 =?us-ascii?Q?d201of5hPDeIOX0m6Fz1Ttm3dUe1bgnev46G0N14aE9ftAjmm1F0csU1uzX7?=
 =?us-ascii?Q?0rxh6zSqW1sEY+1ZCdyePKO+/fENl+JvvxqFSuNfNMY+L5PsJrj44g5ktNIZ?=
 =?us-ascii?Q?IisWgnDNZbNUHvHXLoG2lpolqR+8uO4VfkQvpZJ0cZXpo2PQaFDAONb+ypSr?=
 =?us-ascii?Q?Mh4ciPHC6mMECdF7U1TNmJ0QvU2lRnz57+BDtYCQd75rqwsH7OaE20UBm62t?=
 =?us-ascii?Q?uD07/6+7HeRKqvnyUXyhxUqQCB7DlM8IR4y41vSQwtpOZETkNo4sc9JMJXXv?=
 =?us-ascii?Q?o9nkmdM6Akb7TihsydFwtbJsJ7chL0Dpv6ZUTW0fpmXIOfvbkpLnzdWae2oI?=
 =?us-ascii?Q?9QMjVqYazhPz30EWF2zKC91+iq+Ay+3a+rEs96Hssav8xoiXK47DOE7fR+nY?=
 =?us-ascii?Q?MXfetS8eDJew00POufSvTgmPZOP+NgwGoHvzYA/fQmtqVywOuJckbQh/Indy?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d43eae-d7e7-4e39-54f0-08dcba9cbbe2
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:02:31.0822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Cp35fVcGtJW7pePR6ssLIndHhZ2YOxttgFaaZDMUNY+ixMGUAmHeOKmjZD2mPYYSOqJf+M7N1j70ZgQiIEJDk18++zQseBx+xmru092mX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1323

A mistake was made in level trigger register configuration. Correct it.

Fixes: 447976ab62c5 ("pinctrl: starfive: Add StarFive JH7110 sys controller driver")
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---

Hi,

When we tested some modules that use gpio level trigger, we found
the current level trigger register configuration was set wrong.
Submit this patch to correct.

Best regards,
Hal

---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 4ce080caa233..1d0d6c224c10 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -793,12 +793,12 @@ static int jh7110_irq_set_type(struct irq_data *d, unsigned int trigger)
 	case IRQ_TYPE_LEVEL_HIGH:
 		irq_type  = 0;    /* 0: level triggered */
 		edge_both = 0;    /* 0: ignored */
-		polarity  = mask; /* 1: high level */
+		polarity  = 0;    /* 0: high level */
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
 		irq_type  = 0;    /* 0: level triggered */
 		edge_both = 0;    /* 0: ignored */
-		polarity  = 0;    /* 0: low level */
+		polarity  = mask; /* 1: low level */
 		break;
 	default:
 		return -EINVAL;

base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
-- 
2.43.2


