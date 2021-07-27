Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1FA3D78AA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 16:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhG0Omp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 10:42:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:34214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231466AbhG0Omp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Jul 2021 10:42:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00C7961AFF;
        Tue, 27 Jul 2021 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627396965;
        bh=iRcdF2bhdw7wijnGeYka6rVc5jIoSeBNnn7qex/P0HQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CezHG+tN8iSD42upYvUv4+WtE7Alx+F5QFWt/28yF6jOhHhpeNabpFsCA1y2N+pm+
         xfCVPK3w5TEFTeMEw9mC/xNIxM5+t3FdKMLsnHFJTWwBEhR/183bB78NVEB25RsMC5
         ttG0K3OX6aOHckUJC0N37RO4febBJy5IK/ZdaZcBNmPLkhQzwb4kCkf/ohU9uG/s92
         3HcvJ5IESp7KdqBqF1qqod/xznWDVS3mQq6/P5/ayGb0g8OtpQVNPyXRejnkH328SP
         pVVHbD8xbr38n9Q3GPZ0fuMGI0qDBk0Mg+dV+Hpdu+9mUXMl3B3WRy5+g5qNAukPnI
         7eBjb7jdSFWZA==
Received: by mail-ed1-f48.google.com with SMTP id p21so8553046edi.9;
        Tue, 27 Jul 2021 07:42:44 -0700 (PDT)
X-Gm-Message-State: AOAM533BWBCyAlQfyfy3fTLPgjNAM5iNMRUKFaXSgd7vXoqEQuTP29ef
        lIU8MzLTYGxxlq5l+abfWKUyBaDwHH6qjwXRuw==
X-Google-Smtp-Source: ABdhPJzZ3dcZSbE62SJMPL78QY10ME4lTGnE3r29kSVxIitdu3Zd+vnoWb2Mu+sUJOFdb/Oj42ta2AYGXTpcF7y0Ry0=
X-Received: by 2002:aa7:da4b:: with SMTP id w11mr28997675eds.258.1627396963563;
 Tue, 27 Jul 2021 07:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210721191558.22484-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1626964632.914515.4183863.nullmailer@robh.at.kernel.org> <CA+V-a8s1Cp+atEYFxSm1EpMO+ZqAa00jhHS7bm5QdTPJyd6oJQ@mail.gmail.com>
In-Reply-To: <CA+V-a8s1Cp+atEYFxSm1EpMO+ZqAa00jhHS7bm5QdTPJyd6oJQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 27 Jul 2021 08:42:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKdCMG=ONAfBh61DJ7Led32CH8XjwoRUp3CK_xkfpGUVw@mail.gmail.com>
Message-ID: <CAL_JsqKdCMG=ONAfBh61DJ7Led32CH8XjwoRUp3CK_xkfpGUVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add
 DT bindings for RZ/G2L pinctrl
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 27, 2021 at 3:27 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Rob,
>
> On Thu, Jul 22, 2021 at 3:37 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, 21 Jul 2021 20:15:55 +0100, Lad Prabhakar wrote:
> > > Add device tree binding documentation and header file for Renesas
> > > RZ/G2L pinctrl.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 155 ++++++++++++++++++
> > >  include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |  23 +++
> > >  2 files changed, 178 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > >  create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dts:29.34-35 syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1418: dt_binding_check] Error 2
> > \ndoc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/patch/1508385
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> >
> The base patch series required for this path is v5.14-rc2. (I had
> mentioned it in the cover letter, maybe I should have added a note
> here too)

I knew that and thought I'd updated my base. But it seems I didn't. Now fixed.

Rob
