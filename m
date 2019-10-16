Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04842D889E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 08:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388559AbfJPG1X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 02:27:23 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45898 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388042AbfJPG1X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 02:27:23 -0400
Received: by mail-pl1-f195.google.com with SMTP id u12so10748531pls.12
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2019 23:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=xcdwT4cF2V+pOFpto6g1hLsKYDE91tN3/jlyW1Fe6XM=;
        b=NDFsVTzR4A7J/IjHujREEahybZdPIx81kKZJfQf9vrZWcp0Xvh0Y3IY/NPtNxtpUTL
         DL6CDSipP//uBcELpJWx1twdiIirLRhmrMU3hAjrhPoFCkQI69yJKB0L8AzIGdHqS4R2
         6D8n2hhpUUCEsJ/3hdBIrLYgexAkwibos7Zrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=xcdwT4cF2V+pOFpto6g1hLsKYDE91tN3/jlyW1Fe6XM=;
        b=EEXSajEyAj83S5ChBpZPzULkIv0yOhq1GQPbzg5T5BuqKS5iUXBIanIwRx9Omt7ctO
         RmXXxKBCnRsxANBIxQZPW/L8Ofn3rOZQc9g7g66kekDf4ExOKyqCeYPMb2zxJUErlnTz
         KugLsFSxY18LSgGsdiQb+RP0emOZdF3ldXgmwh/RwDWp6Ed9Jms9HxaEGlV7L6RnJb+i
         iIVgoOIG0mTLnIpb91RjbsqFA6/b9gXXeCE9dH/jXIXoiMRaitfvXQtznxhw99EFlBSD
         KApDoxohOMIz2vpLsHZhEP//0vFBQNo6FSyfRVEhydYsyWUNVPYXdP7lKSAfjd6Pvoc9
         RkeQ==
X-Gm-Message-State: APjAAAXPg2LUGc6akjlLtqUWthwAb4pzFbwNZf8nCPCGD1Zw9udRWDgP
        M96RH1wYUDvseA6eM7vhJEWo3w==
X-Google-Smtp-Source: APXvYqw35UsGC1shtlHLmY97gFEhNOpvQbnF+X0xZdpfm3AC4KGJTc7/ShcSDiJwNixAk6+nO3HRxQ==
X-Received: by 2002:a17:902:b109:: with SMTP id q9mr39203001plr.306.1571207241975;
        Tue, 15 Oct 2019 23:27:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v4sm22330420pff.181.2019.10.15.23.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 23:27:21 -0700 (PDT)
Message-ID: <5da6b849.1c69fb81.a9b04.1b9f@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5d92829e.1c69fb81.d860a.9096@mx.google.com>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-7-git-send-email-ilina@codeaurora.org> <5d92829e.1c69fb81.d860a.9096@mx.google.com>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Lina Iyer <ilina@codeaurora.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, maz@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 06/14] dt-bindings/interrupt-controller: pdc: add SPI config register
User-Agent: alot/0.8.1
Date:   Tue, 15 Oct 2019 23:27:20 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Stephen Boyd (2019-09-30 15:33:01)
> Quoting Lina Iyer (2019-09-13 14:59:14)
> > In addition to configuring the PDC, additional registers that interface
> > the GIC have to be configured to match the GPIO type. The registers on
> > some QCOM SoCs are access restricted, while on other SoCs are not. They
> > SoCs with access restriction to these SPI registers need to be written
> > from the firmware using the SCM interface. Add a flag to indicate if the
> > register is to be written using SCM interface.
> >=20
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> > ---
> >  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt   | 13 +++++=
+++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/qco=
m,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc=
.txt
> > index 8e0797c..e329f8d 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.t=
xt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.t=
xt
> > @@ -24,6 +24,9 @@ Properties:
> >         Usage: required
> >         Value type: <prop-encoded-array>
> >         Definition: Specifies the base physical address for PDC hardwar=
e.
> > +                   Optionally, specify the PDC's GIC interface registe=
rs that
> > +                   need to be configured for wakeup capable GPIOs rout=
ed to
> > +                   the PDC.
> > =20
> >  - interrupt-cells:
> >         Usage: required
> > @@ -50,15 +53,23 @@ Properties:
> >                     The second element is the GIC hwirq number for the =
PDC port.
> >                     The third element is the number of interrupts in se=
quence.
> > =20
> > +- qcom,scm-spi-cfg:
> > +       Usage: optional
> > +       Value type: <bool>
> > +       Definition: Specifies if the SPI configuration registers have t=
o be
> > +                   written from the firmware. Sometimes the PDC interf=
ace
> > +                   register to the GIC can only be written from the fi=
rmware.
> > +
> >  Example:
> > =20
> >         pdc: interrupt-controller@b220000 {
> >                 compatible =3D "qcom,sdm845-pdc";
> > -               reg =3D <0xb220000 0x30000>;
> > +               reg =3D <0 0x0b220000 0 0x30000>, <0 0x179900f0 0 0x60>;
> >                 qcom,pdc-ranges =3D <0 512 94>, <94 641 15>, <115 662 7=
>;
> >                 #interrupt-cells =3D <2>;
> >                 interrupt-parent =3D <&intc>;
> >                 interrupt-controller;
> > +               qcom,scm-spi-cfg;
> >         };
>=20
> This overlaps register region with the mailbox node. That node is
> actually a pile of random "CPU" registers used to ping remote processors
> and apparently control how the PDC interacts with the GIC. Maybe this
> can be changed to a phandle and then the driver can interogate the
> phandle to determine if it's the SCM firmware or if it's the shared
> mailbox register? If it's a shared mailbox then it can write to it at
> the offset it knows about (because it's sdm845 compatible specific) and
> if it's SCM then it can use the hardcoded address as well?
>=20
> Basically I'm saying that it just needs a phandle.
>=20
>         qcom,spi-cfg =3D <&scm>;
>=20
> or
>=20
>         qcom,spi-cfg =3D <&mailbox>;
>=20
> and then driver knows how to use that to write into random registers.
> Maybe we can have an API in regmap that finds the regmap for a given
> device node? That way we don't have to funnel everything through syscon
> for this.
>=20
>         of_get_regmap(struct device_node *np, const char *name);
>=20
> Where NULL name means "first available" and then do the devres search
> otherwise for a device that has the matching node pointer.
>=20

I had another idea the other day. Maybe a better approach would be to
make the mailbox or SCM code an interrupt controller with the
appropriate functions to poke the bits necessary to make the interrupts
work. Then we can make it a chip in the hierarchy between the GIC and
PDC and make the interrupts call through from PDC to GIC. The locking
could be handled in each respective driver if necessary, and otherwise
we don't have to use a regmap or remap the same registers (except we may
need to describe if the parent is the mailbox node or the scm fimware
node).

