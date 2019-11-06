Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAD68F1E84
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 20:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfKFTVJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 14:21:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:55470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfKFTVJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 14:21:09 -0500
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23E4D2075C;
        Wed,  6 Nov 2019 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573068068;
        bh=kt51GLtJRGhpxeArH7PbPGc0NGH1R9MH+9Qgg9Bbl2E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IEAPWRQpe0iBBUsDao1BwZCcAb28KOkc7oYh6GKs2SroYSjzRVbW7TXz2ar0KL9d3
         sUnYQrBCCep8Y0basL097DguXypI0HNiAZbSzC4S+d4qPGDr14sHOzYFSytB1ET9y6
         OdgizA3YtPO8U5omwD7mj8rkAxMmeITXadRB5Qrg=
Received: by mail-qk1-f169.google.com with SMTP id m16so25331958qki.11;
        Wed, 06 Nov 2019 11:21:08 -0800 (PST)
X-Gm-Message-State: APjAAAUmMApYqHhGrHxgINZDJ2HwAvSjwYXCfLEgICffl/G18Lsag116
        51UTpt7qPDnYGrbs3nvuSBK6iKfoEFOLJ2/Fqg==
X-Google-Smtp-Source: APXvYqx32bwEhx99vHD/kDAS+/S75zvMWBv+yskX8CR2wiE5zYnXor6TRM6cgKz+ApVQJE7zjdsPqEDMXPf0REI1jX8=
X-Received: by 2002:a37:4904:: with SMTP id w4mr3368103qka.119.1573068067259;
 Wed, 06 Nov 2019 11:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org> <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org> <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
 <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
 <7811be04-dfda-5953-110c-bca685fdcaa4@linaro.org> <CAL_JsqJNcXe7YSUjHWyFO_czncnR3y7w3NP8ofXfCiXpMrqzRw@mail.gmail.com>
 <b3d078a1-f87d-c146-bdf7-7a6b30547bd5@linaro.org>
In-Reply-To: <b3d078a1-f87d-c146-bdf7-7a6b30547bd5@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 6 Nov 2019 13:20:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK2yBcWbZvK3qUeYW8q+NuWrUmCTBMWqwbAU_0i1fE4rA@mail.gmail.com>
Message-ID: <CAL_JsqK2yBcWbZvK3qUeYW8q+NuWrUmCTBMWqwbAU_0i1fE4rA@mail.gmail.com>
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

On Wed, Nov 6, 2019 at 12:09 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 05/11/2019 19:08, Rob Herring wrote:
> > On Wed, Oct 30, 2019 at 4:55 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >>
> >>
> >>
> >> On 29/10/2019 20:47, Rob Herring wrote:
> >>> On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
> >>> <srinivas.kandagatla@linaro.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
> >>>>> Its Phandle.
> >>>>>
> >>>>> something like this is okay?
> >>>>>
> >>>>> slim-ifc-dev:
> >>>>>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
> >>>>
> >>>> Sorry this should not be an array, so something like this:
> >>>>
> >>>>      slim-ifc-dev:
> >>>>        description: SLIMBus Interface device phandle
> >>>
> >>> You're just spelling out the abbreviated name. I can do that much.
> >>> What is 'SLIMBus Interface device'?
> >>
> >> Each SLIMBus Component contains one Interface Device. Which is
> >> responsible for Monitoring and reporting the status of component, Data
> >> line to Data pin connection setup for SLIMBus streaming. Interface
> >> device is enumerated just like any other slim device.
> >
> > So a standard set of registers every slimbus device has? In hindsight,
> > I would have made reg have 2 entries with both addresses. I guess that
> > ship has sailed.
>
> That will break SLIMBus bindings, Which is expecting one device per
> device node.

Like I said, that ship has sailed...

> >
> > It seems strange you would need both "devices" described as separate
> > nodes in DT.
>
> Because they are two different devices on the SLIMBus Component.
>
> >
> >>
> >> We already have exactly same bindings for WCD9335 in upstream at:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt?h=v5.4-rc5#n42
> >>
> >>>
> >>> Is it a standard SLIMBus property? If so, document it in the right
> >>> place. If not, then needs a vendor prefix.
> >>
> >> "SLIMBus Interface Device" itself is documented in SLIMBus Specification.
> >>
> >> If I remember it correctly You suggested me to move to "slim-ifc-dev"
> >> as this is part of SLIMBus Specification.
> >
> > Probably so. If it is common, then document it in bindings/slimbus/bus.txt.
> >
> As we are dealing with audio codecs here, it might be that
> "slim-ifc-dev" is common across wcd9335 and wcd934x but not all devices
> on the SLIMBus Component would need handle to interface device. SLIMbus
> can also be used for control buses as well which might not need this.

Like you said, it's part of the the spec, so define it somewhere
common, not in a device specific binding.

> > Then here, 'slim-ifc-dev: true' is sufficient. You can just assume we
> > convert bus.txt to schema (or feel free to do that :) ).
>
> We need phandle to the interface device so that we can program the
> streaming parameters for the SLIMBus Component.

'true' just means 'I'm using the property' and have no other
constraints. The constraints like type would be defined in the common
binding and no need to duplicate here.

Rob
