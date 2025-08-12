Return-Path: <linux-gpio+bounces-24229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A9BB2200C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6823A1A259B9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 07:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BC82E03EA;
	Tue, 12 Aug 2025 07:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mRV72NiK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012035.outbound.protection.outlook.com [40.107.75.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212B92DFA2F;
	Tue, 12 Aug 2025 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985299; cv=fail; b=HLGvxhzCnDDhfQn6xYOPGWlwL4NuernOMPmedHrOQXwpVeFktKwqaIzGhLCUFFYnXgHFR9JklfC4byueyYdWnKdx7zPbSB5EC7iuMfnhiWrACsN/JuRSTJr3lvoLc6JXn2qOB7OCkqAaNaOtpdDBwQtmB+iFtrNL/87Nr1NQIeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985299; c=relaxed/simple;
	bh=XsiOp5Z5D/mxAuADscuX4hK3Yk1NiPWmKY2NhRVOaIs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ggItKVPhTlPOPaCGCmqHqH6Z44gTGG8h6HendPK4Im1/VOYbgqjjsZFAoJKW8ZHR7B4gHVEodiuM7sN+vl8k8Z+kpFuhRHuXBrwmTB9qXYmsmTXa7b6hNHNmZAItBmS2iXtWt7Jr6ddoQNS0z/szHgkZuJAuAcqeqPP4uwL4cmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mRV72NiK; arc=fail smtp.client-ip=40.107.75.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+y5CMbf4PS0RMrdft9gp6aKgyUSkzhMLH8I7Liq3CncfsqVisBR6nVTUmkcsS026jafq10EaxMBzJPIgsEclVO+cdXHFs0Y7GL3pAOphubFOHgKuJ3ZG+q1I7qIDQzjpLKK1fzh5/IdtIfUVdX5kXNcfKqSV67aE590OKC0aI756etfzoao0gcFdmF0gOKcgTluiF04duQwU33fEfaDdxhsXha+mizyUECIcPUSggkN+VAu5IAzA3xVcjuQyMiQYILsiIXEQ0/I8lpGIx3nGXaXz7yO9GGeVRJCAS+VvV17ute2OhwRvvv6HW4igXySbY7O5eafE8RSFEnaH6hr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGVKkSJ9UgUDhfoUmPFvfv6z7FnbLf9xMosbGqJn3es=;
 b=rGX8RN4uHjfWjcn1kntyGkY6bdJDYAnOSaJldRiiNLUD/+ZnfDLmkWUmD8wr8SKuazVhrn4r1u71UhXgn2RTtIKdp7qMeSZPdOiPDkSnHS8IVDBGKcWw7pZ3y9lXiEKVXX+rFu8Mgo+2bJP7ab3+z5LALAi+NoXi23SO1HrVQmJ+2uXxTAXMQ3JtOiD+Ooqkxp5eKGxwNM1OScSpKx9/6x3S70BMMBty9uGas/pdnpv/shKnvQOQlsQChZtWZVIUrUkXwpwGgS39YxORU219Mxukh9m/1//c36wROjaCS6nJJQZPAs479TVaxSCrw89vk7xsFPpFxwxACaudQnhHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGVKkSJ9UgUDhfoUmPFvfv6z7FnbLf9xMosbGqJn3es=;
 b=mRV72NiKBbFvqMgn0ljUVb+0rRPz9iadZB9XqDHRln/nXIQ6u05Szxl626QqCcnxCWNA8q9wDRWql5t9vHxZlovU05r69weBB0bFsucwhH9s2MaOMM7xnNMSzEmej894HifyOfSYVwyKNNZD4yUJUpyq2xwCgxntCcdwpwVAzPFmDyCUXFVXMea3IpL5Zju3nTEbiT7sQpKykRIzeZbRCcVdNhPBOWJa7VfvPeePI4NKggmt9Xe7BfgFA9icno8rL5l2hoyuU/7BSiaY5AchOFEO4jpbxwnttdCJ0q9sBU6oojqSq8QC0H01ZSSeXKoFgGxkOrvrQbd2RoPZBSvZKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEZPR06MB7263.apcprd06.prod.outlook.com (2603:1096:101:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 07:54:54 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9009.021; Tue, 12 Aug 2025
 07:54:54 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rahul Tanwar <rahul.tanwar@linux.intel.com>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] pinctrl: equilibrium: Remove redundant semicolons
Date: Tue, 12 Aug 2025 15:54:44 +0800
Message-Id: <20250812075444.8310-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::26) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEZPR06MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c3601f-4497-42e3-a5c4-08ddd975864d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZajPnSfb0K59JjWcFP388LBsVaIbSZuk+aaNCyQM+WiY4MHfpEfTVDg2Fwnm?=
 =?us-ascii?Q?D9CqCVhHClRPbjKmoideujsFQgxWcNT6AM3Nv5A0wRHFn3E+uiv4tSXfGCZj?=
 =?us-ascii?Q?lrXzq8ds7mqVHlUmJZF2flAmI8HnFqVmI7D483ir0p/ipBgcMPIZ5bIHFQYw?=
 =?us-ascii?Q?V5lvw+bYK5Zf3qxzHv1dv4ZusiMZov+bG6hnVBcvsjR/yVUfnVTJFGCgYxt3?=
 =?us-ascii?Q?4PCvW+JOEz+zeV4KLSUqWmf4lujVwTIa+e+lSQnva3Slb70ehf0nDgK9o74V?=
 =?us-ascii?Q?2crH9e3gc33vA/OPZQlY7ppIYoa+n9yTB7dWz58PmSlu2VnexBQCLvZy+wNp?=
 =?us-ascii?Q?IBalBZe+NrwA5t+dYmGLDpk6rgRhhtY32zL4pKsn36GW9tkwn/YsTNJhikZg?=
 =?us-ascii?Q?TdiMnxxv38QvJ+PH+aZ2ef1oBCCZohS4DUegDtrCf+sWfCESYIr/WzgF0we6?=
 =?us-ascii?Q?ZOjbsPo0Na0WUKndU7W9L/KNCAyUXsGqJyH0SKU9Nac6y86m+fFFVJ4cWmoD?=
 =?us-ascii?Q?jfxULABaflirQOjipFvdjvQ+Pfpv6b2RPTGZRyNodSOtz5JkbITTKN0taopp?=
 =?us-ascii?Q?geV8/595Gl51oQPMN6fS+tCDzDwhIyFK3rXrn053svVlAN/YwYkGCQuCIGyv?=
 =?us-ascii?Q?IOi0pxLXKAgCiaTgmlSoO5VmP7ZMDQN2g1KyUZvHNbsERMQpGSlWdftDfHJ2?=
 =?us-ascii?Q?Ny+X4Y6o3CKopzSH4rhIJet3jefxF+dFJsh6hIN43SNBBB/a0uL0nwP99IG1?=
 =?us-ascii?Q?987DgJDjJyEiDHacX2Hsgnq11aVOUiroagllEKWY0cIZOMlWnETtPv3rzT6Q?=
 =?us-ascii?Q?4wCUKiBMoUhiE65ljABGA47BYu1q7HdrqugOWR3PcftCpYtAd5IVAPXClUVT?=
 =?us-ascii?Q?+r7NYuL22bLzbQCCm7GYH+/DK5mF2FB+uQKh1EoHEzDR5ySSqM2p5VDJn0Vy?=
 =?us-ascii?Q?jy7Yn2ZXeiyXmZAwnVwew65VZlGMOftHk5cCiwWP5zKNkoRllDDxzLQis8hk?=
 =?us-ascii?Q?KrnCaI22mEw6XN3xQsj/Wdy0K01ukbfDnMVTmUeuHJMIEHKM9A9qLtxu29ea?=
 =?us-ascii?Q?xKUvcyhRTxiHEgfOF7VuRg1DrNPHgMnJQSLQgBaWxvp1xrsF9aRHatre9xHk?=
 =?us-ascii?Q?ByP2aQgs1Wy0GCatv8tl2y+5UyHad2sEz3DNF85eZY0rUfvOB8UT1Q6kKQ8u?=
 =?us-ascii?Q?TR+LGJtkTWAzMYXuC9QZX3USD8y+kIOtJxz+BFp1mNdZdGophDg2i2BKL1f0?=
 =?us-ascii?Q?7rHsRq05PHKU+dZPq3hutxgl8iTxbiow2NPIuVMu+tVsj3Em0DcK8/0PTet+?=
 =?us-ascii?Q?vQTHvpiAnOQpJIpkN1m9StnwEfgvzxLMBDLTUolnZ8G53mKrJBrA4MW6sSsd?=
 =?us-ascii?Q?t+dbFuuilUa5DY6WVqkJKPMR4to81nBxPN1Q11+SXqxv+biVRbjSZq5eqHmU?=
 =?us-ascii?Q?yHRmq4tpkiTcuDWlvproou4Fp6/Q7fmIdX2cdIqJfAh1v5avvMtKBQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CJlHidWP9Hfm7fdE3HJ6j5b+1S7xPASHO0FrTyIQOBm2biP0AXi55i0E8nlP?=
 =?us-ascii?Q?bJ7gYyxqab5pSKQWiyAl5vs7ebOU7V0/UqSbHbyHf64R/elfEq/Yx4PB48lE?=
 =?us-ascii?Q?ovwcu+jkpJFx9ULvct1aOkUxqAKr3QYmdUjeVYBRXDOTLTMqa0ohV6iM8p8J?=
 =?us-ascii?Q?DS7CIlwuUQOS2KNy4FBSoqBbXtlHCoqNZaW9aqJZSvfuYvcib4Sh3MTpeiZP?=
 =?us-ascii?Q?LAoTjdjjomEGc2j4vLui5770IhrxlIdd+jFjdfFSMdImLXkr8m/WRSTw7vmN?=
 =?us-ascii?Q?TAfxhFK5HTivTAn2hsMUecd/n/4+udC16FQXX6bmp4CwusgJ/MSf2HmxtZSO?=
 =?us-ascii?Q?xfTQb4rOZfSM8UTrcYCiddGltJDnAuLguiXJqzyIfPFhj4JY5H9kJflQazcN?=
 =?us-ascii?Q?cejh2TgBaQbaxOLb2sCsVi7KvfTZa8FmBWPTtxpA1mOotwL/H8f6Vy2ggJEc?=
 =?us-ascii?Q?UXNCNy9kgtbm6O4J6SM8Qejdee57RfLqBt9GUZxzxwUZGM/sQc553AobQ4fh?=
 =?us-ascii?Q?QBkPZ7fOK/7wybZN2RDrFaFMMmVmihMl1E7V3bXgk4RYPUKmo4i5aclEJPhg?=
 =?us-ascii?Q?Gu5cZMaKL2i/TQ/YmmgODQC8fuTwEXeVIOv+nR9ZZkR8SLCPG2ihXrcjU5xd?=
 =?us-ascii?Q?L0vmtvFUwTzmjCDV62m/l1jF268Il7hzxHV7olDbPkUG6/9GJVGnzmTb29St?=
 =?us-ascii?Q?g2ieoPLhjGMPI5cam3iQ7ZRrbGHZSfmxKXTIGz4liEuzf+odTEB4k6NKX/+p?=
 =?us-ascii?Q?r0ot38Bp9RUWVAKS72EVHc5LKgCTTEGwnZu/Zc0pWI6x0lxj7rR16J4XC5Vr?=
 =?us-ascii?Q?UkHSwfM/LG/+Gp27PjDg5jJxU7Owj/7DH1h2+qfbKSO4j00kSqgsYU/TL+j/?=
 =?us-ascii?Q?rOVf9kIN62vbC0Za5fRnNi7nPbgRRhte/duRvWTkvprWHVImLz+NfBc+/CUB?=
 =?us-ascii?Q?rEthJABAFMaIH63mEeEQ4tbYpdkPBgct+MgL5T06eU8fM/0G7BlCIFk/r8hW?=
 =?us-ascii?Q?t9hZpI1N3AORasQ+Cic9RFNfglbUGSrWnmnW4W/JDOenjD9UR6J2tncyPvWx?=
 =?us-ascii?Q?N1tevOCqIEK0J7sj7vn34YFDCJv+AYKtL86ryzPTs3B0Vs3lp7fohcdZ1ldd?=
 =?us-ascii?Q?rU5ZZqIxpEe8+CBh9mCNY/J5hnwk+mIdmFx9cnMrWjIMv7E3nk914wj4QAOA?=
 =?us-ascii?Q?BDgWGLfSmunQXWqARldqffnIDCnSIo8HKHF4MKczx2CkV57D48F5qBmsPt/+?=
 =?us-ascii?Q?X0qbXYovJFqcaWoDckJTmusYzFrFO31+BK/sRGDhSp1TiiMyX7jfDmJOyJz0?=
 =?us-ascii?Q?Qsa8cT5f31/5zTbj5xT+YEtVFsW4GAo4pqQIc4z5pTtZQO0bDiJ8ykgo2Ptb?=
 =?us-ascii?Q?4zsNO8dpDNuaUeZAMjWwc0m0wpztj7MW3yLusvNsvjPIYUzmVfPiHPkim8u7?=
 =?us-ascii?Q?+IxpzEEu0ntCIbxqKLXIp+yPXxMY8KtwhtyIM2zEw7IglpKWThZqmWRGAtKN?=
 =?us-ascii?Q?LomlCCy5M92vQo4MIJ6TS9l0JZFs5Bv5RxIJNw9Nv4JbL9+oEy2aPDfj/9V0?=
 =?us-ascii?Q?bprylKgkidsyfoLeQWysyGmvRtldbClmuArXroFw?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c3601f-4497-42e3-a5c4-08ddd975864d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 07:54:54.6421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Qy6qnl10otTezTDWrNgE4rqK3nVWAIZf4/I2g0ySSN2W1zw7MayVrJsBWtFqC4IQCXcQ2rN4KT5FLO9tZ6Vmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7263

Remove unnecessary semicolons.

Fixes: 1948d5c51dba4 ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")
Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index fce804d42e7d..f449576488d9 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -439,7 +439,6 @@ static int eqbr_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	}
 	raw_spin_unlock_irqrestore(&pctl->lock, flags);
 	*config = pinconf_to_config_packed(param, val);
-;
 	return 0;
 }
 
-- 
2.34.1


