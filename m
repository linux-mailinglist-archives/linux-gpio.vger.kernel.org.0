Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747DA389F9F
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 10:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhETIRK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 04:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhETIRJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 04:17:09 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30FCC061574;
        Thu, 20 May 2021 01:15:47 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id c12so208338pfl.3;
        Thu, 20 May 2021 01:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SdyKECh0fEb+UvxR4lagGLq2m3LWI3riUHFAOcDJNJY=;
        b=BOMwda17kpkCyirEBkjF3uWkvF+DQfeLpDDPMj15Shhf9xXU8/6H3yByt65Lmq5sR4
         NdpzC8UFppX5HhXaZFzKYVFdgODz0uNGdGIgj1lkqpb6SDjKfZUx4mq8nTnjLoQO/zox
         U/EdWXFYkjKPNFBTSV6cvopZERxUCFodJjSzOF8FBxGAtguuv1svwQJbpgVWr2dUODil
         pB5iOEXbFfcZmmE5wjE+i6g4VcSvSsFLeuyEDRHnv+2EUjYOpeYIEr6FTkonbmayQR/A
         skgHEfCMgoJoD8eyTLaBrzKwRdhoThXF/f6vAOwQTC4yd8skzqJGCMc0NhZz7QI0p4C3
         brMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SdyKECh0fEb+UvxR4lagGLq2m3LWI3riUHFAOcDJNJY=;
        b=b3jlhbAidHbceAJ1iwNSZ7T9ONm2R3EWRgt28vNJpfwPKDfuhADE/nNIQu8n3Ae7S5
         JK3Kmr/+ntbQdDQRzGPEs8ej/q+QkQakVhTyv4BJg+wrnjl62T6bjQJwu8x5qyN1Y2UJ
         9+atiS0PP7fBu/K7sNeh1++Cs+1wV14a/KacxnH6GvnWpCl3Etc1AcCl4zd7dMhZr5De
         r2L/LI1xt+JcT7ewgTuDUP8cSIsMmQd7pJeTagS2uNwetX93/Zf7SSFDHR182gs9uu3J
         m3kjq4lLjYBtRaDbjzeQ1s/t4nbzJakitezHbDYrAUU6wuJMgu5oJ22N0A67nH+UIWoz
         FIbQ==
X-Gm-Message-State: AOAM532f6qHwXC3aUIJUNUhG7kTcPV4Tg9zACfzTpWdk+TwVleGlqh3X
        +6sbKVaDlroGHfNes8lBxqZOMbNRy6oGRpx3qLk=
X-Google-Smtp-Source: ABdhPJyfFnQlNGsV9/iaPHlsgGs9ebuW/38steaJ9iSfBEMCuOo+ERW/WGRzgvxzw8Plhsi70HqwqJ5UWf/xSQfNpr4=
X-Received: by 2002:a63:79c3:: with SMTP id u186mr3398497pgc.203.1621498547391;
 Thu, 20 May 2021 01:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210518083339.23416-1-andriy.shevchenko@linux.intel.com> <YKYYp6Z4HAYHLaFz@hovoldconsulting.com>
In-Reply-To: <YKYYp6Z4HAYHLaFz@hovoldconsulting.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 May 2021 11:15:31 +0300
Message-ID: <CAHp75Vf_tQxPcRa_ObYngUFQqzFrx2RyUcqemyeHFDOD1XEnbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: Introduce for_each_gpio_desc_if() macro
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 11:07 AM Johan Hovold <johan@kernel.org> wrote:
> On Tue, May 18, 2021 at 11:33:39AM +0300, Andy Shevchenko wrote:

Thank you for the response, my answer below.

...

> The _if suffix here is too vague.
>
> Please use a more descriptive name so that you don't need to look at the
> implementation to understand what the macro does.
>
> Perhaps call it
>
>         for_each_gpio_desc_with_flag()

Haha, I have the same in my internal tree, but then I have changed to
_if and here is why:
- the API is solely for internal use (note, internals of struct
gpio_desc available for the same set of users)
- the current users do only same pattern
- I don't expect that we will have this to be anything else in the future

Thus, _if is a good balance between scope of use and naming.

I prefer to leave it as is.

> or just add the more generic macro
>
>         for_each_gpio_desc()
>
> and open-code the test so that it's clear what's going on here.



-- 
With Best Regards,
Andy Shevchenko
