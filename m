Return-Path: <linux-gpio+bounces-21684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B16B8ADC5B6
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 11:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A4D1897F93
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 09:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8B4291C0C;
	Tue, 17 Jun 2025 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v/0UHZ8U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D35A290D9E
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151236; cv=none; b=IM3dJkEJFoggD7g3cZTD87ffb/yG4ms1ql3MZQFtWmlOH9eVW9oZeb7CgFWuqMhjvrY+0Vp1viJOjKDSK1/DMQXxQQPlMdApufuR7LUuZkYl6DnCi1s4Cdg45QIyqa6KuIhNbNDWJKn4Hj84+AQdQHz/j3qqJB9++n3YdWJnxxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151236; c=relaxed/simple;
	bh=xxgZ7R/ukDFm8UgWJQf1d2zRkqYHl3X/OWibR2cLpqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KIqsVxaZZY9qnntXQceuIxu3P04yt5EjT+DCpWS4HG9MVBrOFYckRT9TVZIDrgCTxgKFfMUhFew3bUnlqmpwRV/FnWgW4RonR2NKCS9suarE9KH7nuIKK4Dr2laRcFGXGImVcX53RuXgzP6oAzH0VPSQtMncyVcQVrjcnp2MCN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v/0UHZ8U; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453426170b6so15507975e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 02:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750151232; x=1750756032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8O6+umHZPO/Ii67p4kZdXXLm9+0GF0Bsp3J+Rdwo5s=;
        b=v/0UHZ8UmlgwN2h15PhYMLo3UEX0Jpnt/SkcwO0xg7XPpWPdtuzPjaEGpYLrws3HB9
         4x3XpSzegORKNxruo8cM+E/bmxl4/8OyP3UmqCDGG9UGYraztXAQiCbeFqu7t1wUjlnK
         DHX3oEAyP9ddrHdtBOR5PYzNQHcccd0zyrMB4W6hrLaKGjjeu73V8w+qCyShRiSRr9cD
         kksCsIKGpiWEbNLsqgx2D5aorep9LchyxUbzZPlL/qJjZyP1XMuBBIGk0BazJcAK2e6n
         s4UJDgMkgAu70VgQCogUxRa/UTVvdDtgmmUsqiOovCx5GWMjeDfqgAhLnvGhi6sHoNG7
         upmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151232; x=1750756032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8O6+umHZPO/Ii67p4kZdXXLm9+0GF0Bsp3J+Rdwo5s=;
        b=M1XGIuMTlWdXYsRiJ0h/NPf1LoqgcdMQHSlbTX72N412UwRQO0n0em33MhPG1v/xjI
         2S8g+pAOXFQTR9tstsmZo686cP8hkLBo8pYU1hAPFHifC3r7j08QjoYg+fdeaS9Lew7U
         YAe5uVI3SiOmqNq4FEqznF1t21xbcpOSy+lq76HkC9UNe1dtkOWdnpb9HwsQeHxF/JDK
         jLp3cbgQlt1MRmQDxaIotx0tjRjGJ8BVBwuBZbGOtAFQOnHSAG1EINn0f6CkYgYKwX7L
         HfmCCDVl9Y6qnpVxq++3n7BI4aeEU3HQ/7M6metVLZ1qdFS5IvDjuDoShqEUSZdrrj/U
         NDbA==
X-Gm-Message-State: AOJu0YySbAcfVeGCjqm84plSj+xBL4jvveXClQsmOwwcW0MnQNwg56Dg
	iFrtcBfRNu11M428klNWlpETlJK9qEpOv+E853mWME1HQSLBxCBPaNnKx9FRybcS5jWEMXsfzzc
	T2PeXtzY=
X-Gm-Gg: ASbGncutnd7trBCq7qYld9+sP/3mdk/Vjq8dpP7IfZvx37zlM7OvmfdeGwSO/94HGJU
	Cw0Ic7ywGn8InqbootBK8ap+wZLeSJ9sN0YTklk0OSFPD5lWMxfvpgHvyU0cLYcbKR4Br577gsF
	WTQdqcHZMxFCD8S1Rve1J0dMx0qDd19drj7eZRI6Z+Gm9l4N+JxjrweoAfNGUH/NBFxggalDWcw
	CY/kXoRol5Bc0pP8EBtpRKhBnW/ZPGgBJ+ur9y2BS4zeyBKEeII4ucQcownox6wF94v/6l94K8e
	ojZ7rqmWYKlqasw5qaQTj544yRfp6j7IbZ2Z3CPDNWdCRM7fnT8FAtT1rpsCQsw=
X-Google-Smtp-Source: AGHT+IGGnLF+aL3LK+xHmsD10MB4lnkkqmE1vMtMPtoum903Wlqks60RJraEkuA7LpVAWBl6qRxRMg==
X-Received: by 2002:a05:600c:8587:b0:44a:b468:87b1 with SMTP id 5b1f17b1804b1-4533ca0a5cfmr82676745e9.4.1750151232139;
        Tue, 17 Jun 2025 02:07:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm167213005e9.24.2025.06.17.02.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:07:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: fix wrong error probe return value
Date: Tue, 17 Jun 2025 11:07:09 +0200
Message-ID: <175015122727.20962.12230915650495330768.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250616134503.1201138-1-s.hauer@pengutronix.de>
References: <20250616134503.1201138-1-s.hauer@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 16 Jun 2025 15:45:03 +0200, Sascha Hauer wrote:
> The second argument to dev_err_probe() is the error value. Pass the
> return value of devm_request_threaded_irq() there instead of the irq
> number.
> 
> 

Applied, thanks!

[1/1] gpio: pca953x: fix wrong error probe return value
      https://git.kernel.org/brgl/linux/c/0a1db19f66c0960eb00e1f2ccd40708b6747f5b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

