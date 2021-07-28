Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605F03D91CA
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 17:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235592AbhG1PY7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 11:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235457AbhG1PY7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 11:24:59 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DE4C061757;
        Wed, 28 Jul 2021 08:24:57 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id m193so4551784ybf.9;
        Wed, 28 Jul 2021 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5kNNnxvcaBvHSSfcwfCCGCG1lVimpt2MelDrvjqHWl8=;
        b=G91420ry3Osot2/237recxoKA6RHaHJVe+4Irpl/gLX4XiMk0koOCpdVqTTAyVbx3N
         Bti8KplTGrhMIbvO5R5350Q4nA8VvUnhmBooSy4NWZjAYeGA1Wh9bE6f2532jz1budUF
         O8lmzpt50SbAYzl/5ZG2UhBwAnRIAIfccaJh3INHGlfx/PuDCHsGGIXNg1asBSkRsHz3
         8/oAzWenfnrnfGYfNphGG+4/rKdp9RkK893csNKO+SM0Tr8MC6HdstgaedyYtnMPmL9e
         2qSFFfMI4FPe4bBHpBfar3K1zYY6rbYCpvZj5TVtpEXbIpb1+aQbE715q2uf7lyQ0XOq
         l09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5kNNnxvcaBvHSSfcwfCCGCG1lVimpt2MelDrvjqHWl8=;
        b=EGyayKifbxLt5mLfTQU1R/AqNcG8dq45QNjc1vipbWRZ3ZogGOV6xcz2nrPUU9LENK
         OpX2Kh/xiSyLE6KduHcu+c9YxV8vr/whOW587KWpmFHoKAcHCa7u9Y1nZpxJATCxYtCQ
         MIBtIsX9JwCl9W1Prts2x+p+0t6gJUu2hnwMG2g1cxo8JonB+9HadXdARIXj5IFIjXrx
         RCcvd+fcSeIHeTfeoE8LOoWEwAQV6Tpn13MtzTAZHaeAP0N/KBW4O9WOIT04ik3Oo6pf
         ttHviOUY8AhjQtRqVT00Bss6hp7Xg2KSi8a48G3L49OX1NdViVnhBxGO6rwKV3TsoeU5
         ndng==
X-Gm-Message-State: AOAM533YFuXTwCGN2aTNGz31CCm9JPN0ZYe0/zgoj5HbiZYF2ujLgsAf
        TaW6GhdZS8I2RhE36yPfmPdGwfaUBFTEWgS+llE=
X-Google-Smtp-Source: ABdhPJzKw6T2ii27sYldK7VEfZ/TTzvZA1kN5AuDUO0OdJ73j+brcpdTtJhZ8GmeijVQb8xNS/aQ5EBhbk48ObfEA+0=
X-Received: by 2002:a25:3c5:: with SMTP id 188mr246815ybd.437.1627485896803;
 Wed, 28 Jul 2021 08:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-2-pgwipeout@gmail.com>
 <10355864.nUPlyArG6x@diego>
In-Reply-To: <10355864.nUPlyArG6x@diego>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 28 Jul 2021 11:24:44 -0400
Message-ID: <CAMdYzYoUucnU+TG9-qtXdvpXZ8xtTwKuNKNDN5sgmQvsF8FX8g@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpio: rockchip,gpio-bank: increase max clocks
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 28, 2021 at 10:10 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:
>
> Hi Peter,
>
> Am Mittwoch, 28. Juli 2021, 15:55:26 CEST schrieb Peter Geis:
> > The rk356x adds a debounce clock to the gpio devices.
> > Increase the maximum clocks to account for it.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>
> that binding change is also part of Jianqun's gpio driver series,
> also adds clock descriptions for both and even got an Ack from Rob
> already, so we should be going with that other variant ;-)

Roger, I'll drop this for the next version, thanks!

>
> Heiko
>
> > ---
> >  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.=
yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > index d993e002cebe..489a5263a7a1 100644
> > --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > @@ -22,7 +22,7 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 1
> > +    maxItems: 2
> >
> >    gpio-controller: true
> >
> >
>
>
>
>
