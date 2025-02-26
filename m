Return-Path: <linux-gpio+bounces-16609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A5A45B6D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 11:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A40CB3AA84D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 10:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F151724E01C;
	Wed, 26 Feb 2025 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ufXRY/Un"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AB42459E2
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740564760; cv=none; b=nXJtZwRnJowKRlT96hOX2OZtxZ+RHIZ8bXotFFwMvan9vR/+S3M4zt28oM/u2DjTeT1HssFAZ2aQc/cvCW0xymCrFq+iPelx/1zCZJJ7y51I3veJFiZiCQVSZNRVTqnNl35jhEL8fmlP0MzxfieDT+aCorJhs+eWYZvE4bORH9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740564760; c=relaxed/simple;
	bh=AOtsqlOUd+Q3nrmqeeuq8/tgBq1NpytDTQzjNybTiww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=plRYKhfggwS+/6aYiT6ZbpqM51hK6JuajqSmk6Uv8FlJNJlCiuS+Q5vU7N7L3p4g4wCuxOhltGkP7aWDWX0epaxqGUi4DC3xtV9EdPqaG/kUF2jaoPo2zSQhoalPyo/7QQ9oy0QfFOczWKmCAFs9k9Wv41BuLOJUywBt7Wyn02o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ufXRY/Un; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390dd3654aeso147605f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 02:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740564757; x=1741169557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gf7zrHqAdgnbRAeeIHqjXUoytiZ19dAcrK1RDj790h0=;
        b=ufXRY/UnBPhppJT5aYf8fpuUhSmUHQT9sjD5sOWAbT8iMae54twrfJGmBuHT3Ur2Yr
         k56fuzhMbjuLk5+ok9Z2GnCKxSVVOw/n/c7CiEGFbvRR+vj3W+/AlejFLFaJhWC6vIhn
         6J1SSsAdzECZkW+mqMIRJ9dWmE9J3cetj1L/LPtlQ7Pyfjm8AFzbZXHFGt5znNt0E62+
         PqZg/4woy5R430X0p1xD1xwvQv9qZTm200ZPg8yb4nocQdJNKnCyoqswQn3lP11HNNS8
         i4kgataGulv6s6WItgFwAvPO9GNYJwg7Eo1VbmVJjEOUWrnLW7rNwEvLRqzMHxVTCm1G
         jk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740564757; x=1741169557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gf7zrHqAdgnbRAeeIHqjXUoytiZ19dAcrK1RDj790h0=;
        b=CZCWdoR/27+TlTz8xmjtcn7KtA/xD+QM6p6e2yu7l4kZTp6/MefNaCRpJdeb0YoBha
         Gm8hYrJ3k83Cusvxf+GkIT19qJImgojbytoHR7Zw5cc0coZQdKD98rpI+m5ZX42ot53U
         65kK3Obt0CIWuAordlRk/nt2nYQ4v64i9aTA23orSwIa276+Lm2kia9NhavNCjCiAb++
         iKioO2zpPqlfISEyDlW5lw+yMKTLb0wlmPQRJssGZ00AcXZa8YYniDGuKm9cqOBJIhy7
         YrhKZiIOGHBk87mXOnzo3bbrdMi2KKS4GhePRFdejduDqDnWma4PmQLkXNJylhHjKCIH
         4MdA==
X-Gm-Message-State: AOJu0YzKdchhH1Hy2f8zaXfxf+IYiIN8m9Vv2qxWqLZ6vz/ghMcP/5qS
	cd0KicVj5fRokG6sxynGoFIBVUzewX/TgTK1ofumRZVSgMFfNvCyjc04UCixq0U=
X-Gm-Gg: ASbGnctXj0oPH+uZ61P73qWwGaPBsIgfu0E/gvAoS9WZltIk197bnOZ06MWAyIiurr+
	8+lntAgd+ptR/TLuWzUWIuSqemWEJ14DXgVsgHk32ZHdBrZaTlC7r3j8eT97Ygs0wrXtKardMeV
	a44TyclCwV6yZBkgtAGfnHhtbkEBOEd9trozXPwjeeuLDkBnrgGzxxZJJxSFD49TLlnhGuTXM29
	CVYkRiUMAJ8Idx1p3ZZt1QBQRVrnp2CXCRZreNK1gh0PWf+ofq8+uO3xE+SwuSBckl6oVs2TeHe
	qVOXcfxuv2AZRqul
X-Google-Smtp-Source: AGHT+IGEaNiDzOSieP71Ur9Z89WNZbFkGIfzR9lLcxLKiZmPznX1O0XMm0LCjDQo7uBizOeM3s/rAg==
X-Received: by 2002:a05:6000:1f82:b0:38f:2113:fba0 with SMTP id ffacd0b85a97d-390cc63cf15mr5755133f8f.50.1740564756809;
        Wed, 26 Feb 2025 02:12:36 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7d02:26:5770:658c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390d649cd17sm1483971f8f.79.2025.02.26.02.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:12:36 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Feb 2025 11:12:30 +0100
Subject: [PATCH v2 2/3] gpiolib: use a more explicit retval logic in
 gpiochip_get_direction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-retval-fixes-v2-2-c8dc57182441@linaro.org>
References: <20250226-retval-fixes-v2-0-c8dc57182441@linaro.org>
In-Reply-To: <20250226-retval-fixes-v2-0-c8dc57182441@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mqJk5RX1yeclgYqC4arydwTfWo3zYHbBnoSeksuNJvk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnvukRgYaEPCh7qqnfMzCFxviPlkm5aT7bVUnTR
 +XWoAPxKAKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ77pEQAKCRARpy6gFHHX
 cgRqD/9IhwDCta6+RtlkqzzyGimA0gsF8Sdeb8/gADVc2d6rgFwk5/c1NICXL81zhA6U4zjsVF8
 DcKKoiW+WL/i0Vshix0yPqX5nP/pRFkyAd5vwujmRCViUuuzmKiag5aISU5+AEJGk8mltndzjBY
 Xu1p/oi9DVloQDygDH/UKPTcqzBx0/lWF5GR8S4tnB5W5vWzq3JOyX86H90F63BuLOl5Qk6YPJa
 Z1H15WJXbrPipUf1cuVlNP5VSrpMNgFFndUg9CLbS6++WCwmr+ExMcM3TUzw5TQXPheGadcqoh+
 2CFhshj6e2atxYB1UVt+HzykZsb/f0Nfv8AITpgWroa/xmM+0gxG3XcpkrKZsWShKmpptxtM1Ja
 snCIrRVHlHXL6tt49NgFMQSzNKj3cDDr+57Lel2sUChD5wvwgpPReXH86jRk/PAi6+f/1al5PHL
 dWVGLfzjRBPJ2Rw3SaoVc5ZTMcGmp8s52v8q8mJVibd9p2XUkD1Ijue5yqc7eiGYnFprwIZlvaH
 to818oa3445E3pwR452lDP+qNLpaRQv+ZJHvg+bJWRcoji9XZCyVgjj6lvXTgEkMxvYEt+kuxNK
 igGKicPIWU+s3dJwdUOpwf/naSnfhVP1MN2ZO7f/Tx0ZAJaj7/TI62MnA24MFp654dYBirR2fe+
 MrEh95t9BZnBayw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have existing macros for direction settings so we don't need to rely
on the magic value of 1 in the retval check. Use readable logic that
explicitly says we expect INPUT, OUTPUT or a negative errno and nothing
else in gpiochip_get_direction().

Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Closes: https://lore.kernel.org/all/Z7yfTggRrk3K6srs@black.fi.intel.com/
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0d325cc41af3..6f4efab237e6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -352,7 +352,10 @@ static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
 		return -EOPNOTSUPP;
 
 	ret = gc->get_direction(gc, offset);
-	if (ret > 1)
+	if (ret < 0)
+		return ret;
+
+	if (ret != GPIO_LINE_DIRECTION_OUT && ret != GPIO_LINE_DIRECTION_IN)
 		ret = -EBADE;
 
 	return ret;

-- 
2.45.2


