Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE8539B613
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 11:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhFDJis (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 05:38:48 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:36629 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhFDJir (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 05:38:47 -0400
Received: by mail-lf1-f54.google.com with SMTP id v22so11772392lfa.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jun 2021 02:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aYp1Adr5CMzSylwvBButnic0kZJJSgzI/e/jfoc5XXY=;
        b=zInM2KVNPb/0QPFcMUuLjrX59X+MSPyOsPXAiH3/QeJdWAGWbbnaRTPHS24RvPGmhr
         1c/s7uWCp98bhXSvtHnmma4hxMKj2wkELcRP+NW8x4BhYVcl7Wb9OOmOAoZonNLEktjv
         f2GNReyAgIRUBqQ8e7dj4F0fjf2WoHlRjuhmhoG/EVs4gN3buzRA5qQ5eVJpspTvDXS7
         4kXp7Z6GCmiEQiovkQ6T+dw7y2+dMgjt9+vbFYwK6JWAMY0KocQsTXw4Cm6oKlnnJb0j
         KuJ5dOhdjhcfWgh6ghhZpWAQeFdQTklOzHk9JKZfwIMnCavpwhvEG5mnqRGyRTrrfBBV
         Go7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aYp1Adr5CMzSylwvBButnic0kZJJSgzI/e/jfoc5XXY=;
        b=tWRiRsla/iC6LAiSNGWgP2olw9qx8CS9h5I40wdU6hx67UeskQA7Izmq88flODGdwV
         eh5xZI7FkFnS7PtzDL3C7TOiWQgQdpk1lJoDNmAuZYJTPU+O8Xo5KuVp4IHoxt87TWc/
         kLdkA/oGAYmxi6rU7c/TAHHW8Gw4AXLTMppFtA3IryeTlWRGvdQ8Fx443y/+fmY2p9Gu
         +NVgj4RU3t4ODXdlPXEsp2GHxkJ/hBDZWTruObEbhvKO/1tbivaH5f+H7Sz7/rTuc9Gr
         Q9oFUOyiBwIHZCrii2+CTW3DT0jshb46jndshCRdbXR5y/M1Tk3lNmWBdTVxKIDDhTZ0
         rHvQ==
X-Gm-Message-State: AOAM530343N1XEB1/vqwpy7NzE6tUTyvLfd7pwusVJfcf3GZaLMvpVxP
        VWKjMzg3F1Z5IEpwpEhB2SSS0aA9MF4+lmqsuHjp3Q==
X-Google-Smtp-Source: ABdhPJwRz2Ggev+bmlNahkOO4PO7MbTDQi1yWOTrON9QwGEWdv0Ln2lES8Z8v6XjQDOxumVe/uHb7ZSWxPmgPct3veg=
X-Received: by 2002:a19:c753:: with SMTP id x80mr2236380lff.586.1622799359520;
 Fri, 04 Jun 2021 02:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net> <20210602120329.2444672-5-j.neuschaefer@gmx.net>
In-Reply-To: <20210602120329.2444672-5-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Jun 2021 11:35:48 +0200
Message-ID: <CACRpkdY6c750Dnh2H_6uEhOHJv-kLd_OpHqnuDKu4DQezZ2C_w@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: pinctrl: Add Nuvoton WPCM450
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jonathan!

thanks for your patch!

On Wed, Jun 2, 2021 at 2:04 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> +  interrupts: true

maxitems 4 right?

Make an enum:

interrupts:
  - description: what IRQ0 is for
  - description: what IRQ1 is for
  - description: what IRQ2 is for
  - description: what IRQ3 is for

And describe how these interrupts are used. Because I am suspicious that th=
ey
actually correspond to 4 different GPIO blocks, which should then be their =
own
nodes.

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    pinctrl: pinctrl@b8003000 {
> +      compatible =3D "nuvoton,wpcm450-pinctrl";
> +      reg =3D <0xb8003000 0x1000>;
> +      gpio-controller;
> +      #gpio-cells =3D <2>;
> +      interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH
> +                    3 IRQ_TYPE_LEVEL_HIGH
> +                    4 IRQ_TYPE_LEVEL_HIGH
> +                    5 IRQ_TYPE_LEVEL_HIGH>;

So these.

> +      rmii2 {
> +        groups =3D "rmii2";
> +        function =3D "rmii2";
> +      };
> +
> +      pinctrl_uid: uid {
> +        pins =3D "gpio14";
> +        input-debounce =3D <1>;
> +      };

I challenge you here and encourage you to put a node for each
GPIO "port":

  port0: gpio@0 {
 ....
  };
  port1: gpio@1 {
 ....
  };


> +    gpio-keys {
> +      compatible =3D "gpio-keys";
> +      pinctrl-names =3D "default";
> +      pinctrl-0 =3D <&pinctrl_uid>;
> +
> +      uid {
> +        label =3D "UID";
> +        linux,code =3D <102>;
> +        gpios =3D <&pinctrl 14 GPIO_ACTIVE_HIGH>;

Would be gpios <&port0 14...>

Yours,
Linus Walleij
