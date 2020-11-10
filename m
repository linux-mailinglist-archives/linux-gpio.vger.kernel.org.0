Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75ADC2AD8A7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbgKJOWa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJOWa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:22:30 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6414C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:22:29 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id h23so10408755ljg.13
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMD86tEXECv7YvaePhPTtJTj0MM3XK9o0NyCS2R6PI0=;
        b=nTB8b/mNiIgxqPiAbAnkScARq99GnGp4EB22HUjcyZyPc9mNSY6o1zIUX91y/P29cs
         O9TrrSiZBDbQ9+yRePrZQHAEr2jM23RvkOCMiasVxkmTGLrUUF3IQmI1ZeUIUIPQmNBH
         5ux9M86vDPNJadiUSWsSCKw+CQS3ahVdsJJYKEZFmWpSk7uHyvQ3SmPkJV7e1LreEIlU
         T69vaOgM5KbxeLSIw7/fxGIyTjZa10WcmO1dAlv4kJnMkBsIwnWnTQh0e1tg/au1GpvB
         gFXC8i2j/U8Y+WwObeLnQ3vT3jBG2HFI3eTvIY6UQoF3fit31sQbXacVxckNMrIrfoVV
         sNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMD86tEXECv7YvaePhPTtJTj0MM3XK9o0NyCS2R6PI0=;
        b=iWHyxBEcKeYFc2QVE9K4JLA1qq6CJefq2zCIYBSf/AmSuXuqvWVUlRAaJP9a87lMkl
         XpJPVcLUnkGKtlrWoL3AYu+AmRF5bGf44TDav7RtGERNrnVRqqWK7I3tw3KgLwMa5onh
         KCIbtSNisSxNSMLanX7AGd+bU4GVAGyo4VCLyxPTdat4M5/Vr/UjpB0Y1n7CL5uBx/qL
         GSLk3LmF1CRcbh1Np8z1fzgUaWn9NcK44o33tAIkm71Ob60wR8atggSWs8b+/Aq5BSOy
         Nhe+6ycal00lSSa/mvIk/QmXzlgKA9EySq27S+7drCUQd45iYli1bZlFUmiH5YuELUOx
         ywOA==
X-Gm-Message-State: AOAM5301EL2zHMC4h4n179HDoAy3zcY5BJipyzth/1eI7GGwl+os0+LP
        hXKwaJmt3O7/wP9WZPFqBlhaZfOftg/MWYcX1t5QYw==
X-Google-Smtp-Source: ABdhPJwkKmX6iy3vh5cOc4kYxG7IZxuzAgGMQHBTaeexCSw6q0TsbV/SNEsF6jK1e+aRTpNJWn9XV8ZzvXL5sH7ZOCE=
X-Received: by 2002:a2e:9a0c:: with SMTP id o12mr7974674lji.104.1605018148131;
 Tue, 10 Nov 2020 06:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20201104115348.51930-1-damien.lemoal@wdc.com> <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
In-Reply-To: <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 15:22:17 +0100
Message-ID: <CACRpkda_mKYPH8Y4ak1WmFGy17yMkhCgitcL=EjAf1dxYtRWUw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio export/unexport
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Damien Le Moal <damien.lemoal@wdc.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 10:27 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> How about we change that to an unconditional WARN() everytime the user
> tries to export a GPIO over sysfs so that people switch over to the
> character device?
>
> I'm joking a bit but I think it's time to start discouraging people
> from using sysfs and a warning may be a good start.

I think maybe we should hide the Kconfig for sysfs under
EXPERT as well.

I would also seriously don't mind to make CDEV compulsory
for GPIO_SYSFS.

GPIO_SYSFS
   depends on EXPERT
   select GPIO_CDEV

If people to bad only want the deprecated sysfs they can patch
their kernel to get rid of it :/

I will send a patch for this.

Yours,
Linus Walleij
