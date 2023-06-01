Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A737F7196DE
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 11:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbjFAJZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 05:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbjFAJZ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 05:25:58 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F208E97;
        Thu,  1 Jun 2023 02:25:56 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96f683e8855so76783166b.2;
        Thu, 01 Jun 2023 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685611555; x=1688203555;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF5tKCmf9NMeH8uKeKWGsXa5SoL6r7wRbJ+rGM4KRWc=;
        b=nb7D+M8IfBDHQSN9ZOPpuNqppaQV+eAB2ptVeKOCcDtZWTweX5csm4ANFSW24U0mQY
         hhlTcLMBQ6aNDd6GdeESgIIL5ZLhz3GnALzMJMbDNaD692RezbGwVBFEmN64o/mMDI6y
         0fx9qdn2cI5YTlv1qtLNfcOgBX0k+8QmRcC83yTCiA6xc2Qc/sKW0kGt6qQEni1xRTGH
         BfLdoeeJ+l3Tnu/lIE1OgPCssV7lF3e4yaJrzlI75QGSb0xHxZR0C/ceq1KureD3hGny
         +TZor/Dod5zqTfQpIS/QEHVzA5j/WwZBg/suo7uA9p5Lfie7KCG7ovLJQPOHekxdO1M7
         PElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685611555; x=1688203555;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PF5tKCmf9NMeH8uKeKWGsXa5SoL6r7wRbJ+rGM4KRWc=;
        b=GHhyl227f572X4mGU+z++8vjcb0rjhA7MEv1nHXBbz3yz6ZK+0l1OuyHmli7BZTok0
         ZpuP/RzNMUe2ZuYCahXnBSiL9f3RQLqt6gJpObKycj30DfrmF0ldznR6paWTNOzLdK83
         YFZMrglEnp3n791X5WeF7ilxOBeCWO7S2jFOjuuJWC7g8MK0KvKVT8vT8MbKRxnPYtlF
         6Kx4IouVtpanY/sSox+nZRfAqF3051WEvvA8byVr8adM6nqH7gvx51SjkkpKNGaDJyuD
         Ao8kUMUpPCC+HgLebA1ulBLYl4MCpy37OO5r4LA+JnvCAUB7MG/JehSlZavbpisSN1rC
         8iVQ==
X-Gm-Message-State: AC+VfDyFgyeR2BroZqgVYwhZLIVsr15U7kbKgFD1hVCrEXvPurWrhy3z
        luscR3xVXRqQuNAF4uIX+BI=
X-Google-Smtp-Source: ACHHUZ6n80KiPfNGVmFnAevwSDbHOkguS3u44r/kD9T4r1kS0c+RiLSpC5k4GZG8xGpDMEdb+ufFUw==
X-Received: by 2002:a17:907:7ba2:b0:966:265d:edc9 with SMTP id ne34-20020a1709077ba200b00966265dedc9mr6576396ejc.74.1685611555097;
        Thu, 01 Jun 2023 02:25:55 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906560d00b009603d34cfecsm10243917ejq.164.2023.06.01.02.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 02:25:54 -0700 (PDT)
Date:   Thu, 1 Jun 2023 11:25:53 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Document Tegra234 pin
 controllers
Message-ID: <ZHhkIXVSzu1gHZUO@orome>
References: <20230530133654.1296480-1-thierry.reding@gmail.com>
 <20230530133654.1296480-2-thierry.reding@gmail.com>
 <f699da97-9cfc-50ae-60e7-03e692255197@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GgPr2cXfxDj+nhyQ"
Content-Disposition: inline
In-Reply-To: <f699da97-9cfc-50ae-60e7-03e692255197@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--GgPr2cXfxDj+nhyQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 10:45:53AM +0200, Krzysztof Kozlowski wrote:
> On 30/05/2023 15:36, Thierry Reding wrote:
> > From: Prathamesh Shete <pshete@nvidia.com>
> >=20
> > Tegra234 contains two pin controllers. Document their compatible strings
> > and describe the list of pins and functions that they provide.
> >=20
> > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v3:
> > - split up into multiple files (suggested by Krzysztof)
> > - do not permit underscore in pinmux node names
> > - reword commit message
> >=20
> >  .../pinctrl/nvidia,tegra234-pinmux-aon.yaml   |  61 ++++++++
> >  .../nvidia,tegra234-pinmux-common.yaml        |  65 ++++++++
> >  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 141 ++++++++++++++++++
> >  3 files changed, 267 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra234-pinmux-aon.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra234-pinmux-common.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra234-pinmux.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-=
pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234=
-pinmux-aon.yaml
> > new file mode 100644
> > index 000000000000..9d7017a39408
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-=
aon.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux-aon.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +$ref: nvidia,tegra234-pinmux-common.yaml
>=20
> Keep it before properties:. That's really unexpected order.
>=20
>=20
> > +
> > +title: NVIDIA Tegra234 AON Pinmux Controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra234-pinmux-aon
> > +
> > +  reg: true
>=20
> Drop this one.
>=20
> > +
> > +patternProperties:
> > +  "^pinmux(-[a-z0-9-]+)?$":
> > +    type: object
> > +
> > +    # pin groups
> > +    additionalProperties:
>=20
> Why do you need this? This binding looks odd...
>=20
> > +      properties:
> > +        nvidia,pins:
>=20
> min/maxItems? If variable, put some reasonable numbers.

There isn't really a reasonable number for maxItems. Most of the pins in
a controller could technically be assigned to the same group. While that
doesn't happen in practice (most of the time there will be a single pin
per group), limiting this isn't correct and would only make this less
flexible. Are there any advantages to arbitrarily restricting maxItems?

>=20
> > +          items:
> > +            enum: [ can0_dout_paa0, can0_din_paa1, can1_dout_paa2,
> > +                    can1_din_paa3, can0_stb_paa4, can0_en_paa5,
> > +                    soc_gpio49_paa6, can0_err_paa7, can1_stb_pbb0,
> > +                    can1_en_pbb1, soc_gpio50_pbb2, can1_err_pbb3,
> > +                    spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
> > +                    spi2_cs0_pcc3, touch_clk_pcc4, uart3_tx_pcc5,
> > +                    uart3_rx_pcc6, gen2_i2c_scl_pcc7, gen2_i2c_sda_pdd=
0,
> > +                    gen8_i2c_scl_pdd1, gen8_i2c_sda_pdd2,
> > +                    sce_error_pee0, vcomp_alert_pee1,
> > +                    ao_retention_n_pee2, batt_oc_pee3, power_on_pee4,
> > +                    soc_gpio26_pee5, soc_gpio27_pee6, bootv_ctl_n_pee7,
> > +                    hdmi_cec_pgg0,
> > +                    # drive groups
> > +                    drive_touch_clk_pcc4, drive_uart3_rx_pcc6,
> > +                    drive_uart3_tx_pcc5, drive_gen8_i2c_sda_pdd2,
> > +                    drive_gen8_i2c_scl_pdd1, drive_spi2_mosi_pcc2,
> > +                    drive_gen2_i2c_scl_pcc7, drive_spi2_cs0_pcc3,
> > +                    drive_gen2_i2c_sda_pdd0, drive_spi2_sck_pcc0,
> > +                    drive_spi2_miso_pcc1, drive_can1_dout_paa2,
> > +                    drive_can1_din_paa3, drive_can0_dout_paa0,
> > +                    drive_can0_din_paa1, drive_can0_stb_paa4,
> > +                    drive_can0_en_paa5, drive_soc_gpio49_paa6,
> > +                    drive_can0_err_paa7, drive_can1_stb_pbb0,
> > +                    drive_can1_en_pbb1, drive_soc_gpio50_pbb2,
> > +                    drive_can1_err_pbb3, drive_sce_error_pee0,
> > +                    drive_batt_oc_pee3, drive_bootv_ctl_n_pee7,
> > +                    drive_power_on_pee4, drive_soc_gpio26_pee5,
> > +                    drive_soc_gpio27_pee6, drive_ao_retention_n_pee2,
> > +                    drive_vcomp_alert_pee1, drive_hdmi_cec_pgg0 ]
> > +
> > +additionalProperties: false
>=20
> unevaluatedProperties: false
>=20
> > +...
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-=
pinmux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra=
234-pinmux-common.yaml
> > new file mode 100644
> > index 000000000000..a09d050b7d37
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-=
common.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux-comm=
on.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra234 Pinmux Controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +properties:
> > +  compatible: true
>=20
> Drop, won't be needed with additionalProps true.
>=20
> > +
> > +  reg:
> > +    items:
> > +      - description: pinmux registers
> > +
> > +patternProperties:
> > +  "^pinmux(-[a-z0-9-]+)?$":
> > +    type: object
> > +    properties:
> > +      phandle: true
>=20
> No clue what's that but if you need it, something is broken. Remove it
> and we need to fix the root cause.

I'm fairly sure that the validation tools at least used to require a
"properties" property. Or it might have been because phandle would
otherwise be validated by the "additionalProperties" block below. In
any case, running the validation again it doesn't seem like that's
true anymore, so I'll drop this.

> > +
> > +    # pin groups
> > +    additionalProperties:
>=20
> I still don't get what you want to express here. We usually list the
> children with patternProperties for specific pattern. Your approach
> could work too, but did you really check it enforces proper type/ref?
> That it really works?

If you look at the description of the common Tegra pinmux bindings in
pinctr/nvidia,tegra-pinmux-common.yaml, there's this comment in the
description:

  The name of each subnode is not important; all subnodes should be
  enumerated and processed purely based on their content.

Using additionalProperties is the best transcription of this because it
is the easiest way to accept any node name. So we purely validate based
on content.

And yes, this was already tested with the bindings from previous chip
iterations, which all use the same construct, and it works fine.

>=20
> > +      $ref: nvidia,tegra-pinmux-common.yaml
> > +      unevaluatedProperties: false
> > +      properties:
> > +        nvidia,function:
> > +          enum: [ gp, uartc, i2c8, spi2, i2c2, can1, can0, rsvd0, eth0=
, eth2,
> > +                  eth1, dp, eth3, i2c4, i2c7, i2c9, eqos, pe2, pe1, pe=
0, pe3,
> > +                  pe4, pe5, pe6, pe7, pe8, pe9, pe10, qspi0, qspi1, qp=
si,
> > +                  sdmmc1, sce, soc, gpio, hdmi, ufs0, spi3, spi1, uart=
b, uarte,
> > +                  usb, extperiph2, extperiph1, i2c3, vi0, i2c5, uarta,=
 uartd,
> > +                  i2c1, i2s4, i2s6, aud, spi5, touch, uartj, rsvd1, wd=
t, tsc,
> > +                  dmic3, led, vi0_alt, i2s5, nv, extperiph3, extperiph=
4, spi4,
> > +                  ccla, i2s1, i2s2, i2s3, i2s8, rsvd2, dmic5, dca, dis=
playb,
> > +                  displaya, vi1, dcb, dmic1, dmic4, i2s7, dmic2, dspk0=
, rsvd3,
> > +                  tsc_alt, istctrl, vi1_alt, dspk1, igpu ]
> > +
> > +        nvidia,pins:
> > +          description: An array of strings. Each string contains the n=
ame
> > +            of a pin or group. Valid values for these names are listed
> > +            below.
>=20
> Drop, not needed.
>=20
> > +
> > +        nvidia,pull: true
> > +        nvidia,tristate: true
> > +        nvidia,schmitt: true
> > +        nvidia,enable-input: true
> > +        nvidia,open-drain: true
> > +        nvidia,lock: true
> > +        nvidia,drive-type: true
> > +        nvidia,io-hv: true
>=20
> Drop all these.

I think these were originally included here because the generic pinmux
group schema (in nvidia,tegra-pinmux-common.yaml) lists the superset of
all properties that can go into a group. However, not all chips
generations support all of those properties.

But looking at this again, given that we have unevaluatedProperties in
the above, this shouldn't have any effect anyway.

I wonder now how we can properly validate for this. I suppose another
option would be to have a list of properties that aren't allowed and
mark them as ": false".

Thierry

>=20
> > +
> > +      required:
> > +        - nvidia,pins
> > +
> > +additionalProperties: false
>=20
> We keep it "true" for common schema and then the users of this binding
> use unevaluatedProperties: false.
>=20
>=20
> > +
> > +required:
> > +  - compatible
> > +  - reg
>=20
> Keep it before additionalProperites:.
>=20
> > +...
>=20
>=20
> Best regards,
> Krzysztof
>=20

--GgPr2cXfxDj+nhyQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmR4ZB4ACgkQ3SOs138+
s6Fgmw/9F3zGmLhPrw779ZmUXl4bGy9i8O2FsOkW5Z7GrT9ngDWmiJPVWGbJlHTF
xEJ886Ov+56s6NBZId5uZP6cD1COtpDGeTCrcsgQ2DDU8CjNwyfSJBcCZO3TjHVk
TZLv9CwHBYNn+Uapx0ER4syX6Kv0189GG76Gl1I8Cck6S9Bpc5N3LKLNJDK0mhmF
IfjG8wzxiZ7BmaHBWmVzhIgwCoFxiHlKgGaMdbq5bHFoPvkBXU3sgWEgTg8h7IQY
1+5DU3BRio9sbXg406mMoE0osjSly+7GN7CyVyyvQ07qlNOlxtdwiMhKZXE+XXzt
5d8bvmR3oyO4PbVf5Z1lhhQa/4tGlfrmWIcqXufW40PnRr22fqLHSD99gVZKMw4d
SOJHvOcF8Qdl2YsBsQs44UabTAPbMIo8Ysb7y9asTlvIrF3AEzXI/IJsLJWUmmLC
jRNdQguWPybSI37DVAl50gMcWIpLPdBxODfataKJjDHawbrEjpSe5FEMMsnFLnU4
efyzMtxIOqggBCmIsZno/t4eCSRZ6DLFKGWRqzaJegSXwJAVaX9abqRDdQCg1RhU
PGOnz6IaGuGT8K5MBFFf1FZdSQsRhTc0XvxhgjV9zUwYEinPchUVDWnJf3/PemiZ
2u5stiFL8HFA/nkhMVDQ61JjnjGz8WjSwJUyRxNRqNDDzD+uU4A=
=H4lF
-----END PGP SIGNATURE-----

--GgPr2cXfxDj+nhyQ--
