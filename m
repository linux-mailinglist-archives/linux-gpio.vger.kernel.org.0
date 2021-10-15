Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5135342F521
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 16:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237167AbhJOOXw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 10:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234738AbhJOOXw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 10:23:52 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75F6C061570;
        Fri, 15 Oct 2021 07:21:45 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id w14so38629282edv.11;
        Fri, 15 Oct 2021 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YJvkSzyQ78CqYoM3LpjKLXCFiGcDw/gxiiosR4pYAts=;
        b=gdQ6fTdS7XJZYq2+NhR3rc6Y7khiDldFEjo7t+jPn+6KN13hATH69dN7P6/WwcYDVO
         bJlbHow0eZIww6iM8K57So2Pl1uNS8inpMV8CxiUUMCIw9684H3wUeUycXm2/kFbiKoq
         mTX5FfOwLJRgtq9/YY5QitMhdfE9MMJ9gUAxLAbNYG/DHhiYfHKhgorUKU6o2nx7HfsX
         REytZI/zQ/oJEPvqP95et43EvxciwuzcNhwmspzPewQ4T7TO6K5uOVEFkITDYQ3S9eqS
         9eqxzSDU4ADuu0d216KCQPXjrqFI8yeW/04TtfTJxcGfh/fbz2KIS6kVVXobE4V4QHAm
         8Y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YJvkSzyQ78CqYoM3LpjKLXCFiGcDw/gxiiosR4pYAts=;
        b=vuibIWduyfJz5DHauPH+HCH4TsgsGDxyv2RIDWI9aV+52G62UyzDEAoLYk2QJ4M1gs
         S+4xEizjQQmyqKqcRQzYCgmL8XWmrNNOVp6IHxB3OENdTs3CEj8kcdrav56gPw12MW/y
         jdgpnjSdti4j401jZ6lV2Xu5Vw93wS0nSt7mDKZKciWfD+x/bUpHrdW7Lasa3WrrjUhu
         Ola6Lnmse6ZtieVF3qgt51Z+HluMySqvqrW5yFgsssPAFTJVO7B4jU9ksWfp/x3iiZn4
         JhHgEzlevtVshc37i87Hhcszxia9kr4q2ziWGtqWbwfOfzdQREAIm0ChH4L5L6Xs7PrZ
         w7XQ==
X-Gm-Message-State: AOAM532l8UXkJ/cbZDe85vKhbJsrEmal0OH6Q9sIvOVEQk1kEHOwgd8c
        zJEMETvAfeXdJ7Ih4lIvLDqfYVpDZIPvfMxP4EB97qgRHnn0rnMt
X-Google-Smtp-Source: ABdhPJx9ofxBEblfrrdbDLla2A9YVWsdhE+xZ+jxANI8pYD7FdDF/055Eu9sa7upRTW3xOO0oHZSWNBtjDyZ2nwUfkw=
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr6897247ejd.425.1634307671194;
 Fri, 15 Oct 2021 07:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210621172053.107045-1-maukka@ext.kapsi.fi> <20210621172053.107045-3-maukka@ext.kapsi.fi>
 <CAHp75VcjGpveAHNAW7Xf7d_Zf6LGSSyD6+qBiF9xxvb+EKs3tg@mail.gmail.com> <c7b9688f-5f52-94e3-532c-2177132869de@ext.kapsi.fi>
In-Reply-To: <c7b9688f-5f52-94e3-532c-2177132869de@ext.kapsi.fi>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 15 Oct 2021 20:20:23 +0300
Message-ID: <CAHp75VcFALMECoxQH=YHzfs23dOhngYS0pMUySyj3Lkh+D7BhA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: gpio-cascade: add generic GPIO cascade
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 15, 2021 at 3:56 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> On 21.6.2021 20.43, Andy Shevchenko wrote:
>
> >> +       gc->of_node = np;
> >
> > This should be guarded by CONFIG_OF_GPIO.

The above is actually done by the GPIO library nowadays.

> In the Kconfig I have a dependency to OF_GPIO. Is the guarding still
> necessary? Or should the guard be added and dependency removed? Or have
> them both?

For this kind ("generic") driver the OF_GPIO dependency is simply
wrong. You shouldn't have it.

-- 
With Best Regards,
Andy Shevchenko
