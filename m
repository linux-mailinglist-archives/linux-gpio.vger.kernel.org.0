Return-Path: <linux-gpio+bounces-23333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB91B06988
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 00:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49B68567AD2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 22:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E862D29D9;
	Tue, 15 Jul 2025 22:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZl6S30+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3E288C09
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 22:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620320; cv=none; b=FNnnxQSua6EbZvfXVnJpIBrM6v0fVKJOZADKNMd9ET6m5FOHve29XVG9/RUZNRifEvvRqzmOne6Xq4iruZig+nje+/cXzBkgxf2G0zHxs5APCs+99xX3Ua/KVAkgQKu2KR8RiHy2UQqGPI+Aflc22TDOc7aW23E1D/MCB4iEJqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620320; c=relaxed/simple;
	bh=YfJndeDNNKb+DJXXBEqntPkbEm1wX2h/q+7NcWAA8fY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dkov5fVyXRzxrTHNdguF+HfQ3/FwwShTXG+BzER6XWmYezpPXOKXg2/EltcDCCFrh0DUohnbMl5Sr17im8HSqNjr1OEamlnZJUFWNJbJBsOZrlL6oJUhFARpM27wpI9VeMPqlF6/O2w0t9bcdbStclekF75gOW0MAcE8Lns2jes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HZl6S30+; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-73e650f3c31so90704a34.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 15:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620316; x=1753225116; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xd3z62QSYDNQGGQDCwZHy5uaazsJb4z6l10vr2/CFsY=;
        b=HZl6S30+ktLwy15UZ9EzV2Zvc0ixJsGWZLmBbQQYDn96YEuFBmJ4wbNQhWmSdyEjuT
         42ueNpfQ1LPvRmq8d6A/vd4XRr2vqEv7hNLC+0sJECUZ8R4GqG8GGsOkW0uD0TXtG74p
         dH1RGc52zY3iy7awz8Y4IrFBM69f4dzc+5r+xfxcT1kLllY8FVUnlq4FxZTm5RCbZljX
         My+UEo9FcwgBI/Cbp2Yxg9dwAvg/Nb9vI040lcwUKj8SDp4BpcpS+Bwa3jU/QVVALhCF
         mbZiiYgh4iQW2a8WM8sZzvdem/vxYhlPTRh+NkrFjSdtfYpy9Ua+Cmefo9fTg/dA9TDQ
         /tPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620316; x=1753225116;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xd3z62QSYDNQGGQDCwZHy5uaazsJb4z6l10vr2/CFsY=;
        b=aqTmcY4sddX8HSJV84wh4h888lvdVWxTG6x26ietfMcaCzAJGNsYvNh/AQnbJkUNtb
         YpovJhBrFACrgookahuhPzTSN6D8xyg+2qprMMN/FdBjMARLPACkMfgpDj3DSRXP/95+
         0hERAYGDXglXT8SZYqURJNVPwDnjNvlTD0OQX/8UWeIZJJx8Zij93ISbOpYnVnDkO+Xt
         jDhBBjERY/z1TYMlqPQ2a6jqdaq8RNkPO9L57VJSBMFqV/SEfHGXVKGD2FthlW1uQxFy
         2R0e1jqF95YmhGbsuXwux1++2uxyxid1bcObhYZCyi99ZsP8Y/fC+wSMEkJySqkAMeSA
         4+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7AOi6dkpbpN0eGUsmbAk3+Qux6/Kra08wi/0nKyITGSpfoC+i7x1hir2arvEAWW4BPZq8o6ER6YZN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3rV1j3IpiCI7AkqA/cERal1QcgTjx08mpQ6b0cHtQxLBosHQB
	GiWwaRXcVeXUNTkZoW1Rqs4R0giNustFSxvM/PppLtS4/bqZItWiV1fIL84c4QEPHRU=
X-Gm-Gg: ASbGncusTWHoA7+szy3nvW6KYdAj4tgY84YbjYjmC8HK50YXSzCcXXFDLFAPRWQXDu1
	vcqe6qEm96qal9V5VaSub51lCU9k0cpvJKvsmDTZtZIfOscgauU3UvzT4B75jmxaWEUMTyPQUKW
	IlsqnOeKr3lsEVQg1xuOBjRddYv/fM/uAgy40DJlYErssjRjEL5ENu9CboUWSAleydOnj7IzcIr
	b0QYvcrqMOg3KCcKz74+gc+fONo3fGWk8146spSxAA+4yQlpmOh2Vx5MS9hh6mYFTJ6Ef7bVV/o
	dO9jSJP4BHFeTxK/OQfWbGWr51RxbkdEKtyf4upRLQhEzwMfbRfa1Yatg+2NFfgge7gWaH9ekM0
	AYb6arGZoiHWtnT/FuOVKB8x75Ssn/9zWT55axUU=
X-Google-Smtp-Source: AGHT+IEcnMLBH8gdjj/v/BIDdQjlwnkJ7S/ATCiix0YyiZQNd6IC6FrB4fBrsEE6GWebz8GXYY4Ntg==
X-Received: by 2002:a05:6830:6c88:b0:739:fcb4:db1e with SMTP id 46e09a7af769-73e64acf237mr791454a34.20.1752620316602;
        Tue, 15 Jul 2025 15:58:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e63b94769sm368296a34.21.2025.07.15.15.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:58:36 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:58:34 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] gpio: viperboard: Unlock on error in
 vprbrd_gpiob_direction_output()
Message-ID: <9e72018c-e46e-4e55-83e4-503da4d022fc@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Unlock before returning if vprbrd_gpiob_setdir() fails.

Fixes: 55e2d1eec110 ("gpio: viperboard: use new GPIO line value setter callbacks")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-viperboard.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index 3eba77f981d3..e8e906b54d51 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -378,15 +378,13 @@ static int vprbrd_gpiob_direction_output(struct gpio_chip *chip,
 	gpio->gpiob_out |= (1 << offset);
 
 	mutex_lock(&vb->lock);
-
 	ret = vprbrd_gpiob_setdir(vb, offset, 1);
+	mutex_unlock(&vb->lock);
 	if (ret) {
 		dev_err(chip->parent, "usb error setting pin to output\n");
 		return ret;
 	}
 
-	mutex_unlock(&vb->lock);
-
 	return vprbrd_gpiob_set(chip, offset, value);
 }
 
-- 
2.47.2


