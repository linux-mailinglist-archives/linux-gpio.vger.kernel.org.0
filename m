Return-Path: <linux-gpio+bounces-8414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36993EE8A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB32A1F22137
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3E612C491;
	Mon, 29 Jul 2024 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b="mc4grrHL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b="iEFgI5vc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fallback23.i.mail.ru (fallback23.i.mail.ru [79.137.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117EA8405D;
	Mon, 29 Jul 2024 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722238583; cv=none; b=HQm/8JYxCyCQJT+r5pqhOelwGVEIz8fTsP2tt7hCHNhFIrgQiUyapGKNjVTBPztSm/EGgxyQborsZmz1f8ED6pL7wRur1iRRndfmb2NZp2SDXhbQoHPKDbyxZWLvSt7DBU9jzg4W4COSoH4BHGS/AiUJC/0gEL21fdTvptH5kx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722238583; c=relaxed/simple;
	bh=eht6YgghUXEwo4O2dparAWQ7AigHwdZ8UI+dQ2aQrSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ewzagb0RPjSoP3Qd/GRTcRi+jRd6loafOyBk3oBVsGusKBngBPXTiznTnUnTxHCr8wQSFlLy+zgB9pxP+aFmNmA8mWKlUF9YX0T0MmoLy1BW9na4kuntgoNOuLD3WOCpyQ+mVqoXkcONQ3aBXD5vAtIYa7dN4b2FOkNdFrU18Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adomerle.xyz; spf=pass smtp.mailfrom=adomerle.xyz; dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b=mc4grrHL; dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b=iEFgI5vc; arc=none smtp.client-ip=79.137.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adomerle.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.xyz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=adomerle.xyz; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=ncHefQXhdwDQ4/RjlVuwMUNr+QfPDTUajV9Yds65PcU=;
	t=1722238581;x=1722328581; 
	b=mc4grrHLBP5sux/8VnuTwwlKLjK+dO/bAyReqLhY6LcbiD6YhXNt8O9XEkyf5cmrwyTxqVBev4yHeGdC44NuZl7jaiQD7fZtTv5/lyDHl/L/nKW2o0xLgweG4cOjNQNJICpvvdhoOowvoAWPUQAXryQyk3k8BQiQujcyzw759ZU=;
Received: from [10.12.4.11] (port=47532 helo=smtp36.i.mail.ru)
	by fallback23.i.mail.ru with esmtp (envelope-from <me@adomerle.xyz>)
	id 1sYKvU-0082wk-HW; Mon, 29 Jul 2024 10:36:12 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adomerle.xyz; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References
	:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=ncHefQXhdwDQ4/RjlVuwMUNr+QfPDTUajV9Yds65PcU=; t=1722238572; x=1722328572; 
	b=iEFgI5vcU8H8kq0rfIL3WT4WMbQZoxedYqQSQ/nKBkyUl3m0OydTGjl0Yq4DcBbDVpZFUVclwv0
	/X5kyd1nWxf6A5cBqFSMn26HAPxrV7U55T2uOOSFzfnr/EfHPFoAQ5mRFatyHOOJ5OHrE/aqE1i/f
	4RT2xkHBdo5sbu3uTFg=;
Received: by exim-smtp-868bf69f6c-zg7fr with esmtpa (envelope-from <me@adomerle.xyz>)
	id 1sYKvC-00000000275-2D1y; Mon, 29 Jul 2024 10:35:54 +0300
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
Subject: [PATCH 3/5] pinctrl: mediatek: mt6765: Add virtual GPIOs
Date: Mon, 29 Jul 2024 11:34:26 +0400
Message-ID: <20240729073428.28983-4-me@adomerle.xyz>
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
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C6F0D221D1B7CB84E2160E2B5FE815AD3B182A05F53808504070ED64680FE505633DE06ABAFEAF6705569D5C545E49AD31303324A9B5BFDD32B323337538F1B82C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70EEC24FFE855BCBBC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE74CC7A12EE14DE72EEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36D7040FD6C795E0D58B0FA825F8A708479DF002D5AC07DD35A471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7212612128AA291179FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3CF36E64A7E3F8E58117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF043DDA2F55BC478EBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6A44FC0728E0BEE5076E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB23BE56FCC6FEFED43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A57D5381FE4AFA73195002B1117B3ED696AEADDBF43329A05C715D9AB585B0EB04823CB91A9FED034534781492E4B8EEAD9CFA8CFAC159CE19C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF9917B871B94905D69EECD606C3E2E4C9B2A5DCBF1DDA7D096B07566F282BD1DACBE0296D7E8D7E7C67C7AAC6E25A208654E82B7864EB9E77FEDD108130C0427CA650E05A2CE5F5DC22BA058254B804A102C26D483E81D6BE44BE0F8B58F75087CBB04030989F1EE011FE023E09B2D9C0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6WItejNFuIZdQ==
X-Mailru-Sender: 5DE64BD8B4008F63F32F89B2E510BB54953AE6F1ABEFA2EDB951B70A5BD4BD8EAAC38112D6C17A550D95629463F16A6A3B9265ADAFE7D7E06F53C80213D1719CA6FC796F43705345A9EF9D9C6A90DD94D3D6663D5D4272A7B4A721A3011E896F
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B431B8944160407DD0C2EAA1E6BA7F9BE034EB9672DF358C7268F3CF0E9FE49B69BA651B92B2A570CDFA13EC145ADEB46B10EC71622DD18A7315255483CB426599
X-7FA49CB5: 0D63561A33F958A589323A742A0C511558D4370723787B0B6D208F3F2A12F1508941B15DA834481FA18204E546F3947CFE0D02E6309259D2F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006371E900BC921822949389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3BAD564E72A87595935872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6XZ5YEio6WQfw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add EINT-only virtual GPIOs as done for MT6735
These pins are needed at least for PWRAP

Fixes: 477fecee7ca9 ("pinctrl: mediatek: add MT6765 pinctrl driver")
Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
index 772563720461..070af420333b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
@@ -1749,6 +1749,72 @@ static struct mtk_pin_desc mtk_pins_mt6765[] = {
 		DRV_GRP4,
 		MTK_FUNCTION(0, "GPIO179")
 	),
+	MTK_PIN(
+		180, "GPIO180",
+		MTK_EINT_FUNCTION(0, 144),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		181, "GPIO181",
+		MTK_EINT_FUNCTION(0, 145),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		182, "GPIO182",
+		MTK_EINT_FUNCTION(0, 152),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		183, "GPIO183",
+		MTK_EINT_FUNCTION(0, 153),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		184, "GPIO184",
+		MTK_EINT_FUNCTION(0, 154),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		185, "GPIO185",
+		MTK_EINT_FUNCTION(0, 155),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		186, "GPIO186",
+		MTK_EINT_FUNCTION(0, 156),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		187, "GPIO187",
+		MTK_EINT_FUNCTION(0, 157),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		188, "GPIO188",
+		MTK_EINT_FUNCTION(0, 158),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		189, "GPIO189",
+		MTK_EINT_FUNCTION(0, 159),
+		DRV_FIXED,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		190, "GPIO190",
+		MTK_EINT_FUNCTION(0, 147),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
 };
 
 #endif /* __PINCTRL_MTK_MT6765_H */
-- 
2.45.2


