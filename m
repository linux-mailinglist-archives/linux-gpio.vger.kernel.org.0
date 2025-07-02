Return-Path: <linux-gpio+bounces-22568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17337AF0E5B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 10:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BF4D1C24C0F
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 08:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3521A24113C;
	Wed,  2 Jul 2025 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0hGIwQoF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0823D294
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445947; cv=none; b=C6pllCozKRvDszxqVVftHyXdYqvU1JyDU9xfDATyRrHiPCi2DzKsPXLZ5+6duX8+RTtEXiImHf69ykZZ/PIMzjGdrpM1voFQ9MiSkSbFSd/bHxGIhFf13VkRiiEUZrP/bujh5SNue+tHBbncbl750VKwJN9c6h87WHT23e07LuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445947; c=relaxed/simple;
	bh=n+b5nx1+JBjRozO+Cx/7ZN17j5HdvRNm5alXDhUL0xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fs9MC7LHDSp+PeyBagG7MWkgDr3VK+0X+MxInrT+9rghwpvsX01HsUcvqMfUqvJbLDZIvOdp6FBKdwnuUij5JICUriRsOy7jP5ea8BStlnEZc1TYFfiWE7KRRXkbMLHikF+NSevEPgRUCjucwnVgMQeDCDYmz2phS7UbebiAPDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0hGIwQoF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ab112dea41so2275042f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 01:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751445941; x=1752050741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rs08bQcW40TM9Af/OuJiqaYgiV9Dgu9agE6s4LzHkTg=;
        b=0hGIwQoFp0w6Ue0ZHe5xQXd48TcojqTSOkskIt3bXaWyMKpuoLU0DNYSrqYBWafcti
         P3nej8IOBUp4KNP0tbrK8UYull/YCkbUw0J/Ne4T7rFmhKEvrw+0DnfO8fJFATUylEMx
         R5wJJmyCW+NuG9ikKfNtRGErNoKCFW1FdAb9BPnxUl8XEdpxfsRCs4l3dlchulFwrOle
         LHvIxjGoFKlOl0k1RFKGdIU656l6nClODs8Uyq+x/O21MF/IeRUtmVyNdXThNXl/RfMO
         TS/VadoMMdcg+cLwUEU0P6nhxGy7jQo0Cyx2TEfJ41XHy42YxPTn49P6gCIIIFRgdWff
         7SVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445941; x=1752050741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs08bQcW40TM9Af/OuJiqaYgiV9Dgu9agE6s4LzHkTg=;
        b=TNTQi+9MKy+6x0Kry+FvWTXIYxyrretw/oWUcyc9HSVZytY9IQQRdXMh6z69MX3REa
         +4T1udJV5SXgRXL89Pf3SWKEwgTAHm3BPRBRXaDTz+Ckxq3D6A0SakL2iypx7FRiBacB
         Pd0riF+Lp1RSC3G4RVaFGKoigiGsHeWMBBt2Hg34XNnibXD8tVNPOcM03RPWsS7BApIt
         zch6GS16rQ02k9vQXq45FC048kO5+c7m2x+yU7xsZBd2oRNGnAcGukSflnIC432IQoRp
         EHEwaZpvAmQnkF1vkS+0fc0YY1jOHRzZjnLDhkWqCCclmUDFKG4d87MX7Ci0bnebEFu0
         W73A==
X-Gm-Message-State: AOJu0YwSV1Z3ivNZEs4tEl46SKZkrRjw97vyc3XHywIlHu2eeCdTgsyU
	VBGICI3TRwwfUr/uB50HrbYUHfayLlaDZr5Nyqs3vBjp9/MJw+zRa7UR/cXJSbtWrSw=
X-Gm-Gg: ASbGncsQ0hfmI5tsLZZz3GcHnxPeohiQI4oaOycij5WB8Y0RgLKPL+TyUQ8gtURx9sN
	dBujOCnqVYAYwBpaHUm98t9CsGJ4JQIaxDbYvyWVPkJ0YPGAtDt9ZfuQr/y18jav8vgurmlaJTI
	WgAU9dcFaDtZsuE8xkT4semv7eAljXsP422n8fNcwkVq+1GQ1EyYjRr7N5Q3g4NU9JoBOAhqD/r
	76tznzvplUugwxRD5W9u7wiIMsle7bet4gcO0+HG4zu422Q5tiUtTqByfziHualbnKPka1yxEsW
	v85FGfJ+vKHYJbEU1g30cVQkWxb5hy2Qab4BrzPwSMlFQgN/ghD7a//cIt/HYyw7
X-Google-Smtp-Source: AGHT+IG+UV/n5OZw7RJOlbQwrxSyVzLF9p/WpSZZqGHUIf1KCNRm5aaw0CKCQBbVNSpk4hyMerVxVg==
X-Received: by 2002:a5d:6f07:0:b0:3a9:16d5:cacc with SMTP id ffacd0b85a97d-3b20110b0e4mr1271063f8f.49.1751445941121;
        Wed, 02 Jul 2025 01:45:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm15620571f8f.51.2025.07.02.01.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:45:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 10:45:32 +0200
Subject: [PATCH RFC 2/5] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pinctrl-gpio-pinfuncs-v1-2-ed2bd0f9468d@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2096;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9NUCa1lPWQXFimM/gZhuG/PHTdiwXUxqEFQxJKSZ4qc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPGw/1evvC9XaNzHd0bTGA1ZL5jNdMm16uM57
 uhp3OBVhaCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGTxsAAKCRARpy6gFHHX
 ctpDD/4jR0dxT2vLFaLcVbgsBjwZSyPAlBL0VqLbumb33iDCPHFBGgEHpnOLo/kPYzjEmS6Ha5r
 2wCYGVcP+mJp1QzAEJAIc67kYOl+OAaJixSPgeLPPZqfUAOma0MgI5x1IAWy3t0YUi+4tlSyG2X
 M78VMn1csnH2JrsrV/CIwbjqKGLSGEY3kviy2U/5Pc5TvvYgQedWU1wO5M2c6xH2c2XoRmGBfwC
 2n3L5bE6GzvxcxY2kaZEnqWWhRk3RBfG2Rl5Qbdxjol5dN6qeWHsX6DJUNdOoanBfHqFh0tZfW6
 j8wZ1NalsCIUZEWzcYtVYOf0b8JxuV9BEXP5Mn2JGGajb9ezZGxyzI0AcsQV2S+5sUFdi6nswcs
 l+QYoLgwJOVhN5AdGa76gIhZR766OnlGP6bHTTuJJYZsHjp2kxPZt+TyHLv/8BYS/4luhrDYtoz
 I7wAj7q8GlVYmypOWvlfGryzrIvtWK7UlfbxIHJ6bYQPsfPgdFe/53PoyiDL4jd+L2WclYgIk9y
 O1tFfSke1zhsV+8kXUMhvtMjugBSY8pdcXSQRkjw4acjidwQvAEoUL7w+pijTeY6zS3yKwf5V5y
 +3Jj21W5q12tBuKJ1qGKJNWfkNxxhjmpCVo1n5oXie1oZAEs3XbNefRhafMjSuNq8MmiH9crMXX
 kXlyXZNCRfJ02xw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and implement the .function_is_gpio() callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 9 +++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f713c80d7f3eda06de027cd539e8decd4412876a..bb1e5aca058fc28c3cc823876c8fe7880d66b6fa 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -286,10 +286,19 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 	return msm_pinmux_set_mux(pctldev, g->funcs[pctrl->soc->gpio_func], offset);
 }
 
+static bool msm_pinmux_function_is_gpio(struct pinctrl_dev *pctldev,
+					unsigned int selector)
+{
+	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return (pctrl->soc->functions[selector].flags & PINFUNCTION_FLAG_GPIO);
+}
+
 static const struct pinmux_ops msm_pinmux_ops = {
 	.request		= msm_pinmux_request,
 	.get_functions_count	= msm_get_functions_count,
 	.get_function_name	= msm_get_function_name,
+	.function_is_gpio	= msm_pinmux_function_is_gpio,
 	.get_function_groups	= msm_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
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


