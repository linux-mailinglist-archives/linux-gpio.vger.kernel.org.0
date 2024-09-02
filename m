Return-Path: <linux-gpio+bounces-9552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4560896849E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67D381C224F1
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403F813D8B2;
	Mon,  2 Sep 2024 10:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="142CfxvF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A17413CFB7
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725272783; cv=none; b=CuxSZpYhzNuyx4FPUnaIQiqFkcWs7VX+turv4PGVTbGsoJy0ZoC90D51+0oOH0QV0ce/Y2JJnYZ3iL5SVVHT3E9MC9CeCnWXzt/KMHO9zNfLVRFRoALpZrtyJNBxMIOIvK+ed/0+Km+soCC7tUJYze73GwLbwCYtfd6xP50SXxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725272783; c=relaxed/simple;
	bh=BFfI9FpfzIUUD35IcnYqFMz6uCrKmc0IhIxkRuHGttc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+nRvR7NjFvf/+C47JFA1MLNyI6bVdeq5gMxVBzzzvjsQIND0YuJ5euhbejiRB6VxKscLNJgRLYfnUwKcycOjGEOcqz7G1RqD8Xfinjh+zb73JfC50Es41n4xpE5aw5nyEh72pX+7smJT4YFOoEPhyqrKAxSavkO+jhrzgtXYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=142CfxvF; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso6985731e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725272779; x=1725877579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdhTD91gUIx/ayxEiTnAVXsfq4RDl8NYrdKQ/eSSaWw=;
        b=142CfxvFvbe+EMdVWutvCO62d7hai6gVs8vR1R0Fr4qOIZXsN6loN5vX9/JdcD967S
         WRtb0Ss7GDD5t+ilp5t9YLuiPoucEgE0+YWpjkDqsoT54uIEDktlyvKK6CVaIEb/Z6Wg
         sOcm3hQR5Luz34dcAtFUtns3wL6HP4w2SvVYfCJPbxiH1nsQlii2ncKS5pggxbfArVGE
         cMJXyydPf8HQiNNT5Ivlt/oTmb2WJrQ1BsJva1EimBXtvImiti8cjFAwwGviodFyw2f6
         ZvpnGOw2CwcwGPpDtevpl5jn3WSnqoBXvv/QmK07bGeD3gGhvL7z68JRozxUUGtfekY2
         YSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272779; x=1725877579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdhTD91gUIx/ayxEiTnAVXsfq4RDl8NYrdKQ/eSSaWw=;
        b=k7+367V7K6Xho+hMqjY9qk1y3XbKJlS+k++TAsrrM6Im76YREnwbkL21I9mWIL5/zV
         x5zRWCFDd/dJUAMI298SfJohN/JeEH++iJnpTBJyB3S92klL5S///O1Hw/xAeolNovmg
         hhm/NW/md7CzuyezTSVmuMnhvFSzxzKbUkqbzPaqEbSr3m1FcCo+Hn66760iKhn8x6rM
         1TaiT5h1d8f/7yzt3YlMJVQkfnOZMm2lqaZFUwe/5QQ/m0kM1xEBK/wpRJuVjI397ojD
         rzA0eRfj6xFAf3xxC+AGJ7+UEm4cY7piLCbEl9t8a04y+fJ8B4z78FRvNaW5cZu8a5ZF
         P5fg==
X-Gm-Message-State: AOJu0YwuG3PuzZYTEvtbTwEjink4hCZjEkyjTDJr1dhKpeR6k/s5+fNP
	/2X3BjKHGoaXQ8amEmm5N9H55jWz4NaLPbgWJUloijgs402iZekSr+PuNHwPhzVaOCChLzzhVY8
	O
X-Google-Smtp-Source: AGHT+IH9DTMtOJ9FIs1C+aKzuRz2rSULKJyaElIQQSnn51mT2lijrn3LSYXHij8nULaRtHH6QBi+JA==
X-Received: by 2002:ac2:4c4f:0:b0:533:42ae:c985 with SMTP id 2adb3069b0e04-53546b2df7emr6922742e87.25.1725272778785;
        Mon, 02 Sep 2024 03:26:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbf15b9b1sm92362725e9.10.2024.09.02.03.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:26:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/1] gpiolib: legacy: Consolidate devm_gpio_*() with other legacy APIs
Date: Mon,  2 Sep 2024 12:26:17 +0200
Message-ID: <172527277542.24997.2961040710217329263.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828151357.2677340-1-andriy.shevchenko@linux.intel.com>
References: <20240828151357.2677340-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 28 Aug 2024 18:12:43 +0300, Andy Shevchenko wrote:
> There is no reason to keep deprecated legacy API implementations
> in the gpiolib-devres.c. Consolidate devm_gpio_*() with other legacy
> APIs. While at it, clean up header inclusion block in gpiolib-devres.c.
> 
> 

Applied, thanks!

[1/1] gpiolib: legacy: Consolidate devm_gpio_*() with other legacy APIs
      commit: ef2753797e31a126ead23258d73fd8d979679e81

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

