Return-Path: <linux-gpio+bounces-11736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C569A9A6A
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 09:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 120671F221FF
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 07:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065A3149005;
	Tue, 22 Oct 2024 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sC+4m1d7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5405148850
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 07:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729580553; cv=none; b=G5Qj8JYETRpBNge2Ld63Q9in9Rq1sZLAkEblvMFaKuxpIA2b3OqNMZNJJBbIVcof2i4brP3hwCOgJ2sCLVxbF/QN0aly1S/eGKwRsq9nC9XB4DOC2orKuv++A0VWMGQNRCP18lKhw9mxXNfQX4SkntGx0KDkx1q2mYoXqu9BnnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729580553; c=relaxed/simple;
	bh=6yecYyOl1XB2jG57eP+Oz/q1hh5SmTlw7UfAwz6faEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/JoOx3hSqOGG/aRJrPf35KLUpPnqLw50bgdqdTVy2aLkUL0/A3+NTA+K7ceLdzMP3ZQfZ0O/ZpeAB+1hONGOn8JqafLsXTbixVJ9zFGSMVouMTeC5uNdvNryR/rm6qLkLNOsgf3HeFGhtQIMrfz/a1SHXM25k2Ct4YESUx5Ujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sC+4m1d7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso52591395e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729580550; x=1730185350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8koonOFHMpNQct0lsg9ojQqYmEdXGsTEtJwnJC3hKg=;
        b=sC+4m1d7XjmB1INcRVnBe3dPNnKsgJ+/2SbCA99GEYyapW8LKI1AXgXRDNJt/GEHe/
         W+vbYfoxUrgNUbcJ8WWNl/BuXNRCDsDyx5beILc815DKLgE6CfKn6T/zF3BzW4Ea4c0x
         xsIIUG5pHYxHfrUhr59qXUTWgUuU2LfdGyysHTQi/IYAnS+uyGuEyrMI5wYnQoDwDZ+H
         4Se/Da/CMGHRA6GerjUP6vFo1US12JPoWBqEtJzyS4xoxu2HKWJMMiRH+hvAmNK1MfrP
         f/6H0O1DHBnMySub8PUVjLCjT/0NRHybrIUt3xwEPsxGKaWSBmH/JHzZU6k+aof6X9o3
         npGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729580550; x=1730185350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8koonOFHMpNQct0lsg9ojQqYmEdXGsTEtJwnJC3hKg=;
        b=XV2T9+pf2adm625EAx6R3QHr1uMwENwU59XRLYcWdkmfoc90raysldIlR/r5To4Syf
         46WazP/xvqduZeLOuxwNLDY4i2wYGI0ZVklW4DnaihfX5qdv/Zcm/kebsbBpBI4ioFBQ
         2anYwLdq9uuCmBFFTnZt0LjD9shmbtBqciYJJ0x2WaupenpFVYydxUZZgZZBINRJo/Ue
         tSmJE51uT7CuZXdW7VUtgF8TntbPZtgTAvFO7ju80eAWyTUZ5fFxr5l7KWWWINrGgOhV
         S2w6BHfimHlK4AHZWIgHvHgHkakQcRcah6BwFwCv/E1S25TaXHmnJYTlyexVTPOYgHCr
         /jbg==
X-Forwarded-Encrypted: i=1; AJvYcCX3irrYPYuJlD6JyLuKiC5yrnBjclw74DJbXgmXA7A5EKwW4lsJLUnpJQwNbwatF9d6FZSD8CTbO6j/@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1omHJPokaEgDcE68PndXbbdsdJznVHDheHPcROmIldG7f5X5
	YwJ4GSzuQrVvpLijJiVUTv5OS+3WzLDTMarqlZlIgp+bKHy9fyxra1/hYHXX7bTwY3PX44DnJaQ
	C
X-Google-Smtp-Source: AGHT+IHHjMzL2CELOF5eKlo8H/OxbG8pguXv9wwPUxUkPxvHzODR6/5t89TJdLp0vET/tnjFDI7ptA==
X-Received: by 2002:a05:600c:4e12:b0:42f:75cd:2566 with SMTP id 5b1f17b1804b1-4316161fb3emr101668015e9.2.1729580550007;
        Tue, 22 Oct 2024 00:02:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9c8b:c7e5:66f5:b8f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b943fasm5924904f8f.69.2024.10.22.00.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 00:02:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/8] gpio: notify user-space about config changes in the kernel
Date: Tue, 22 Oct 2024 09:02:27 +0200
Message-ID: <172958054405.6877.3533239060881386816.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 18 Oct 2024 11:10:08 +0200, Bartosz Golaszewski wrote:
> We currently only emit events on changed line config to user-space on
> changes made from user-space. Users have no way of getting notified
> about in-kernel changes. This series improves the situation and also
> contains a couple other related improvements.
> 
> This is a reworked approach which gets and stores as much info (all of
> it actually, except for the pinctrl state) the moment the event occurrs
> but moves the actual queueing of the event on the kfifo to a dedicated
> high-priority, ordered workqueue.
> 
> [...]

Applied, thanks!

[1/8] gpiolib: notify user-space when a driver requests its own desc
      commit: 49182c87af377ec4ae0a5e116a9059e03b083574
[2/8] gpiolib: unduplicate chip guard in set_config path
      commit: dd26ffaa4d278d6e538c4ea68fb508a69f567827
[3/8] gpio: cdev: go back to storing debounce period in the GPIO descriptor
      commit: 81625f362497509526a2f9ac53843ae30b4709cc
[4/8] gpio: cdev: prepare gpio_desc_to_lineinfo() for being called from atomic
      commit: 8c44447bd76109e33a69fccda89c84715fbd5658
[5/8] gpiolib: add a per-gpio_device line state notification workqueue
      commit: 7b9b77a8bba9c1fd7bad3310dbf2cf382e1f8c25
[6/8] gpio: cdev: put emitting the line state events on a workqueue
      commit: 40b7c49950bd56c984b1f6722f865b922879260e
[7/8] gpiolib: switch the line state notifier to atomic
      commit: fcc8b637c542d1a0c19e5797ad72f9258e10464c
[8/8] gpiolib: notify user-space about in-kernel line state changes
      commit: 07c61d4da43fa3b34c152b28010d20be115a96db

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

