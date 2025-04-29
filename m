Return-Path: <linux-gpio+bounces-19468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B95AA1ACF
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 20:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 250804C0325
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 18:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE365253B5F;
	Tue, 29 Apr 2025 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KOqFom8e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1794621D3EE
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952206; cv=none; b=c1UEQ01E5GRH/b1GB4LfP6q9ru3Binp5ABCw2UqOmCdK1+0eVYSFAyEeCIAIKq3MeEIAMgFwCUFdEMAIhp+Ku6RcQGex+JUp3SA4UvA5mUs/X752rmoeTaoKYee0Bdi/QZEMaf3Qe4aWcoy7kOi8bmkWNCtlKHokLfDI9ZtIKpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952206; c=relaxed/simple;
	bh=UeSc/5BZh1t4ldehBk5tJa7zSp0X0x4lRUAaopaKMhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6B3GjbHbwY/C5Di7J0ZIv0ZXgbY0NICYvLHujjT7T/4S4eymffKNe+CCnWxE58QCZCbWttviCuEOHt1lkjwLcuRD8cMNBI6myK/UcIGrPsxLa36ffRPEAdzzGVAMFSV+L+AqmERqvWBaO+jwCqr9zzfNZJgdN2gEMA91LsFifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KOqFom8e; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so62893881fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745952203; x=1746557003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeSc/5BZh1t4ldehBk5tJa7zSp0X0x4lRUAaopaKMhw=;
        b=KOqFom8eHb+vQj2eGFSmi+wDJmBDCm/4QWc2IQ4ZXLxzvS88gnMSAZ1y1ZdGNPUB01
         lU+Iu7OG+cl2vvDw72+gWT2wubM2pxq8LLhDlF3pcTWYRTCw6vDtXFLFTHhgy9UXiEfz
         hXY06mUnmQUQJo2Xe4LxRXuGqTtedNipVQhtqQOh7UDi+Z3e7tfZU1ntTsC4b6R/ZfSu
         vFBt1IDvGyz/0bUVzcxRvXydzkUkKKAoHzj6KFzNtOZ+X81nUYUHceINOCj9PpvZVxoN
         d+1APMhCJRsH0e2ewsa95iKPfxAYVNb6K3qo8cOPMTGI6Osa0spoEF/htfBcrcCMXF4Y
         rofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745952203; x=1746557003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeSc/5BZh1t4ldehBk5tJa7zSp0X0x4lRUAaopaKMhw=;
        b=h7C8JwjFTEsb+BsoSBF+vuom91F8brFAYXFLsVIqfTminXMIfXS89tmGnjHmVg9UbX
         zSjhvobWwzvQU1LD5s/yGCq2SLySqTl6uVBQ9KLkV1HmIIkmYQu0c5Cc+XuGCHkrctUB
         zFM5E/N1ZuQQbzy+0aqFXBwltOR57IjSeeyxAoDEDCU2gA0nzefXrncj1aBKnDmVwTRw
         2UeAnloBWs8hnr66KOEQWUX8NCm5W/9YwrnhkphGkn2uxcm4N0oivl0YgE+k+8vDg4bi
         Xo64/v4eAjVLnfzL2lTaskCkcAbeFd46KMGU0WN6WZXYKJJiFHgaE/gGdK5VFygfggzd
         AsdA==
X-Forwarded-Encrypted: i=1; AJvYcCXHJ4ZnfjaCbpnB6AGVaetW5CwBbXznFH2+yxg5F4qQb3MHs9ouw6yrGYKzP0kmpyJCIwK6yWm6D2QR@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4968j8CioCdVcc56NU7va/aN5xU3euMPfTZShxdiYl5va8vJ
	P3m/YK2cskwj5t2ddrWK8NSHe0RuoB1SSnDCJm/XENGTELdjIXfJnLTi7rIp15K/zpEOWif1tAl
	aNlPXWba0cHjQAfdOfCt0KbA5XjvAbCwztOs+w+a7DugK1Nu8
X-Gm-Gg: ASbGncvtRrR+BlPafNq3YQDxZI3LuZfcLaFmjB0Tt/ljxzwdyb2d+3J5ywMKnSF6bfo
	IP0JBKSdAYeluCrr0G+DQTNzNWvPg44sAgLfaFwVLTYOuGRlQVNdxu5zUv0vh9e/F1UBvYF0Wvk
	z1mWRRRwG/xKjwQ57ugUQN9PCo5/0KR/iVLt6yAw9YtmZl0Q1Qdas5Ilma9XEBEP+P
X-Google-Smtp-Source: AGHT+IFW/CX408gyWrfHMdOwoequNQf7BFXdXPyHUXK7j2OMhS6KT7GwMmG2rSXP+wTND/kT7QfmLTIIBSLCzPUbzV0=
X-Received: by 2002:a2e:be9e:0:b0:309:23ea:5919 with SMTP id
 38308e7fff4ca-31e6b2c6f0fmr842631fa.31.1745952202951; Tue, 29 Apr 2025
 11:43:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Apr 2025 20:43:11 +0200
X-Gm-Features: ATxdqUHJnz3Fduuh7qnUTYN-WgL5KpZt6syl8lZWPYRMAPtml8GzwrHvYI-U59M
Message-ID: <CAMRc=MfpE6M28P6jxFgs6K6Tf84LRhmaw5U4s8WgciF815M7Bg@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 4:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> This is the fourth version of this series.
>
> The main change is the way the forwarder type is exported, now gpiochip_f=
wd
> is an opaque structure.
> In the forwarder, a valid_mask was added to track registered GPIO
> descriptors, and it is now possible to remove a GPIO at runtime using the=
 new
> gpio_fwd_gpio_free() helper.
>
> Two new patches were added, the first one to remove extern specifier in
> machine.h, the second one to define new helpers str_input_output() and
> str_output_input().
>
> Other minor changes address Andy's comments, see below for more details i=
n the
> changelog.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

This looks pretty good now. Who should take it - Linus or I?

Bartosz

