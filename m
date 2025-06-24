Return-Path: <linux-gpio+bounces-22038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56149AE5CB8
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 08:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7E44014AC
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 06:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FEA238D53;
	Tue, 24 Jun 2025 06:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ojvvVvd8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013018.outbound.protection.outlook.com [52.101.127.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3277221F3E;
	Tue, 24 Jun 2025 06:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750746156; cv=fail; b=UwzK7UEMr5DgV7MaKhStodfJnVlf18/CRtWskP3rYl0OatbVYXOwX/JpUFH9XaeRNgRRt+SX5+YqpSlZzd6WTzbdG4CEM64rrIOlgrSAOXfU6c2cr/ir/7P28h4pWjch+WiDTJQYmnf12eo9awpXcBC/LXiQXtr9YIi3cz8nMNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750746156; c=relaxed/simple;
	bh=fL3+zp8zATZaWs3Qnt+/DCANRzoJdUWPwNBEDh0U8As=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=k4l+1gedWzZVpv4ibwmNCj8kB4xdpB1j7BDOZlp6GLJa7rxbyixbCUwXhgF85EARZJssYxeKussFXAfIdqx7XTS2KerdCIA7HUkbb3h8qzya9k1ofaZ9ULsuvvASdt++VAGJ7E/W2oYhi4ZiE6cM/DnkaO7lUveB3/2HJvP/R7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ojvvVvd8; arc=fail smtp.client-ip=52.101.127.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpOjw4D5g/Bfuv0FRL3nXeGxMUDqJmuigdCls40hBh1/VKuko1LTKRmmIZA6+4I/2yxq3arRnIdVpBBLWnVi6ZlUDqfBufZcJCip+jlWp2EUtICXNKkmVDOnJaG/g6zVpITtPQRMK3ofMDxfasJW8e8po5CSTTu20QCNNi6BlkMqqX/e/LXwuoydN4zM4tb4KG3w4qrxlAdiiuzdh+IbzmrEh/rM87aGOo3ZA4cXM40yi6nNKqs1/cKBMID2l1WFU6ztQ1JIwQjiR4crauD2SQHRdGSk6OpvonKzQCE7Rp+qn1X9hXTylVe0ekkJrdXRxF3MKdOTTZR6n9kdCrG2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFhVfpz5tS49hNUOMbGQzRnMwLG38Ru5+ZOkAR/6oqg=;
 b=JEBjRlWbvTbqxRlCWvzqdtXalnwxMCwKzyosAc5dSNBEQa2tWnjcTpimINiDgpBksCm9JkzseF4iqXgfCs5vRBWWXhbRjbCeobF2vwzKCxPxJEk54N4YAuX0xMNb4eHJyvoZdbhtsgsex3adHIlZ/oku4Zd9Fu+1wFG5YxTdomfdm/sEg+06lrUmWqIA6l8VDOOp1SCg/eSnYGcOxrX6hmGCYKUOxExW83Wd8PrqZQvGIdSClxBpYCEdeMWY2n9GLmkpsJS2iner4nTShQ7KGpKzIJTZgyjj4dW6GzGllzw37mOBWeRvG7Tw48uFvEvTht/HVxILgbIjaQv6+dt9rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFhVfpz5tS49hNUOMbGQzRnMwLG38Ru5+ZOkAR/6oqg=;
 b=ojvvVvd8g9PHhA3uA8L2joMa+o2ld3K7F3Ua6b9rsjTCAjtS3Y4INUbbEJKOdkOXNHVyw/kaA8zBUmiF8XjyW+pUPmxOhbBBt5ulLCUg1VMB44l2hbqL5TWFUWmYW0BcYeB+qxHfi1UjrYgR/4Zckd4zzEDfGoVcGvDC2P4cctQfM+Z+yXSouDsGBN8X5hF1+GCvvAW4H70uj0GQIA/nrCrQn9sVbNZSmRCmSWQUX2zVhheEeruTobRbRrek9Hf6d5ViOnxbARspupm6an+sqQVm5F4hfor/jLkhJ3bMHjuUP191x4WTk3epynj0lytTHr7WMm/flGB+V1Fl3me6vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from JH0PR06MB7151.apcprd06.prod.outlook.com (2603:1096:990:8e::9)
 by KL1PR06MB6908.apcprd06.prod.outlook.com (2603:1096:820:127::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 06:22:31 +0000
Received: from JH0PR06MB7151.apcprd06.prod.outlook.com
 ([fe80::5dfa:f434:cd39:85dc]) by JH0PR06MB7151.apcprd06.prod.outlook.com
 ([fe80::5dfa:f434:cd39:85dc%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:22:30 +0000
From: Qi Han <hanqi@vivo.com>
To: linus.walleij@linaro.org,
	afaerber@suse.de,
	mani@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qi Han <hanqi@vivo.com>
Subject: [PATCH] pinctrl: actions: use devm_clk_get_enabled()
Date: Tue, 24 Jun 2025 14:22:20 +0800
Message-Id: <20250624062220.21997-1-hanqi@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To JH0PR06MB7151.apcprd06.prod.outlook.com
 (2603:1096:990:8e::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR06MB7151:EE_|KL1PR06MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8b7ef5-61d6-4842-3f88-08ddb2e77f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mKSbQnqhwivYCOiSbrQwa5YQzqmtLxXOCfbsfv5rVuxW1LkBsYL0FvRs0IdS?=
 =?us-ascii?Q?QHU9MEglTHvm48UmmxqwaFh+vBO1b2CZbYESuXODGLlFSUQqRmcsWOW81oLK?=
 =?us-ascii?Q?vvSYGeplffC08k/3akeI7CReL1gaHEU2DXBY5G1tST0ngrfZiCLh6tisi7jk?=
 =?us-ascii?Q?8SmVNkLcruNiSupQleb+vt5g+xE4DUorM9m4uMvSANlfoZNeFLNjKvInuiQY?=
 =?us-ascii?Q?nA7CKEhL9VvPDYlYf6f76g62xf52WnMCWtN3LmO/e6s9MpYJc2ZGDrsegLNL?=
 =?us-ascii?Q?jAo4j3n4ncepEe4+ULUCpRSriTDYcqd+yhKoe2vCuFWDyXDDZVpoEJSHx1xk?=
 =?us-ascii?Q?ZPckKm04I2X+GAA8vFid7/WvbK56NfHX3CegQW6Y5348UhuGgtbTLYAYLJOc?=
 =?us-ascii?Q?IIxDGXprDgKnPy4llwC299Qtu2mXSMsjYZcTE0QzY2PINx8gfZYo9yLKu5U+?=
 =?us-ascii?Q?UeiPvXtiWuQIEC/IU7NQNVb3/jEsZlzcLzHu88b8TEXqc/5PLxcqP97DwJDP?=
 =?us-ascii?Q?ZKRCaL+EgjPWPgfluHvV3tUyI1o4XCGHPe5kO1xM2K02HJV2gjbllmLL1PaK?=
 =?us-ascii?Q?xfz3e1ZEd0twcjqwy02QyIO+PaWVLtaKzBIQEkhOCGId97QdP9udnEuhHq1g?=
 =?us-ascii?Q?bHvstJBCQHkbi8YKZjWGC3ErWhec25CBMyZPhwR9W+e0EAA2KpmWeCnX5GAR?=
 =?us-ascii?Q?aqJEqERTf8gGE4QneJyH4lAIBalfSHsFY5htl4THG5JHsNI9pBB02uTaQOyw?=
 =?us-ascii?Q?xFkJ1RTlWIgKudfBVnRMcLZSY1TkAwAGhhvd2jVMkxtXsGvtyltLEWUS9f9T?=
 =?us-ascii?Q?diO+b9axcSZ1qWaqDlfbdli3gLCOxNOiqSd2nwPN1T7S56wRzkAO2zoxXUzR?=
 =?us-ascii?Q?3ZSt6EuwC0vBTNlQtB5pN8eAUL3om1gzdIo6wFKD4d3CjiHUAU360Nf5D7XP?=
 =?us-ascii?Q?6Sr3Ywcrihcna48TKsr7r1TGoc8wfKUY51ItAvmIe8wBZpNNgLb8lWyYrUrE?=
 =?us-ascii?Q?wy3BmDeygjUxrK/kCuiQYHhxtyeuc1xsk0D4Z6w7MHYBMFucDK70icVzcd6B?=
 =?us-ascii?Q?gNNJ4fmpfQr1c0S9YeMfYHXsLWyuPnaEa3nmGMj4NR6/GfBseQX55qeKzSO6?=
 =?us-ascii?Q?V/keTuP2BxbLq2zGawV1ZIBlYGVQwCSvSD23IVym3J3aru+JCNX+aC+WOzF/?=
 =?us-ascii?Q?U/dlT7OdkHHxzYRXhqFkcVcg9Q9hXypmchzYyAInvH2fQx+wyo9pxEgXt189?=
 =?us-ascii?Q?DdH6yKYGm9sWPrFyaaZ7EkVLsp3/BiABmBEI9aY80E5CRNRbMuAoMVw3sTUr?=
 =?us-ascii?Q?yaUhHT4Fy/w8vOtaTsBT9/Qx+b4l91XiFc3p/ghkdF9+JKsa6QK8PmnAac55?=
 =?us-ascii?Q?MyiajMcZVbfYzrK+Hau7LhaI3Qq4dta4eKRn0eG270RkKRnayRmFQ7XLI9ku?=
 =?us-ascii?Q?fh1GFJiv1qnKokFSWZrRs+zO1usGFu/MZEgVjGH2QA4+AViWATT0BA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB7151.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4f8pgn/KbOcQLPMzQNr6+0zXDQRttHRaw6EP+EwdLeKBaEsBsYsC0UcvrMrb?=
 =?us-ascii?Q?yJFTuo190Salud/Uf7j5zH9inQ38pozuLkCXsZ8kmdkesssHnDA1U5gz6JO4?=
 =?us-ascii?Q?hEnhbdtlatx1f5Yy5It9HX6Q+xnMkTrVpwuqGJdrgIHMNQkAyHSiCNbNGwjn?=
 =?us-ascii?Q?OTDejzXftua2Uv6IciariQVIRYy0m8oF7GB4pKjz+VuvmRwBVrd5x8XSwJUZ?=
 =?us-ascii?Q?VBINkkheJ0lNeqOWrsskn/0W0UqqeiQ1d7c3lwQBw0a/+qMOP5NVtasJPPYI?=
 =?us-ascii?Q?I77fx7xfQbX2kpGBx03kY5HrCmrEI5wDV1mM+K0x6EBYlF4aXSgtoqPfNqcR?=
 =?us-ascii?Q?cJaYdxP/AI8Ee9dVDXMUNw8CrmCxy4iaP/1jRqxIC7XNfmG1zNFvBsZwcmm+?=
 =?us-ascii?Q?Gya/uj9RHFS6jquWIZyULKs8NWvMlW9aV35HVuwewENzOQL8i333LORIRwhK?=
 =?us-ascii?Q?3DjPIR9oj45GVyKuJeDyAGbEUneeuUOpo4yxzhJK2bi9E3pt2SQ7dvCIc0I4?=
 =?us-ascii?Q?wtnHg6pFBNbIxa2K8jdurh5GCpR2CMpFzF/b5QLUcDZeXmBZvRWC4dasokcE?=
 =?us-ascii?Q?hu9C7gCqYoW3kAWC7eAxhFLA1HoCM42xKL/6NrGekt28Tg/dCuqEXFeo9O7Z?=
 =?us-ascii?Q?w8/M9xNQZb1F0pgofskVI8t+OtpQrD1spNPSj3crQfQR66NgoX4pfsvT7a1T?=
 =?us-ascii?Q?EMHGsGxi8k+YbfP37uNE/TiNFeYNQ34hvvZHZSs3sn4joG3Nn1JH3L2S1daP?=
 =?us-ascii?Q?L4ji/Axzfta4uMQBuB7rJbZwAOdiQGQOq9Q+1bqFIrApoMVaj29s15AubSN3?=
 =?us-ascii?Q?CtFRXpr6lE5J+Qv436J1WEMd73kReq45ctKrQeBlHC7fatVZ360D+SD8JoWq?=
 =?us-ascii?Q?gtc2eYsPLbu8rTmy2/MdTKRlUiewte2mlqSCNWVnLa3xvKN+ioStbJ8vhdYY?=
 =?us-ascii?Q?fk4D9/SKSL7pe6mqKHE7kCmTwCZ6xNp8+SbufYlOEvpOzC1nD9Uw2SJtJlga?=
 =?us-ascii?Q?UP6yGWoX+QvqJgfmfUGyi19dczxQAU2TVorutWH004gHzWBTbrolPSLc1KnZ?=
 =?us-ascii?Q?L2ITtJeELNd2Zbx6KIoxSkuDUV0LrO5cJVrOqOQHl/KXiKHu7hpPowKkhMHU?=
 =?us-ascii?Q?hTviY1CMdfxRIFzxhSLWPN65pdOkDeZERcvn3j8Dy6ltn8iXSHf87SaR3TEq?=
 =?us-ascii?Q?hlaAWRyKnS9RTyKBVWkOHoZjh/8OKpKh1K5NTi/RedAf00ujPFckvB3fwVJe?=
 =?us-ascii?Q?mS7hV1KwwpbQ8pvMirpOusWw+oL3Ek/0jc/8h7M/rr2u80kktwdIPscVHrP9?=
 =?us-ascii?Q?VVBmwGgukOdnM7qsJUTyIf4/xXRJi9VPuOt1hha/M4z94y8PVKxhWRlyJXmm?=
 =?us-ascii?Q?weuQ1A6j8Oe7WgA0M81cAqBH1VHO12ZdScU2Db7SLtsdd4zvqHxyGo7EMarA?=
 =?us-ascii?Q?vQ8s+oY7Dg0rHH3u53oXFRfF7WCGu3QiRhg1iAdiM1S8efdk0rPE0QhZ0Jz7?=
 =?us-ascii?Q?0r01qqxhMh6yc6DWfqXTasYKfdif0DEHpaWPecTz6jbo+E9v1CssVZuhGBqR?=
 =?us-ascii?Q?4PwNvXGvrFTkB74DikBlSn7qajX87NlFfSGVy6My?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8b7ef5-61d6-4842-3f88-08ddb2e77f8f
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB7151.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 06:22:30.7219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bh+sPPhUIQdofzxEUHt/Qe9wlCe10/q0X0dy5U8VS90GegN7eO3dcTDN7NKJ0IxybcoiyaT6SSKVn2STDOqbqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6908

Use devm_clk_get_enabled() to simplify the code.

Change-Id: I0902c50e50db565381c65e8d8a7f1481e82b271a
Signed-off-by: Qi Han <hanqi@vivo.com>
---
 drivers/pinctrl/actions/pinctrl-owl.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 86f3d5c69e36..a66739a27489 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -941,18 +941,13 @@ int owl_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pctrl->base);
 
 	/* enable GPIO/MFP clock */
-	pctrl->clk = devm_clk_get(&pdev->dev, NULL);
+	pctrl->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+
 	if (IS_ERR(pctrl->clk)) {
 		dev_err(&pdev->dev, "no clock defined\n");
 		return PTR_ERR(pctrl->clk);
 	}
 
-	ret = clk_prepare_enable(pctrl->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "clk enable failed\n");
-		return ret;
-	}
-
 	raw_spin_lock_init(&pctrl->lock);
 
 	owl_pinctrl_desc.name = dev_name(&pdev->dev);
@@ -1006,7 +1001,5 @@ int owl_pinctrl_probe(struct platform_device *pdev,
 	return 0;
 
 err_exit:
-	clk_disable_unprepare(pctrl->clk);
-
 	return ret;
 }
-- 
2.48.1


