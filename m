Return-Path: <linux-gpio+bounces-28398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 244BDC529FB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 15:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 930454FEA93
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 13:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81CB33BBC4;
	Wed, 12 Nov 2025 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QS+2BMr8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830E33A03A
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955756; cv=none; b=m/cK1KB3FJh7GkIFZN2MVnPTD0oCu0zlecCyfwF9LXYlPCWy8biRcR+2Tv6KUH5wQTijR+Mr4SYNy6K4lTbE+Z6FjPBrIqza3cfpHdw+vwfQRpYUJUw0EOt9Hdu/bl90SQ2Akm/rt+nYyq7wZMPMjEQMhBTnQ7+KfM/++r+qSRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955756; c=relaxed/simple;
	bh=pMVIDl094hPPBJ3k0e5jfhRoS7U501FS2T88kBd7i0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KmZlHXPFBo8RKLKfBbmCY0+YZPRv/T9+gRn0/rBcx4edCLKvmfuk1PSG9/jZwbUIHOGtEXKUA/ztKT1N5QU+m7jiirVXBJvZI8uEZsJq96tkuJhPXzOPt55gXM0DSHWxmAMoeoQ7UixIuCDkdICsVep+1yWbJAM0/+4/tUsi2Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QS+2BMr8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477442b1de0so6165955e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 05:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955753; x=1763560553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqbaIc3KaZCmVuB7kqLuKLKtHplI0gVqS2YvAhrL6C0=;
        b=QS+2BMr8zwL0QqE6FRda7pLvxTD0XVkuKZ0vmbHn6+h8WNcTepnkta+ORme+Zk/36J
         572lqLKqsGnX9siT+ht7pUbQv68fRanbdyWY0WLtL7cWYdDn/Vr7OoIo1Qg+MiVS0U0U
         H1d0lqVhku3BLFEzndUceItzk6x+lFn86p2SOMCfDbr0FdvND4SzmfQWxkBytcD8rwm+
         KYH2GVGWbZ+2WWwwl9A9xKxpV3KnYg369MbItIm5NwAla7PoOtBSktf/JCWoWMajGZhn
         sL+/j/M0t2ehzE1P44uWaKNv+jN+xD681gSdqcUpGTZccBmWE/3nbDz/sWkJqGz7d4V3
         kH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955753; x=1763560553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqbaIc3KaZCmVuB7kqLuKLKtHplI0gVqS2YvAhrL6C0=;
        b=tuyu1rWwlrbThHmcKIok3/cJ5rT3IgfVFuPoEvjae2Bc/fystZsYB6MixzO7+wtGnw
         KbzOrZW0WK9nY0O7zOIyCLd4waDOz0/2c/YhB9hdi3jraTIFtETcX3++wjicoZsUwBoI
         M5FYqAbYOlLu6qt30X9KfBfkHI16/AzYrLqxDRziTau11o+fctpWMOZCEzJf5PGYyoeV
         wCtid5nhD9V6QkNXnruXvolvSHbIaawXQM+0kXyzaWxn2NpvcLALIE6ZYb5GwM2uGBsx
         Yc7o+uB4u6Hc9EQQUBVgcOoY/KwOs2PvXQC/TSHkOxp2e3DrlZBD4iJTSZeHdDnQ+bZl
         KGdA==
X-Forwarded-Encrypted: i=1; AJvYcCXJRRpc74YsIl9EeDTknTsp0Gl8vI1wa/3X1AdaB98mTaL7ZZ9q5Hx1sXi1Uo9xe3NTJh9EL7qlOUqC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+l54VxywtdKafA3GazsaAXJBpu3Vx4FgVhCCVOHxoMS1g8nGZ
	nFqIqsrG8YLw09cTpf49W+45jF7O00x9DjTrhXx5csAnLq/xEAUsXmzU89tq/wHQDcE=
X-Gm-Gg: ASbGncsSWJPQzPHG4fkoE/rULMe+0hecZaRbw6bSFJEPQHDOl+7IqGsSDZ3cgogWuDX
	FfbkaVShTVnMVmsPcDYu5/zRNb5e4zAvi8qexuS9ozOvCrI9qKBKgmBxXtNOSoVnIMsHOTdv6gF
	RsftwE/WE3JmcNWaZ1js8oR6wWrnoiocJF9/ztX8TXWkh+oIYuHyFJKBoUv4jRgYrQp/GZ3qYsx
	wLSLiIv8IE9riaQBTrZbqvs1WZqNWFp4zt+3GeRJ/YoAlbL4VqRq0C9us/vLg0qzMIpG0M0ko+9
	b7UOahqzAwEdnVwVIaP5lnN240jc0jG2Dhu4ZXTkMqo/GegZARfQ1pB3I+adT876E1xqML9XlmC
	Ar2vysLnmcL/5DiFfLL/4dUqDI2qKRmf7eC6juPSmIPYaZbN54uzoNfxlqONnrb91iVs=
X-Google-Smtp-Source: AGHT+IHJt2UAXPW2MhXPVBBMI+uiCZQQH4pvDWU/Qe5FJx2daMpbRe2y7K/kRKjmxJ4TfWX+tRiFBQ==
X-Received: by 2002:a05:600c:3511:b0:477:54cd:2021 with SMTP id 5b1f17b1804b1-47787041346mr31124405e9.8.1762955752566;
        Wed, 12 Nov 2025 05:55:52 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:37 +0100
Subject: [PATCH v4 08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-8-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5tWrLPzClpmnMADJpWcVY10mVN9q3Vw/ebyB+WPO3Cw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHXDZMnwTAKRmvdN9vLJzwjFFiSdS3OXohry
 PUdZAt0JWGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1wAKCRAFnS7L/zaE
 wzUMD/wJ3SBi0tLbJfLHaJhap/guD7pReEjnW/JOFDIC2yq5EzUDFEcY2ViZzm0g23lmQuNDYfK
 A9dkc1Mv+1lDHo2WyNnysll2axbhGj5aUrn/CRjyhAP38l+zWwE1lmSO8/4QorZVdOBbmKtqgs2
 cAh4KcGjmE3UCT6hw+o1H2Y9P9CjXJR9elZ1tGxe/rhxV/4AZcVd9Y/ii8edu8RxZ/sRYhEk5WM
 fRMEOqLO2vvrStmWdHmJVvco93x2yBlOM8nGDFyAfbus7MnFkbt3/oM1bGOFNMdljTdqAnmqduW
 9w2n4+muj0DODSDmbhf5LxohVoIe4YjL2osikP+z32QEPd+RH6u1WwW/yNKHWsCbGjxiZYp5ySw
 hukbppWtOdg7agAmIeium9gbFu92bYTi6faAUI6gElRB2ZpQxJX0w0K7vBLYk+yDV+KHtZwzdeA
 dYffKpRViRdgesoFBEq4ngvfCW2BXb6Igh6DGMUY7oMiWxZhzSVXJJoUq+3k3a3ly9r71Fd5t/D
 XwQRIape22DdjWtcBS0I+N3YZ551F3dIYO4wV89vQEqxGyIpGgKO8fTaDdg0vGfaz5fOGjHuyiT
 4vcee5JPb+QUHuN3nlCYmBKHKr73jH+0N+HzpMRJZftovkFJRJqTD/ScNSWk0I/RgCE8u/APQA8
 6yW1XuYbXdH+Qlw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index e249de7f91d91f8c7f1e7020086cc65c71e64c5e..d7aca6567c2de1ec36e9f36aa82463bdbf3be27e 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1112,8 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", 0);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");

-- 
2.51.0


