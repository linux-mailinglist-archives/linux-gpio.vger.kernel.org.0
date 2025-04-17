Return-Path: <linux-gpio+bounces-19016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B99A91C39
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 14:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3B8A19E5EBA
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 12:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD90823E33F;
	Thu, 17 Apr 2025 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oH/r7LEs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE446243953
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 12:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892952; cv=none; b=OPCWslceYNd4LHneHHIWXCLr7NxapfKcVddGNgfZT6MCTTWWX9ZP98uHwfTSkuskCQxa1/qqwW+7uVZ+umczT82aOMp7g5uzntAQruhwLEpSvV/uvyCI7HByo66dhTtz4o/R2g9qfKkrAsNo6rwjo/HOWmKzsknRT/XIW6necpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892952; c=relaxed/simple;
	bh=nu6kbIacrpDCT5vMw5ES0U54Qb9pSv7ZCfuS9blSr08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSZ1BI4sUffet5YW3EsXvkHyGpJtNdCbg77LrJwIMDrcGos+BBLDuAVKBWshpBsGJ7gLqHL+pZpuo7WCS7K6I7WJ6K/7t6/H5ZAsgftD0gyd+2FlcXwA82sXRnCAKhobdNw9F3ipg7hq7mzCTq3WBVSPaISTg0oZCa6LDF+oHOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oH/r7LEs; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10956398so880763e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 05:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744892948; x=1745497748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nu6kbIacrpDCT5vMw5ES0U54Qb9pSv7ZCfuS9blSr08=;
        b=oH/r7LEsFoAz0i1pw1RFw6ScprK94yEpx7iis+HM63ZVWEVzko9AU1wMLopqzg+fAb
         DgQbDu4mQqxtRMnbFJqlg8Ip32xKqv7nULaSedKbmcfxViynuRJsYRXXPTaQlUYTlUNI
         w6HGaaOIh1KB4ikcg04yvIgX4nEMfa8ZQm+imUBibn3w+Wvdec+nM+93CHI/KXiOQdfv
         wakzn+USbfO7rHxmJan9gG4mvfPVKoFpt65JWR3pjQbcF0jtSiwC0En55FJs9xZFRodM
         7HwvfHqsvyFmZsYLg+hqLJmWOE90DQDzt9+GmDEglO8P/EN6Pp6ss4l3A9Ohskpit50q
         Gk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892948; x=1745497748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nu6kbIacrpDCT5vMw5ES0U54Qb9pSv7ZCfuS9blSr08=;
        b=b3rAMK/mrMI95ChD0daSkgT9NgX4ONi8wcjyPurbYXx23xjh4V7Z9GoxgLDKj5twcn
         STyNHIJqs9iRPTNPQ6/uyi3IKS96OTN8YaGTtheuUBattAKHcIqFJTdXj0WxwkjBQ91U
         PHJn4V96Wz2ofWolqS7zfOzFIiM7u2WmylsZFjC6zm/vwfp7C5VW1wJQInHcO/1yOFJx
         JyLArudi2c1jRRO8cQT0ZPRHp7gZ5jQkHeWKdDagxhWKvvzaDalwC+00871ykIMGE8JU
         bZCwbcrFLZ+R9t8bFyhbkkOOTGvO2a+GmrcjfBgmbFJ9kGNskPK1nXKlxmvFChkHNuQC
         gLTw==
X-Gm-Message-State: AOJu0YzflwrrnQs8adqK2LRngTxUqG1AfBpVJbt4b6oXo9tSgjw8eM66
	AJmUT6BntcV0H/uxqE96sgSWvz0I8c8c7Oqb061jXs0oVMm8imTUPASGuCOVt0YXGQmJCygTuG8
	JQTD+fw+lpeGtgUh4albeW5mBduNw8TIeGpus8g==
X-Gm-Gg: ASbGncv4ekZ+VBI0HwyGwtWqv110DhyvkpQiZnDZbCh4RZIbo+w8tneD4n37uD+TZ3E
	fGKTaLVa+wn/TYaTlwn7yWu0r6hPRNLR1686kVCxHe1UC9A7TDjkFVFbCEgJzUhXIaAPwF5XnZ5
	XGBhq0naQaaSCNBIfS3p7iYFKtQUPp7APx/h/AJGmB6kOklsOVUKwH2Ew=
X-Google-Smtp-Source: AGHT+IEF+h77GIjECx++dvbLtSxZcrgUv4As1K7LTL0wGasowDO/DAHV6mNaDlM5AhBuOyn8iTjUFe/V1V2STZoogO4=
X-Received: by 2002:a05:6512:3056:b0:545:4ca:d395 with SMTP id
 2adb3069b0e04-54d69b4d325mr703862e87.2.1744892947916; Thu, 17 Apr 2025
 05:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-dev-adp5589-fw-v2-0-3a799c3ed812@analog.com> <20250415-dev-adp5589-fw-v2-11-3a799c3ed812@analog.com>
In-Reply-To: <20250415-dev-adp5589-fw-v2-11-3a799c3ed812@analog.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Apr 2025 14:28:56 +0200
X-Gm-Features: ATxdqUEjG3srjaR1zbdJGVx0d1VvANk4hPBYsb6-d9hZ0St9SHLUzFXCFtyNaIE
Message-ID: <CAMRc=Meu8KK6s=DUs-4N9FwD8n1diPo6zvgzG_XKB_kg=7Pfuw@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] gpio: adp5585: support gpi events
To: nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:49=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:
>
> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> Add support for adding GPIs to the event FIFO. This is done by adding
> irq_chip support. Like this, one can use the input gpio_keys driver as a
> "frontend" device and input handler.
>
> As part of this change, we now implement .init_valid_mask() as we can't
> blindly consume all available pins as GPIOs (example: some pins can be
> used for forming a keymap matrix).
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

