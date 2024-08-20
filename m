Return-Path: <linux-gpio+bounces-8860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E23229586C1
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 14:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AEB71F211AC
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 12:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DD419004B;
	Tue, 20 Aug 2024 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="on0gT67k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2077.outbound.protection.outlook.com [40.107.117.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2610818FDD7;
	Tue, 20 Aug 2024 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724156258; cv=fail; b=nixCx1SEjxbcd6W4uMdbgRF9dDZsAeaeO5oDjhL6cVqay+oieJ4Ar7jRwkdUhNauk4M1eNxGZgoQJsIdSh8CDyc/jF1dv8jhY+nfHSK05Yh9lsAq9sgpXtU05vKxK8ZS4+fYW7cEhIsfr5WgK4mK7SQGqLXVYkfWZUURG11H/5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724156258; c=relaxed/simple;
	bh=sm5olNZevsVl6BzIz8ApFjJv2uI9qOZ3rXqb2n8N7w4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hhW/Go+tjYu16eN6YZK2hUGpoYUFpNHTKhytf/auZyA+r7OvfJKHfw9lDtf8A88hTzkqIZpQuXEUzO6m6DgMsERY7MkcExd5VI0OwOMtuEiFxozN9sObY3RPaHpot6nJ2eahv+qV044hY966TOUBiK38Tm68SBUFeMRPQG5E2gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=on0gT67k; arc=fail smtp.client-ip=40.107.117.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsAhsAKBWD0uu9npFSJuY6POnjXOAQOWeC9rZgPUUlBWhqyHw0rICgt3qWevaVRDT0+9L85hvZgTs/XoWWsalAD2GwHvttNA0u1l3nT40EWnMLKGloyI3mKa53+C4Gc7hU65omigW9MDkBpOP98MmE54+L0f++SPl62BScIEhI4M/qg8npW2JNoBhpdJPD8L2BJLPCyJklUOPl3zD5suUwin524QWaDLz6xaWEeOFzwCITBwaz6I5HD9TvjnnmHY49kLrSJc78edVB9wOwcnT1nq9/NjM6YkH/jLQB4DfjMsDc/PLEB7UL0mkpklNB35c0HCVcpO5jm+IorXGaC0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0rBOixmHhBRzgZtRhFnHD9FtysGBoIxatHpLsF4YD4=;
 b=oPY1OWJAhMmKCqYRIkW6SDlhulZA0Oe9ZNUY51tUF2jLuJRQJrrV1IVOavVSwoYv8O9YRgke6juyyq+lNMUTidXhquzJYJQuQ8bhi1vR/HB8LmwTYKGpJ33d5WH4+Q8reOrx4yz+UDbswQqlkjkUz/rrXhnQhyzywe4efcRefp/AVOhH2PxrQK6CyerAP3RP1psdockhoOWRHSeTTI74LF517ZLOUlueaahnBjR6yFbnyDp9dPlT34ylWpyvKCgBWlsYaXV43q1+g26jM58yQp7f/K0FW2hf7Jbb2OnLvxzyOfVRMJEnvj/RRTUv2KBwmx84zKSVfQnHd2i3ApJSLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0rBOixmHhBRzgZtRhFnHD9FtysGBoIxatHpLsF4YD4=;
 b=on0gT67kGoUgYvtAYyevzyH4VaS9d+xO1y5/Mw/q8cYH6OdSZywi0RR68lClu93VclqrPndCLwUMWE7jnqRlKMUnxrqTD7sDYO4huCv0MigPo1Vd3SiiVrwU4enKwoupxJuy+x5yEH1lj14XTeMkgKnpRtpNJ3mgNhJW0SsEmxIawhHr9xcDKxVGqS0wchfxVeD6vF7x7XFpwMHaLAmn9DcAMVcOiemYMH6WJ57BPlBhMzSbNiZn//OU9sr6IBHJtGHF6YpBG7OxO0yrJ2l6TD6eFPUDcJ5clJT7XELmEkx9jwEoXvgWWUI2lFY4njflZOQv9tncQETF+UGRFQYzqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6285.apcprd06.prod.outlook.com (2603:1096:101:130::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Tue, 20 Aug 2024 12:17:34 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 12:17:34 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v1 2/2] gpio: zynq: Simplify using devm_clk_get_enabled()
Date: Tue, 20 Aug 2024 20:16:51 +0800
Message-Id: <20240820121651.29706-3-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240820121651.29706-1-rongqianfeng@vivo.com>
References: <20240820121651.29706-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: d4d06f54-b4ab-46fb-46b9-08dcc1121255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JU71w8VHQXHznrz2XdYpyPoHzMeGhNo26jf5GtWXmv5OcqoQbGX5Ldt/mrcc?=
 =?us-ascii?Q?OxM3si4utr3ieTTea8HIUXpmY9Ha5/223HPRp82CkSNkogcJmwIGL3Amlidk?=
 =?us-ascii?Q?FSEBsnGWfNmIH5qVh+cxsxaN36/rIsm8TZuaYbw30bofAO74Dt58W6BxVTib?=
 =?us-ascii?Q?veIe71W8iPgCeTqSYD/U5j3m9R8yad9snHJDVQk486fDSt/LGE3PttYYAQeY?=
 =?us-ascii?Q?J6i5KOYBkNWFO/q+yAgK9wrQrE8v3FPSXGVKDvTarnbJIpXs2Ijfd/ei//ye?=
 =?us-ascii?Q?NqPduxCS/XMw6mf1PvpCbRORg8e0yQcvtqVlEFVLf8o6lIuCh84/HRHrIliw?=
 =?us-ascii?Q?VS8wsPyIx21ig2a14ewCwUJ4RgBH39+BnarbQB9OM3yvPSeoeTF7y6UX/vkk?=
 =?us-ascii?Q?VoPTHxZXKkjYfltLn6kC6wIzzj1iv0gT3jbphnFSjbLDMjLwi8/cQ/Vq/wnA?=
 =?us-ascii?Q?tmOiacycxL3X9A0RmKSW0nCCJo4XnJxcuwQDk784O/bnzPhYLFGM8f2RJlCc?=
 =?us-ascii?Q?Ewu8RaQQXfpP3d5GEo88eUj9pjftKELExiwt/2k92xPyCuFPDJy6v/sTd6kt?=
 =?us-ascii?Q?cpfYo16xORzc7ElcD/NXAkkTn+oLrxoU5apbBhAufYuUXH7L+E0FKmASe/py?=
 =?us-ascii?Q?lgk+5y2OjbiikEGql7IhdBKjW9EqD3Rnrtx7OY5VIevt2IV6lw5WEqHLiY/b?=
 =?us-ascii?Q?QLSde5VCZcXWIhPRZ6+r3qn7cQBY+CfgwE8veBoGQxJxpTx8ye2QXPzPWZrR?=
 =?us-ascii?Q?HDDMQ6SCo/4eqmFm5vh0BD/woKz/9+CAyXLBnXityzPEmgraV6P2bLlBKHSR?=
 =?us-ascii?Q?cQWTqQoARBsY6BVMv+OgxhrFpg+htqayGiw3IG+5Hj8VMoMOxR0ZMnGK2U5L?=
 =?us-ascii?Q?TqkYijKnRndVAtiiN1JtXrvR6WTlWQR0a6sxfRdfhFbwJHXftDqn9ouz8GYk?=
 =?us-ascii?Q?ur38SsOICrpoGpTcuv+YnanVofsTjjb5lpjq/a3H1PDR3ehsx+HYWJgYaFw0?=
 =?us-ascii?Q?r80DsjiRpPaimPtoNqR7iMleuEmpsDv/Drw59wR8C1YjS1EiXTB7aMprknHW?=
 =?us-ascii?Q?wEUx/62OKtCnmb8mTVtans2QD0jvwEqIHi+6zPJixyxz3EtuR/KI+PWcpRGE?=
 =?us-ascii?Q?/D3c+23ndeVUs/bIaAw5/8KIFHhOeZyZHOp+ONqoouIpgaRreKv33k9nXxtt?=
 =?us-ascii?Q?GjN/U/NDKhtRxHvKOFZbO6Dkj0Jk4P1J2H9DAl39rXc2jlW+YMRPuxMtR2EL?=
 =?us-ascii?Q?2VcdsBn5U3VNO6sd+HfVyyoQuviAHVwzBtqP3PjQ8GPfQhxAM+kRWx/IRkva?=
 =?us-ascii?Q?j4O6uKXJYQAB91ElhQ+5bnuFzCazYWIjiDFcm8Blld7+c2aDjv/AWVVYZRJi?=
 =?us-ascii?Q?dmh77kHM1P58UeIN3Pj+o89K2D77kXa/cJ2IkkbpftRvBtoN2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GkdLRLaMdI93ZrA3O48C+lvd6zTxV/voEXTf69U4y0MuB3hkh/k3D7g3eVEi?=
 =?us-ascii?Q?zvjpN794N95Omxgf+1VZYVZKfNzZ8VyS5/ga1C9isIK4ZWqzZQFdMQSidsdL?=
 =?us-ascii?Q?gmAI8MAx4YPwWA/V2FqlIRy2xSaDhJaNfWCxiG/mbErr+o+MeGK43InHKuak?=
 =?us-ascii?Q?xm7k4c3K9e783zP7qeV6BbpNJDB8tOJaRmFdqM3LiFDLtyxP/0kACoOWc4eo?=
 =?us-ascii?Q?WA4xFuQ/M8ECIFD7MPB8rcRJPya6GIy6fg4Ac1rVZRf1TFF+e3gyYnR3Cn2s?=
 =?us-ascii?Q?s3vHUlpRIIJ94HxcxIw/7uqK0YC9+jNDiEoTvWmr4gd67F7s5yjpSagL8s7M?=
 =?us-ascii?Q?heCO0uiu8Y8UulTxBuLq8maZAqBnF0ectQGMvtTud0K+/45GbbpLPQHfdBNm?=
 =?us-ascii?Q?SBl874lYirJFj1pXJ6mKFk1ArwEwR4Fr2Ku116cLHD0n0FgXa0ZTNGVfY9AL?=
 =?us-ascii?Q?ikICyNGjki7hu0g2E0JXUW7DRaHe3IyQie9t+yY3OD3WIEv/SBLzWnzIaDky?=
 =?us-ascii?Q?0QchA0JZFolUMRVSWGk7Jurnxv5uoq2dep1J74JaETPVw57ZZiPsPD7IoJGs?=
 =?us-ascii?Q?o6mOejJPweAkGiSqiqMXrqMFLG89tuS21dynhDcHApOJbrYqejm1f8OPr46a?=
 =?us-ascii?Q?9kGFBtRfs4tQ0SbW/6BFwKjKfjeH6j8O9okIExddDcMPNPWx8J0luH/gm9H/?=
 =?us-ascii?Q?civnweZ8zkAj0D9dJaycaELEKE6YQE/1q+39bhtIWE458LuZFeNAjXjXa3xg?=
 =?us-ascii?Q?FnZV8SwAfz5cZ10HSCwjfTCvXE3MVgTo59RCH5YuI6c/hv68PRuOLUCt2UvW?=
 =?us-ascii?Q?//CNDmb91BR2cHG2Lan/WZdPTZT2tPaN2m/Mw80VQrpiz/zb+dnlY3M3YxdK?=
 =?us-ascii?Q?CwP9GRA5bYncgO2FaNu4CAG+m93YLWMOw8P0z+k/X0EIO1XMXdPGwTlBrbB7?=
 =?us-ascii?Q?VzElDr8yKqey5wdwBnRttOWl6SxYGolOOAA2i2gdtZfRoW/i2pYIbaunmoZM?=
 =?us-ascii?Q?aoHo4QxJMTmxVZ9/+50j17eZnXlYxJVfH7PuzDNN+U8/t2omy7txIlGWmwM1?=
 =?us-ascii?Q?pJVfLXNcdVHp+Ocy96Rup/IzM2YKJKomowFLOi/3s9hxNoJKz8RJp7Pmf0y1?=
 =?us-ascii?Q?RL1bD8kf/muzsgXBl6rgi7/7npJaJOBzO9Vyjtsqqo+1Xus0hD4koGpgfWR6?=
 =?us-ascii?Q?brtZFGSE5pOP/EbnxiinTXHTeITPh2Vuzgpe7SiWKSIQLfKo9gccyAGdNkFI?=
 =?us-ascii?Q?Fp0vpxkpmAFjvVHP4aKeiZ5t0wVoOqm8bWTehRN99gySOvz0hmgSW0U0NRce?=
 =?us-ascii?Q?JSlA83dudUWxqyKS3UW8AO/jtskDfUiUFp5Z6IiAHXQNPs7a6HJgs3U/LB/Z?=
 =?us-ascii?Q?iPSLJnAj+7Pu3ECCfN0y9BYYB3g58fERzw8H/3x4CxVmRDeh41oJ92yf8WZg?=
 =?us-ascii?Q?/3KpOb1eP5Tj8+5Q0XpNAO/l/X29xmlZsKL1ZoHUSjB9t0cff2rlKHya89BC?=
 =?us-ascii?Q?fa+vccq4TzZKnsBsaVdaHH2y02HLf5Nz7+YbZdpAJqDSZLMEnLnaAGH5ti0Y?=
 =?us-ascii?Q?USlP0zMT9ItUOpcAS8iW0HJUpR4G/tdSWlUKjX2O?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d06f54-b4ab-46fb-46b9-08dcc1121255
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 12:17:34.2469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bg3GwGnrVVPJqqcBA2jyfxntuoq1S8B7b9P990ZdJD2QKwKpZ6jsiPA/VNUtUfWWzU28t3iS5aq6GnI8QzG+6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6285

Use devm_clk_get_enabled() simplify zynq_gpio_probe() and zynq_gpio_remove(=
).=0D

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/gpio/gpio-zynq.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 466e23031afc..1a42336dfc1d 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -940,16 +940,10 @@ static int zynq_gpio_probe(struct platform_device *pd=
ev)
 	chip->ngpio =3D gpio->p_data->ngpio;
=20
 	/* Retrieve GPIO clock */
-	gpio->clk =3D devm_clk_get(&pdev->dev, NULL);
+	gpio->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(gpio->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(gpio->clk), "input clock not fo=
und.\n");
=20
-	ret =3D clk_prepare_enable(gpio->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable clock.\n");
-		return ret;
-	}
-
 	spin_lock_init(&gpio->dirlock);
=20
 	pm_runtime_set_active(&pdev->dev);
@@ -999,7 +993,6 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 err_pm_dis:
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(gpio->clk);
=20
 	return ret;
 }
@@ -1019,7 +1012,6 @@ static void zynq_gpio_remove(struct platform_device *=
pdev)
 	if (ret < 0)
 		dev_warn(&pdev->dev, "pm_runtime_get_sync() Failed\n");
 	gpiochip_remove(&gpio->chip);
-	clk_disable_unprepare(gpio->clk);
 	device_set_wakeup_capable(&pdev->dev, 0);
 	pm_runtime_disable(&pdev->dev);
 }
--=20
2.39.0


