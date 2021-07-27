Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D4B3D71F5
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 11:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235946AbhG0J1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 05:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235979AbhG0J1Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 05:27:24 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33C2C061757;
        Tue, 27 Jul 2021 02:27:24 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id v46so19656708ybi.3;
        Tue, 27 Jul 2021 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OXaP/V7E9VE6tY63eKRQ5gbV86lhUto9d36GQTXubCY=;
        b=KFYuPqxEbWgJg3sI4935wrP5FBajhMICpfDFJ/IMUVseOWYZO0nYmXhWZWZOLUogHE
         qb7gWpp8a0cQ+4z6ZlAkSP9Kzl39NPb9WQREZ1+g4HJfrV29b702Ix3Ouu5eHIjcweOS
         hpGAWABAAmWD8+PgeUuHmshjbnjrJJE1/ddrb/8DijucGXrrD0KdX0fH4wiInCGiylzB
         V5woj6lUKYdB1BLkMkxWTUnDwbbIh/qjj4ZhCzBGPLl15uR9DH1OcV+qeezs/42PGGcO
         3laD/q54vfQ8YEtxA1kW7RYxOuQBC9STRkRaSORLhV2vXF9bL9aWJoShf3LWCrP2MWOF
         afvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OXaP/V7E9VE6tY63eKRQ5gbV86lhUto9d36GQTXubCY=;
        b=J8cedr2qc4QlWLDL/FYN5wECqyOwm66+iPaYDJK2uOxWXH+0/YNHUFXhW9e+yM6Q7Z
         OAfa4T6A9dGFSJ/r+tWfC1WxMV8HM+1+S6sR93KkrSuXInK9CXNL9QSz7S19dlfGIWJs
         HLsRX9X+6rPE5eD28EUaxr/Mcye7G0s9KGj4Ms8svC2eZ1lmQ7+YyZehyo27nhxzKPop
         GcbNCi/DTXinZOSltEriWhSeJNy63DOg205dssKc6KYw51XUpf1xATouxI7sI86Nb5Js
         0ECLGzmUGsVhDGkMQ3L+TZagRHfkgxeeka/oI/eXHJUCXmJU83fsbtEl5Nmb6edbQPy9
         KKJg==
X-Gm-Message-State: AOAM532BxuQclL4+umbE5WdqdD83iX43TU5xcsuhYk6/S6pwyJC4lPOT
        EbeIHMsRclFLfaKeefjuOhQCXnoNTrrwHWVe5qY=
X-Google-Smtp-Source: ABdhPJw1d5jLrLhylPnJafYE/2u8pPAm5nX0i33oemeAERzvm+qCWm0EaJqS+oc/I2QRqEtkk6JwwZzPZEsIkSmEq04=
X-Received: by 2002:a25:dad7:: with SMTP id n206mr15828153ybf.119.1627378044106;
 Tue, 27 Jul 2021 02:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210721191558.22484-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <1626964632.914515.4183863.nullmailer@robh.at.kernel.org>
In-Reply-To: <1626964632.914515.4183863.nullmailer@robh.at.kernel.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 27 Jul 2021 10:26:58 +0100
Message-ID: <CA+V-a8s1Cp+atEYFxSm1EpMO+ZqAa00jhHS7bm5QdTPJyd6oJQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add
 DT bindings for RZ/G2L pinctrl
To:     Rob Herring <robh@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
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

Hi Rob,

On Thu, Jul 22, 2021 at 3:37 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 21 Jul 2021 20:15:55 +0100, Lad Prabhakar wrote:
> > Add device tree binding documentation and header file for Renesas
> > RZ/G2L pinctrl.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 155 ++++++++++++++++++
> >  include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |  23 +++
> >  2 files changed, 178 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dts:29.34-35 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1418: dt_binding_check] Error 2
> \ndoc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1508385
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
The base patch series required for this path is v5.14-rc2. (I had
mentioned it in the cover letter, maybe I should have added a note
here too)

Sorry for the inconvenience.

Cheers,
Prabhakar

> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
