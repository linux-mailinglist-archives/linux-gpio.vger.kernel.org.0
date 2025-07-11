Return-Path: <linux-gpio+bounces-23119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4B0B01479
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 09:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CADB5B4361F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 07:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC5A1F4C90;
	Fri, 11 Jul 2025 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZC73Vdyu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209D51EB5F8
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218389; cv=none; b=DPHB03QYS+5YXGvmWSJs8ByjzKtXTyEd9gJJ2/8wDYxjE6Au42M7w2NGdvxX4LR876Haq2lHuJSqE+ZOreHkzrabJJsjSHaYudZQO5Ry9FlEGRWoJeWQi1rLTJbdIDNS9tBV/4hMQTq3H+VGvN3rCHA6qxP9EoMa76IU1og3Mlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218389; c=relaxed/simple;
	bh=7jC9RNUKCoCgH1rIVJRPYzeCQ9pbHb6UnX4L8SmyRhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fu+jLUBxSGAZtuD3YiH8nQDA6d5SMV1oo2ray/zR7BNOcIYylrv9wDC9OdijpilwkRQJ9T7pyo6tDqOvGrUYDKNRlv6yJpSnFtG+/jKo7vNg3Wc6M7rX/mDiGHQ4wvElDV22xTauqCK1rOZysw/Yjitly2qfI7zneR/iuJbovwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZC73Vdyu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45526dec171so3996905e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752218384; x=1752823184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZVedI7T7ke49tkE3TY9Ypm7IrZSRL9iRdMGglfCLqg=;
        b=ZC73Vdyuk6ndzKaR0958Mu01YSjF7jaCWQ9EvSx4bgtVPjOjF36WRZ8WyZVTFUtOs4
         HzEl7DKinxXCxTU3iAkHmxP0rrrZYu2M4FZIiLfeg0uVAR5lLJrKHcjxqZBdhGPOuWOC
         +FX84CMvJ+zz2GrmECh0eb7q2FCzUeDXCQt2eoWQl01yimVg1BDoZaRRDmgzZ8ELFOLD
         ZgUSaseIK1bMWxHjaFdHrxZwSb75Yp2+lridJXfk95tm0lVGxrPYv0wKqTGhvK8vkDPY
         X11SBTmcLFneZ/qW8oW+cYOdFhd1x2+XYhExQQE51PNmPb7rKI0oAP5tI3Ve6VxZR97P
         qDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752218384; x=1752823184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZVedI7T7ke49tkE3TY9Ypm7IrZSRL9iRdMGglfCLqg=;
        b=eUiA4w6ur+u6/UPywKfPCU1vaOvdawcZ43gU0UuhVN/+F9r5xDUjCuK34UK2Xxkg4v
         Ounh5pyi2l87Dhotn8u+JH1peRykUkfV+viqErXS1VXwbrPVfsGqiPNZgEOMTfLzVA9G
         PaoDAMV+KPwN2lW8tQFrC1MxgOFV3urw70MkU6B84Apu85MiJhkHXRsPp2si1LE74jh7
         jetkNxxmRLMqiFjJtDUT94O/TIjjBAokLGpobttnY8jUQXLS74XgMk9XnOWkcZ2DX8+K
         zKs/Tw6JOuCb41OaDqGIgYaILRKwGaTgruJFShO8Y5SNRzQvMqpclXFd/jiEgeNc6fF1
         F5OA==
X-Forwarded-Encrypted: i=1; AJvYcCUG4YOBFvGRuEYtYIymUnTkb0Zcr/4gdS1I+9jOrVSS8xPn2pjpDcab8PbmaXIWinfysQiTkU7nizKE@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8bW1VpnxOjHofLXbLELXLmr+wzJh7oNuq/0e015sO3rHTiNj
	0Y+yxFilTIDnNN9hQ8kSy+iYjm3/Fy1m9gJU6NLPlwkAh8kyHcfPwmOCE5YoYIkBxqc=
X-Gm-Gg: ASbGncudxGHrQCm+nZvM6zWTyjGLtSA09ZVc+tIGBJWlXppah+Cp4NopA+ebsr251XT
	z5EbRnoMYKF5QiNekaBvkjj8KRxqA1rMnGSvI+YGTyXyNdFAyzgFY7FIkZ8/WAKus0qz9V2WmjB
	HqYNLtWez00wG0hacLUOlnBNumdJuaXitxF+4x/jqo4D9lL04twJ/Pl9dvP0tE27yACb8YpTxUs
	f7+z+6D0HapNlnTybQ8F1qH2TM25LmJ7hAlRaMKoCrUwl/UgkzO7i1pybcao7UYPFSswN8YJGtN
	fusViZskK4EOwCaGVwFYilm9Kfk6LCQ6AvJPcLWcXgOizV8ZeHZkUk/lbJlLBJ2LVfnlcuaP9zE
	GOYEYEbN/szi9fU6XuQBXxAyytVGiF9pt
X-Google-Smtp-Source: AGHT+IH5zYIQ+Abjj1HwiX3tECKci1lXtCJaaUK3SCI4dh/Tn6XWzkIpQzd3wlqKGMQfYchsvHjjvQ==
X-Received: by 2002:a05:600d:e:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-454e7b603d1mr12934695e9.4.1752218384072;
        Fri, 11 Jul 2025 00:19:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4de1:8724:bdd:326e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e02csm3711184f8f.73.2025.07.11.00.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 00:19:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: remove bouncing address for Nandor Han
Date: Fri, 11 Jul 2025 09:19:42 +0200
Message-ID: <175221838015.8892.11227120249917200302.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250709071825.16212-1-brgl@bgdev.pl>
References: <20250709071825.16212-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 09 Jul 2025 09:18:24 +0200, Bartosz Golaszewski wrote:
> Nandor's address has been bouncing for some time now. Remove it from
> MAINTAINERS.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: remove bouncing address for Nandor Han
      https://git.kernel.org/brgl/linux/c/edb471108cf1477c44b95e87e8cec261825eb079

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

