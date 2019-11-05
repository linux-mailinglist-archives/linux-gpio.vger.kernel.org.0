Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08461F05AF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 20:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390929AbfKETIy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 14:08:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:45838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390709AbfKETIy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 14:08:54 -0500
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF3EC21929;
        Tue,  5 Nov 2019 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572980933;
        bh=OXmBdFlRHFjSKG93l0PdhfI6GDLFZkT6/eylL4O2BLY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=A4Pyc+titsh2MV21obxyJRFvEjTVhzZVdWlofZbm9ErJqczl1aSdsxzH2xh1K5BrT
         RQi8cmmYa3bBydJXKkGV83IkSwxjUqGwYyAs11LfD/Y4+MXMyC2wo0/rIObZ9L+ZMd
         64yEhJSyMdmn41WGoUwlTmPIbBRE864pCWHECsig=
Received: by mail-qv1-f51.google.com with SMTP id w11so366527qvu.13;
        Tue, 05 Nov 2019 11:08:52 -0800 (PST)
X-Gm-Message-State: APjAAAVrpJ1quM72a6Siy0L9B1jQla1F1470E+9A20OrTnKHjkeWPmzI
        jkrlQJtPCEuN4/yuLoRaa13wjhgl/VeIAvUzlg==
X-Google-Smtp-Source: APXvYqxZiO3lZWJ0HQfv3215/wlPFfLAmRacWVsijd7Otyaf6TcDjfY8XMoGW2mVkceqmWdXru0Tw3AymFwc3LoYKik=
X-Received: by 2002:a0c:ca06:: with SMTP id c6mr10688316qvk.136.1572980931880;
 Tue, 05 Nov 2019 11:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org> <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org> <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
 <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com> <7811be04-dfda-5953-110c-bca685fdcaa4@linaro.org>
In-Reply-To: <7811be04-dfda-5953-110c-bca685fdcaa4@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 5 Nov 2019 13:08:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJNcXe7YSUjHWyFO_czncnR3y7w3NP8ofXfCiXpMrqzRw@mail.gmail.com>
Message-ID: <CAL_JsqJNcXe7YSUjHWyFO_czncnR3y7w3NP8ofXfCiXpMrqzRw@mail.gmail.com>
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

On Wed, Oct 30, 2019 at 4:55 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 29/10/2019 20:47, Rob Herring wrote:
> > On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >>
> >>
> >>
> >> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
> >>> Its Phandle.
> >>>
> >>> something like this is okay?
> >>>
> >>> slim-ifc-dev:
> >>>     $ref: '/schemas/types.yaml#/definitions/phandle-array'
> >>
> >> Sorry this should not be an array, so something like this:
> >>
> >>     slim-ifc-dev:
> >>       description: SLIMBus Interface device phandle
> >
> > You're just spelling out the abbreviated name. I can do that much.
> > What is 'SLIMBus Interface device'?
>
> Each SLIMBus Component contains one Interface Device. Which is
> responsible for Monitoring and reporting the status of component, Data
> line to Data pin connection setup for SLIMBus streaming. Interface
> device is enumerated just like any other slim device.

So a standard set of registers every slimbus device has? In hindsight,
I would have made reg have 2 entries with both addresses. I guess that
ship has sailed.

It seems strange you would need both "devices" described as separate
nodes in DT.

>
> We already have exactly same bindings for WCD9335 in upstream at:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt?h=v5.4-rc5#n42
>
> >
> > Is it a standard SLIMBus property? If so, document it in the right
> > place. If not, then needs a vendor prefix.
>
> "SLIMBus Interface Device" itself is documented in SLIMBus Specification.
>
> If I remember it correctly You suggested me to move to "slim-ifc-dev"
> as this is part of SLIMBus Specification.

Probably so. If it is common, then document it in bindings/slimbus/bus.txt.

Then here, 'slim-ifc-dev: true' is sufficient. You can just assume we
convert bus.txt to schema (or feel free to do that :) ).

Rob
