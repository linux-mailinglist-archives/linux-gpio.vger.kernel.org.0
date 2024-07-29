Return-Path: <linux-gpio+bounces-8422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C8793EF2A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1408BB221FB
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9FF12CD96;
	Mon, 29 Jul 2024 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b="QUR1frsV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b="fBsI9ub9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fallback17.i.mail.ru (fallback17.i.mail.ru [79.137.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DAF1EB2C;
	Mon, 29 Jul 2024 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239774; cv=none; b=m6qX+VyZzDOgyJMjC0l1iaVdm9NTLB4Jvz3PFWqjvbpRs6rOPo8PpEqo6uFY0dPJ3ZETku9+49zRNs4tTuBecaHD16h1fwoFsCKnMVak7LV40cpCkvbSAZWZzAcm6Lj3hyAsy+GNnlMSiT1gcDYNp9gAulJOyAE/w8arZ6mUCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239774; c=relaxed/simple;
	bh=dZBEstzfdqQtDRUzSU9eVtSpo8REa+i0Xlzsa53l0E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFvyY/XQ6CYA9ELrdsxq20cKwr5DFP/Eh/fex/NuIqjz1ccG3wptnZkI6O+D1GEjJATclq2mC37PP2CVMqK+jIFMTOijbTVZAeasre9XQM59pteED+0qr05SHUkrhmxiX03YBqutMbTdHxl6SjLBHIx9RS4W7FLICG9+bsF7drY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adomerle.xyz; spf=pass smtp.mailfrom=adomerle.xyz; dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b=QUR1frsV; dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b=fBsI9ub9; arc=none smtp.client-ip=79.137.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adomerle.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.xyz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=adomerle.xyz; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=qXpGTjMyqiCD0RIX+JF9xtfahmenrVdxwgP0rFdhRew=;
	t=1722239771;x=1722329771; 
	b=QUR1frsV/DqBAUtA8TRORaZXkOlDzczaBr9oBUKTWJPNtgE9WzGX6p8YhT5szu6I3rjIbEzzvfPHj/ehkr/u0DnhKZGBvt+9e+VIgIeI0SHUEPKEfW9DnMztGaqPU8UjIui3K2JsUVOdG6ylOzYYO/TlKXlFwwfyTxzUAalmaek=;
Received: from [10.12.4.28] (port=56382 helo=smtp52.i.mail.ru)
	by fallback17.i.mail.ru with esmtp (envelope-from <me@adomerle.xyz>)
	id 1sYKvs-00AZhu-8N; Mon, 29 Jul 2024 10:36:36 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adomerle.xyz; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References
	:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=qXpGTjMyqiCD0RIX+JF9xtfahmenrVdxwgP0rFdhRew=; t=1722238596; x=1722328596; 
	b=fBsI9ub9p2EpR3yy1aAKPFyjHkl65lmTOfzgBtzeZDHmgTKUQcDvkFn5DX6uAbQiNawdMnhfJIV
	LN/5MQeCt9gdPuUuYG/KMgZmta8UeODWmWmPCnK0W4+1FFcjpEtF7IliBLH3wPqkisL6UtJ7rsgqm
	uZ0aulE5pX504nVo3q4=;
Received: by exim-smtp-868bf69f6c-zg7fr with esmtpa (envelope-from <me@adomerle.xyz>)
	id 1sYKvY-00000000275-1lNf; Mon, 29 Jul 2024 10:36:16 +0300
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
Subject: [PATCH 5/5] soc: mediatek: mtk-pmic-wrap: Drop CAP reset in MT6765
Date: Mon, 29 Jul 2024 11:34:28 +0400
Message-ID: <20240729073428.28983-6-me@adomerle.xyz>
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
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C65A930543BBC4734D0FBBE5E356D8E6EF182A05F538085040258FA13FC4598E4F3DE06ABAFEAF67050194B3CBFFCED927303324A9B5BFDD32A5CBAC82CA3D0FCF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE760302A529BCAAAFCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B28E90C11C329EF18638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82570FCA53F16511A83832EE758E1DF5414DF00F3BD1EAAA9CC7F00164DA146DAFE8445B8C89999728AA50765F79006374F374FBCC9EDB495389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D2DCF9CF1F528DBCF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C643FE6A0CAC512C72D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3E4A64BF2429643C8BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE77F095E679B220E0C731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5905487F9E6F6BD445002B1117B3ED696151B13FE362816443D2BBC1EF78EDEBE823CB91A9FED034534781492E4B8EEAD69BF13FED57427F1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF92F0962FFBA62BF51607CC140B3088954361740219701A828057699EB7BCCB91EEB2523CC0526E3F67C7AAC6E25A2086B57C1B32712EB477FEDD108130C0427C97E10C581ADD9E9322BA058254B804A102C26D483E81D6BE44BE0F8B58F75087CBB04030989F1EE011FE023E09B2D9C0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6WzePG3zjDDEw==
X-Mailru-Sender: 5DE64BD8B4008F63F32F89B2E510BB5456122DE473CB4F5AB951B70A5BD4BD8EDDDCE20488194853C479C2914A57FB1F3B9265ADAFE7D7E06F53C80213D1719CA6FC796F43705345A9EF9D9C6A90DD94D3D6663D5D4272A7B4A721A3011E896F
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B431B8944160407DD0C2EAA1E6BA7F9BE034EB9672DF358C7268F3CF0E9FE49B69BA651B92B2A570CDF7F174742BA51ED9A3F6D35AA5AFD3FB9DAB4D0B271CB4B0
X-7FA49CB5: 0D63561A33F958A5813E036B878CC046BCB23413696EEAD02DEC6E588680D74D8941B15DA834481FA18204E546F3947CC824672CB62AFFF2F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006378E5B25976F539216389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C306E3C6E93C569A9E089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6XVMRrxXEaqpQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

None of the MT6765 reset-controllers have PWRAP reset,
so remove the requirement of it

Fixes: 12b079b0fe8b ("soc: mediatek: pwrap: add pwrap driver for mt6765 SoCs")
Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index efd9cae212dc..30d74279e27f 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2288,7 +2288,7 @@ static const struct pmic_wrapper_type pwrap_mt6765 = {
 	.int_en_all = 0xffffffff,
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
-	.caps = PWRAP_CAP_RESET | PWRAP_CAP_DCM,
+	.caps = PWRAP_CAP_DCM,
 	.init_reg_clock = pwrap_common_init_reg_clock,
 	.init_soc_specific = NULL,
 };
-- 
2.45.2


