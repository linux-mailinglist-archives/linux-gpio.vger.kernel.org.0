Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C7637761D
	for <lists+linux-gpio@lfdr.de>; Sun,  9 May 2021 11:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhEIJvl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 May 2021 05:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhEIJvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 May 2021 05:51:38 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD4CC061573;
        Sun,  9 May 2021 02:50:35 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id v123so12030250ioe.10;
        Sun, 09 May 2021 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=barFcS9I2eyB+LExJ05prwmz4l/wrUna3uILerefQ8Y=;
        b=mDtS89YE6/aE+mdD8A3T5eB0bbXLccoGoIHac5O0Zmg+VUcQb2Es6op1pRmFMrgYR6
         pTbsPgTSCBGYAERUDiiEkghveS88M665/ETz0DFUqaRD5TIRoquCrrU/G7govjxLXW8W
         L8K7jlCeH/ZHGTdIHmC8kQS3MDGyN2y/NjCnTaIIdfEEMzPF8YkKGasBKq0mpkso1DuK
         axCvGx2Gwd+wLCMK5ATvSIY+PQ9QZNj9zmAuDgMvARwxx11WecQvMBO4g6haKgIl1kPO
         UeZ+k/UKLj9S5YtRKvFN5L2p56XWJodxB9/o7ilREZs49zEUlB/LtoFrbaJM+kZzH1ml
         KwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=barFcS9I2eyB+LExJ05prwmz4l/wrUna3uILerefQ8Y=;
        b=FNo1YH4xkuTjeJxz2xP/nKv3iWS9VrQ7mVQc1lsODnbh2/crN7hc8oNKzydFe2fz5I
         619bSNekSuf8a3Q3fPjZqqnQbiDA9DNcQjBQvZDCOyS/ysiD6SEkfGFthvwlwzAtJCRW
         CrfhwzmRxAbZtYcoOmMU3U2em3EJ2uSSrknm8szyHyt8dmtRd7jF4pYQnnRTo5E1JB/s
         9l/W3rtXG0RW1jxMj8yjQzzv+Qc6We08TVbvbGZBSWjTgxSeXYEnXo7/yH0MFp3fuFhD
         Lau6XDfkNhl9gKkMxsBId8eaikRBpYD71/me52S83bxcxKpVhc5+QRLjaUOtu+zQRHTb
         m9eQ==
X-Gm-Message-State: AOAM531wZ5jK1b9GgATqiGTiBt6qcKqHa223ibwzyuuf8CcM3HA5czun
        8jLEmFtgeua0pCcHoS3DQd46eb+/N5PtZvJ55N07HHi7
X-Google-Smtp-Source: ABdhPJy/Wtu2qDsOHlSuAWaVKuQP7l6s8S6ywNzFPQPjPGPR6/5kfsHEur62jTVotwRg/P0Cpj1/fTsEt4S67fZadmM=
X-Received: by 2002:a5e:8305:: with SMTP id x5mr13931204iom.112.1620553834384;
 Sun, 09 May 2021 02:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210508142000.85116-1-kettenis@openbsd.org> <20210508142000.85116-2-kettenis@openbsd.org>
 <CACRpkdbUNs_FFv9RteWKUrxBdRuiXU2Fkt-oY4=Phke4gNBoaQ@mail.gmail.com>
 <c1bd678c5dc81db8@bloch.sibelius.xs4all.nl> <CACRpkdb=0EQN=CJqfjKS-iuAiKCvU38fw5krzEY5LvhNpyFd3w@mail.gmail.com>
In-Reply-To: <CACRpkdb=0EQN=CJqfjKS-iuAiKCvU38fw5krzEY5LvhNpyFd3w@mail.gmail.com>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Sun, 9 May 2021 18:50:22 +0900
Message-ID: <CA+Ln22GnbTnxoAy0CWXVxAUUV-LBRHyLqDc2u0fpH5=FdHoWcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Kettenis <mark.kettenis@xs4all.nl>, kettenis@openbsd.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        sven@svenpeter.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

2021=E5=B9=B45=E6=9C=889=E6=97=A5(=E6=97=A5) 9:27 Linus Walleij <linus.wall=
eij@linaro.org>:
>
> On Sun, May 9, 2021 at 1:02 AM Mark Kettenis <mark.kettenis@xs4all.nl> wr=
ote:
> > [Me]
> > > On Sat, May 8, 2021 at 4:20 PM Mark Kettenis <kettenis@openbsd.org> w=
rote:
>
> > My U-Boot driver is here:
>
> Thanks! Looks nice.
>
> > > > +description: |
> > > > +  The Apple GPIO controller is a simple combined pin and GPIO cont=
roller
> > >
> > > spelling
> >
> > Not sure I'm seeing a spelling mistake here.  Do you want a comma
> > inserted somewhere?
>
> Your original mail says "conroller" but the helpful google mail
> editor autocorrected the mistake when I hit enter after it.
>
> > > So is this an entirely Apple thing now, and not based on some Samsung
> > > block from S3C like what we have seen before?
> >
> > As far as I can tell, yes.  This Apple controller has a single
> > register per pin that controls the muxing and gpio functions, whereas
> > the S3C controller seems to have 4 registers per pin.
>
> Fair enough.
>

Right, doesn't sound like any Samsung pin controller I'm familiar
with, although I haven't followed new hardware developments since I
left Samsung a few years ago. I've stayed as a maintainer mostly to
help with the legacy SoCs I had worked with, e.g. s3c6410. :)

Best regards,
Tomasz
