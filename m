Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039692D542B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 07:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730829AbgLJGt7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 01:49:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730804AbgLJGt7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 01:49:59 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3209CC0613CF;
        Wed,  9 Dec 2020 22:49:19 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id d8so3938857otq.6;
        Wed, 09 Dec 2020 22:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GpLHl8aI+wmgxv0hazRZPDJI4LNA3P1gAIF5pSq6p6Y=;
        b=KD3X5V20NWATnMDZqY1vtwyVJUOg0NRR1hdRGaLIDsJJZEpoPXsA3V4Smer6/6zBuR
         C7t7pkG/o/pAVc6wbHuddSRNTFOWuMXs/zUgmyWJKBu6UzCDN6lkjTaFzX0wqNNTC2rc
         YZQEA3TqVQWPTg5BP6kaf4uxgzKUQh0KgDA0t4EGJcY/aTPXlSvB63yQyXSiVoXXtHzO
         LGjbpt2CPx+3PTM/pW4qvqsf4u8ZSZzi++cd8gMglgiQkCHtv3DE5FoYeNv+Y6IVAC9l
         5/D//6m97hLaJNghfr4hJBIDQHHFvYo8XCWLN6FIEtMlIUSLMXKGQTJ9kG2O2q5NwzBm
         GOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GpLHl8aI+wmgxv0hazRZPDJI4LNA3P1gAIF5pSq6p6Y=;
        b=JV1OMol6rtgMoPm0QtVN8W0TOIf26TIlCNjgioHrKa7J752uR8OJZg2nW/EQLAiOjz
         X4ikIzPsu4VNWDCg+EjPa1IfOTH7TsXofyEhYLr0mhVMeKfeS/fLfPUC6pgwtCkgJtzc
         lPzv8rTdLDGVzfPY1KOp7MfaNznumj0XS0bR9VrTvnmRRWjzwbkU3fZo/oBM0XTplONI
         by7wxncBlqDFec4za+TSsr2mMUKCKF2uf/cmiUuTg/1kgwYVYl66PI6pNvcKfiyByMQI
         s/BJ3CFxS9OCVWJbKjIurYQAy54e6YXJTysIbk7QlwTv7bXGSlYNtey4Kr96HV40NJd8
         XYlw==
X-Gm-Message-State: AOAM531f6dpCmxhcGtG52dMdcHKce7E52GvRbuuu6y4LH2tFTI/TDiZk
        96JXza4XP53HC9ejmE84mmzYrOu66e6rh4IgY62B0Ym2
X-Google-Smtp-Source: ABdhPJx3GmmPLYce7Q7MbSvoY73AdVSTZAg5Z4f8b87slKZJ/tUFYD/TvNj0jR6sWXX8CcQgic49Wwcj637RG6EfdoA=
X-Received: by 2002:a05:6830:2371:: with SMTP id r17mr4923392oth.236.1607582958667;
 Wed, 09 Dec 2020 22:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20201207081151.7489-1-sergio.paracuellos@gmail.com> <20201210021353.GA1495778@robh.at.kernel.org>
In-Reply-To: <20201210021353.GA1495778@robh.at.kernel.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 10 Dec 2020 07:49:07 +0100
Message-ID: <CAMhs-H_bzC1XLDnZQOKim0baFdM9Fe1_x7kDDjSbMSrw04XKXA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mt7621-gpio: convert bindings to YAML format
To:     Rob Herring <robh@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 3:13 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 07 Dec 2020 09:11:51 +0100, Sergio Paracuellos wrote:
> > Convert the mt7621-gpio device tree bindings to the new YAML format.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/gpio/mediatek,mt7621-gpio.txt    | 35 ---------
> >  .../bindings/gpio/mediatek,mt7621-gpio.yaml   | 72 +++++++++++++++++++
> >  2 files changed, 72 insertions(+), 35 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
> >  create mode 100644 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks!

Linus, is this patch going in your tree?

Best regards,
    Sergio Paracuellos
