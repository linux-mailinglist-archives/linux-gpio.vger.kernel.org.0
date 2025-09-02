Return-Path: <linux-gpio+bounces-25369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EDEB3FFA3
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 14:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F9865E06A5
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 12:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDAE324B01;
	Tue,  2 Sep 2025 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="INgqUkgY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D0732144F
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814393; cv=none; b=dvzPZ8WefZg0h6ApaDYV6I0TZu1M8AIqdej/pp/vx7AyFzEsvixWyNtjnVRuYJtEOIRhwMy5PtJ2wCzbjOLjVdInZTUneaWZWUkg+F2tfRD1H+7JN18BCPVDWuj/Par3psd4qTCysQMxV4RZtvBYhyxipOHJLTQgNovfwaw28iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814393; c=relaxed/simple;
	bh=pmPGULb1s5aSI6ClYNDWVTQCSeoNAD27M4PgucF3E4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXdynX0z+B/mivY+54Fv1paPOiJk72JOhBh4Ue8tQTlQXUs/egFZzulmDbPJL68yow+P74JZLWk27AegQDYoZQPJx4wPeSBJ9vMtgzIS8KaHGBSifN7XiRN2EO+oUa5xbdQN3YtwDRdSrA+xMdOuZWI9sDvvLfxzEev3EmAwdJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=INgqUkgY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso35892555e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814386; x=1757419186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1JFPtEwOFWxLJ4pevnsYlgpYZW/QvB5ELLnfLsEVFI=;
        b=INgqUkgYx6BaU4rM8Ajotj3byE7tPUqBhDjs6SD5bCcu/ifV2R+tDUzZot6iIrFZrj
         ZiMDaKmtdgcGkjB2UAOkLbkf9/l7A+XVEe19G6JtCwjWodYGnoFs3DW2p+OsTfNWI1kc
         eFQ2CnTMRlL2SlYz72RXnLmjKCxXdhkjkcPg9aOzU1SHL3OTrS+oZ+6uveI8BL48y9U9
         aO801ACYArNz/8ztCxOLsodof2CUi0+Gu8V8hCZT2G03dHwCVqaaqrZcTYx0bHLclll2
         +3nSbVKWXWF8uQocF9I4Zcxl+gLmb2Bw4SxXG05e9uBuVT5fPTPg3jZr5cud/OGNgkgH
         gofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814386; x=1757419186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1JFPtEwOFWxLJ4pevnsYlgpYZW/QvB5ELLnfLsEVFI=;
        b=thxN/izzU4/Bgs3eWMY8ypp8+Ip1JH2kQqkmv2+R2jPkTxHzIPcjo6z0r6F740u15n
         duR6Kso/xCaqb3fH8yLMndS+Hl4ssg7dGJvFMtbm4qwuiHQ3KxdzacVP9xh/nndKMmJJ
         kaWOc8V9zZTlVforQ6wPEKHfCSYf1UiTPmuKCYsioeaxHQw+whU0BvhkOpbkWMcCkZ3J
         sRhUTeqH9+ynFlOD/6PI+siLr/2wcFpxMPCzkQPWXaSzS6qSnbW5g8Z5MeUGcRyu92lC
         JSIvhBLtQyfTUdftju99uthSEaFje4uQH+Q/rEVjnPhmyKJ9ipLnKlja1B53VWoKmD+G
         MCbg==
X-Gm-Message-State: AOJu0Yzqd1vyLeiT0iG7jHfnXXXzAOgh0Yj40MqL5upzj/tM9f0L82zI
	mY5GKvQFgJhwsItjCj0KjrOV+IxiuZ4bZhnRbAhlKnZEZVZ85yjqBN5KOnYev9PR3Q0=
X-Gm-Gg: ASbGncveW4eBMV2udbzgSbk+LgK/7j8F62DjMKFHyO6GIvfq8K3wzqdDO6TssEYPRxt
	miuvp8QyKUc8qH/UEm/VyL+RonJbdeyBoAreeTEZGUK85qml/nj7V3p4A7GqZ5jCC3UXNZuYhtP
	7BGVpbpN8aHHXIwri2j4QDY8T+NMjFMGPXo5f8x7bGevhbSjzARdWQX8JTuS9jhMA9GtkotwW2u
	WVQB/hXhQmXVdvoGxJAN/XZoYJQn0oOh14MosflALXkez1IeymxY02Z+YC8vjBUYtzabMTcVwL2
	+/a2191ZXhSzJRtVNI2+4Zz0F52IOsHiZsrtGoCPDepaKM3GO+AK4+a126/U2YO3U9PHoWZQWLO
	rUjS+0KtidWJ4zgM1
X-Google-Smtp-Source: AGHT+IERkhZoQX1HV3fDYiEzCgaqV6JXpD5DtzyBRIwQQg9LLBsXxUh/GkJb42UUw5J8EFKuniHI6w==
X-Received: by 2002:a05:600c:4f83:b0:45b:7deb:3f0f with SMTP id 5b1f17b1804b1-45b84c2256bmr102158145e9.2.1756814386175;
        Tue, 02 Sep 2025 04:59:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:25 +0200
Subject: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bNcWH7RYmKxieWZj+11TmEo7Y2F52BicXtYvQjacVVo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwVYBNAIqxX+GTdprLN1KmCRP+T0cr4zPnb7
 WAB05uVr4mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFQAKCRARpy6gFHHX
 cm3gD/4gfdNCgi/L1crd3spjH2BfsVhCz8jK0iuHKflwRrBglJW+yuaaNcsIES0+sEg4mbRdkvB
 1Ww04kOvSuLFZauF0IjgNjcsXM9Y4+a0omjT6JjzrxF4wH11ZUipW6gaRbg5cWC5eo3rgddQEsn
 kwbd/DgAjJie0IMEsgOrpRxSoSPgtiB28j56D9mQlqkaav0Un0XGqHAf52wzHJKASG5FIcLEqk3
 qIM2zlotBfSbMMrimUgMUuracaiWXAgUZEUnTEvPcEqzGxwmGN7aUT3In4gU+ZIAMIA66uGPNE+
 irYNdb4rfWdNdq7+XjiId4yoaKduyzu5Qc/jnjzOGWFHMO2C/qillgL5/et3jIT1GjeUzbUIINn
 CxvwKST8T1S2cPmHe4pwcwmXVDVTneQtdl42O5qh3vP+1L2/R2k4qf2Nl2kX0gqEEV3lZZo9eki
 Ft8oIUThEPJqYpsD0+9gXrBi9I1lYZsOnzBK7tbaaPfJb/rpibcVpT+BJ76HUywsb2N5YPPscbC
 s7dzSCMl03nWf/7ur92d3WElyVXj0DwD7mA0bhE7Qm+yF5en8ldGU3WMcg9FbVS9+hCDk4xtc+s
 aMN2oTM1Lo+DyGbfSI+GpIAarry7nR5402siiOB0KaRWE+zrsWXHk9HH0n2Vu1wv5iSFoFplf5q
 nx4+sTuoQi8FoEg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1


