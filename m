Return-Path: <linux-gpio+bounces-23015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7AAAFEC4C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FCEA1C42EBA
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67102E54DC;
	Wed,  9 Jul 2025 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IGMb4xJ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F592E8E0F
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071960; cv=none; b=rfIQ36Cg5ELVnh/httRuv4JDIxa8bqWW66eA+pBFyqDlL/X5kplrSrQ6Ao9DTWhnsZhvqhd7QnlSmO9yVYs3fgHH5XoL21t2jW4w2mGhYCCbjSUWQA7zBKmjOCFyXIJd8X5BkDwtdT5WABk9+wvvaqqMtf+cZPXulM+uioi56As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071960; c=relaxed/simple;
	bh=SCS8lXlSiiBwXguGwY5sbzIz2soagvI/WfQi2qiMnqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFvnWOSgUS2pIXEtqU0qCHMxHM0dvmcy+DSsqPsP8eOpIrUOniTEf9jZ1MHbrfEqK+lc9r3963MchizPok3x81tMQ4CvxBsFtb18Z4q4kNeM4+O3yAPgSd/rydFLIt1kbPyh47CHpNGpd4Sb8pqSMc2isTkteUspD8/dQ+0UpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IGMb4xJ6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d6ade159so49953495e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071956; x=1752676756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnZLud9yO6zOA+K6EV0Zq/kEr3WEEyX9xKA6hhGjpKg=;
        b=IGMb4xJ6nBMaL3s4vLs/M+xL1SSlgv3rK8YXtVm7YxihAuJxGq83tesxQnpZoDV872
         /E3FhmY/FNP4TXA0D6Mb8e2XpFdztTPD1GQakEQ51Rv2hv+JZwEPSbwm2jFdVluM2anM
         5W4EK1XVIQWPJh1meFGMpzJkppa58LFCCtBrBobeFviAiTeZAL2vWwWpxQKqKGONC/LV
         A4zbMda3x1Og37vIfcDZ2hMo0RS1DSaUojx83wAgEX0LQto+b0M3+bT5BCJ6vtr3VmFe
         He8nHWm4/DvrQHSO8SH8ZVdO9YIwxBajP44Iq0g7/GfmkIQ/Hn8U6CPmjD3NlyKXQe4N
         arQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071956; x=1752676756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnZLud9yO6zOA+K6EV0Zq/kEr3WEEyX9xKA6hhGjpKg=;
        b=oep9VJKvJuObjoDPfwF790EjBVTC9wpeus95f9EjicxLdAH5GM+u/O5j60A8lOMqXT
         daUj9dGuRAxPadLFOHRtdj3XSBz+EjnS9cOkBbYuoKK/djrKfsq9GG9TjnI4KZb8vGCA
         tBQ255ouNwEHHlTHj0UQUya1V4Z2ErGS/E1f1cqwbv13aWiEHMBgpKZuYjhQqjDKF7ys
         Pxyr+blSx3lhD5Us4PHKN3JFZHzisyixmCNO7S8ifzt0LRYYTiq1qUKb6twt7Dn2LoMK
         ediRUAg9A/fxFPUkPpwbe8nfT9tX5mRIkdE52fa/T3iF4EaBoKiEJ3KrtQzmsOA0jkoY
         ZIgw==
X-Gm-Message-State: AOJu0YyboU9d9SRIFocJqAyt8+f693tMMYmpvO9EtdRTurhfMcZJ1GLg
	TG5fVhARK6HHUKAcWrOr2qfit7wGMVtdCPjaSI8+CwM858oFYd4bCPVuk2DtUtIUrOFHO5dDrri
	Hn2icnYs=
X-Gm-Gg: ASbGncv3OYxYxPUAfJoYffRN2RwK0fqlT/pr6ug8J37Z7osrkkE5bjyZSSV66e/f4DX
	kyHFjTFKA2XlXktixHgp8PIeyssx0jGaicx1EWrIaewS3H7rpLBe1d9C2elL1GoERsdXO12+/A7
	daTbwlVJ1aO1RHs+PuCVffaGTosjbevT26kRu+3twVy6p4arJe/BoNeIIGrcJUwlPRq5ZfOrfE0
	aAwWW+48PaQYC6C3QL7bgKKDIQ/0xxHHnvmXXnSVl9gpqPTgZHYWihADg9j+YeFJoATwCO04sm3
	U4TiCVheseRS6Y5+ByRtjNGZ5F180H1T55iYWwB29CKsRJPe7eoMDgM=
X-Google-Smtp-Source: AGHT+IGq6DlUYoApEugH6cDhO6AeupjgahOv4gDk9/vuNfa2ylaW/Guo/o9ndLeOYxtCCVeM7IgCyA==
X-Received: by 2002:a05:600c:4692:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-454d56af9e0mr29208915e9.13.1752071955911;
        Wed, 09 Jul 2025 07:39:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:06 +0200
Subject: [PATCH v2 10/12] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UdZ2DBMT7xZXebRXGSH+ALcw7tXi9xCLUU0Hy5OPvAw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8HRwoShqLTGfiStGORsuza7OvA2QrMSBi9l
 ChFmBizpqSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 cnosEACh6WbaTtFBq2fxmhuAoGjSt+Q6E5srezOcew+EQXK6B0xtC2/jrAK0kyIdTlCiI2Jpb3k
 muui8bz+61HhIfL3xVRg9x7DZmxPMEGBTLX0wgxKYWLoabpwPGZAEVTrRFObmGV0EF0Rcxdgqq8
 DO6+GW9hWm/5CFmta27hfXEkgVFGnBgWwOkdgCXjd7IqVBT9cHAFtwK0/7y4QakKJLNfOhHEcEB
 dz6FfKO18xUZ7x9h5Azd2WQPtOc9qC3zN1SqrF4iZfKL7gba49XoNAKSX2l+osa6BDjbL6nKInQ
 RsAckjuQxY3jcwhZoIdcsUpW4Br9HhwpeAsU57wYPkbp4V3K4D+ZJ36Lr422MaOevqy6GTmMOKO
 W7apzN2klYF6JSOjzeynE9221HkqjqEqSCLPAq/K2z6xzjDYDpjzvX+yG6UlMgCHuz5qretJjIY
 P9v4eiNvHWbfTnBNIkNvI0aw0kWzP/qJsenuHmmpR5l1XaV6O+ruecKbv9jpi47XhDD5N2gKVQA
 Ibq/uYr4pIV5r1VCgSDZ5Mq4JIialrRhxOSdKjWJZ7CLdkVuVnYNbj9f00oZ67TF8yghNdx/OzA
 Lw5AXW6E6RqHHrZwuRu88iGvgV0/k4Mgp7AIsiLAorpNJ8tIa02LLZe5E+sOzH53zortWOVYjQF
 /LwuyRHibnzRGZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and assign the .function_is_gpio() callback in pinmux_ops.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 965f0cceac56697bc4cdb851c8201db7508c042e..7010be8d1ace062fcf7743e539d2065d4aed856b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -265,6 +265,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
+	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index d7dc0947bb161868c8f433dc2536719b8afc8bd8..4625fa5320a95a4d24e3a0c98a249e4f163dd4c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -29,6 +29,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define MSM_GPIO_PIN_FUNCTION(fname)				\
+	[msm_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define QCA_PIN_FUNCTION(fname)					\
 	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\

-- 
2.48.1


