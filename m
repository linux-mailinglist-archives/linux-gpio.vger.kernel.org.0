Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0482F2E8CE9
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 16:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbhACPfT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 10:35:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbhACPfS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 10:35:18 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DAAC061573
        for <linux-gpio@vger.kernel.org>; Sun,  3 Jan 2021 07:34:37 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id 6so33601373ejz.5
        for <linux-gpio@vger.kernel.org>; Sun, 03 Jan 2021 07:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7VJSS2MRhdrAHE2InrIaRduFq4J8wRHwKfn5ZoOtFPA=;
        b=ggcpMrMpfWXy42E72xoUF2jN3tEZjFxxPk6R9lutWT1Jlbd+kwg/a6ylIDueRCaCHs
         ZCUm+2XSy0YquBeHfSdBnC3Fk0/MXOW/1yGNp+1E2/+VGE+VHe6H4Nm/5nOKU4+gzDE4
         BrhW3PwpIYi1LAlj/jwj68LO/i95Q+ZdDv5SuWyVt3WmpOZY/kjxkw3MhPdyB4pgMZ40
         nMl+8HFlXXe4YiGrxalFdwIRV6Jbf5cTB6MXcIHkqSTs440jBCBQATmz1V/mfoV3AA5d
         YoG1wBHgyTlpwQar5NXxuGjnAzJy+ywWo3yfPC7fSzFJO9tkshpGP/T2R7hKiRMgFM4E
         +U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7VJSS2MRhdrAHE2InrIaRduFq4J8wRHwKfn5ZoOtFPA=;
        b=ZCt4ZHgYQRdgx/dw2kfqz7JHQ4XTGhdbp1bOXQsqs/P+0yAf2vA8EIq1ggUv+tuHj3
         yQQDBK1wwfljfbdvM/v9lJJ7ndlOyyDSMN9GtzP5uPDAamFpOAi62kdLPTwPuZP84I/z
         RShJFLlA9FSbZyISOzR8G/KmkMT50eHpYSHK+lnpq8quzuKsr73i18fWccT0aJxj97qE
         1soqRfHb/cnsp9JOAb+2eKypzOK8fsDSJr7/PnEqKN5E91LX8JSmKm+mvFXn9nX8UHBr
         6CTwG/MIKxqB9SOH9lYFgMakt26vRzgsp4wyxDop/rBbrGh2SHh/Rowi4H7q+1CX2sdL
         l0nA==
X-Gm-Message-State: AOAM530xfxsKw3Tfu4aeY9ijA8o8ArrH8JZuxi7QLp5LTwQCzmw9jBj4
        uoeBLxRQkE0MvlLAyeeCgl6K3v0c7POKIHGA2D9ffQ==
X-Google-Smtp-Source: ABdhPJwvngco/r9xFm5sTplUpavbxwsWcVbxihKIf/+1h09Ybaw+QKj4aeWfzeTil+SwvSPf2Oa9WGgRS2D7zARYlwM=
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr64879642ejl.155.1609688076771;
 Sun, 03 Jan 2021 07:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20201227161040.1645545-1-warthog618@gmail.com> <CACRpkdYk9U_=AOyy7NSKL9+Aoe0+qCdZVN9EXWLn7NUcUajipQ@mail.gmail.com>
In-Reply-To: <CACRpkdYk9U_=AOyy7NSKL9+Aoe0+qCdZVN9EXWLn7NUcUajipQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 3 Jan 2021 16:34:26 +0100
Message-ID: <CAMpxmJVQ3AfQsXc0g-BigiS03ddP0FcZOWB7vtP1rHX5jFCzcg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: fix frame size warning in gpio_ioctl()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 27, 2020 at 10:37 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Dec 27, 2020 at 5:11 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> > The kernel test robot reports the following warning in [1]:
> >
> >  drivers/gpio/gpiolib-cdev.c: In function 'gpio_ioctl':
> >  >>drivers/gpio/gpiolib-cdev.c:1437:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> >
> > Refactor gpio_ioctl() to handle each ioctl in its own helper function
> > and so reduce the variables stored on the stack to those explicitly
> > required to service the ioctl at hand.
> >
> > The lineinfo_get_v1() helper handles both the GPIO_GET_LINEINFO_IOCTL
> > and GPIO_GET_LINEINFO_WATCH_IOCTL, as per the corresponding v2
> > implementation - lineinfo_get().
> >
> > [1] https://lore.kernel.org/lkml/202012270910.VW3qc1ER-lkp@intel.com/
> >
> > Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
> That's an interesting regression.
> Anyway the kernel look better after than before the patch, so
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Bartosz will pick patches for Torvalds this kernel cycle.
>
> Yours,
> Linus Walleij

Applied with Linus' tag, thanks!

Bart
