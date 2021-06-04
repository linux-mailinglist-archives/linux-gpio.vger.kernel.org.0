Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C9A39C33C
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 00:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhFDWIb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 18:08:31 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:46723 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbhFDWIb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 18:08:31 -0400
Received: by mail-lj1-f169.google.com with SMTP id e11so13383682ljn.13
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jun 2021 15:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lm6qjNOSd7S3ElmBGLAdz/ltzncXw/D1BuDORLixUOY=;
        b=RpZRBAvNmlvbMhdcUNBT1IRUNettfyipNir/0qTLXWWLR9kdY0t6lKvAuh/oaTO45F
         5VYqft+IFQlJmmdwTQoAEFOwopCsUIMwZQlgODEkvQU8f/iH2vIB9Vv95mrSlCqO65kl
         w3P8QlnkZgOEDDR8ulaMR/x/vWmMO0QXEzB2uFKqpthjGimkeTBdq6IOsgSHFlBfFdNV
         afIVLhvu1AVawb5Ojf3Wd+4G2lTKMotrRitIkml6wxZ4ma3jZdfN6BNOWHtSBcSLtjL1
         7ZyK2RFaieTful8M/iFLhhAu+Vmhy6kX2GC1MGVLHjNe8RzhdcF32ZuwkectC9wXalaG
         0Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lm6qjNOSd7S3ElmBGLAdz/ltzncXw/D1BuDORLixUOY=;
        b=Q50U/8jWJKeRBcF7MnvrW4+eFaxhvwe/99eLlAUKfGXNe3nJtkzti4BhNHdwIeUqda
         uetIX2B5Np6Q+bnIv3L6U3gROwo7kS1qCm3fnNN0xTcbBbJXc3WAY9BSIkLFZhgO9JzR
         iAm33XKklpe0pZUNaqhcseRlGLWVJoCP7BFx0jGWbeG/X+S3EkrjBqAhCWFjiUbBzaYG
         DXRYz1FhDIr6RmLEsUbw8YW2sFoAGHaJQe1MpX03qvmWJuDJXWoUhC0QOJ8z/rHBH1LH
         VJC0aD7PNgjIxIwTimSUOfWVBSr+ae3kh+BgHbRWbo5yxA8hmnSOdz3ti4eQ4U3Kb8hN
         p52w==
X-Gm-Message-State: AOAM531ZY4R6/nsDQIds7G06V7Dk9ez0I4qqPBkfpH/O+dwHpEOa4Y5F
        jyi5ipnPSLu1rEGjS3MMOub7CHzVg86Iv2nGDcWcxw==
X-Google-Smtp-Source: ABdhPJxIEjo220o67L1taBJY3zqlit/QriVesKs4aC6pDmACw4lPvVzV8qVmU/R+jsc82jo3VZQGH3X9ojeu+ohPLmw=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr5091495lji.273.1622844333120;
 Fri, 04 Jun 2021 15:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622560799.git.geert+renesas@glider.be> <7caa954add90255fc177e5dbabe17d62e0242861.1622560799.git.geert+renesas@glider.be>
In-Reply-To: <7caa954add90255fc177e5dbabe17d62e0242861.1622560799.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Jun 2021 00:05:22 +0200
Message-ID: <CACRpkdbSP2FEkfY74HxSUDse57iRf3MY+-i5ZDk1AeUxd=FSug@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: gpio: pcf857x: Convert to json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 1, 2021 at 5:25 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Convert the PCF857x-compatible I/O expanders Device Tree binding
> documentation to json-schema.
>
> Document missing compatible values, properties, and gpio hogs.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
