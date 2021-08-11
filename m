Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB533E9054
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbhHKMSW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbhHKMSV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:18:21 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE4EC061765
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:17:57 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id x9so4253641ljj.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KQjb/FThXLfBl/otc3Znh0SZQ+j62VlqIHDeYo+IMZg=;
        b=tpLq6HB2rX522yTr4THCUwY7joSNADf4vSrKKu61HhVFIllWBYhinsNhaggrONz8hM
         tDLN86QYxoZIZfKrdxHMR2/59QaV86eynH52IIlKR274X1lcOprxx/+RBEbVTk7ygZIQ
         ngjRQkm8RAfN4gMDLdy9NpLGwYCiZlywH2O3Is4x4Nr2NNdW3C8wtPIP/gFqTMTjlC51
         MGNu85NbTSDHS/GTNLKH+63Mk6pnX3tmBlD/98aTh55zEWaB7g6hADOSHK84xiMsIjvh
         243ls6P1nfk47fcRXZamgi5COT+S1zFrLX0Gldz8FVbrJ3YFL6Q4eJulvPy4NPi0X0Ej
         9dOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KQjb/FThXLfBl/otc3Znh0SZQ+j62VlqIHDeYo+IMZg=;
        b=g4VhmVmBY6mo0GvoaiaiShi4PPzNJ97BoZWbv+0ebTMMR2aE2+t1FGJgjVctPrGXnt
         hBw7INnXenOSfKkmMKL/LkNT28bidTdxgNmGpWWwPpEoqnWNiiOkz9xc/SU4t1vU3k3V
         /oZPBERK0JXwdaIVnExJUNsj4gsQQOSqluYH/vURRqwNsYDMfptsq8n6mOlA3aSZPGIz
         nCVbFe8/J2uWog5lCxS5Acf8z4ES//2hnGU/NCu3mjOzPn2FgPNvSHEYNUb1f3nPY8oM
         IHdrf9Pn7UdAfSdut9diELIgkL+h63EZsxhgQA2lGjhWyKC+jlDEOo0jvLOIqe1nos65
         Rsgg==
X-Gm-Message-State: AOAM5301rHepi8duFNbwz9K05kkdXgS4CZeiCFTgU5RktE86MjV9c0kv
        7Vwe5+tuRykWfMC5x2cYR/PO3djRBZuQWq6HPwQscA==
X-Google-Smtp-Source: ABdhPJykncSqm3nyxK3p72zHiH80OFKfNQHUKLJLnWJSQkukUssrqDDbMiWiEf8QJ4mkA7jhMhWxAvKH1ulwqn1rzAY=
X-Received: by 2002:a05:651c:1318:: with SMTP id u24mr23139087lja.200.1628684276361;
 Wed, 11 Aug 2021 05:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
 <20210607123317.3242031-5-robert.marko@sartura.hr> <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org> <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
 <20210719225906.GA2769608@robh.at.kernel.org> <CACRpkdbq6Jow6AT9OpsR7Q0JVCWVMcmamh9KHPXMtUnkoe7ZFw@mail.gmail.com>
 <CA+HBbNFEs-=5XTK7PUL+LsgBCcPfwHsCPe4v6byK0x=O_7TRPA@mail.gmail.com>
In-Reply-To: <CA+HBbNFEs-=5XTK7PUL+LsgBCcPfwHsCPe4v6byK0x=O_7TRPA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:17:45 +0200
Message-ID: <CACRpkdZfZLQMgpMAF2FwSVt1YAzhQJ9ZWkVUjVc2xpmWL7yEvQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Rob Herring <robh@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 3, 2021 at 9:23 PM Robert Marko <robert.marko@sartura.hr> wrote:

> The pins that this driver wants to expose are used for SFP-s only,
> they are provided by the Lattice CPLD which also does other things.
>
> Linux has a generic SFP driver which is used to manage these SFP
> ports, but it only supports GPIO-s, it has no concept of anything else.
> Since the driver is fully generic, I have no idea how could one extend it
> to effectively handle these pins internally, especially since I have more
> switches that use the CPLD for SFP-s as well, even for 48 ports and 192
> pins for them.

Which file is this driver in so I can look?

Maybe it is not a good idea to look for generic code just because
it is convenient? I have had this problem before with GPIO, along
the lines "lemme just do this dirty thing this one time because it
is so convenient for me" (more or less) and the answer is still
"no".

Can you either augment the driver to handle a regmap with bit indices
instead or write a new similar driver for that or refactor it some other
way?

It is not a simple solution to your problem, but it might be the right
solution even if it means some more work.

> GPIO regmap works perfectly for this as its generic enough to cover all of
> these cases.

Yeah but it might be the wrong thing to do even if it is simple
to use and works.

> CPLD also provides pins to test the port LED-s per color as well,
> but I have chosen not to expose them so far.

Have you considered
Documentation/devicetree/bindings/leds/register-bit-led.txt

> > If it is a regmap in Linux then that is fine, just pass the regmap
> > around inside the kernel, OK finished. But really that is an OS
> > detail.
>
> Yes, its regmap but I cant really pass it to the SFP driver as I don't have
> special driver handling the SFP but rather the generic kernel one.
> It only knows how to handle GPIO-s.

Of course you have to program it. If I know which driver it
is it is easier to provide architecture ideas.

Yours,
Linus Walleij
