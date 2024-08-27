Return-Path: <linux-gpio+bounces-9195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F38195FF51
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 04:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 542F61C21CCF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 02:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9B014012;
	Tue, 27 Aug 2024 02:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="E//XctzB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211318037
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 02:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724726847; cv=fail; b=jvmItMUZFqRcMKyoUnq/fDOjGszFZfw8tS3sTeHcwda/gPj9OK2BVhU9vH239TWa658qAdzU+u6KrUdazdfz6xywol4XH9FnycnfoO/MQLF8Y0ThhwUBbYv7JjvOTgQxBtLR3CyMkyvc4Hc68Eh96pSqvLpYwSpaspbwDFTL+hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724726847; c=relaxed/simple;
	bh=5+VjKiQH2XIRJLScTheh31Jz/v+/KCcR1cIKGCCtvpI=;
	h=Date:From:To:cc:Subject:Message-ID:Content-Type:MIME-Version; b=mkSZtGyrdXYlqqll0W+ohsw+JQV4jltguWcqb6MMejYD2NxsAOo1Wz5W1CVK73t25On0irpp3cXedpH8a4UT+LwLgBRscTPgbd3xZWdKLTNTmovRJOkg0UZwP4iUwx8qkFqAikzn/zf2BnFGcQuqO6jF91wOk9EMw6PaLvB7uHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=E//XctzB; arc=fail smtp.client-ip=209.222.82.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168]) by mx-outbound22-208.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 27 Aug 2024 02:47:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiqShegcbUnu/hX2yyXG/zvj5RRUjlCriZ2lLqG5/lttBlr8kIUNPlzczKDcjBKrUPdF6OzY/2dqoe4AebTh8fYkfRhPJyHUXiqIv7KFF1jI/qqx+odVbvSMHOvYM0AOSRU56vdiuhjolzM2GXgU2OJo6MIZk2ZCQoLn+yduabPF7+9vauW0AhE0vRb7bYb03JiW6SlmokxkvtAUkGSIYzjGJ/gsE1iJMlUUBYH4iS7L4qxt8bJRrEXMM128mepa5XjBzFYy+T4cvv5KBtDM6Jhbsd8HGrrQJFCjkHzmdOnnvu3dR/ZU3TtMrDfkclc7sr54gozOite3vaqqN17jPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGo/qtI6DrVdCYOJbM1oovYF01KBW/lbe13pWeZjpQQ=;
 b=TnxhMdS9ePJmC9po6lv+GvFaIHuUgnJb+NqaBG8X1pSieUmBu+8moZfj6nyA82nIU5Trp/GYPaX/cbhfjfVqEkRFlPhDiVZZnXT2SRfCjfl7J/cBhojX8yCbeD8VGEM7lxqb5NcdT/pK4/kSX/IirC64s+JRoqj6L0xLmhN+MbK2i99qPfhgOXO4U0s0OacHdLeQBnrJzJSBijlKVyysTSH+ZDpRCA//WA3UnR8Q5PHIfsgSeBusW35tf2BJLgHhxqjQJVIKBffqg/Ydwhivfx3F5ZS9Jz0tx83uPNasSY7gcvAdKP472Rf14cIiWrNwzvRsYzrIHKUV8C0IPkNBVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGo/qtI6DrVdCYOJbM1oovYF01KBW/lbe13pWeZjpQQ=;
 b=E//XctzBi6x7xZ6aI5ggRzoEv8Jv6sXJCOpkQFdAHfokLPh+FPeTSxxcNrvKsILkQ9tbg1Lmf3SEUy7UtYIjvWpLz7KlzBOTn1RisCbh4N75sPU/VDe3zIXaU/4eKWkXL4pON71CuuKfDuUhoYPbELO565paUWQYxw4VhQkrLAUXBMq9nCBmiSZP0hPQcXc7y8zG/easd+E/vmAiiV7+XZC7L2t+S1ublViVv5xXkjXP57zd1C+yY7Wvgg0eL6N7isTGHPWNT4el0j+gYOdRy0YaWt6E5AturBKwZkznJLt96hVdYbWAlKeLtYy0+OSJhqs1RTmjiBgdDDN4Yq+WRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) by
 DS0PR10MB7432.namprd10.prod.outlook.com (2603:10b6:8:155::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.14; Tue, 27 Aug 2024 02:12:31 +0000
Received: from DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae]) by DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae%5]) with mapi id 15.20.7918.006; Tue, 27 Aug 2024
 02:12:31 +0000
Date: Tue, 27 Aug 2024 12:12:24 +1000 (AEST)
From: David Leonard <David.Leonard@digi.com>
To: linux-arm-kernel@lists.infradead.org
cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
    Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
    linux-gpio@vger.kernel.org
Subject: [PATCH 4/6] pinctrl: ls1046a: Add pinctrl driver support
Message-ID: <c0ecf4f4-94f1-2efd-b05b-fc117c62e516@digi.com>
Organization: Opengear Digi
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: SY6PR01CA0015.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::20) To DS0PR10MB6918.namprd10.prod.outlook.com
 (2603:10b6:8:136::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6918:EE_|DS0PR10MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: d71f2753-6bab-4b0b-6976-08dcc63db53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ux6HC1v/RtsNgg0ezk+QnXo55qhnfN4aUFxp10OXaShM7b2Jrls8wBiE9+22?=
 =?us-ascii?Q?DJlTj6uUf45rpAVIgL3OFahzRXQO7YDLsJD+dp1V0WRyOGVFCh3danmYEGWl?=
 =?us-ascii?Q?uhJeYZW7jUxoT34Do98fCAjatUT+qwiWU069iRwR0nUYlRELp+Qr6AfKLBaw?=
 =?us-ascii?Q?x0UTXpg7qGoX8X8LQQ0tygoJ07NxJsnLGnhsUzSYgCtedkD4COouJrb7KfCY?=
 =?us-ascii?Q?6DEV0po+e9wIflv64XUx/YnhMpOhFR7iPhie/SnwJ+s710NR9Q+lPDFV4tWX?=
 =?us-ascii?Q?fYvohLeVGqiFSPDxNW1R6zZRCcu4ewrVJlOT2CmYb/yJZzv66IiVYprfbyWq?=
 =?us-ascii?Q?6LDLqN56gEYHWR5Ka5tHVaLz5uL9PiQv/0u8TkPY9RCDZSg0NhTJoqF0y+kV?=
 =?us-ascii?Q?ZazZfBNfR6m/IphlM7Y5a3h69Q/jPd1OwPHJcpkkmZn4p9kHSCdpo9nYNa2T?=
 =?us-ascii?Q?qLQoPaat9pElwczQ8jyP0Wp5PukKKi7P6Tg63hCb74YlVJeMCRMmT+uByTAK?=
 =?us-ascii?Q?4mqkhqOJPJA170CGxlRbwv97HodhBsmLkBZIUxONyTHIF6q7XqmgfSyAfaPN?=
 =?us-ascii?Q?JuHW8q1BsUdNHkRi+1OfvfT81mxmf2XJkUIZeHKg3comwQj3FAz9OVWmPSRf?=
 =?us-ascii?Q?RZ7RMByNcVAg2hvgjQGL5w5nj7JSRnNYxwGEYTHcV96rYMBekkbbvWAFPfbP?=
 =?us-ascii?Q?JLoKIHv3Rz8/JS3dTnpFeaUPkv5LJNzHV8b4MKLujppx/9TzrO/sK1Rzm9cQ?=
 =?us-ascii?Q?nCtvJTwmRvyaM6E8fQVFLCzBIeRVGK+LCROrYyzlY92Vda7TVLbwYeXDlmcZ?=
 =?us-ascii?Q?SXNgc8NcIZuLXJB2yzv4t8fCy4nmNUixpMJf6AOIZleXw2/AVCSs6DXIk9Cn?=
 =?us-ascii?Q?MW1WHR80D81uZy77SUg1xNDtKvEfWp7qCwoRe/Ouc8SVbRexqYw4yXK6JRXS?=
 =?us-ascii?Q?WB2d+yR+oX8kRSbd/NkPuQOWUdG+2eNLagZgd9x9dD+dRN7w0OCCfe4SitdA?=
 =?us-ascii?Q?sFepDJZDCvHr5ZkhH7RMLLqc2/FOIQps2QLAGj9+J9sebNZHYHajMYK/iAwz?=
 =?us-ascii?Q?RCtS29KBAArskC2K2OgFKh3HvgC9HhHOHiV+NMxttAVl0bD47eV/RA+wOdVt?=
 =?us-ascii?Q?zc3Ffcb5HOG1x2mTlOeoMbbLfbyivVpqS7g3YsbXE+YFxcCRsWX8M0YXVX0m?=
 =?us-ascii?Q?LfQz5+tSbySYdS1Dp0N2qsnDsx47Bgnf4Z+if5QBRfxfhvizF3u0PYsRXTW0?=
 =?us-ascii?Q?Oq38G1254Kt51iALL74+heboAPfxQSK6d8SwsWuMfd4YyucphjT5gSDXi/6S?=
 =?us-ascii?Q?9F82atNPySJchYPfyyU0iL5HE6R5dXq78NqAb/by3OaPUQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6918.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0gqkuPkeWoge1Ti8gR7Fly/ID+VnZUPQHcrocmSBeRPD5LWYFlPrWp5UIwrE?=
 =?us-ascii?Q?vlOs68+9E2ECFsbRyRqT2tMLIuoDbEOjy8Kkfsak+RrSLFvYtJBgMEW2U9mp?=
 =?us-ascii?Q?e26z1vr/qM2d9OjFduaLz+0m58tolE+qbDVMlAgDdww+3C+sXCz+nFHRwqxb?=
 =?us-ascii?Q?rh2JUJ3uXLgALk74xJMp3brNEXjVcM1FQ0nFZYAlyUp4PJ7/VflHaxyHPN2/?=
 =?us-ascii?Q?LsKBUez/d1LwAoRkzGrvSbrvtpr3y9lo3GzVgFbGtL2nNEc4Es15p9vI9K/4?=
 =?us-ascii?Q?ZVW7fIjg4bpkGL+JnTOJnbyIOhiqYtlclb9kkXKlSJ2stAlqCtoa9ccXOPr1?=
 =?us-ascii?Q?xcHbaMhgnzyTkC0aWUQnUnjlh5lxXrUZIGJPxSBaPcE/6qDr5RWZT8o8QQc3?=
 =?us-ascii?Q?hQ1yOp8WNRUjNNMABce1Vs1RxF90vZF7YJ57JtWGXGFertySZnBYaYaHe3cV?=
 =?us-ascii?Q?+7Ou1KESiKfft/jOhrPBwEkpeQBB6vlvwh4WbySC8fdQ2bQ+AHyZICzMLPCa?=
 =?us-ascii?Q?THyM4PsGUCFfYclcaGVVfRNVkcOS8zwA9vpra9zLfznRqgNeZkHypdexfwzm?=
 =?us-ascii?Q?TTD53CiKP87bfA0E7NukZa87TcwhqHOqrRMORcBs/454dKYWRorPz07jp8hr?=
 =?us-ascii?Q?G0JFlGHXs3aCJrRWk+VjM/IMIu/hk9HwhU1NcpIK9WJDn/v1FKJSRF8w+VDk?=
 =?us-ascii?Q?q98EKkO13W2LLzxsURG4kuNOnvVFHOGuQl72ebhqafoAt9SoiLZzpcPr0j42?=
 =?us-ascii?Q?VtfnUNbhix1kZFbyTx2cz0NWSZXSMdniAYl3WOkngrrhw2cjGbPPesburr2R?=
 =?us-ascii?Q?7ixbTkTSoUZbDPsiViUfBLoERci8fd9qG9avvSdShHNbIvNTuMtGPRidh98t?=
 =?us-ascii?Q?7SRw1yAbFPiJmOC9aM3sG836FRPH04OE+qQeqI+S1H97gCDKWwchrSGZwBZ8?=
 =?us-ascii?Q?vLPsDLd/xTv6QPwWGMP2dvrJ6JJ9kE7wEpeDJbXicIFGNnO9KxVpda5OHbeu?=
 =?us-ascii?Q?KGxekIQ+JYuhv4wSJmLEovrbOIiEsOyG7SEqa3YkH57u+L37XtH9Nkz70HkI?=
 =?us-ascii?Q?D5ExD6xO9RucnoyBlfdw3AeqH2kXuOUMYn9ZdVYp6Vgw3KFgZQTNL0JO2drO?=
 =?us-ascii?Q?OMaxhf7wFmlBoo6zPr8p3UiWseupZLIpzRAsdmN3mFdKU0i5od+LJbOJ6Sl/?=
 =?us-ascii?Q?Wo/s+1BGRphUpnJH2l7AbE0Z15n2JvWLPwq7/iofqLXvXVhUuK+R0fLdYYGo?=
 =?us-ascii?Q?J293St3MOxm5yTPLm+qLog0En2bDjD/2e2UEZHgGlVKLtmFwWVN8dX/agAI1?=
 =?us-ascii?Q?Q+wv/O2cxN+E/7CjgiadM1XVz9CPRH1JpNN+p6dB3Ecj6UnKK6FwoUmTsBR2?=
 =?us-ascii?Q?WmJZHpHLqatrDkGrdQezRL6LdJS8vmwgYmoV09M08HJkP3Rr+UG3BIwALF7j?=
 =?us-ascii?Q?yr8Ydcox8ZphXINX6cZUSwUm4ospdjblxYxR+qTJH1JqEy+Mt7aR3IGrnbTn?=
 =?us-ascii?Q?5SUcMJoIfKNQFx2CyGyX9ovzPUVhVmaiofY1Df4Bv/hjqPHGB22EllpRaVW/?=
 =?us-ascii?Q?cPDdPHcZKZivvJGaEcsCIXKskHMtnhbXdtzQ2FjIMqOP4vGiJdbJZU03SKH+?=
 =?us-ascii?Q?iAYBH+ZjhVCCypCOOmo37r9ynWIaA48MMRgYpEtvNKFJ?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71f2753-6bab-4b0b-6976-08dcc63db53f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 02:12:31.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7pMQIk0d/kkIht9HyKRMvdAfPaW0Dvf4/DUs8moft2RDy5V2hGloKZszqxbDtd/CDfK1mZiaDb1f6wla26C+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7432
X-BESS-ID: 1724726842-105840-22354-20894-1
X-BESS-VER: 2019.1_20240823.2008
X-BESS-Apparent-Source-IP: 104.47.55.168
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVhYmhgZAVgZQ0NDYxMTCODXRxD
	DFyDzJ2DLZItnA2CDZ3MjE3DjVNM1cqTYWAB6AWgRBAAAA
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.258621 [from 
	cloudscan23-80.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status:1


Add QorIQ LS1046A pinctrl driver allowing i2c-core to exert
GPIO control over the third and fourth I2C buses.

Signed-off-by: David Leonard <David.Leonard@digi.com>
---
  drivers/pinctrl/freescale/Kconfig           |   8 +
  drivers/pinctrl/freescale/Makefile          |   1 +
  drivers/pinctrl/freescale/pinctrl-ls1046a.c | 224 ++++++++++++++++++++
  3 files changed, 233 insertions(+)
  create mode 100644 drivers/pinctrl/freescale/pinctrl-ls1046a.c

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index a2038042eeae..2641db6c64c7 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -217,6 +217,14 @@ config PINCTRL_LS1012A
  	help
  	  Say Y here to enable the ls1012a pinctrl driver

+config PINCTRL_LS1046A
+	tristate "LS1046A pinctrl driver"
+	depends on ARCH_LAYERSCAPE && OF || COMPILE_TEST
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	  Say Y here to enable the ls1046a pinctrl driver
+
  config PINCTRL_VF610
  	bool "Freescale Vybrid VF610 pinctrl driver"
  	depends on SOC_VF610
diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
index 6926529d8635..66fec747af73 100644
--- a/drivers/pinctrl/freescale/Makefile
+++ b/drivers/pinctrl/freescale/Makefile
@@ -36,3 +36,4 @@ obj-$(CONFIG_PINCTRL_IMX28)	+= pinctrl-imx28.o
  obj-$(CONFIG_PINCTRL_IMXRT1050)	+= pinctrl-imxrt1050.o
  obj-$(CONFIG_PINCTRL_IMXRT1170)	+= pinctrl-imxrt1170.o
  obj-$(CONFIG_PINCTRL_LS1012A)	+= pinctrl-ls1012a.o
+obj-$(CONFIG_PINCTRL_LS1046A)	+= pinctrl-ls1046a.o
diff --git a/drivers/pinctrl/freescale/pinctrl-ls1046a.c b/drivers/pinctrl/freescale/pinctrl-ls1046a.c
new file mode 100644
index 000000000000..9f5ec31f1e05
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-ls1046a.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Pin controller for NXP QorIQ LS1046A.
+ *
+ * Copyright (c) 2024 Digi International, Inc.
+ * Author: David Leonard <David.Leonard@digi.com>
+ */
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/sys_soc.h>
+
+struct ls1046a_pinctrl_pdata {
+	struct pinctrl_dev *pctl_dev;
+	void __iomem *cr0mem;
+	bool big_endian;
+	u32 ssc;
+};
+
+/*
+ *       L4           M4            M3           N3
+ *  i2c  IIC3_SCL     IIC3_SDA      IIC4_SCL     IIC4_SDA
+ *  gpio GPIO_4[10]   GPIO_4[11]    GPIO_4[12]   GPIO_4[13]
+ *  evt  EVT_B[5]     EVT_B[6]      EVT_B[7]     EVT_B[8]
+ *  usb  USB2_DRVVBUS USB2_PWRFAULT USB3_DRVVBUS USB3_PWRFAULT
+ *  ftm  FTM8_CH0     FTM8_CH1      FTM3_FAULT   FTM_EXT3CLK
+ */
+
+/* SCFG_RCWPMUXCR0 pinmux control register */
+#define SCFG_RCWPMUXCR0			0x0157040c
+#define RCWPMUXCR0_FIELD(shift, func)	((u32)(func) << (29 - (shift)))
+#define RCWPMUXCR0_MASK(shift)		RCWPMUXCR0_FIELD(shift, RCWPMUXCR0_FUNC_MASK)
+#define RCWPMUXCR0_IIC3_SCL_SHIFT	17
+#define RCWPMUXCR0_IIC3_SDA_SHIFT	21
+#define RCWPMUXCR0_IIC4_SCL_SHIFT	25
+#define RCWPMUXCR0_IIC4_SDA_SHIFT	29
+#define RCWPMUXCR0_FUNC_I2C		0
+#define RCWPMUXCR0_FUNC_GPIO		1
+#define RCWPMUXCR0_FUNC_EVT		2
+#define RCWPMUXCR0_FUNC_USB		3
+#define RCWPMUXCR0_FUNC_FTM		5
+#define RCWPMUXCR0_FUNC_CLK		6
+#define RCWPMUXCR0_FUNC_MASK		7
+
+#define PIN_L4 0 /* IIC3_SCL/GPIO_4[10]/EVT_B[5]/USB2_DRVVBUS/FTM8_CH0 */
+#define PIN_M4 1 /* IIC3_SDA/GPIO_4[11]/EVT_B[6]/USB2_PWRFAULT/FTM8_CH1 */
+#define PIN_M3 2 /* IIC4_SCL/GPIO_4[12]/EVT_B[7]/USB3_DRVVBUS/FTM3_FAULT */
+#define PIN_N3 3 /* IIC4_SDA/GPIO_4[13]/EVT_B[8]/USB3_PWRFAULT/FTM_EXT3CLK */
+
+const struct pinctrl_pin_desc ls1046a_pins[] = {
+	PINCTRL_PIN(PIN_L4, "L4"),
+	PINCTRL_PIN(PIN_M4, "M4"),
+	PINCTRL_PIN(PIN_M3, "M3"),
+	PINCTRL_PIN(PIN_N3, "N3"),
+};
+
+/* Each pin is its own group */
+static const char * const ls1046a_groups[] = { "L4", "M4", "M3", "N3" };
+
+static int ls1046a_get_groups_count(struct pinctrl_dev *pcdev)
+{
+	return ARRAY_SIZE(ls1046a_pins);
+}
+
+static const char *ls1046a_get_group_name(struct pinctrl_dev *pcdev,
+	unsigned int selector)
+{
+	return ls1046a_pins[selector].name;
+}
+
+static int ls1046a_get_group_pins(struct pinctrl_dev *pcdev,
+	unsigned int selector, const unsigned int **pins, unsigned int *npins)
+{
+	*pins = &ls1046a_pins[selector].number;
+	*npins = 1;
+	return 0;
+}
+
+static const struct pinctrl_ops ls1046a_pinctrl_ops = {
+	.get_groups_count = ls1046a_get_groups_count,
+	.get_group_name = ls1046a_get_group_name,
+	.get_group_pins = ls1046a_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_group,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+/* Every pin has the same set of functions */
+#define FUNC_i2c	0
+#define FUNC_gpio	1
+#define FUNC_evt	2
+#define FUNC_usb	3
+#define FUNC_ftm	4
+
+#define _PINFUNC(name) \
+	[FUNC_##name] = PINCTRL_PINFUNCTION(#name, ls1046a_groups, ARRAY_SIZE(ls1046a_groups))
+static const struct pinfunction ls1046a_functions[] = {
+	_PINFUNC(i2c),
+	_PINFUNC(gpio),
+	_PINFUNC(evt),
+	_PINFUNC(usb),
+	_PINFUNC(ftm),
+};
+
+static int ls1046a_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(ls1046a_functions);
+}
+
+static const char *ls1046a_get_function_name(struct pinctrl_dev *pctldev, unsigned int func)
+{
+	return ls1046a_functions[func].name;
+}
+
+static int ls1046a_get_function_groups(struct pinctrl_dev *pctldev, unsigned int func,
+	const char * const **groups,
+	unsigned int * const ngroups)
+{
+	*groups = ls1046a_functions[func].groups;
+	*ngroups = ls1046a_functions[func].ngroups;
+	return 0;
+}
+
+static int ls1046a_set_mux(struct pinctrl_dev *pcdev,
+	unsigned int func, unsigned int pin)
+{
+	struct ls1046a_pinctrl_pdata *pd = pinctrl_dev_get_drvdata(pcdev);
+	static const u32 cr0_reg_func[] = {
+		[FUNC_i2c] = RCWPMUXCR0_FUNC_I2C,
+		[FUNC_gpio] = RCWPMUXCR0_FUNC_GPIO,
+		[FUNC_evt] = RCWPMUXCR0_FUNC_EVT,
+		[FUNC_usb] = RCWPMUXCR0_FUNC_USB,
+		[FUNC_ftm] = RCWPMUXCR0_FUNC_FTM,
+	};
+	static const unsigned int cr0_pin_shift[] = {
+		[PIN_L4] = RCWPMUXCR0_IIC3_SCL_SHIFT,
+		[PIN_M4] = RCWPMUXCR0_IIC3_SDA_SHIFT,
+		[PIN_M3] = RCWPMUXCR0_IIC4_SCL_SHIFT,
+		[PIN_N3] = RCWPMUXCR0_IIC4_SDA_SHIFT,
+	};
+	u32 cr0;
+
+	if (pd->big_endian)
+		cr0 = ioread32be(pd->cr0mem);
+	else
+		cr0 = ioread32(pd->cr0mem);
+
+	unsigned int pin_shift = cr0_pin_shift[pin];
+	u32 reg_func = cr0_reg_func[func];
+	u32 newcr0 = (cr0 & ~RCWPMUXCR0_MASK(pin_shift)) |
+		RCWPMUXCR0_FIELD(pin_shift, reg_func);
+
+	if (pd->big_endian)
+		iowrite32be(newcr0, pd->cr0mem);
+	else
+		iowrite32(newcr0, pd->cr0mem);
+	return 0;
+}
+
+static const struct pinmux_ops ls1046a_pinmux_ops = {
+	.get_functions_count = ls1046a_get_functions_count,
+	.get_function_name = ls1046a_get_function_name,
+	.get_function_groups = ls1046a_get_function_groups,
+	.set_mux = ls1046a_set_mux,
+};
+
+static const struct pinctrl_desc ls1046a_pinctrl_desc = {
+	.name = "ls1046a",
+	.pins = ls1046a_pins,
+	.npins = ARRAY_SIZE(ls1046a_pins),
+	.pctlops = &ls1046a_pinctrl_ops,
+	.pmxops = &ls1046a_pinmux_ops,
+	.owner = THIS_MODULE,
+};
+
+static int ls1046a_pinctrl_probe(struct platform_device *pdev)
+{
+	struct ls1046a_pinctrl_pdata *pd;
+	int ret;
+
+	pd = devm_kzalloc(&pdev->dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, pd);
+
+	pd->big_endian = device_is_big_endian(&pdev->dev);
+
+	/* SCFG PMUX0 */
+	pd->cr0mem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pd->cr0mem))
+		return PTR_ERR(pd->cr0mem);
+	dev_dbg(&pdev->dev, "scfg pmuxcr0 at %px %s", pd->cr0mem,
+		pd->big_endian ? "be" : "le");
+
+	ret = devm_pinctrl_register_and_init(&pdev->dev, &ls1046a_pinctrl_desc,
+		pd, &pd->pctl_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed pinctrl init\n");
+
+	pinctrl_enable(pd->pctl_dev);
+	return ret;
+}
+
+static const struct of_device_id ls1046a_pinctrl_match_table[] = {
+	{ .compatible = "fsl,ls1046a-pinctrl" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver ls1046a_pinctrl_driver = {
+	.driver = {
+		.name = "ls1046a_pinctrl",
+		.of_match_table = ls1046a_pinctrl_match_table,
+	},
+	.probe = ls1046a_pinctrl_probe,
+};
+
+builtin_platform_driver(ls1046a_pinctrl_driver)
+
+MODULE_DESCRIPTION("LS1046A pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


