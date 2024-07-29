Return-Path: <linux-gpio+bounces-8412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D306E93EE7F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F6B81F21F36
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABC0127E3A;
	Mon, 29 Jul 2024 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b="US6xXn5P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b="NPTNGDV5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fallback1.i.mail.ru (fallback1.i.mail.ru [79.137.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9C582869;
	Mon, 29 Jul 2024 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722238526; cv=none; b=VIbtapXdmJNFAldOByWp20WcRIWa7Cg86orUECzzLm7hdtJOI15b5oFlP6XyXbVwlJgkKF/1dj62ewlzP1anvoeGD3qeE21hPdCwHTty+v4VEbGtx4DoG4C9vggXc8Ohpd9jYmPP3vMmEWUPQTLLzR+of2lT+srYf4U54brddj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722238526; c=relaxed/simple;
	bh=7cok65e8s4uLaRXW6FoGXBQpDXILERn+aTgVzJaleb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSrZSi2QYCNCcR6ufnOR9ll+FOKVok2cy9XYgwHfRIoFtwmdbXvLLx5QHvvMY5+uHtXxdWD9Z7KfprZU4BP58mGPg7ECb3VCU5hudLnJUpvae4ZRpeEiLY5B4KSrCeFeYTXpE/72QMLxccjTMl6+LMKXSnlr6sObVB3u0HWu7qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adomerle.xyz; spf=pass smtp.mailfrom=adomerle.xyz; dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b=US6xXn5P; dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b=NPTNGDV5; arc=none smtp.client-ip=79.137.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adomerle.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.xyz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=adomerle.xyz; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=L9uvubG4e7GuXy/HEqPlxlpTn/mAzNZtQZkDQ9dVw+U=;
	t=1722238524;x=1722328524; 
	b=US6xXn5PVCOj0pz+hrhQ8H5AsMxCD56jGMxkr6XAbfLk6vXwCIgh6kC36aGnrNlkNRPCV+yECMG52YKOlD2RC709i62NLMEl3u5MwaGAw9g85Je8ppphEPRi2xyMo+O3GABdr4apqcjaE23jfvM6jf3yfTIO2m5b3UfU/PLnbsk=;
Received: from [10.12.4.37] (port=42138 helo=smtp61.i.mail.ru)
	by fallback1.i.mail.ru with esmtp (envelope-from <me@adomerle.xyz>)
	id 1sYKuZ-00EznE-BE; Mon, 29 Jul 2024 10:35:15 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adomerle.xyz; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References
	:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=L9uvubG4e7GuXy/HEqPlxlpTn/mAzNZtQZkDQ9dVw+U=; t=1722238515; x=1722328515; 
	b=NPTNGDV5Vp6I7vyS/1jURwjfcj1k3F8DT8ZkgEYzS0KkdrKD14wei9LwSWucw2AHDt52w96V5z5
	HAc5KauW48lfdQy3QVYRh0+AVkPeM8EHsObneHxyNDF98teu7+Wvp6ENA2/EZ9hRx01/oJDGD1Kmd
	gzmQKLl4/c2gV+bAGX0=;
Received: by exim-smtp-868bf69f6c-zg7fr with esmtpa (envelope-from <me@adomerle.xyz>)
	id 1sYKuF-00000000275-38KR; Mon, 29 Jul 2024 10:34:56 +0300
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
Subject: [PATCH 1/5] dt-bindings: clock: mt6765: Add missing PMIC clock
Date: Mon, 29 Jul 2024 11:34:24 +0400
Message-ID: <20240729073428.28983-2-me@adomerle.xyz>
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
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C6F0D221D1B7CB84E2160E2B5FE815AD3B182A05F538085040EF34FD0AB11A37C53DE06ABAFEAF67050A0C1D41407711BE303324A9B5BFDD3258986F725C2A4283
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE793089AEA09EF102BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063745B6F93C788775E78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8EAFA047CD450D65583832EE758E1DF54FD86F243095BA4A5CC7F00164DA146DAFE8445B8C89999728AA50765F7900637028599BB38096F4F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D2A98E5A6551E3E5117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF055A3127ECEB1CB3BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B61FFDF4B5E34157C176E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C5E1C53F199C2BB95B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5F5DB60828C4BA8AE5002B1117B3ED6961D04A7459567D2FFBFF4097FFC9E796F823CB91A9FED034534781492E4B8EEAD9CFA8CFAC159CE19C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC35B71914E27C0DF66C6FC9A8988FE5A15CC854EA8CCEF6E2AD8E098005480FBB0F06D2F9487D0FC67C7AAC6E25A2086F0B81A1E795561CBFEDD108130C0427CA96BF36F8852DE3522BA058254B804A102C26D483E81D6BE44BE0F8B58F75087CBB04030989F1EE011FE023E09B2D9C0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6Uopk33/Q/B+g==
X-Mailru-Sender: 5DE64BD8B4008F63F32F89B2E510BB548372E88CF31825DAB951B70A5BD4BD8EADFCC5A6732EA59FF1FEA02A07AA46D63B9265ADAFE7D7E06F53C80213D1719CA6FC796F43705345A9EF9D9C6A90DD94D3D6663D5D4272A7B4A721A3011E896F
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B431B8944160407DD089A7AE0D179B51619F9534A46E763EF368F3CF0E9FE49B69BA651B92B2A570CD43AB70617FBFEEA7B40AA28FE4929FBFE23D54027332D046
X-7FA49CB5: 0D63561A33F958A51EC06C8DC4B0EDD370EFA612254C0AEBA143497BDFABF0948941B15DA834481FA18204E546F3947C7893FB2F108C49E4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063780B3000F7A6F2D7A389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3DD19ECFA348986C535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6Uemu3hPbpjWQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add PWRAP clock binding and shift the following ones

Fixes: eb7beb65ac30 ("clk: mediatek: add mt6765 clock IDs")
Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
---
 include/dt-bindings/clock/mt6765-clk.h | 131 +++++++++++++------------
 1 file changed, 66 insertions(+), 65 deletions(-)

diff --git a/include/dt-bindings/clock/mt6765-clk.h b/include/dt-bindings/clock/mt6765-clk.h
index eb97e568518e..5d3a603a0d36 100644
--- a/include/dt-bindings/clock/mt6765-clk.h
+++ b/include/dt-bindings/clock/mt6765-clk.h
@@ -161,71 +161,72 @@
 #define CLK_TOP_NR_CLK			126
 
 /* INFRACFG */
-#define CLK_IFR_ICUSB			0
-#define CLK_IFR_GCE			1
-#define CLK_IFR_THERM			2
-#define CLK_IFR_I2C_AP			3
-#define CLK_IFR_I2C_CCU			4
-#define CLK_IFR_I2C_SSPM		5
-#define CLK_IFR_I2C_RSV			6
-#define CLK_IFR_PWM_HCLK		7
-#define CLK_IFR_PWM1			8
-#define CLK_IFR_PWM2			9
-#define CLK_IFR_PWM3			10
-#define CLK_IFR_PWM4			11
-#define CLK_IFR_PWM5			12
-#define CLK_IFR_PWM			13
-#define CLK_IFR_UART0			14
-#define CLK_IFR_UART1			15
-#define CLK_IFR_GCE_26M			16
-#define CLK_IFR_CQ_DMA_FPC		17
-#define CLK_IFR_BTIF			18
-#define CLK_IFR_SPI0			19
-#define CLK_IFR_MSDC0			20
-#define CLK_IFR_MSDC1			21
-#define CLK_IFR_TRNG			22
-#define CLK_IFR_AUXADC			23
-#define CLK_IFR_CCIF1_AP		24
-#define CLK_IFR_CCIF1_MD		25
-#define CLK_IFR_AUXADC_MD		26
-#define CLK_IFR_AP_DMA			27
-#define CLK_IFR_DEVICE_APC		28
-#define CLK_IFR_CCIF_AP			29
-#define CLK_IFR_AUDIO			30
-#define CLK_IFR_CCIF_MD			31
-#define CLK_IFR_RG_PWM_FBCLK6		32
-#define CLK_IFR_DISP_PWM		33
-#define CLK_IFR_CLDMA_BCLK		34
-#define CLK_IFR_AUDIO_26M_BCLK		35
-#define CLK_IFR_SPI1			36
-#define CLK_IFR_I2C4			37
-#define CLK_IFR_SPI2			38
-#define CLK_IFR_SPI3			39
-#define CLK_IFR_I2C5			40
-#define CLK_IFR_I2C5_ARBITER		41
-#define CLK_IFR_I2C5_IMM		42
-#define CLK_IFR_I2C1_ARBITER		43
-#define CLK_IFR_I2C1_IMM		44
-#define CLK_IFR_I2C2_ARBITER		45
-#define CLK_IFR_I2C2_IMM		46
-#define CLK_IFR_SPI4			47
-#define CLK_IFR_SPI5			48
-#define CLK_IFR_CQ_DMA			49
-#define CLK_IFR_FAES_FDE		50
-#define CLK_IFR_MSDC0_SELF		51
-#define CLK_IFR_MSDC1_SELF		52
-#define CLK_IFR_I2C6			53
-#define CLK_IFR_AP_MSDC0		54
-#define CLK_IFR_MD_MSDC0		55
-#define CLK_IFR_MSDC0_SRC		56
-#define CLK_IFR_MSDC1_SRC		57
-#define CLK_IFR_AES_TOP0_BCLK		58
-#define CLK_IFR_MCU_PM_BCLK		59
-#define CLK_IFR_CCIF2_AP		60
-#define CLK_IFR_CCIF2_MD		61
-#define CLK_IFR_CCIF3_AP		62
-#define CLK_IFR_CCIF3_MD		63
-#define CLK_IFR_NR_CLK			64
+#define CLK_IFR_PMIC_AP			0
+#define CLK_IFR_ICUSB			1
+#define CLK_IFR_GCE			2
+#define CLK_IFR_THERM			3
+#define CLK_IFR_I2C_AP			4
+#define CLK_IFR_I2C_CCU			5
+#define CLK_IFR_I2C_SSPM		6
+#define CLK_IFR_I2C_RSV			7
+#define CLK_IFR_PWM_HCLK		8
+#define CLK_IFR_PWM1			9
+#define CLK_IFR_PWM2			10
+#define CLK_IFR_PWM3			11
+#define CLK_IFR_PWM4			12
+#define CLK_IFR_PWM5			13
+#define CLK_IFR_PWM			14
+#define CLK_IFR_UART0			15
+#define CLK_IFR_UART1			16
+#define CLK_IFR_GCE_26M			17
+#define CLK_IFR_CQ_DMA_FPC		18
+#define CLK_IFR_BTIF			19
+#define CLK_IFR_SPI0			20
+#define CLK_IFR_MSDC0			21
+#define CLK_IFR_MSDC1			22
+#define CLK_IFR_TRNG			23
+#define CLK_IFR_AUXADC			24
+#define CLK_IFR_CCIF1_AP		25
+#define CLK_IFR_CCIF1_MD		26
+#define CLK_IFR_AUXADC_MD		27
+#define CLK_IFR_AP_DMA			28
+#define CLK_IFR_DEVICE_APC		29
+#define CLK_IFR_CCIF_AP			30
+#define CLK_IFR_AUDIO			31
+#define CLK_IFR_CCIF_MD			32
+#define CLK_IFR_RG_PWM_FBCLK6		33
+#define CLK_IFR_DISP_PWM		34
+#define CLK_IFR_CLDMA_BCLK		35
+#define CLK_IFR_AUDIO_26M_BCLK		36
+#define CLK_IFR_SPI1			37
+#define CLK_IFR_I2C4			38
+#define CLK_IFR_SPI2			39
+#define CLK_IFR_SPI3			40
+#define CLK_IFR_I2C5			41
+#define CLK_IFR_I2C5_ARBITER		42
+#define CLK_IFR_I2C5_IMM		43
+#define CLK_IFR_I2C1_ARBITER		44
+#define CLK_IFR_I2C1_IMM		45
+#define CLK_IFR_I2C2_ARBITER		46
+#define CLK_IFR_I2C2_IMM		47
+#define CLK_IFR_SPI4			48
+#define CLK_IFR_SPI5			49
+#define CLK_IFR_CQ_DMA			50
+#define CLK_IFR_FAES_FDE		51
+#define CLK_IFR_MSDC0_SELF		52
+#define CLK_IFR_MSDC1_SELF		53
+#define CLK_IFR_I2C6			54
+#define CLK_IFR_AP_MSDC0		55
+#define CLK_IFR_MD_MSDC0		56
+#define CLK_IFR_MSDC0_SRC		57
+#define CLK_IFR_MSDC1_SRC		58
+#define CLK_IFR_AES_TOP0_BCLK		59
+#define CLK_IFR_MCU_PM_BCLK		60
+#define CLK_IFR_CCIF2_AP		61
+#define CLK_IFR_CCIF2_MD		62
+#define CLK_IFR_CCIF3_AP		63
+#define CLK_IFR_CCIF3_MD		64
+#define CLK_IFR_NR_CLK			65
 
 /* AUDIO */
 #define CLK_AUDIO_AFE			0
-- 
2.45.2


