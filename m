Return-Path: <linux-gpio+bounces-12367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B329B7AE9
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 13:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EB282824D1
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 12:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE28919F430;
	Thu, 31 Oct 2024 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dDMAso1R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9333519F130
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730378403; cv=none; b=PHCLlRw8HlvoX2eIXaPohypCL+KAYDoo6DBvZF3BObqbDI+Rz9gNiDUXJV2B2dRn5ie4pG02x3rR5x0vrS7cztZuQczF4fxlbHA9IZwYKJbk6dW7m4uBIevFzOsVZcoqsJqG2F5tv/CQkxJigN63Lk9kZATgeGhOdn7P2c+pBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730378403; c=relaxed/simple;
	bh=/rku8w+ZQaIMVwtmKD47gNNf1ahswgiaRlMEWV6ZL3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gSUp8kCEY+Bi35hiVqu0f6veTMs3/61Uo2+xJQgWpOjppVTJ/NuM7q2ZIzai6hb+3njRf6TUbvtSEA2INnmm+GuAQaaM7HG9AnCQ8ic/qP+VNOxX+0m4kvgSjEnlbqjntEHu2uLMvJoGkY0cVQ9azOPw+lAPo+J5SK8F47OzdgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dDMAso1R; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43163667f0eso7324565e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 05:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730378400; x=1730983200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDn/Q9PuaiRUmXk0kNabW3oFFLNcUS+yUJImQy0llLY=;
        b=dDMAso1RstuRXgTQ6aZhMBZjlqHyhY6+3YVT/87vxyEWbZGTEjKf/bH5KKs2HVmzxk
         RNxrZjaTz5t4YEtKOX+KOSqJohro8joV1LCu2L+zJ/Yr7Jw0XjRYqaZfSdu9KbYfkOXC
         8QShbDCfBGYVlHDb7k0HjxsEpmFtJmGCW9me1XdIXWaa7MXpZEohCJPtPmKtZ0HvyP1m
         CBbUpOyRvQed/AltVBh9p0GjwD2ZpMAys1EjRnHNqoW/yh1rVDyz+OlQg/wx869/Hgq8
         wvpI+PVreN/GIXrbOf/ZlD5IRWK4ClLrBz1t8DBjHyVC/gSH63T46Rx3CNc/JX3raiBk
         jaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378400; x=1730983200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDn/Q9PuaiRUmXk0kNabW3oFFLNcUS+yUJImQy0llLY=;
        b=oMro+0/9iQvuCvaZVbMeMHey4qDjK+2++WdXz7huxHOgco2QrzY+4IIfoOLvhAax+5
         88O8UOpni8C48MFC3d5Caeq3NgnrhaW9iLQNzRd1prItDu4qrCXJlDf877qJ0J+6KTAd
         bG9m9MPojGJn9iF7eI+d91TsDIc9W+BpfFxJbyi+A3VKW2x96YDp7xhRekzaSuSHyPU1
         Wv/cftMCIofvpHDPbSQQpH+vvKB7n7qR6Ot1/8LFm5qMgDvTg74HvwjoYOtqj7Z9t/EX
         zj6oFVS/kRfEDsnnl3vnVLrNr52l3siZe+f3jrWGSVLsVECh6vBr2SnrE8wEol0OMy5c
         biwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw+1KmOAsQv3BzlOI7+fXR+/S5EpAhTFyXaAsDCMJY6VvQnW5VpJGOLeV8NS+t+U/PQc/MpLqB/vnj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzstr/Ymy+OmU0N4RW5+3zwjn9xPjs2x567vBxEcSbv2XRNaoDI
	/rNIkXLmEEmvDZzqGxN/gzpp8pzoiV+X5gICIwZLnXEtXD21UZ4NEORJCoqM/LA=
X-Google-Smtp-Source: AGHT+IGDAHRdlYmFq/60UQUNs2YlJ3Goxa2Kz3Vq1xQX23qZB2p5fUnXsQ++A0pOGewMXGkHHTy3Bw==
X-Received: by 2002:a05:600c:4588:b0:431:51c0:c90f with SMTP id 5b1f17b1804b1-4319acc2ca1mr169624675e9.21.1730378399971;
        Thu, 31 Oct 2024 05:39:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a6bc:32f9:21fc:be97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116af7esm2004922f8f.103.2024.10.31.05.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:39:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: fix uninit-value in swnode_find_gpio
Date: Thu, 31 Oct 2024 13:39:56 +0100
Message-ID: <173037839477.7100.6092134366756840133.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241026090642.28633-1-surajsonawane0215@gmail.com>
References: <20241022194624.34223-1-surajsonawane0215@gmail.com> <20241026090642.28633-1-surajsonawane0215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 26 Oct 2024 14:36:42 +0530, Suraj Sonawane wrote:
> Fix an issue detected by the Smatch tool:
> 
> drivers/gpio/gpiolib-swnode.c:78 swnode_find_gpio() error:
> uninitialized symbol 'ret'.
> 
> The issue occurs because the 'ret' variable may be used without
> initialization if the for_each_gpio_property_name loop does not run.
> This could lead to returning an undefined value, causing unpredictable
> behavior.
> 
> [...]

Applied, thanks!

[1/1] gpio: fix uninit-value in swnode_find_gpio
      commit: a14968aea637bbe38a99e6089944e4ad8e6c49e5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

