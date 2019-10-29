Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6AEE910C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 21:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbfJ2UsC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 16:48:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727518AbfJ2UsC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Oct 2019 16:48:02 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 772812173E;
        Tue, 29 Oct 2019 20:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572382081;
        bh=Ygn4EvFTkQPU9gL2XGi0tJULzGH0l8RhkL1ooAj5JHg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XqxK6ael7sn32QGY8CaCGOGjbhuxgUjpBmpIdAEvJUv89tiObkUkSILVBHDCE7LJZ
         rV6D+ERGDqoFwIA6Yrqsskn8zciws9s0b8B8ub38xm14dNkk3ymYfSej13WrhlzPkz
         8JcdPJuAT2cGzKwPOcO8vsbcNpIKxV9thnpvNQvY=
Received: by mail-qt1-f174.google.com with SMTP id g50so104396qtb.4;
        Tue, 29 Oct 2019 13:48:01 -0700 (PDT)
X-Gm-Message-State: APjAAAVvzDXClW/hFyBwBHRpE6DsPW7dKh3B2o4s9m0kJPPXowuVe+Ws
        1d3py5I7vK+rA8Y68rr1ivBI6Wi0PmD54kxrww==
X-Google-Smtp-Source: APXvYqxRQv2XrvJIQ3TVSDV3CE8sreLm7dFshwfw+gLwCiGofNx5kLIVQs/5+QRDKOiPEJXkqbqx8OxZBZCu1r+/L10=
X-Received: by 2002:ac8:70c4:: with SMTP id g4mr1279199qtp.136.1572382080593;
 Tue, 29 Oct 2019 13:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org> <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org> <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
In-Reply-To: <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 29 Oct 2019 15:47:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
Message-ID: <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, Banajit Goswami <bgoswami@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
> > Its Phandle.
> >
> > something like this is okay?
> >
> > slim-ifc-dev:
> >    $ref: '/schemas/types.yaml#/definitions/phandle-array'
>
> Sorry this should not be an array, so something like this:
>
>    slim-ifc-dev:
>      description: SLIMBus Interface device phandle

You're just spelling out the abbreviated name. I can do that much.
What is 'SLIMBus Interface device'?

Is it a standard SLIMBus property? If so, document it in the right
place. If not, then needs a vendor prefix.

>      $ref: '/schemas/types.yaml#/definitions/phandle'
>
>
> >    description: SLIMBus Interface device phandle
