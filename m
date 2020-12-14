Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93CC2D950C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbgLNJUC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgLNJUA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:20:00 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FD5C0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:19:20 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id r24so28328604lfm.8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2KiNFGuHRAngXU50uYN5PWqWRF/ruTUekfUrlri0CfQ=;
        b=q4CcTX/QLO2V8+gRMKZ6WBTELmqzgjgvSoCKFoWlN76XMuPOfLR9SV36d5X1/2w2iS
         0J6Qn32h7syXJNuhSOxptmpYKdV0RwCQl5LmpHJVCOtLR8APxnWawj1AqnRsSZFeCfOa
         twdM4XmKyoQebBWA1YUR8J2zg6NtsPcoFR3jxPmorhpK2hFfhehb4uoMveR1D2EtmHgp
         tvJsYp9xKPSKF5O1+rqXBDw3mz1uSODx+FzvRrOJUxiBk/lPupH//CNldZakk1Ed9dQf
         lQJgGJ554qE47JsYzmiT7h0AM/JyJSZQ3d2vsBfJQRMx57PBo/+S0ledP049enSbxGPm
         8Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2KiNFGuHRAngXU50uYN5PWqWRF/ruTUekfUrlri0CfQ=;
        b=ZcjYIaa+ZiE6hvZpYouYpqPan8GF4pUXGiBmQOQaE4CylQ0tFt0XsW/Qd2WpwOCtHN
         Kbs5fevwHEScgwftcKaHjJEu2jK3tAVmvXnNdcAX/zav9NwMJdldz8/2Q+Yf4jt2iUlH
         RDT1U9ximZ+90ZXIFHypMC10Vy0VtUQknA7wptVw0UxLwxEml4mpvPe/7ZX1U0v1vcHq
         9gTInlz78dhcXdcv1y9Fz2VGDXcMMO+kYXJq083JLijOjo3nAizV0gGxfnLkw0+MkDXH
         /A4eKC8HDWKASd7vBBLf/adLggsUnOpk+BHvINhBeL1Zrd5sACJ+FU7NhJX47vfZXGwb
         eBRQ==
X-Gm-Message-State: AOAM533V3QHNYjRraM+MsQJQvB9Bp8+K+b2oD9ewl5f5VVqOzIPQhfru
        oE0ToJukHkHRriMYUda/LtEIbf5TIGAAi2kOZRki8w==
X-Google-Smtp-Source: ABdhPJwhvfpGJx5eYW996f7rt6XIHNAUFvQqTPj+6iJ1YJaQVGYhhsnA8B0WVBteIZYui42JJ4uZaIpk2CKEHgPzgTA=
X-Received: by 2002:a19:8384:: with SMTP id f126mr8561066lfd.649.1607937558820;
 Mon, 14 Dec 2020 01:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20201122170822.21715-3-mani@kernel.org> <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
 <X8ZmfbQp7/BGgxec@localhost> <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
 <X89OOUOG0x0SSxXA@localhost> <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
 <X9DsWahl6UDwZwBn@localhost> <CACRpkdYm-j9QcK8hgNrC33KruWE17Q0F4+T=UanE7PCEZEtu6w@mail.gmail.com>
 <X9HiGaIzk4UaZG7i@localhost> <CACRpkdZ6MUzRe9m=NrqA_5orhZXDtWj+qoFMHX7v6Zjsx-rVGg@mail.gmail.com>
 <X9cpQO3IV4IgX1dh@localhost>
In-Reply-To: <X9cpQO3IV4IgX1dh@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Dec 2020 10:19:07 +0100
Message-ID: <CACRpkdaGWpk=hB6osfXDqx_aSx0aYDyqJRNtY3Gr8z4bLPxZcQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
To:     Johan Hovold <johan@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 9:58 AM Johan Hovold <johan@kernel.org> wrote:
> On Sat, Dec 12, 2020 at 01:03:32AM +0100, Linus Walleij wrote:

> > If I google for the phrase "Detected name collision for GPIO name"
> > I just find the code, our discussions and some USB serial devices
> > warning about this so far.
> >
> > Maybe we should just make a patch to disallow it?
>
> That would make it impossible to provide name lines on hotpluggable
> controllers, which would be nice to support.

I merged a patch for this now, let's tighten this loose end up.

Also: thanks for poking me about this, I should have looked into
this ages ago :/ focus you know...

Yours,
Linus Walleij
