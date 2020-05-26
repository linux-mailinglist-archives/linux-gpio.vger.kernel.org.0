Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E75A31E20C7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 13:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388728AbgEZLUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 07:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388712AbgEZLUa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 07:20:30 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7BCC03E97E
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 04:20:28 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w10so24043661ljo.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UeMnwBf9eNNf2F3k49lyAWQfPa2wNG4At9IBgKCT+ww=;
        b=nxjzGrJAK2bqmc5Yj+Tu7qkotxjekECkXsSFuhfXO6C6TjhDjPLCLBRQR8l8+XrPeM
         /U0fx04GLevUVuxW7yPPGR31T4D1n3krQWqrR/OexwrxxXamLfTGFQKIwbfhIU3U934X
         tAHfl9JAc04nTE6WELdWSK77+atEEU6pOqNJ03GxHtPGU6LCzSGNpd8QDowO9hLZ1PAO
         5TlOn4uvQUJsDxIpQYeis0eoeR9gc20v8uIcW7+/fp0l/fmOwkDJlzWwrk6kJNBs0d1Z
         Fk1CxDQFuOZ5mw5uJlS0KKXL7a8s89mj0GAknatsU5DkVi753AQTnuVURVl8x0pLqRwG
         3JPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UeMnwBf9eNNf2F3k49lyAWQfPa2wNG4At9IBgKCT+ww=;
        b=tWAzGv2l6a3TBCBUiJSFQF8s+jTvwEbMO3IfuBo+ycv4+yIY6Lt8GYMLhHeK/Sfid/
         OrjNlVlM7ZubSI4f62LovKH7e+XklPmml34+moKrnb3iGNv0bzRvwnks0jlllrWUl5Ku
         JYAj+MavMhWr6oNpfZADNM75KfXoCo9biCAZ7yX+dFhTLkn1CK7a0q+UaL+stOYkJ50J
         sDecYX+zF7HR+qnBZwB6f65ALGAB/n7CdrxCtyosrnXIr1eGJcHyV3VElWVea3q0eMnj
         91TKoFrw9RopKWYoJLaQx4E/RwyhfXTOs37nvFF2ER7bbL3AI5FVH168jvIymwYhP8//
         M1UA==
X-Gm-Message-State: AOAM532X0RqTFFgPmJEg/6E7fqdYm9rPiNm6d5pXbere9bLqZG3Dn5NS
        /5HO3K3ecSmgww8Pgru2wZw/e5GyHx63Bb9PKwTSWA==
X-Google-Smtp-Source: ABdhPJwk5nbp+X2SGNwnguSA55O4aRs6hUxfWJ3niJYbn683LKVUEGx9LHJbboiqDqB4p3+ery0IVT3EOuiw99vES2U=
X-Received: by 2002:a2e:8703:: with SMTP id m3mr403379lji.286.1590492026585;
 Tue, 26 May 2020 04:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200526104321.4825-1-saraon640529@gmail.com>
In-Reply-To: <20200526104321.4825-1-saraon640529@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 May 2020 13:20:15 +0200
Message-ID: <CACRpkdbGNaGh7SkHAeUiZuFDeP_oj8g00tTOJAtjhrV9R38tbg@mail.gmail.com>
Subject: Re: [PATCH] gpio:gpio-asm28xx-18xx: new driver
To:     Richard Hsu <saraon640529@gmail.com>
Cc:     Richard_Hsu@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
        Jesse1_Chang@asmedia.com.tw,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Richard,

thanks for your patch!

Next time you resend, please include the PCI maintainer
and the PCI mailing list on the To: line.

Bjorn Helgaas <bhelgaas@google.com>
linux-pci@vger.kernel.org

This is because I do not understand the use of some PCI-specific
accessors in this driver and what applies to them.

On Tue, May 26, 2020 at 12:44 PM Richard Hsu <saraon640529@gmail.com> wrote:

> Hi Bartosz Golaszewski and Linux Walleij
>   Sorry!I don't know why it diff against a patch in old repo.
> I create a new git repo and re-process it.
> I have modified it according to your suggestions.And our device
> is similar as AMD South Bridge(amd8111),then i just take
> gpio-amd8111.c in kernel driver source as reference.
> It says that we can't use plain pci_driver mechanism,as the device
> is really a multiple function device,main driver that binds to the
> pci_device is a bus driver.It seems reasonable,then i follow it.
>
> Signed-off-by: Richard Hsu <saraon640529@gmail.com>

>  patch | 314 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

This is still very weird for me.

How do you create this patch? I will not be able to apply this.

>  1 file changed, 314 insertions(+)
>  create mode 100644 patch
>
> diff --git a/patch b/patch
> index 0000000..220a8cf
> --- /dev/null
> +++ b/patch
> @@ -0,0 +1,314 @@
> +diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c
> +--- linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c   1970-01-01 08:00:00.000000000 +0800
> ++++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c     2020-05-26 10:41:11.401349769 +0800
> +@@ -0,0 +1,281 @@
> ++// SPDX-License-Identifier: GPL-2.0-only
> ++/*
> ++ * Asmedia 28xx/18xx GPIO driver
> ++ *
> ++ * Copyright (C) 2020 ASMedia Technology Inc.
> ++ * Author: Richard Hsu <Richard_Hsu@asmedia.com.tw>
> ++ */

You see all these double-++ things, they mean that this is a diff
of a patch so a patch of a patch. Something is really odd with how
you generate this patch.

Sending the thing in your root directory called "patch" instead of
generating this diff is better but preferably check your file into
git and generate the patch from git using the git format-patch
command.

If you're not best friends with git I don't blame you, just send
the patch then, but please not a diff of a patch, I can't deal with that.

Yours,
Linus Walleij
