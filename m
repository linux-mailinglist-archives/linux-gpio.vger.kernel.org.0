Return-Path: <linux-gpio+bounces-15833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B24A322F3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 10:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0646E3A8536
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 09:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EF7207650;
	Wed, 12 Feb 2025 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UXuAfugM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32871F03C1
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354242; cv=none; b=KXTKKLu//AKK3mMxh6tZglfQODovsCuOV3AJN1IcWagUprWgZG3uHsAmAgG5Bkv/C9ICsgdPuzmwYPc6yO0IDzQLGyofssIPsh6WxupqzzCQW2fW2goyI/B9hHP1FvD6w7Qd+DodHRDk5T32vpMABn7IMLHAw0H0uBtsMzTn/70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354242; c=relaxed/simple;
	bh=DbWnxZQj/QY2+PENDx3QARa/H9rHcPmmXzkYM1WueAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fY9Vea0ac3SGitbACme5iCHR3KoYl2Q6d9SG9rXdCBvLhHfx3pVgUeQjBvSzsZ4tCKnP/7CkWWyEacNJtT3AtGFbTu26fc+Ji6wdVXLW5HYzb4mpRbzHUwfBpSRbHr6ts6A/CULQXaiWpbYAD8KitxZipQDz6hKW4lit8L+/Fbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UXuAfugM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43934d6b155so3935845e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 01:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739354238; x=1739959038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6vJyJgeQHsvu6Ff/y0C/JbFL7zNshY57B+aHRbXHVM=;
        b=UXuAfugMmdiunwS5DAOP7Sb3521mL0MCbjGNacRvIShKBdA7YriBtylrCrtRtyHmYQ
         SPjTxkQTw32WiX8iYfhH0JQMsR0yS5GBp+OORCgDXyEkvNtcWmHi7+Jk191cctQiouGD
         UotovcVOB3KN2EbjrkDggJGd04wE3F0ISLIV16w1lzsAtXwgcdpTCouZo2VoGq/ntKOA
         AncJ4p5VGKgu+NFwsIBOOe6y/+fmMcT8LDJ/sf1SU+2VtismrZvD0tGjNYPY4y53O6RT
         P6BRIIyfrE+LKPL0h91iAwLTepZXfsuEOGlpY+nl+ty3gvf5KAOvIf7Cw2MDDvpvlpOn
         dmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739354238; x=1739959038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6vJyJgeQHsvu6Ff/y0C/JbFL7zNshY57B+aHRbXHVM=;
        b=j6i3WGtaGNU6qGReOCSa+f+J0YDQOwGxpQGDm6SM71A+u6dEJk5hp4gH4NfzacTebY
         Xuhctf2oQWDdwbUbbQ01oIuDFZJVuRmsoWZTVu0JN8unWjj+R8jIhC9RnmtbVEAyRIJK
         eQWC3M9CvL5FjT82ulaoaCQjQswRrilH0LQF9eBbFlIZ3IdMiWo19zD08MBfKISAvFzN
         7mlXN6Z0ZNY5ogZRz+HQSb0dIgtFKpnrzkEBXw5JVA8vBP7CFWOluNAfF6X4TCI8sewH
         zgxy1wN0/ysqzOTbWKHWFbHNjeebGYh5xI8I18MZLvpXXz7jYwmCRGGoWqKR7T/ZMaaN
         aVHQ==
X-Gm-Message-State: AOJu0YxaQR6CadSZ5rqpp3+/6ZQbjFz9XxzzKdzr4Ax396vW9amGol1J
	Bnp+qa2b4lzBJ1+xwFgW4pB8DNyYInHk2d7P8JU9Ds6emSyyq+XvyR9qp2G4iqmFw8Hu5EYfi3V
	bCEs=
X-Gm-Gg: ASbGnctCyiKPMb6YSi0vkQnjxI4e8LNh6hCUSSArkBTDBk6mXYyZMmuwukQLKafDuXb
	u76bgOocwrPuNmTkM8lSgPjqJrdFZY5OmLx6oZnxaC/wSAeTR2zyPwNOMpv4KcpGoMabZ1KR212
	mcy9g5q2e2WvGRqhJ3+twaq7mOMpNbP4ihp5XXH4AIgvu3ge2EfWp/VYBvu0WdWVFWCpCFwNguT
	MSSa9/7Jvl+cGUqJLu0UWZief8o/ZPrUqgkuZzl9vtxEp/WtQ/iQIc+Q3DWbaDyjP2n2ni0doyO
	jrbCFb91ioZU0oI=
X-Google-Smtp-Source: AGHT+IHmNW/uEKKhVJH5d7jzvEsFDf7h41DfWWQR+7ySmCWdVvV8vJ3bcQAm3tRGaO+q01hevGkb7A==
X-Received: by 2002:a05:600c:694:b0:439:5cf6:ec3 with SMTP id 5b1f17b1804b1-4395cf61043mr7945095e9.4.1739354238666;
        Wed, 12 Feb 2025 01:57:18 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd511e626sm11255636f8f.74.2025.02.12.01.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:57:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate gpiod_direction_input_nonotify() call
Date: Wed, 12 Feb 2025 10:57:16 +0100
Message-ID: <173935420805.13771.5715845143153249360.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250204175646.150577-1-andriy.shevchenko@linux.intel.com>
References: <20250204175646.150577-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 04 Feb 2025 19:56:46 +0200, Andy Shevchenko wrote:
> Deduplicate gpiod_direction_input_nonotify() call in
> gpiod_direction_output_nonotify() when emulating open-drain
> or open-source behaviour. It also aligns the error check
> approaches in set_output_value and set_output_flag labels.
> 
> 

Meh, it's a bit of churn IMO but whatever.

[1/1] gpiolib: Deduplicate gpiod_direction_input_nonotify() call
      commit: 8beaf839018096cd20e427e68645b4fbecdcb1f0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

