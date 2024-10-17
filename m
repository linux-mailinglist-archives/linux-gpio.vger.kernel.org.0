Return-Path: <linux-gpio+bounces-11499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8039A1B3A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 09:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 254E928B1C0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 07:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E79D1C175D;
	Thu, 17 Oct 2024 07:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kHu0Hnax"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0E13AD06
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729148526; cv=none; b=ZKyDDQj22Dqy9YyzPN3/rhRfJn9S/dbOi1isv7y4YLHIybPS6GifYUhqSWyTHMVof+WP0qd53vbc3vDb6tU9sR3DndQnqBx/UWNwT9wyR1kYIBzQTotB+EAFoR/95agzXIoH0SnRJMOS/X7FOYlp7kICrPzVrP0o5s+4636WabM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729148526; c=relaxed/simple;
	bh=RxcMj/0qPGt6mDB9MCuwaXsTsXlPnXTHVMsX+z+lp7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mkHz6WuhWHw2h8Qn+D/XIUXMnJ/3YqnbKmq7EyK9QOlbl4Ik8koEgh3kFRepWZrzkvnRtiEV8kfBJUlwoqUsJ31SzYvcusNGG3vMWgoyOpmQYwB6TKyQiIrLamqSPSEW9iH51e5ExYpA26Lp11kEVyGWHiB0/n8anGRaeNfDpuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kHu0Hnax; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431137d12a5so6238015e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 00:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729148521; x=1729753321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjX73oMx4ddUCrPRpvUB7TilyAiWRns2IE5CciiqnPQ=;
        b=kHu0HnaxvSjJtpkdL7Y9R+Q1WN515iYsgmr0kX15YwtXq8hjFhyBt92wwdN+Zj3D/V
         VUcD3mZTinDWtXkyHMnaMYPXwlYMX3b9gpgTwgEMecNrJeUUrvc/FfPYTwOndx68F2Ql
         XorQNbsW+SspLzjZEbaXvo/ubUCxS4vpcAYOfL8Nr069kmS00JY3arWmYhPJ3WsE9XV0
         7NiOanBNtkCJnBahy4aSTAJ35fZcHcMjCwvri9b0UuxcHcwH8v58iCop5OUe6BgLL76C
         888bjgnx9k4MilKflaWhzSMIl7BpYCFW5F7k55Ds3gY7u3rCRc4hLj13Uq/0aEivCJ9L
         KFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729148521; x=1729753321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjX73oMx4ddUCrPRpvUB7TilyAiWRns2IE5CciiqnPQ=;
        b=MQ9u5iynaTOZzK9muqMUzWDYQVaIH6NLHQBlLPvnlQhOdDSIs/3zLQeqWwaNUPwb53
         0rex0zFb5l6ZpKXkRSOdTK6LWv+6wWsxbT9hpTXYjBH2zcNUyM9VazqXJBsJlVuKx6Xg
         Lpdg0KFY5nk62nIy5TcN2SxIkxQ8cbfW5W3Q5eOsWCw/56Pcu/umJigGI5KATmuwzaXN
         dlAWBoHMDVSyiAfUB6zF9z2vxNyLyZUdgzzx7xa/JLSiQD9W4qDEUL+j6d2t9TZEhegG
         S4Xo5PhKu1Vso+x74EgZOS6gAig+1sldj6PAwQO73vq5Vq+ViK7QDEaOh+sB63iXGmX2
         G/sA==
X-Forwarded-Encrypted: i=1; AJvYcCX370Ibibh8/Dyeg38j8LEiiWekcwG1RhGySHTc68HQaPB5v+lf6OO01hv1ajW5CGDgjcyXFXEe3rE8@vger.kernel.org
X-Gm-Message-State: AOJu0YwjuB9AVxmOl/OZbiZn63QasupSIcZgtpuWigS1ZxiM8JinjAYo
	PHXgOIrsM3/W+yRJFhUE++OyjIGJDXJJDGHyQxY9lPXqS4bjI1uGXwmJBhza39ncoi3dqHwVoHd
	7
X-Google-Smtp-Source: AGHT+IFlIUu9K7Q5WLdaLDPIrc82XHjUKfakZ3962kCoW7FH3JrneRI5tvnWkmy0MF1z04KkTKyA2A==
X-Received: by 2002:a05:600c:3c9a:b0:431:51e5:2316 with SMTP id 5b1f17b1804b1-43151e52855mr34508765e9.34.1729148521070;
        Thu, 17 Oct 2024 00:02:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc41154sm6281187f8f.108.2024.10.17.00.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 00:02:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: Switch back to struct platform_driver::remove()
Date: Thu, 17 Oct 2024 09:01:59 +0200
Message-ID: <172914851470.17646.17037295305065777285.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016152435.38149-2-u.kleine-koenig@baylibre.com>
References: <20241016152435.38149-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 16 Oct 2024 17:24:36 +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/gpio/ to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Applied, thanks!

[1/1] gpio: Switch back to struct platform_driver::remove()
      commit: 678eefc1ca5f2b061951abe8ffdf290ce104dd8f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

