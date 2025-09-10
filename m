Return-Path: <linux-gpio+bounces-25877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7A0B51108
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 10:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2B2CB61C34
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 08:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54463305067;
	Wed, 10 Sep 2025 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LSoikkUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9CE30DEDA
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757492117; cv=none; b=tPivCghflKoK3gySCd2d/Je+c+Ekh9HOeg0XAJfuC8/fIS3LsRQL02T2RwSDPImdF5VVd5kqaXWgzpPzXzyEro7Cl759HUCVh8at79PBS2oDtvjyQTOHPI7IA16b13r0y8Lrg0rqmwxiaAs37WliO9sIpidtxWwNhde2rGqVquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757492117; c=relaxed/simple;
	bh=tF8LpkJ22cQEsJ0sRitfP7ZwvVBY3997D3wsT7ETdpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gUMZueLhy9ukmNzePeKTM3XMNA89usCkcu4Pxk6pBkF3J1eUtBiKIWmV8GpUDkQ62qkF9aUdzWK6c24DeStZR1JD//2GSpPoF2qDDFwg9iqs9OopdIT3r5uDbHfoIL8ZVbwUvm+aPa7w3pckfqJGja2RAkDH759jcSRfeknZI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LSoikkUo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45de56a042dso21994165e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 01:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757492114; x=1758096914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwU6AzP+BVSq2Of14qRAymDuhCNu7ThySnEb4q+EocE=;
        b=LSoikkUo2zJPYm3aF5ylSLw476IhHqpGkVeXF8+kTpUMJ0qnMdMvLOMBpn7Cm7xN5z
         hvedXQ4LZcgoxB+KDE7SP5GZC5S+f7JPM8q+C39f6ZXTkOsEiHzwtiFPHjjKtV9DtSv4
         KgnVlRSsVJ8wlU9jQzfwVd3rge9COxKBYlAJPOCRM1lPRPsRewNkhfD3Z8Jdyjf82dRQ
         jxqmzE1/ulttsMkKi7APfbEngCTo/aPNpQqvUn9LUXe4At4nBlUyvol/6eFBKdnYdMwt
         SV25XaRwIf7PmqfiZSaqPWPUjKyHtWQEmjmbSZZ9Xht2CFvrFTDj5djC+QD2kWuyew/X
         oxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757492114; x=1758096914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwU6AzP+BVSq2Of14qRAymDuhCNu7ThySnEb4q+EocE=;
        b=o+n/+41Q8b5QJVPdLxnSScRMoZhemoRXkYTvUi57Ygv03ZxbIHajUm9hkug1t7LUIq
         YiVXCzWytBuBbUjUajCKV5+WOzI+h0S/5PitaNzoU/8sa9Gtgxu0Qn1ee/WyBw+rx+YS
         xlSvQOled5EgAt6BPMy2FsQyN4RrDPMpmyg0oK/OcuGj7k4qPIoTjSvRV50p+co204CR
         AGa3qhLiYa4LZLnf4RX2WVr6/lUSMcB4Mt7FSCazXKGJskt+ElKxRuSBMaufjf0INSSS
         6T6VMO29Lenn1DDs+WYJjz55sOHs3V3jWAvngnCWZvc/Y8b5bxn/2/SeKF0MH1kNIwPV
         Xhzg==
X-Forwarded-Encrypted: i=1; AJvYcCWIOWxASGIZxoQv9K6+7cxLA4Grm1ttUlD9V46u0fyeDlSwIbs3PtBsQdSp84HL/Y40NNWCscFrUtc0@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZks1NpK3agMYLV65o2mRoHEatTNuLzLn/ZkkA9cpiENp55Fg
	PsBfbkNk6VOGADmoMQwtLLgrhIz2xXTdiN8+aqfncqqRXEnHL03qqh98E9zzn38YpiI=
X-Gm-Gg: ASbGncuywxUHcdP1fzEUo/t134zSgJwNEEIWPA6txKqcv+Gjq+GXEGxdOJVNRPRjvY4
	3a50QIueirSYrShboo54ZrnwKhElLWVmHS5P1pnh5QC8F408zLUs4KGr8MReMdKXqIu7+2P4dWh
	D3cPQRIFmhsNwoNpAHfCNkqwAyKWR7pZOaLmyYbpM2Xevxk0veKIR6QvRTtXsURev518rmvX/z4
	tm4V2cZvt1BUhdDiMu0eKzzW65tECbcrILNHCoCsT2MFkWac8xdomnokMMlulBY+nqE9YRBD4JY
	l1uuE2D6vFcHzGab8qZncsju2yQWEO2S7vRq5Q/ImYyKbAJa9qmJpHLi7/eA50SOSNBsrxxWec1
	rgBxeN20Dx3NuedcKjcmeZb4IWMlKAX5x8g==
X-Google-Smtp-Source: AGHT+IFe2wPN6Nmyi5ZfNourrl7iXoPp381GTFJ0zjgYb794H8ra2ZWQb1U1PKqnmRoNzo5YN4u0mQ==
X-Received: by 2002:a05:600c:1e21:b0:45c:a955:4578 with SMTP id 5b1f17b1804b1-45dde02878emr113926945e9.21.1757492113623;
        Wed, 10 Sep 2025 01:15:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df804bce3sm18650015e9.0.2025.09.10.01.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:15:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Yao Zi <ziyao@disroot.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-gpio@vger.kernel.org,
	Colin Ian King <colin.i.king@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] gpio: loongson-64bit: Fix a less than zero check on an unsigned int struct field
Date: Wed, 10 Sep 2025 10:15:11 +0200
Message-ID: <175749210857.28519.13259779376506560732.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909190356.870000-1-colin.i.king@gmail.com>
References: <20250909190356.870000-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 09 Sep 2025 20:03:56 +0100, Colin Ian King wrote:
> Currently the error check from the call to platform_get_irq is always
> false because an unsigned int chip->irq.parents[i] is being used to
> to perform the less than zero error check. Fix this by using the int
> variable ret to perform the check.
> 
> 

Applied, thanks!

[1/1] gpio: loongson-64bit: Fix a less than zero check on an unsigned int struct field
      https://git.kernel.org/brgl/linux/c/4c91b0ee35db07ae017dce067c64364c7e95faae

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

