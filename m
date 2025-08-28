Return-Path: <linux-gpio+bounces-25116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8480CB3A543
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 18:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A37E8166C1B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 16:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8BD1C3314;
	Thu, 28 Aug 2025 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yyraMMIf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED5B259CB6
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 16:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396831; cv=none; b=SkxINt8a4rrSDW+yZmHtvLvhWn4lvi2skSqyYR1i0Lij7m6eezChyYlv4HyY3DCo94HYg7hE3lzLKa9ESw3XV3Jx7Rzu1/GJx7/w2FHB0apl+e3XXXQFUdreIAFhSvxNjDtM14CdVilzgBA+1kdK60beJ1IfI5BZnogie1UKlXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396831; c=relaxed/simple;
	bh=AqBljAHcu9SEs+fMf1cVNWEroJaNcsABmNRiWlNYjLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aVjcLyS2gCA1uErjV7uWedrow5u0e77Pvhts/WMg+iEbtYzQVPzKB1hc0z4iaWzmVabTPPCKVjY15CHl8pIsravaZHxPEPU3HaclVMaSOyE69sU4xtlsxaqI13uEpeso4rwmm8OupZ8D1u9fqScuPUvSP4zL0WI7CYolVJrDBjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yyraMMIf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b7d497ab9so4436465e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396825; x=1757001625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxPihWEE9okM75l8p7+ohG5rL5D7+pdcAJ7iXomcZQ8=;
        b=yyraMMIfnKzbWxtVCj9/B7KvdiaurbXNLMCGgEcazajDmu+wyLmUoJn4aITCcfcVef
         xQFV/Czj9rJh+/VlsRC91UFtlkmzEGQAVGW3TOfoNOfJSngcsRTkxsnC1s32mu/8+YQE
         UXEU/FBy5/7aD2aHzcfAPPAc9DkxSGtLO5D7E7SQzQKgHHwTHfraU87oO1YpLkwsFua/
         HDzEvK2EyrQaPvaCNPZHX69V66C9UOM7Njyn+ic40Gvdh5AGMQAFFn6fmiwXg+gtj4TH
         0oo2SM6CwaFtWayPdLVM9ktYHafbTZtZleCH3uJEtbV4BxG0VDuk9z5NrvR3Dlberkri
         s+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396825; x=1757001625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxPihWEE9okM75l8p7+ohG5rL5D7+pdcAJ7iXomcZQ8=;
        b=mCGOMnAiSuRCACSKdeWqzyb+OP6TBYfgoXvvqoI6JMaAbsEfBEOED6b3g7mptc640v
         L/j2qfVSRJ+vLDyF83K9M2cpOT7QEa0qloNSfIIzyPKV3F6/Va7BYhHe0GMk0TmDzaOy
         dVMNwMpJ69fm+xVaS8tEbsIUaO/hV0WEBUu4gO4PkZdfVizbJbSJAN48/WNV8KciRS0X
         pJk6UgnYeFw8uDYJBUV0Vjq+t4lixVtwFTYmX0F5YT+6r4YXqRSzv5NUtTQg/Az1VAaT
         gTx+mzF+yF52Es/K6ou1UvEuT3FKBQXnIQQL3TWlFjshFYlE+sm5dyx74a2FibGR70G3
         g6Og==
X-Gm-Message-State: AOJu0Yxq95XSeXwAcqsJik5a6JhjnepS0/HhhT66D0uNiBvf9iwXkGy/
	aD2sJL00GT5AUOnTijY6H8FpEmug9mRuDwryKMvBoIeRFXD8I85I5Qghw4YxWddiq2o=
X-Gm-Gg: ASbGncv+o2sAFf0fJq/ga2fDaLK1GR73f8VmmLFAaafU7fyL4ohbGxgd2EfzxeFEENS
	eIZ6YdonK9tfbRujsgFSAClU0vniHiOd0P4u7WCgqbdkcuf+avKIlf8trsErgcjF7JE1gpyU2dG
	KVWt5IBnA5KhkAEaX7DnJlr2uTIkIWMEULixRdNUCCAMP07JOYmVsn6vKv+e96z4U//sr7+/psk
	SXPq/M9WsJ88pUcHhSUR4EZelHRgfUwPlR97xNc369mSy2zM6DmcPzdsXdqsL0T9X7ikKpuQKL4
	EEUybLCY6kJ8DT7RVS/qbVTzDtd83ECP7edZo2v+sMEiAvbtRLgFYC7CAmgPD1tsD884YI06njr
	fJF6POKHl4ePSwrC0olqbcUNNtrO5
X-Google-Smtp-Source: AGHT+IGRMyHayDmkLGW7+TAO1iROYIwKh5FOICjdfcZ0105VGTYnJRy0SkhUfojn9IN8Mk3CuNpnVQ==
X-Received: by 2002:a05:600c:35c4:b0:45b:7bba:c7b1 with SMTP id 5b1f17b1804b1-45b7bbacbc1mr17635415e9.32.1756396824905;
        Thu, 28 Aug 2025 09:00:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:12 +0200
Subject: [PATCH v6 04/15] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-4-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2921;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=79i9CgDBpTwy0KAMS4vozziB177zSWYhoWrySFXqKM4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0Nb2Lfmw6OgPTm+UKi/evxFaUCjOaMgc4KJ
 G/Jl7qtg3uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DQAKCRARpy6gFHHX
 cmd1D/9O9r1DDeMjfZpJc7L4WQYFg4NpL4bsKIEQD/4HTfJtY0F0AbCzTUVX8wvtO6G7Oz7Ckl1
 JGsGL2ePPaPSOhC4u0K4c6e8AGfOLuS65Aup1ZPjk9dByafrLUoaeoI1SM2rk0Ff93R5dCbWAhV
 O+zwBzL4wpnwF6q8j7vEmnrERbfUK4DJyPUYU8dEMlQpCvM2xq3vX+6M9aRECpcDSDIgjXsJaiC
 3SEQGGSpuSWLH4vgWbPAhYTv2uA//5mK/J93r57YZIjbfUe7EN+xvbqFhkUX8sFPTTQ1K5nSV3I
 1xJamJF6MUu1lz6b7z/ZIRwkLcp9NWTEKBcIA5UbweTZFziTMjOdWQ+wncqGqm/jw3vitwXbUp/
 DaSwfS6lcv7zefvLHYddAx3HLAixXjkS/XVFAC9VZW2ZtNpqJXBMl8S9+hfVpwXFc3OlVI+764g
 v9EF9SWddtxMvleCD6Cw2vOD0URS5JtaEfX8/draXvRAklHRp8xnNS6tXVnx/pQWNt/SKMcxHfi
 EuioUyf3YE+ywH7kBFazoYHGSt5+i0XaiWxZPkvXjk1A/9V/nJyroGXDVvC6IJKNSYJSkbmxsm5
 6AQHNTKZD1aoqjMJa0hcJdLtcBCZCHyZup13Wvn6cJC7D3MAy+LWRbAi9MJMBS4G00bSg2oJCqw
 6ccAd8cQ8L3Zydg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a dedicated initializer macro for defining pin functions for
mediatek drivers so use it here.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c | 42 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 68b4097792b88356babe4368db7d0f60194e7309..55c8674d8d66f12d2f2246c215056d4e51296a9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1465,32 +1465,22 @@ static const char * const mt7988_usb_groups[] = {
 };
 
 static const struct function_desc mt7988_functions[] = {
-	{ { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
-	  NULL },
-	{ { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
-	  NULL },
-	{ { "int_usxgmii", mt7988_int_usxgmii_groups,
-	    ARRAY_SIZE(mt7988_int_usxgmii_groups) },
-	  NULL },
-	{ { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) }, NULL },
-	{ { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) }, NULL },
-	{ { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) }, NULL },
-	{ { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
-	  NULL },
-	{ { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
-	  NULL },
-	{ { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
-	  NULL },
-	{ { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
-	  NULL },
-	{ { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) }, NULL },
-	{ { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
-	  NULL },
-	{ { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
-	  NULL },
-	{ { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) }, NULL },
-	{ { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) }, NULL },
-	{ { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) }, NULL },
+	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
+	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
+	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
+	PINCTRL_PIN_FUNCTION("pwm", mt7988_pwm),
+	PINCTRL_PIN_FUNCTION("dfd", mt7988_dfd),
+	PINCTRL_PIN_FUNCTION("i2c", mt7988_i2c),
+	PINCTRL_PIN_FUNCTION("eth", mt7988_ethernet),
+	PINCTRL_PIN_FUNCTION("pcie", mt7988_pcie),
+	PINCTRL_PIN_FUNCTION("pmic", mt7988_pmic),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7988_wdt),
+	PINCTRL_PIN_FUNCTION("spi", mt7988_spi),
+	PINCTRL_PIN_FUNCTION("flash", mt7988_flash),
+	PINCTRL_PIN_FUNCTION("uart", mt7988_uart),
+	PINCTRL_PIN_FUNCTION("udi", mt7988_udi),
+	PINCTRL_PIN_FUNCTION("usb", mt7988_usb),
+	PINCTRL_PIN_FUNCTION("led", mt7988_led),
 };
 
 static const struct mtk_eint_hw mt7988_eint_hw = {

-- 
2.48.1


