Return-Path: <linux-gpio+bounces-24570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9F3B2C745
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 16:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA3925E61A8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E92427E1DC;
	Tue, 19 Aug 2025 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="UGvRp8Hq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013010.outbound.protection.outlook.com [52.101.127.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E4727CCF3;
	Tue, 19 Aug 2025 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755614402; cv=fail; b=KLqS7zsZndtJ9zfDhUPeGZf6yEGzgAS3+pY6WejZl6jcftpsf9mMhYX3Vi8SWfjTB++g1MRGh3O7dub7IDWzRQs2KBCgqSaOdXGM+nfkFaR09EVDGClXLuUvLFuh37/HjYSbrpQY7JsEfXF0jq6EY6ABCP4prc3s2UhDe2v3z+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755614402; c=relaxed/simple;
	bh=fooL+MqjdghT8Y0lU6EUehezRs7mJWQ8o+9RkYJO0l4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V3DcdeHiwxMeUNjOkroSu6jd3FILterKN3sog/2//6KCca1HluIrDCAm/nAKO2KD6p0LmDLgaVs+5ov3vvnAQxIUoAGw+6uxc0MssfaWS6tJlIwlvGlHk7vasWahULYzDBX/294SwAkGCt3XykH39acPA2AIRFShzYT37jA06Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=UGvRp8Hq; arc=fail smtp.client-ip=52.101.127.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVU/q7wtLK+yr8Jk8O65ybQoezqDuvq1AArrzG58/pPyCYpy+vGdn3eHIhl7Sr/b1faa5dO4hpKvtu9qfqfxDBTj3kOmrgpMy05sBKjdt2NWDA1qO48jEpUN1Ag96RH4kcM1/Y49y2JroWSOWMOIbaT5OnXcAbYFpy5jfM86wzXvRjUETmprxJSczaDSwz3RxuwAr3zd+Dyu6s6sEXPpnfJmB5CxTCv2QqEEHD+081o6AiOoFEbDqvxbwn3ZHPZrL4msIosG1in/lx1DNcK/H69HndrWzycip++GsqCO4QDQXOB0f5jrnWSngi98Wb9jlY+B6GjEJfIxDa45PZa0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvlvEbvTJ5P5m7Y8ZVsEm09crm+IPMCjXXedbs+6FKo=;
 b=rEjUDPRabkXTpwYQzKaYiljXYGVdRXIkaPm2jMGdj6hkMbENrzmwnjpqT/V9iQzSxgeIQqIoPAPbaKnV5WRPi6eteqbt/LgaG2n8CYJu0LVBaOgjJ6uRNRQbgO/dVRDVBGHAV5njgKLWJ/G905n76YvZLC07nIYrIhVOfYP1xyhQ3yjW+ZBoS4Mp+JTkwDjh1snHeflufGLYwxdw22McCFi+VRrJ4O/8uzCMBlK42f8iHzhXB77Db+/OyNsZeEfXrDIWkh0OCKCQfXegSmMX2cdvOgaiBcyFcbD+ofNOglmBUjSmfLVEkj17kg1t30LuMes/RaKexONCcZ+BmMvwkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvlvEbvTJ5P5m7Y8ZVsEm09crm+IPMCjXXedbs+6FKo=;
 b=UGvRp8Hqixge0B+n3MvJ6XMuf1XDGi2LBMMRi4bSDc7U+kJq6IbQx7JOV+jk3hFk4wlne1qc2wY1iA4h02ZJZXHSlqCSCE+1hN5LlOY04W+aM8OL4gdvP15JEA4zsoyc/R0pzGUO7i2UNMfcwMpy9QpWq1TezGnFJqPzyxlNEx8GevfJ8mqIwlhH4xAyaJQbpPhLyDjZ2l/fC0qKapmYXY468SnskRpQ3J04NpYxuc2Hgn9v0JWewRgXjne3H+BHiamVfdBe3o42FudWC6MboIHOQJncOFZ9Xg3OIGFJfcrne26wi7wZtT2DG9Fd8DhGcJdkG2bAxHSfZ9SSQr/DHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB6679.apcprd06.prod.outlook.com (2603:1096:990:3d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.13; Tue, 19 Aug 2025 14:39:56 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 14:39:56 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 4/4] pinctrl: sunxi: use kcalloc() instead of kzalloc()
Date: Tue, 19 Aug 2025 22:39:35 +0800
Message-Id: <20250819143935.372084-5-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819143935.372084-1-rongqianfeng@vivo.com>
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a813cdd-e88b-4c26-ed70-08dddf2e4426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KJk9kkX78fH7cP1bGta8ZyghiS/CLPCzTtNZybezNZO3nEpyZIMrXeSgT1tX?=
 =?us-ascii?Q?SPRSJ55JxGBjOuHPio3WEHsKt/IYhoMCN4QLeLLzNNODVuGJ2JE0rk8M5zOb?=
 =?us-ascii?Q?7NFyN+tXB7li7v7LMc8wlaOySps6A/qxMrDRSNrTQ3bEbIpWA4V3AOMxDkdy?=
 =?us-ascii?Q?JL/ZoNlHxZBvzh5NhXOEwLX4jRmpmK8U5gC1b7Q1ywcE6t0NiLOdCQRNb+Ps?=
 =?us-ascii?Q?RgJ80kQWaRex/gv9opWabg5NtDFuZ02KbYps88He7mcWYTsOZWn0+ZDgpTJC?=
 =?us-ascii?Q?E7Lz4vR9BI+jXory+u6iLQuorMGjGRk4vY6bFdQ/TxCnryDVh6WqACVPORlp?=
 =?us-ascii?Q?i9lBerKwq0MQ+af1QuNpqnW8uSuL+AvdSwsxEeWUzHguxAIW+2XMiOI7T+db?=
 =?us-ascii?Q?FJEe0SQc3T4t6JW72RApxdj0nAizmlBiJpRz8E8XWKbzAYJ5s5grLNO6lw84?=
 =?us-ascii?Q?phZtFYEHRWtdLaej04LviARwsYtbzMExqHuzlR4Jqt+quOfGNOY3NAefBoTn?=
 =?us-ascii?Q?zHf7aGykzN6DoV/EPnTqid5dgJCPeaymIqFAc7vMSnYH6DYLJ5LE8j+vg9Fi?=
 =?us-ascii?Q?IYCxrWl5Klsk/FbEj0lnX51ZSMtS/+99KzC8ZDGP+E/13GrFzKcAONYdYS1X?=
 =?us-ascii?Q?mzhlWmEh2+d8hcO/BSv7HO03zcNOM04KEW3Q11OJjGLjw7rc7jPGBUJSZHZr?=
 =?us-ascii?Q?eSIqDYFuLgY5VxCNqhkG8rSgVD5rIHKjTXqHYlB9DaVfCo9QYAW7kCua7wvz?=
 =?us-ascii?Q?o7rNweOmNIbZ/UNkY5N3ttBjjN4T6oe41H/7niGr0EAh+afBv9hfnx/YhKHW?=
 =?us-ascii?Q?6M4SL+C9bBKWw0Xju9vtSAxggR5GwiBPPxyUf4XT2EVET2OlAmsaMSoR7y89?=
 =?us-ascii?Q?ZcWGoMD1knPPLAQ/PGyAxdSMslRDGgPJPYQzGEssLwbjBtAyHYTZJoRhKujg?=
 =?us-ascii?Q?HuHtTjUQr9N4vyq1rPDKTydbJoSJ1ZsadKvbwpmz+wqS1AXU1GkWVA5q45tV?=
 =?us-ascii?Q?eAsD52RQeClf4HMuUn9jvBq6Q6qLqVo5VfdpgXa4wkmkm2pQfySVpf9sbEkl?=
 =?us-ascii?Q?kJCV4EzmwYDy6h9PfGPN4sfcATJT29odoP/FWMYpEEL30ABe5QTc0jpUFios?=
 =?us-ascii?Q?l7otkSTwj8pOCjDri0gW8BEoqvBwJEEImrDez8ZS9fDTUjFXonxGIOtSuphS?=
 =?us-ascii?Q?6ykp2/+WW0wfx87iQ2x4M6JS3AT02nn+ASbQdZ04T1ddBFXhRAAWO/Gq8jKW?=
 =?us-ascii?Q?sNQ6LtZiRKiBOrS1HI1Pfl38ezthyDrHplEWnY9B0VJb3szJ6XK4WbNs6kPI?=
 =?us-ascii?Q?uYOEa/WvihUShjPeh/Ppj4l3Mtwr7tlycOZiqHev/QGXU4Lh3uIqt4dBspVD?=
 =?us-ascii?Q?kckeJgHyOHfu0rhkI1u7Te97KK3LJNhsW8zfOvlNDWJ/bwGoHDlwGrxUpoQf?=
 =?us-ascii?Q?/zwWy8KEKSrzZRlA4hmRXJ42zuVurzVaPhq9+LFnMxsM1aZ/v2w+Bsu7M1Bf?=
 =?us-ascii?Q?7jnv3/BJLkg03VE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H6LqHGNxHCgoapM2suB5FjCcyLXq7ENDoYoVMYOOPw4HTaoGcfvi38IxZGpz?=
 =?us-ascii?Q?9Go61sbz49GjN1A3MXPe63jknOwPlOoVZ3m1KxG217GIgKC72m4nExYVqal9?=
 =?us-ascii?Q?dZc23zai43iKpW2LyuqX3hksYipKiO93blFGQK2M/tTU7++HiyNuIwXN5Nog?=
 =?us-ascii?Q?Ny4YwUyxz+TKX8dDaUavCCgP+Gu6GZjU+JejRRLbKL3xJxCji5rhknOMtMuq?=
 =?us-ascii?Q?NO0aT3L3mT/uZCC3BBqNFoLL4AfGEHgfiXiKiS+1kQcNWJjxR4cw2gWTozc0?=
 =?us-ascii?Q?QvQIAQM3nD1ZI+6BqRVHcnJFyg7dmaq5cB/XPZesceF1qAsRRULSTkB6TL7X?=
 =?us-ascii?Q?n76f3yVax1bBwyzakim06TOCM/4FtAwjbUHKwbjETCKi3QLo2OA5EawxE2Zu?=
 =?us-ascii?Q?1vUnUH9ZtItounlkBCkHcWmmGpespmQGdBroUi2Zvi7ugSyn6XWYmyiFWz8Y?=
 =?us-ascii?Q?gXt/WRGATJcnJZLhs15Z1EdPNadcKwpmlT4TU2BJgdgYcEebI9tHltRC4sJa?=
 =?us-ascii?Q?ryZ8lfoMmtSiesfGbZQRnunBDKI2eHkLZMyoWQrHfize9hn9aPMUB6qIkev9?=
 =?us-ascii?Q?ZqJsZmNplYn7DeaMMQaB+TvKKBU2eKbtW6/llRTtpbyU52gBBrNf6L5ZKBOi?=
 =?us-ascii?Q?p5SMBY/1IjNTOi1N1oMWxXJsE+kbbtH6bJiL76DMGoMRqN3bW2BkamWz+vVy?=
 =?us-ascii?Q?m8MSBUKB26gY8S3OxfGegwCGdJKkRM2QLVdA7xZCTGU/CCTcsF3ActUBoqTl?=
 =?us-ascii?Q?YZ6p/csZuAjNzriPwf2jJX/D7c52nIMgdwATUb8BGSqqUi4btjMgKKE0/jcm?=
 =?us-ascii?Q?urteHzx/pyB/F9nosRuci0C+lGktCou22w5O5jiaypV5iJ0N0swyh9+6YFbn?=
 =?us-ascii?Q?qI3SXdJXxubnWKrc8yowwpAP913YsYpWEjgGPT0jn62oYofHQDBuuG2BuGzw?=
 =?us-ascii?Q?SJkncO7SbEBmaS18WZU9aTskdBRCDclRTLyVXn0ykaGxldFw9w2xwNudi5+/?=
 =?us-ascii?Q?h+wO0pv1a5KK+nIkR+rHbRV0+7kmTs7fIW0h6ailWdX1sfAETFgC4RAS8Dam?=
 =?us-ascii?Q?JV45TBuj4PW2UYjn26ZcQV0zHX+042GxdgzvQiUz2g20AVWATb63YXqYxh9k?=
 =?us-ascii?Q?tDuotQmchO5MBntfevsCUznWI9Y9OplGC5g8mS4iEDZMLGTfMbUZLG05+rmT?=
 =?us-ascii?Q?h3Nh97eeg6dko/t2ynRIHgqH//3I9g/w/6nUDIdyADtgnp1wDjIFUt/pdsaS?=
 =?us-ascii?Q?hq+oqwgFzueIN4OJwDOq/+gW8RYUjNroFPPKZcuBFUWDkRyyTBYuxD3cMdNQ?=
 =?us-ascii?Q?OvMLUxpM5xDB+R8/q8xa9054AjvO/naMXjuXPbbTW9QnVGSPgkioGgYNatxO?=
 =?us-ascii?Q?67AQZLfk6xkT1e8WHptqT1rhIbZC7g/tvh8Pb/9QtaEIufGI0/Kqy48Llexi?=
 =?us-ascii?Q?svSFaPkcRsbEYtffWr2gmHuSv9en2A+Wf3eTLZf8wavmt5S00jCwHTu1c8o3?=
 =?us-ascii?Q?QV1/9kWsThBRLFjVk2AhszXGsO17gdBy2IuKxMcb6hvo7v864cmt1QOj43FO?=
 =?us-ascii?Q?0oS/nNjzb+f96cHQ4VTB0GXm9wrGboM8YG11pd9N?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a813cdd-e88b-4c26-ed70-08dddf2e4426
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:39:56.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV9Z3vo3iz3QUNFVXQ5HFRelWMGs6ZmQapX5ZuArafHiCBpPla2tKQ0XGrsBZfUdmMEalE8x9vEu0UJz5KXb8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6679

Use devm_kcalloc() in init_pins_table() and prepare_function_table() to
gain built-in overflow protection, making memory allocation safer when
calculating allocation size compared to explicit multiplication.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 4e34b0cd3b73..5f13315ebff3 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -103,7 +103,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	pins = devm_kzalloc(dev, desc->npins * sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return ERR_PTR(-ENOMEM);
 
@@ -199,7 +199,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * Allocate the memory needed for the functions in one table.
 	 * We later use pointers into this table to mark each pin.
 	 */
-	func = devm_kzalloc(dev, num_funcs * sizeof(*func), GFP_KERNEL);
+	func = devm_kcalloc(dev, num_funcs, sizeof(*func), GFP_KERNEL);
 	if (!func)
 		return -ENOMEM;
 
-- 
2.34.1


