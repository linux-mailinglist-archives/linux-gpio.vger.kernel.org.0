Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5E934E5D7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 12:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbhC3Kyv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 06:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhC3Kyf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 06:54:35 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5EBC061574;
        Tue, 30 Mar 2021 03:54:35 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id h25so11461081pgm.3;
        Tue, 30 Mar 2021 03:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GfTXsCc8VwOCrzz5IdVCXT4sti0I4o6ulUxkv8FeK7g=;
        b=YJAH/noyJneTpA0X43ErEz/UFsFEgkwZ3ukM7fGy4VRntqNAUK46Ay8zaGC6HZFdFe
         bLJjJwhtq6sieA9mutlfAU5p8c+v2REPkBDgqjFSSnIMsw8O4jf2P2BteogNq6PDB2nK
         7DWMWUCZ7pKisRqqAOgh/TsEC2S28DuvUmdShd4rFGmFMvB83NfLa7iz41JKIHEI1aGN
         LHky3qSLnQL2CS90SYvVtaHCEvgQZfvx9W//ENYy6aDEdYdP6Nv7jUuCd3hbm2WwrUlV
         JzTMUkC6SCO5CPbF9d+yYRxRbtOPTtHUedrx2YLDT1EyJDr3SCWl+CBKfrvDTztU6gxO
         GMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GfTXsCc8VwOCrzz5IdVCXT4sti0I4o6ulUxkv8FeK7g=;
        b=CzpyyWVbQja/1Pjps6/RmR7p066nkwhWgskii4gR8x03woeRLaNpzNl3aaPUCrYj4G
         9Gz+wvukI55ar/9Hw7gofZiA3LKEGsdLT214MPe1wy60Hgf/B9QHmjY5PpawgdMpIMHe
         +3TdX2AptJTdYhBEbCtaHvrIYKaoX+jZEK/vf/7uAY5ALakdXPthF1XKIgUDt7TB30wH
         kT1+7x2JhSRfpTxPgCRS7K4zzB0eldgge9Q/i5Jx2XRBJ3/KxmyC/TpdQfE77zlUKLGP
         bmU4DtnaBYDz9c69tbn/W8ACDQkiBGOn7nppSoli6o4jthLInKxNSYZazfqCSXMpFevs
         AFGg==
X-Gm-Message-State: AOAM5332FOp+x0+NmN7c3EWmsMAh+Ygrc7fSBkPSieD3Ko7NHEcW6kXF
        gb63mv9MWt72deUd5acatCduo7Q09aKusmMKfLk=
X-Google-Smtp-Source: ABdhPJyYjv0zrkk92HwCcZoSJd1Qt05pjq4R9mTJrwEJ6hv3FeLZ0+qIgtMm4U7QFaRNmO5DhyiNwMiZi7sLoxYeXGw=
X-Received: by 2002:a63:c48:: with SMTP id 8mr5797418pgm.74.1617101675189;
 Tue, 30 Mar 2021 03:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
 <118a6160880a212d20d0251f763cad295c741b4d.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VdRobc6jpFzAkd3U65BhiiNPLrF4qsnCKmsQBKMYbG4sg@mail.gmail.com> <d4e78b93a62d2882492b46942a927293bad81d66.camel@fi.rohmeurope.com>
In-Reply-To: <d4e78b93a62d2882492b46942a927293bad81d66.camel@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 13:54:19 +0300
Message-ID: <CAHp75Vce8sUsVz0YgHLDFbVMEmbYzaUZ-nRwgOeEfDHowEnxrw@mail.gmail.com>
Subject: Re: [PATCH v5 09/19] gpio: support ROHM BD71815 GPOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 1:43 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
> On Tue, 2021-03-30 at 13:11 +0300, Andy Shevchenko wrote:

...

> Andy, how fatal do you think these issues are? I did put these comments
> on my 'things to clean-up' list.
>
> If you don't see them as fatal, then I rather not resend whole series
> of 19 patches just for these. I am anyway going to rework the ROHM PMIC
> GPIO drivers which I have authored during the next couple of months for
> regmap_gpio usage. This series has most of the acks except for the
> regulator part - so I was about to suggest to Lee that perhaps he could
> apply other but regulator stuff to MFD so I could squeeze the recipient
> list and amount of patches in series.

I understand that. I'm not a maintainer, but my personal view is that
it can be fixed in follow ups.
The problem as usual here is that people often forget to cook / send
follow up. That's why lately I'm more insisting on changes to be done
as soon as possible.

-- 
With Best Regards,
Andy Shevchenko
