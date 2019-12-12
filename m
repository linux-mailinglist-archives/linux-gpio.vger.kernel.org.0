Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A61A011CFF5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 15:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729757AbfLLOgq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 09:36:46 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34829 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729769AbfLLOgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 09:36:36 -0500
Received: by mail-lj1-f193.google.com with SMTP id j6so2566923lja.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 06:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mFBaysu79yDikUBKmCJOSK+/KcLNsfSxo1Kg6RMTYzo=;
        b=CYTDu33S/uRKGhVT7parvwID0Z4EEkvon8ISEhgQg581I+1vygWkVRJfIX6VyR90IP
         5s90on/IBWtzNCkfiPg7uk+yBQZZgeRl/SRSDr7c+w33usVVyP+MJiAG1YhQEWLjO/Lm
         P/0CD0GARye2OYMRl25h1tC04+CXoKFn2YTnfaKWCVyq0RUQtJskTe7aNXDDUW4mR74/
         t7GoesEcr1oPDRiIJXWl4xt+DmU6FKcdogFEPM7GJ0MbM1/bRU5TyZ/4OU2CRtiJtNg9
         8b733kTi7YVBHa42ZnE/qE1MABlz/YuyRm0mRdXrwoA54K3MFcLxF9VgrBgIm71NLVT5
         m2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mFBaysu79yDikUBKmCJOSK+/KcLNsfSxo1Kg6RMTYzo=;
        b=J9+cT/rk3Ug/PeCB/FJQedb3HWo88qtNZjBHvGfbg2n40ovBGbXrT1iLt9XDGo4/sp
         RG0QPanyyZAYt3GZ40U2X9PeaCjQ0lk3acdXJq0+9vq5UlIbDxcXHF0bSX8eZPcoLgaT
         poWvGTjyvrhzQbiIhZWRWxIMIXb6DX/odpiOF68D1BtFmyeNIc9PCsiKoTKwRlXBXDoy
         QPkV95h8CII0GY+LjNIkLxNbwctDT72+vs9/xfl4JNZDtYTzbTX5vi6DRb3QU2H4Xn5a
         G8VG6vq6s8nUU1DErUdTDyyTJqATiwsLQ0ebHXl2SmDKCxdpnmVr2F26FQyZEFjAMI1E
         UiuA==
X-Gm-Message-State: APjAAAVbDbwc+3G9SOC0Rp34vYZw1STjVcPhrNLKMJZ3loz7kjZcW57S
        z4XbcgaqXVFETyRGYZX4rwcfjLns0rGmP7Xtv9hPtg==
X-Google-Smtp-Source: APXvYqz/zPYVnRmIpLFYccngv9dixRG8YUx2SGeQvmu/20Gvhakgo9h/gmYehDYbcCI+QIDTfrgweSqbzBJTINCecCM=
X-Received: by 2002:a2e:844e:: with SMTP id u14mr6119798ljh.183.1576161394471;
 Thu, 12 Dec 2019 06:36:34 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-3-geert+renesas@glider.be> <CACRpkdYyY0eGipdK6ixZxLtdJ5px=U2mOa79VZb00NEEAEL=6g@mail.gmail.com>
 <CAMuHMdVL2w=DzOHTh-Tq6NZLTNUKxUneMi3wX71Z83mdsy3LTA@mail.gmail.com>
In-Reply-To: <CAMuHMdVL2w=DzOHTh-Tq6NZLTNUKxUneMi3wX71Z83mdsy3LTA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 15:36:22 +0100
Message-ID: <CACRpkdZ0geBk4oBkjb3w9kep-jWMUdpegngspN0yhKRaNY0ZKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpiolib: Add support for gpiochipN-based table lookup
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 12, 2019 at 2:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Dec 12, 2019 at 2:20 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Nov 27, 2019 at 9:43 AM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Currently GPIO controllers can only be referred to by label in GPIO
> > > lookup tables.
> > >
> > > Add support for looking them up by "gpiochipN" name, with "N" either the
> > > corresponding GPIO device's ID number, or the GPIO controller's first
> > > GPIO number.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > What the commit message is missing is a rationale, why is this needed?
>
> Right. To be added: so they can be looked up in the GPIO lookup table
> using either the chip's label, or the "gpiochipN" name.

After reading the aggregator/forwarder driver I am not convinced
that this is needed at all and I think this patch can be dropped,
but check my review and see what you think!

Thanks,
Linus Walleij
