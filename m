Return-Path: <linux-gpio+bounces-24265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0879B223E8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 814C17B37CF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEA72EA724;
	Tue, 12 Aug 2025 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JySaj/KK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4852EA495
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992775; cv=none; b=IPxb6enRZPWrCTiJ+jX3N49qvt1wi1dy6BAmeormtmxU+e117E4GSQr3tjC+Jr/hYRNEGgNBeYb6f5fzV1eLpAHkyNj+AQBn2uPGvTiHCdJm82fQznqNeA/80r30ZcmfayeWn6Ifowk1VxWIbwoSBUc7EJK+vk+Wwhi02SD0xjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992775; c=relaxed/simple;
	bh=fdw+3Gh+VFRomWVLfv0e7HTdn397jxovmsPiCFpOtlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=muID7r/u/kTVZwMK0rQzZauSOzyGY7YpDp9UREurTsbsNchVz6EI04UlsFlGUJ8RFWmju248fVHyk+ah/+kTgfEbeNus7MH/rn59bzx79rfw066xOhJiEceCH92WwuEwvwGIFRVFGKEbxuXt92sSLkO/IMt84ylwel3KQWdY12A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JySaj/KK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55b8248e77bso5253043e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992772; x=1755597572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1mDrWuohEgopTPInI6sA+uoNinbrVfmWIHEgismuPk=;
        b=JySaj/KKE+Jr1HqFK+9h+6f78vADIvRNx7h2I0SQQ9/mZIJ06IDEocguSaS8LneuXb
         alFHu/eZDE7znbTuFWwPowjlWOfLDvC6QupeWEi0WUMO2LPuSOKlcOR4AWA3VR+3QTP9
         aq9eo88KBaIs8bsYBaFck7jVj6Ax4sE2k3MztTD57u3hVqLt//6AwlAVe5l6B29o+Dap
         rRvUOlpDxFhVnLQDnyiNCyX+FJ34EJJWBQUbOdYzuep+TnezDTEJeQ0jkBxucHNEYn+a
         mX/hsf8PlX7N0GUPPaMNsmSgihW4hfn60sFyZAOS4jbRP/APNhisuqG7PL8Zv/gUvyXY
         KpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992772; x=1755597572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1mDrWuohEgopTPInI6sA+uoNinbrVfmWIHEgismuPk=;
        b=ZhgbCo9IWHXyMYS6MqaodADgXJrwp5/hmVzIFtxxkUqBD15peBn0nCEICXh7Qb6uup
         1ao0XAxvHPm9UQUDbh5o7T4471xhKtZBSC/JY71ESUjNG+Q8AGlO7XPDtOdg/PL8hL6k
         hGr8opKqRJHuuMdDlGXLMzSCKxTxiwEIbHd/fjvlu50WOZvr6v3353B6VxQU9bRy27Mz
         Nz8pas7fvFLFndHWsqMaU8jnzxigcDuMxi4AdNVuHEztlXO44fw7IFln0Fz6MQlAYa0j
         Jl/ZLIlnIPHkpz7Rf/M8p1r3Llm2R7GmXvocY0Q0QNibfiJi/2WWqtCMcDHxUeIN7kwI
         F7lQ==
X-Gm-Message-State: AOJu0Yz1xuBkxdpthONHuuT16Q90RdtQUBi46AKjt+YC1z9DcXCTwh89
	D9iXylQAP6711zIH9MkDEek1VYefolnwks1z/tvJ8eOIqWq4l0/M3ydCHVqB4GVtD7z2PoKGGbs
	nSwgBJ5VMBpSjoPIuiYLuFN3ljdw8QKCE8PYbMGAGwg==
X-Gm-Gg: ASbGnctMSjP8EQ6p+n54wX5NXOKCXf0Qq1SQ5MZt3b0MExlyxlCAUGMz+fI+Rr7Dgpp
	6zEh2e6N4smKhhZj/BiqfXBXYSUoHH6WcZ4S2KS7wXaP52MQso2i6MF5C8YVJSvhbVbjZNi8i2O
	Pk9WSmZY+kJ1LJ69nl3FZMSBybzqSYAeFZgG9AZQYMaPVCNGPCOB5M4vVANr+QFgeKjlJ/m++tK
	g1Uj8sLV+1AqnP4SUyAYyt8QsG9hPmVFGaz
X-Google-Smtp-Source: AGHT+IF3WgiehWnZQLfMQrcxniMNK/2fuKGhQA/XqVGq1OCbr4PDYFcEG0ahDGLz1N6K7QygM6mYjF0gHE1SQR7cH3A=
X-Received: by 2002:a05:6512:3b07:b0:553:cfa8:dd2d with SMTP id
 2adb3069b0e04-55cd766f8c4mr730147e87.55.1754992771830; Tue, 12 Aug 2025
 02:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:59:18 +0200
X-Gm-Features: Ac12FXytMUHnfMvorE7AaIZ4tQn_RJRgw5kgUrTE9wtdfJEknR5-9y8JUWSkapc
Message-ID: <CAMRc=MdTWpdQp22yf7w5zNhfKBdWKJAX=rvAG-bkYxtCfLSFAg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:58=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> I hit a network error when sending for the first one, retrying now.
>
> This is the first round of GPIO driver conversions to using the
> modernized variant of the gpio-mmio API.
>
> While at it: sprinkle in some additional tweaks and refactoring.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (14):
>       gpio: generic: provide to_gpio_generic_chip()
>       gpio: generic: provide helpers for reading and writing registers
>       gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
>       gpio: ts4800: remove the unnecessary call to platform_set_drvdata()
>       gpio: ts4800: use generic device properties
>       gpio: ts4800: use dev_err_probe()
>       gpio: ts4800: use new generic GPIO chip API
>       gpio: loongson-64bit: use new generic GPIO chip API
>       gpio: dwapb: use new generic GPIO chip API
>       gpio: amdpt: use new generic GPIO chip API
>       gpio: rda: use new generic GPIO chip API
>       gpio: grgpio: use new generic GPIO chip API
>       gpio: mpc8xxx: use new generic GPIO chip API
>       gpio: ge: use new generic GPIO chip API
>
>  drivers/gpio/gpio-amdpt.c          |  44 +++++-----
>  drivers/gpio/gpio-dwapb.c          | 160 ++++++++++++++++++++-----------=
------
>  drivers/gpio/gpio-ge.c             |  25 ++++--
>  drivers/gpio/gpio-grgpio.c         |  87 ++++++++++----------
>  drivers/gpio/gpio-hisi.c           |   3 +-
>  drivers/gpio/gpio-loongson-64bit.c |  42 +++++-----
>  drivers/gpio/gpio-mpc8xxx.c        | 102 +++++++++++++----------
>  drivers/gpio/gpio-rda.c            |  35 ++++----
>  drivers/gpio/gpio-ts4800.c         |  39 ++++-----
>  include/linux/gpio/generic.h       |  37 +++++++++
>  10 files changed, 337 insertions(+), 237 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250728-gpio-mmio-gpio-conv-623517c3df74
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Sorry for the noise, I'm hitting some SMTP errors with gmail currently. :(

Bartosz

