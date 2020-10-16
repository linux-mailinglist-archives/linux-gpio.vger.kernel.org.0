Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE21290718
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 16:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408803AbgJPOX0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 10:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405369AbgJPOX0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 10:23:26 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1F4C061755;
        Fri, 16 Oct 2020 07:23:25 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a1so1610208pjd.1;
        Fri, 16 Oct 2020 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bDn8EvSa9x8an2wNno9ij6ESLlfjdp/gDnJjjs9WxmU=;
        b=Cm0QDu+2zt7x2CsvysYIOUjnnYj2q/soy7Zqe6eZqQb+aAqbK65twV5wmNF1dKVQnn
         knJHA961m5rK2ShudtgivBA4BQ5Q+TphtpNoplzdxZYl212CndoSc1byVmZ9BXkm+r45
         huG6daoRdIDTe9DxY4gcl5r5JVlwD6hNxuTZ/1DHtu1M12jnc4jwT+fYeI+SbcmlbO3M
         o5vwuPm1SfNBm51GlFNk7+QK8+Vku3eRGLF7ytMNTSVNKt3AqaRfavKa5DqVuBkXUwLN
         wnQlYwQD2Rsd1WpFxcymfK5WZ/gYaJrmUkQPPmdiZyA+d0xeniy5NxqXfBFIOckOUR1x
         OJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bDn8EvSa9x8an2wNno9ij6ESLlfjdp/gDnJjjs9WxmU=;
        b=LNTaJIlZ/6QEvUVu/h1DbZxJdm3nR4HkldYQQRhoa9HMb1rGE3eD97UdB86Y+5V8gV
         xPwfb/Vqa5Bsl2YJPVy5/MjyuD8MEXvlnfGZ4mernshVtSzIHiT0dvjsGTYaaobgPqvb
         UuXJL0Qo8fIw/Ro+afxUTMN2PKt77nX0LJm/35XBxLVBGhlXFZURR7Uy3rqR5Gv6WS0X
         IBWO0mvArnTtlRCPW+PelWQTYo6x09ZHWs21Z53x9OEuZFKFifvVvUc+nyvDVydoXMVu
         Z3ppkIimICwAGH/AoLaI99b+ir7yPItk22YF6wZAL94606HKYEkELnlwEz3x/q+YBE+z
         FnvQ==
X-Gm-Message-State: AOAM533WodrvmFOapIFyhiS+el46fVUlAzrWLJBGl+sNBGqrvXS1CFQa
        pwS8TdrQVnd1OJCAVBAKOvvoTjIv1x1RuhKwGsvLKpq4F6CyR1Br
X-Google-Smtp-Source: ABdhPJwwRTj7vSKIcksqdqRdeNJRiJuCowW8CKyw+E6kIGyswpUPhF3HMDpQTxqh6ySRsi7g0BT2PwS2bHIOUPOzl8g=
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr4090150pjs.181.1602858205436;
 Fri, 16 Oct 2020 07:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201014062921.79112-1-warthog618@gmail.com>
In-Reply-To: <20201014062921.79112-1-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 16 Oct 2020 17:24:14 +0300
Message-ID: <CAHp75Ve7TspiCredTu48AwstS4YUnfKTHzvuxvhq_-c9697igg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: cdev: document that line eflags are shared
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 12:21 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> The line.eflags field is shared so document this fact and highlight it
> throughout using READ_ONCE() and WRITE_ONCE() accessors.
>
> Also use a local copy of the eflags in edge_irq_thread() to ensure
> consistent control flow even if eflags changes.  This is only a defensive
> measure as edge_irq_thread() is currently disabled when the eflags are
> changed.

> -       if (line->eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
> -                            GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
> +       eflags = READ_ONCE(line->eflags);
> +       if (eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
> +                      GPIO_V2_LINE_FLAG_EDGE_FALLING)) {

Hmm... side note: perhaps at some point

#define GPIO_V2_LINE_FLAG_EDGE_BOTH  \
        (GPIO_V2_LINE_FLAG_EDGE_RISING | GPIO_V2_LINE_FLAG_EDGE_FALLING)

       if (eflags == GPIO_V2_LINE_FLAG_EDGE_BOTH) {

?

-- 
With Best Regards,
Andy Shevchenko
