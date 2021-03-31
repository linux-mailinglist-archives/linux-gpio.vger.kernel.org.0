Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FC13501F7
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 16:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235841AbhCaOMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 10:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235976AbhCaOLz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 10:11:55 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F523C061574;
        Wed, 31 Mar 2021 07:11:54 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id h25so14317807pgm.3;
        Wed, 31 Mar 2021 07:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=32RQZhHIbg29tka7G3qVJxotSTluRvACFQj5Q5cAkVI=;
        b=dA3v6PZlP6yJ4F/duWkL8VjDyGtZjvkoGZi+dIT9MJOFVnRwv9Lz+As+CbuMvyLGaz
         D/r9j5zaFWu3x4rO+EerPDiVdTjpfAvxZvwST1zS2Uu9pMUvQypwQVqDISJgXlt1l2S7
         ld8PXXY3SVF7Ol4ocwFunP8KW16K4oPAYTZm4IoeGTJpesRrpfMELIdUQazNKIEXvEss
         zITkhn2h7n7UCtNkVSlB7CpwEMywrBOtQSzwWB74bONhiN1IttLBZFTAzF7ZVL21OGPe
         hAV40WkO5XeV+VfrvPsPXwIQNIYz8A650sCoCYbwxEuhNNhy+LWMc2dgtZPFTylTaQAh
         oyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=32RQZhHIbg29tka7G3qVJxotSTluRvACFQj5Q5cAkVI=;
        b=VYkjOPMENH23MNjBUYUmWmuD3NaWuSHEKE8acOvDINYL0yF8CliIR7YSntB9kx0wA5
         NIZNozf2STmB6TPBNadT39mOubYLCgZmg7mCTY8PEmVY5og1EgjPKHxgO2oyidy6cW4b
         BZsqDmXggnHdP4Tgej0mFDfSUuqwSkHIqQ6Q6v2FQ0sQTSKFmggeZUaljXrAnTscEmGH
         +idZu/LdGcuTN4L1f1bwkOY08Gkba4TWpvYIOwRtPC4h80DaKGDxB3WG1WUbBVx8J+Ca
         0mI8yHagt7K3H3aEvp63HEPzyA2MvD9S+oLEkMdHDD8JlwWSGgWSYH+6vEzFxLFSXLVP
         +1TQ==
X-Gm-Message-State: AOAM532PfSvN0O6I5uULrniUhfBi1HR76NsyD4vurXHQjbX1u6qX9Xjz
        llLpj+tQWOkm7GoU1pZ+p7VaNpHKe0d6ULC4oj4yTBpPBjx7sg==
X-Google-Smtp-Source: ABdhPJw/DJ6Ldm3VbtELcfCNAvPjiAS7dmSM/JT1E6iQPEKoNsJeojtgvNM26HJs2Cyh0GsLiEQ+3+OY5Vug4EeB67o=
X-Received: by 2002:a63:c48:: with SMTP id 8mr3427053pgm.74.1617199913923;
 Wed, 31 Mar 2021 07:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <3c19d714645f788913956223097adc360ceb6203.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <CAHp75Vdk4rxiD_nm8Cb53oTYNvMqkAOM4U5zEn5tchtptQZEBw@mail.gmail.com> <83d7ea27b27225727fec7b077efe1a67ba1184a9.camel@ew.tq-group.com>
In-Reply-To: <83d7ea27b27225727fec7b077efe1a67ba1184a9.camel@ew.tq-group.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 17:11:37 +0300
Message-ID: <CAHp75Vc5Nw+GJ4tFeciYZQhJ_NbRZMJjJNcWeFq7nOuAOe0=jQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mfd: tqmx86: add support for TQMxE40M
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 4:33 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
> On Wed, 2021-03-31 at 15:37 +0300, Andy Shevchenko wrote:
> > On Wed, Mar 31, 2021 at 2:38 PM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:

...

> > > +               return 24000;
> >
> > AFAICS it will return 24 MHz for "Unknown" board. Is it okay to be so brave?
>
> As noted in the commit message, our hardware developers intend to use
> 24 MHz for all future x86 SoMs.

What may go wrong in the future?.. (rhetorical question, obviously)

-- 
With Best Regards,
Andy Shevchenko
