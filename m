Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033053E567D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 11:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238628AbhHJJQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 05:16:02 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:38544 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhHJJQB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 05:16:01 -0400
Received: by mail-vs1-f42.google.com with SMTP id f6so1185924vso.5;
        Tue, 10 Aug 2021 02:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NEOZtP+vHU/ivcHcvORMOPiKRJ6UVUVnc4R4agMKZOY=;
        b=i+Fji5MnN+0b81wRdRwVRhIRiXov6X2S7midr8jAUprhBtfL1AjXSopuf8fT+gXCz6
         Asx74BKOd0+EKYy1bhrjV9WWhQHMN7gQgWDzp/DweVC/uS/FfwuB21l8tok2h48QjW2Z
         sq9A73BryC7vic7/nJGAuHvl1W73Ia5AsmehOTFGityZ+MkNgRrZlF99ugqDWhzwPY2K
         kRGqCyVBa1YJJvl6WAJs2Wx07b/simDgLP1IiB5CYsm2mYcS3C4mQZ8S4zfvUuQo6VGk
         JxRaxZVJL9z9uG53jRP0ePC65823a1vb6pjzxcxUMHV5zxaQcpnQTLUo+ThYDYmlHznC
         ET9A==
X-Gm-Message-State: AOAM5307ymg//dsJv7shNx4Nb+migFj6TPK5AztoZxMgtHia/ZkARd5H
        l8hk/PwJjC2h0p+JMUShtfDqAPGG+o3l6AuQ+co=
X-Google-Smtp-Source: ABdhPJwqYP20QSAIORoskonORuJVtXmoKAlng9heM59wu3qA9HVuH3aA17E+xu/xvDQC4SO6mikMQkO9VC7FWZCkxRw=
X-Received: by 2002:a67:8009:: with SMTP id b9mr21201233vsd.18.1628586939429;
 Tue, 10 Aug 2021 02:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210727112328.18809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210727112328.18809-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210728160253.GA1150550@robh.at.kernel.org>
In-Reply-To: <20210728160253.GA1150550@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Aug 2021 11:15:28 +0200
Message-ID: <CAMuHMdWFSVCPkCHwyKH2t=2Uh2FCOGAN4UucnRkhXyNMg34VRw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add
 DT bindings for RZ/G2L pinctrl
To:     Rob Herring <robh@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 28, 2021 at 6:03 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, 27 Jul 2021 12:23:25 +0100, Lad Prabhakar wrote:
> > Add device tree binding documentation and header file for Renesas
> > RZ/G2L pinctrl.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Hi Rob,
> >
> > This patch requires the base series to be Linux 5.14-rc2(or +) or
> > the bots would complain about check failures
> >
> > Cheers,
> > Prabhakar
> > ---
> >  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 155 ++++++++++++++++++
> >  include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |  23 +++
> >  2 files changed, 178 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, queueing in renesas-pinctrl-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
