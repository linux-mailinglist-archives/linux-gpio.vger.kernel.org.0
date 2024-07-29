Return-Path: <linux-gpio+bounces-8413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 197D393EE86
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89E031F22554
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF7712A177;
	Mon, 29 Jul 2024 07:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b="br2R8vrl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b="WuEzAHYB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B548405D;
	Mon, 29 Jul 2024 07:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722238559; cv=none; b=IiF6gJiAwpLhrThyA3g8/yGU3LqXAAaVDe2YIo2FOmG51f7vzrho3NV1+22dRjY1Mq39O2yJiUxsOgU+2dX1YLElkWNPQS1Kxj1iqgwaF3hdCXXOtT6CxeuoHyIv0ljUP3O6VThMuikl1VfI7gVj6GZDTTejfw2RaE/pBkGMea0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722238559; c=relaxed/simple;
	bh=X3vJFTkCj/MOhAn+iAME9PPFyh17SlfElUXdCNu2yOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJRoeMHT5RbZe4ct/+bEm6kk5ctQyLfiztElNNLbhA2z+jhiJlm3D7TacDFJvQPckhWwByttJoioG1Pk9+aKGl67wEWkV5zVtuhwe68vg0ZVK84D9AHosY3/v+o6GZeItip7bn7zuCHPopuNyxfXPTGBZvTMBZlhuT6w8lA+xWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adomerle.xyz; spf=pass smtp.mailfrom=adomerle.xyz; dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b=br2R8vrl; dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b=WuEzAHYB; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adomerle.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.xyz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=adomerle.xyz; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=BGScZYwNYRzn1E4n5sia8NhWakfQ03pdvYwsdDQdjJg=;
	t=1722238557;x=1722328557; 
	b=br2R8vrld6rpN+FGQwQXpL6EqCwZ/56ulVd3RLnPCLZSex+5H7bwxs0bb5hgeA2MJ+Y0IdvTEwr8iDszAdSonErAVbpAS1vW411Puj8CCLNxw3rK534uBt28IaTWYswagEkiu/BYAhLlIhXly4psHifGPt8w9Nhw+Y0kl4W0rzc=;
Received: from [10.12.4.16] (port=43308 helo=smtp47.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <me@adomerle.xyz>)
	id 1sYKvA-00DvMi-5G; Mon, 29 Jul 2024 10:35:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adomerle.xyz; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References
	:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=BGScZYwNYRzn1E4n5sia8NhWakfQ03pdvYwsdDQdjJg=; t=1722238552; x=1722328552; 
	b=WuEzAHYB8BMZoMSbiPDvb4t9C2jWBqaC514Yd5uaEnXJGC4Zh4l0sMGUzf8gza52U0p0siJUONX
	V4R6zkIwW+vpQvkiVS3ucwixGT4AiKruYTWKF2edpJKYQx+yuvUOBYiDKaBbVp0lV1XGq4z8WWNmy
	m/vJlX5Mxpm0zp9B+fk=;
Received: by exim-smtp-868bf69f6c-zg7fr with esmtpa (envelope-from <me@adomerle.xyz>)
	id 1sYKur-00000000275-3PYN; Mon, 29 Jul 2024 10:35:34 +0300
From: Arseniy Velikanov <me@adomerle.xyz>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@vivo.com,
	jiasheng@iscas.ac.cn,
	mars.cheng@mediatek.com,
	owen.chen@mediatek.com,
	macpaul.lin@mediatek.com,
	zh.chen@mediatek.com,
	argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Arseniy Velikanov <me@adomerle.xyz>
Subject: [PATCH 2/5] clk: mediatek: mt6765: Add missing PMIC clock
Date: Mon, 29 Jul 2024 11:34:25 +0400
Message-ID: <20240729073428.28983-3-me@adomerle.xyz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729073428.28983-1-me@adomerle.xyz>
References: <20240729073428.28983-1-me@adomerle.xyz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C61A13D99F4944E7212A013F29C7F5C920182A05F5380850404D53ABDB57B21B8F3DE06ABAFEAF6705BAD916B310CA54E9303324A9B5BFDD325DA98F1BEDE0FAFA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7956F10FFCC7409BAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373103A56A89D9083FEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F364D9CEBC3CFD6B8DC8B0FA825F8A70847059FB8DEF563170EA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE71DD432BB81541BCF9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3BD39A56654533F91117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF8C9B7DB6C49B7CEFBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B69D9A99123495817A76E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB23BE56FCC6FEFED43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5975FF99ACDBD4C1C5002B1117B3ED6961C112C838BE192DA69995D676B7B4CBE823CB91A9FED034534781492E4B8EEAD69BF13FED57427F1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF339F6C03A655D4025E4C9CB6EC7E2D2E0436D35C90D4EF0AFEBB18B2B510D9E0ECCBE4C437D6579C67C7AAC6E25A208678E18BF391248B5AFEDD108130C0427CFAB615D4A583E39522BA058254B804A102C26D483E81D6BE44BE0F8B58F75087CBB04030989F1EE011FE023E09B2D9C0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6ULtCaxUqIPEQ==
X-Mailru-Sender: 5DE64BD8B4008F63F32F89B2E510BB542337E882BFF2C65DB951B70A5BD4BD8E8E87E983BFFB9F4DB9A8FEFFB5F7F2D53B9265ADAFE7D7E06F53C80213D1719CA6FC796F43705345A9EF9D9C6A90DD94D3D6663D5D4272A7B4A721A3011E896F
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B431B8944160407DD0558ADADE14CD5136C862D2A3006641E368F3CF0E9FE49B69BA651B92B2A570CD9187EB2F77E968FB8F265BACD459A333ED86E6C7479721EA
X-7FA49CB5: 0D63561A33F958A587EC2158EBC1702CA1C8A1B6B60FCE89C09569DA583CB3248941B15DA834481FA18204E546F3947CBA7556051D6825FBF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637889750A55773577B389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3DD19ECFA348986C535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6WItejNFuIZdQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add PWRAP gate

Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
---
 drivers/clk/mediatek/clk-mt6765.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index d53731e7933f..4f03a0df4ff0 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -559,6 +559,7 @@ static const struct mtk_gate ifr_clks[] = {
 	/* INFRA_TOPAXI */
 	/* INFRA PERI */
 	/* INFRA mode 0 */
+	GATE_IFR2(CLK_IFR_PMIC_AP, "ifr_pmic_ap", "axi_ck", 1),
 	GATE_IFR2(CLK_IFR_ICUSB, "ifr_icusb", "axi_ck", 8),
 	GATE_IFR2(CLK_IFR_GCE, "ifr_gce", "axi_ck", 9),
 	GATE_IFR2(CLK_IFR_THERM, "ifr_therm", "axi_ck", 10),
-- 
2.45.2


