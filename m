Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52FFC6E9A47
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Apr 2023 19:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjDTRGX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 13:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbjDTRGV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 13:06:21 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C41D2;
        Thu, 20 Apr 2023 10:06:18 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id dx24so7832443ejb.11;
        Thu, 20 Apr 2023 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682010377; x=1684602377;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtUIq1BXEELRmuZX/0QsOWpgg1xR0XGMWnUfrgHGgak=;
        b=AV0QwQChC3b5Hk6keQptJus7CxxmrlvDa8EoJKun+ds11zZ+XDN8TcVcFVyCGmt2kU
         t0pL4Y/F7Z1VdOeHS6U+qBVuCWA4soqbJRJk78oUpYXkbyRM0tk0c999MeMy4e4M7fv/
         vsFGjkV6ocC6bMCuQRuIJ+uI87o4tZaGEIkqwjkm2Eh7fU20ToYLDBKx4NzOwFJRpBxi
         dD8qzvu/mVbFBS0JR8ctQ/TZMNldRTYl4EkeKzOQbxaE1hYcLFm5Fa8cpHwpHR/d8L0o
         KkoBH6bE6pVejry6TTjquq+Z2GXE/7VucT20uxG2346AG30xepcZicGeo8xCSy6cV6l9
         a/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682010377; x=1684602377;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtUIq1BXEELRmuZX/0QsOWpgg1xR0XGMWnUfrgHGgak=;
        b=SqRvYy4YaJ8hJX0r9Wr8Trnmimpt+5fDgnX0cItAiutvhz9E05bGL5W8RAHQDrMO0i
         YKP5SM7bnPU1RZrxwL7KT0TpaBd9Zrmi1Ig7N+z+dDqZaA0461YJ7m9nIo6zBpTgG0J0
         MBxA3hyXP+Ha/DN4BZY0jErLpmEXIujpLJZrDgGfamOwvf4rOyZzrn4siJJFLJtJwy3c
         GHTqBqFfZt9q5TeeX/9F3F8q2TASALBDOgvL5dSNQE1ygUKTJNBVUzgwnHxVqGBBz8c4
         BydWwau3cSrXJpvP+hAJNUY4gk+L5HWM07oO0oKqLcClAHs2RzkwsZHD49LJRo+eRzsw
         VlZA==
X-Gm-Message-State: AAQBX9eit2HjEJkMM6nF/XMSJzlNxbUt2FWMC6Eojn9geFPtVYmPirFK
        bpLAoa5RW0ne7SRcnxDDZPv+Pag9XQ0=
X-Google-Smtp-Source: AKy350bLthi00RHDLjp0f/6qw5JDwgXK+Q2Td3AKngBJdodcojLFr2LUCtnEvA48KPSLEn77Uu737Q==
X-Received: by 2002:a17:907:6024:b0:94f:6316:ce8c with SMTP id fs36-20020a170907602400b0094f6316ce8cmr2099550ejc.42.1682010376463;
        Thu, 20 Apr 2023 10:06:16 -0700 (PDT)
Received: from orome (p200300e41f053a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f05:3a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qt2-20020a170906ece200b0094e1344ddfdsm922419ejb.34.2023.04.20.10.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 10:06:15 -0700 (PDT)
Date:   Thu, 20 Apr 2023 19:06:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Prathamesh Shete <pshete@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Message-ID: <ZEFxBp2S-B6mbOMG@orome>
References: <a1395eb2-da3a-e080-fa6b-50f20d879655@linaro.org>
 <Y+OGdMFQkL9Dtaq/@orome>
 <9e7e1762-1c2e-28cd-c7a7-b0577addf51e@linaro.org>
 <DM5PR12MB24066CE3175B74150235FE55B7B49@DM5PR12MB2406.namprd12.prod.outlook.com>
 <3b9d4177-ebd9-e341-294d-41860fa8c5ac@linaro.org>
 <ZBxeLIXJDbM2ebyt@orome>
 <e06977ab-8112-1e45-4392-df36e358e772@linaro.org>
 <ZCLgEhrQiYHGGZ6S@orome>
 <0b39b19e-e5ee-2751-cd57-68278354da5f@linaro.org>
 <ZCW5nuHXt7G1ety7@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iAV2CzO3wLZD9NyR"
Content-Disposition: inline
In-Reply-To: <ZCW5nuHXt7G1ety7@orome>
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


--iAV2CzO3wLZD9NyR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 06:32:30PM +0200, Thierry Reding wrote:
> On Thu, Mar 30, 2023 at 03:58:51PM +0200, Krzysztof Kozlowski wrote:
> > On 28/03/2023 14:39, Thierry Reding wrote:
> > > On Sun, Mar 26, 2023 at 02:19:45PM +0200, Krzysztof Kozlowski wrote:
> > >> On 23/03/2023 15:11, Thierry Reding wrote:
> > >>> On Wed, Mar 08, 2023 at 01:24:04PM +0100, Krzysztof Kozlowski wrote:
> > >>>> On 08/03/2023 12:45, Prathamesh Shete wrote:
> > >>>>>
> > >>>>>
> > >>>>>> -----Original Message-----
> > >>>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >>>>>> Sent: Wednesday, February 8, 2023 5:28 PM
> > >>>>>> To: Thierry Reding <thierry.reding@gmail.com>
> > >>>>>> Cc: Prathamesh Shete <pshete@nvidia.com>; Jonathan Hunter
> > >>>>>> <jonathanh@nvidia.com>; linus.walleij@linaro.org; robh+dt@kernel=
=2Eorg;
> > >>>>>> krzysztof.kozlowski+dt@linaro.org; devicetree@vger.kernel.org; l=
inux-
> > >>>>>> tegra@vger.kernel.org; linux-gpio@vger.kernel.org; Suresh Mangip=
udi
> > >>>>>> <smangipudi@nvidia.com>
> > >>>>>> Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT =
binding doc
> > >>>>>>
> > >>>>>> External email: Use caution opening links or attachments
> > >>>>>>
> > >>>>>>
> > >>>>>> On 08/02/2023 12:24, Thierry Reding wrote:
> > >>>>>>> On Tue, Feb 07, 2023 at 04:33:08PM +0100, Krzysztof Kozlowski w=
rote:
> > >>>>>>
> > >>>>>>
> > >>>>>>>>> +          type: object
> > >>>>>>>>> +          additionalProperties:
> > >>>>>>>>> +            properties:
> > >>>>>>>>> +              nvidia,pins:
> > >>>>>>>>> +                description: An array of strings. Each strin=
g contains the name
> > >>>>>>>>> +                  of a pin or group. Valid values for these =
names are listed
> > >>>>>>>>> +                  below.
> > >>>>>>>>
> > >>>>>>>> Define properties in top level, which points to the complexity=
 of
> > >>>>>>>> your if-else, thus probably this should be split into two bind=
ings.
> > >>>>>>>> Dunno, your other bindings repeat this pattern :(
> > >>>>>>>
> > >>>>>>> The property itself is already defined in the common schema fou=
nd in
> > >>>>>>> nvidia,tegra-pinmux-common.yaml and we're overriding this here =
for
> > >>>>>>> each instance since each has its own set of pins.
> > >>>>>>>
> > >>>>>>> This was a compromise to avoid too many bindings. Originally I
> > >>>>>>> attempted to roll all Tegra pinctrl bindings into a single dt-s=
chema,
> > >>>>>>> but that turned out truly horrible =3D) Splitting this into per=
-SoC
> > >>>>>>> bindings is already causing a lot of duplication in these files,
> > >>>>>>
> > >>>>>> What would be duplicated? Almost eveerything should be coming fr=
om
> > >>>>>> shared binding, so you will have only compatible,
> > >>>>>> patternProperties(pinmux) and nvidia,pins. And an example. Maybe=
 I miss
> > >>>>>> something but I would say this would create many but very easy t=
o read
> > >>>>>> bindings, referencing common pieces.
> > >>>>>>
> > >>>>>>> though splitting
> > >>>>>>> off the common bits into nvidi,tegra-pinmux-common.yaml helps a=
 bit
> > >>>>>>> with that already. Splitting this into per-instance bindings wo=
uld
> > >>>>>>> effectively duplicate everything but the pin array here, so we =
kind of
> > >>>>>>> settled on this compromise for Tegra194.
> > >>>>>>
> > >>>>>> OK, but are you sure it is now readable? You have if:then: with
> > >>>>>> patternProperties: with additionalProperties: with properties: w=
ith
> > >>>>>> nvidia,pins.
> > >>>>> This is inline with the existing bindings and I think this is the=
 compromise that was reached during review when the bindings were submitted,
> > >>>>
> > >>>> So the code might be totally unreadable, but it is inline with exi=
sting
> > >>>> code, thus it should stay unreadable. Great.
> > >>>
> > >>> I'd say this is very subjective. I personally don't find the current
> > >>> version hard to read, but that's maybe because I wrote it... =3D)
> > >>>
> > >>>>> offer to rework if a better alternative can be found, but that on=
ly makes sense if all the other bindings get changed as well, so I think it=
'd be good if we can merge in the same format as the existing bindings for =
now and change all of them later on.
> > >>>>
> > >>>> Cleanup should happen before adding new bindings.
> > >>>
> > >>> I don't recall the exact problems that I ran into last time, but I =
do
> > >>> remember that pulling out the common bindings to the very top-level=
 was
> > >>> the main issue.
> > >>>
> > >>> If I understand correctly what you're saying, the main problem that
> > >>> makes this hard to read is the if and else constructs for AON/MAIN
> > >>> variants on Tegra194/Tegra234. These should be quite easy to pull o=
ut
> > >>> into separate bindings. I'll do that first and then see if there's
> > >>> anything that could be done to further improve things.
> > >>
> > >> One problem is allowing characters here which are not allowed. Second
> > >> problem is reluctance to change it with argument "existing bindings =
also
> > >> have this problem". It's explanation like "there is already bug like
> > >> this, so I am allowed to add similar one".
> > >=20
> > > This is not a bug that we're trying to replicate. We're basing this
> > > binding on a existing bindings that were already reviewed upstream a
> > > long time ago. It uses a shared binding that's in use by these other
> > > bindings, so making any changes to this new binding means either the
> > > other ones need to be changed as well or we can't reuse the existing
> > > shared binding.
> >=20
> > Are you sure? I did not see here conflict. The specific device binding
> > can narrow the pattern defined in common binding.
> >=20
> > What's more, where do you see this pattern at all in shared binding?
> >=20
> > I am sorry, but this does not fit my arguments at all. This pattern is
> > clearly wrong and argument to keep duplicating it because other (not
> > common!) binding also has it is by design invalid.
> >=20
> > >=20
> > >> Now third is that defining properties in allOf is not the style we w=
ant
> > >> to have, because it does not work with additionalProperties and is
> > >> difficult to read. Again using argument "existing code also does like
> > >> this" is a very poor argument.
> > >=20
> > > As far as I can tell, it does work as expected in this case because
> > > we're not actually adding any *new* properties in the allOf/if branch=
es.
> >=20
> > The if:else: defines type and additionalProperties, so I am sorry but
> > this is not a readable solution.
> >=20
> > > If we were, then yes, we would need to use unevaluatedProperties and
> > > that can get complicated. But again, in this case we're merely
> > > overriding existing properties with more specific values, which means
> > > that both the standard binding applies and then things are narrowed d=
own
> > > by the values defined for each compatible.
>=20
> Okay, so I'm starting to get a bit lost here, so maybe it's time for
> another proposal. I've tried splitting this up more so that we avoid
> the if/else block. Would you mind taking another look to see if the
> patch below is any more readable to you?
>=20
> Thierry

Krzysztof,

any thoughts on this proposal?

Thanks,
Thierry

> From 00cb909f6d8732680d65cdb67e0573c8e6dc7b7a Mon Sep 17 00:00:00 2001
> From: Prathamesh Shete <pshete@nvidia.com>
> Date: Wed, 8 Mar 2023 17:14:30 +0530
> Subject: [PATCH] dt-bindings: pinctrl: tegra234
>=20
> Add DT binding doc for Tegra234 pinmux driver.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../pinctrl/nvidia,tegra234-pinmux-aon.yaml   |  61 ++++++++
>  .../nvidia,tegra234-pinmux-common.yaml        |  65 ++++++++
>  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 141 ++++++++++++++++++
>  3 files changed, 267 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a234-pinmux-aon.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a234-pinmux-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a234-pinmux.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pi=
nmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-p=
inmux-aon.yaml
> new file mode 100644
> index 000000000000..9d7017a39408
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-ao=
n.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux-aon.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +$ref: nvidia,tegra234-pinmux-common.yaml
> +
> +title: NVIDIA Tegra234 AON Pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra234-pinmux-aon
> +
> +  reg: true
> +
> +patternProperties:
> +  "^pinmux(-[a-z0-9-]+)?$":
> +    type: object
> +
> +    # pin groups
> +    additionalProperties:
> +      properties:
> +        nvidia,pins:
> +          items:
> +            enum: [ can0_dout_paa0, can0_din_paa1, can1_dout_paa2,
> +                    can1_din_paa3, can0_stb_paa4, can0_en_paa5,
> +                    soc_gpio49_paa6, can0_err_paa7, can1_stb_pbb0,
> +                    can1_en_pbb1, soc_gpio50_pbb2, can1_err_pbb3,
> +                    spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
> +                    spi2_cs0_pcc3, touch_clk_pcc4, uart3_tx_pcc5,
> +                    uart3_rx_pcc6, gen2_i2c_scl_pcc7, gen2_i2c_sda_pdd0,
> +                    gen8_i2c_scl_pdd1, gen8_i2c_sda_pdd2,
> +                    sce_error_pee0, vcomp_alert_pee1,
> +                    ao_retention_n_pee2, batt_oc_pee3, power_on_pee4,
> +                    soc_gpio26_pee5, soc_gpio27_pee6, bootv_ctl_n_pee7,
> +                    hdmi_cec_pgg0,
> +                    # drive groups
> +                    drive_touch_clk_pcc4, drive_uart3_rx_pcc6,
> +                    drive_uart3_tx_pcc5, drive_gen8_i2c_sda_pdd2,
> +                    drive_gen8_i2c_scl_pdd1, drive_spi2_mosi_pcc2,
> +                    drive_gen2_i2c_scl_pcc7, drive_spi2_cs0_pcc3,
> +                    drive_gen2_i2c_sda_pdd0, drive_spi2_sck_pcc0,
> +                    drive_spi2_miso_pcc1, drive_can1_dout_paa2,
> +                    drive_can1_din_paa3, drive_can0_dout_paa0,
> +                    drive_can0_din_paa1, drive_can0_stb_paa4,
> +                    drive_can0_en_paa5, drive_soc_gpio49_paa6,
> +                    drive_can0_err_paa7, drive_can1_stb_pbb0,
> +                    drive_can1_en_pbb1, drive_soc_gpio50_pbb2,
> +                    drive_can1_err_pbb3, drive_sce_error_pee0,
> +                    drive_batt_oc_pee3, drive_bootv_ctl_n_pee7,
> +                    drive_power_on_pee4, drive_soc_gpio26_pee5,
> +                    drive_soc_gpio27_pee6, drive_ao_retention_n_pee2,
> +                    drive_vcomp_alert_pee1, drive_hdmi_cec_pgg0 ]
> +
> +additionalProperties: false
> +...
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pi=
nmux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra23=
4-pinmux-common.yaml
> new file mode 100644
> index 000000000000..a09d050b7d37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-co=
mmon.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux-common=
=2Eyaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra234 Pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible: true
> +
> +  reg:
> +    items:
> +      - description: pinmux registers
> +
> +patternProperties:
> +  "^pinmux(-[a-z0-9-]+)?$":
> +    type: object
> +    properties:
> +      phandle: true
> +
> +    # pin groups
> +    additionalProperties:
> +      $ref: nvidia,tegra-pinmux-common.yaml
> +      unevaluatedProperties: false
> +      properties:
> +        nvidia,function:
> +          enum: [ gp, uartc, i2c8, spi2, i2c2, can1, can0, rsvd0, eth0, =
eth2,
> +                  eth1, dp, eth3, i2c4, i2c7, i2c9, eqos, pe2, pe1, pe0,=
 pe3,
> +                  pe4, pe5, pe6, pe7, pe8, pe9, pe10, qspi0, qspi1, qpsi,
> +                  sdmmc1, sce, soc, gpio, hdmi, ufs0, spi3, spi1, uartb,=
 uarte,
> +                  usb, extperiph2, extperiph1, i2c3, vi0, i2c5, uarta, u=
artd,
> +                  i2c1, i2s4, i2s6, aud, spi5, touch, uartj, rsvd1, wdt,=
 tsc,
> +                  dmic3, led, vi0_alt, i2s5, nv, extperiph3, extperiph4,=
 spi4,
> +                  ccla, i2s1, i2s2, i2s3, i2s8, rsvd2, dmic5, dca, displ=
ayb,
> +                  displaya, vi1, dcb, dmic1, dmic4, i2s7, dmic2, dspk0, =
rsvd3,
> +                  tsc_alt, istctrl, vi1_alt, dspk1, igpu ]
> +
> +        nvidia,pins:
> +          description: An array of strings. Each string contains the name
> +            of a pin or group. Valid values for these names are listed
> +            below.
> +
> +        nvidia,pull: true
> +        nvidia,tristate: true
> +        nvidia,schmitt: true
> +        nvidia,enable-input: true
> +        nvidia,open-drain: true
> +        nvidia,lock: true
> +        nvidia,drive-type: true
> +        nvidia,io-hv: true
> +
> +      required:
> +        - nvidia,pins
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +...
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pi=
nmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmu=
x.yaml
> new file mode 100644
> index 000000000000..7f0bf3d75f35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.ya=
ml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +$ref: nvidia,tegra234-pinmux-common.yaml
> +
> +title: NVIDIA Tegra234 Pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra234-pinmux
> +
> +  reg: true
> +
> +patternProperties:
> +  "^pinmux(-[a-z0-9-]+)?$":
> +    type: object
> +
> +    # pin groups
> +    additionalProperties:
> +      properties:
> +        nvidia,pins:
> +          items:
> +            enum: [ dap6_sclk_pa0, dap6_dout_pa1, dap6_din_pa2,
> +                    dap6_fs_pa3, dap4_sclk_pa4, dap4_dout_pa5,
> +                    dap4_din_pa6, dap4_fs_pa7, soc_gpio08_pb0,
> +                    qspi0_sck_pc0, qspi0_cs_n_pc1,
> +                    qspi0_io0_pc2, qspi0_io1_pc3, qspi0_io2_pc4,
> +                    qspi0_io3_pc5, qspi1_sck_pc6, qspi1_cs_n_pc7,
> +                    qspi1_io0_pd0, qspi1_io1_pd1, qspi1_io2_pd2,
> +                    qspi1_io3_pd3, eqos_txc_pe0, eqos_td0_pe1,
> +                    eqos_td1_pe2, eqos_td2_pe3, eqos_td3_pe4,
> +                    eqos_tx_ctl_pe5, eqos_rd0_pe6, eqos_rd1_pe7,
> +                    eqos_rd2_pf0, eqos_rd3_pf1, eqos_rx_ctl_pf2,
> +                    eqos_rxc_pf3, eqos_sma_mdio_pf4, eqos_sma_mdc_pf5,
> +                    soc_gpio13_pg0, soc_gpio14_pg1, soc_gpio15_pg2,
> +                    soc_gpio16_pg3, soc_gpio17_pg4, soc_gpio18_pg5,
> +                    soc_gpio19_pg6, soc_gpio20_pg7, soc_gpio21_ph0,
> +                    soc_gpio22_ph1, soc_gpio06_ph2, uart4_tx_ph3,
> +                    uart4_rx_ph4, uart4_rts_ph5, uart4_cts_ph6,
> +                    soc_gpio41_ph7, soc_gpio42_pi0, soc_gpio43_pi1,
> +                    soc_gpio44_pi2, gen1_i2c_scl_pi3, gen1_i2c_sda_pi4,
> +                    cpu_pwr_req_pi5, soc_gpio07_pi6,
> +                    sdmmc1_clk_pj0, sdmmc1_cmd_pj1, sdmmc1_dat0_pj2,
> +                    sdmmc1_dat1_pj3, sdmmc1_dat2_pj4, sdmmc1_dat3_pj5,
> +                    pex_l0_clkreq_n_pk0, pex_l0_rst_n_pk1,
> +                    pex_l1_clkreq_n_pk2, pex_l1_rst_n_pk3,
> +                    pex_l2_clkreq_n_pk4, pex_l2_rst_n_pk5,
> +                    pex_l3_clkreq_n_pk6, pex_l3_rst_n_pk7,
> +                    pex_l4_clkreq_n_pl0, pex_l4_rst_n_pl1,
> +                    pex_wake_n_pl2, soc_gpio34_pl3, dp_aux_ch0_hpd_pm0,
> +                    dp_aux_ch1_hpd_pm1, dp_aux_ch2_hpd_pm2,
> +                    dp_aux_ch3_hpd_pm3, soc_gpio55_pm4, soc_gpio36_pm5,
> +                    soc_gpio53_pm6, soc_gpio38_pm7, dp_aux_ch3_n_pn0,
> +                    soc_gpio39_pn1, soc_gpio40_pn2, dp_aux_ch1_p_pn3,
> +                    dp_aux_ch1_n_pn4, dp_aux_ch2_p_pn5, dp_aux_ch2_n_pn6,
> +                    dp_aux_ch3_p_pn7, extperiph1_clk_pp0,
> +                    extperiph2_clk_pp1, cam_i2c_scl_pp2, cam_i2c_sda_pp3,
> +                    soc_gpio23_pp4, soc_gpio24_pp5, soc_gpio25_pp6,
> +                    pwr_i2c_scl_pp7, pwr_i2c_sda_pq0, soc_gpio28_pq1,
> +                    soc_gpio29_pq2, soc_gpio30_pq3, soc_gpio31_pq4,
> +                    soc_gpio32_pq5, soc_gpio33_pq6, soc_gpio35_pq7,
> +                    soc_gpio37_pr0, soc_gpio56_pr1, uart1_tx_pr2,
> +                    uart1_rx_pr3, uart1_rts_pr4, uart1_cts_pr5,
> +                    soc_gpio61_pw0, soc_gpio62_pw1, gpu_pwr_req_px0,
> +                    cv_pwr_req_px1, gp_pwm2_px2, gp_pwm3_px3, uart2_tx_p=
x4,
> +                    uart2_rx_px5, uart2_rts_px6, uart2_cts_px7, spi3_sck=
_py0,
> +                    spi3_miso_py1, spi3_mosi_py2, spi3_cs0_py3,
> +                    spi3_cs1_py4, uart5_tx_py5, uart5_rx_py6,
> +                    uart5_rts_py7, uart5_cts_pz0, usb_vbus_en0_pz1,
> +                    usb_vbus_en1_pz2, spi1_sck_pz3, spi1_miso_pz4,
> +                    spi1_mosi_pz5, spi1_cs0_pz6, spi1_cs1_pz7,
> +                    spi5_sck_pac0, spi5_miso_pac1, spi5_mosi_pac2,
> +                    spi5_cs0_pac3, soc_gpio57_pac4, soc_gpio58_pac5,
> +                    soc_gpio59_pac6, soc_gpio60_pac7, soc_gpio45_pad0,
> +                    soc_gpio46_pad1, soc_gpio47_pad2, soc_gpio48_pad3,
> +                    ufs0_ref_clk_pae0, ufs0_rst_n_pae1,
> +                    pex_l5_clkreq_n_paf0, pex_l5_rst_n_paf1,
> +                    pex_l6_clkreq_n_paf2, pex_l6_rst_n_paf3,
> +                    pex_l7_clkreq_n_pag0, pex_l7_rst_n_pag1,
> +                    pex_l8_clkreq_n_pag2, pex_l8_rst_n_pag3,
> +                    pex_l9_clkreq_n_pag4, pex_l9_rst_n_pag5,
> +                    pex_l10_clkreq_n_pag6, pex_l10_rst_n_pag7,
> +                    sdmmc1_comp, eqos_comp, qspi_comp,
> +                    # drive groups
> +                    drive_soc_gpio08_pb0, drive_soc_gpio36_pm5,
> +                    drive_soc_gpio53_pm6, drive_soc_gpio55_pm4,
> +                    drive_soc_gpio38_pm7, drive_soc_gpio39_pn1,
> +                    drive_soc_gpio40_pn2, drive_dp_aux_ch0_hpd_pm0,
> +                    drive_dp_aux_ch1_hpd_pm1, drive_dp_aux_ch2_hpd_pm2,
> +                    drive_dp_aux_ch3_hpd_pm3, drive_dp_aux_ch1_p_pn3,
> +                    drive_dp_aux_ch1_n_pn4, drive_dp_aux_ch2_p_pn5,
> +                    drive_dp_aux_ch2_n_pn6, drive_dp_aux_ch3_p_pn7,
> +                    drive_dp_aux_ch3_n_pn0, drive_pex_l2_clkreq_n_pk4,
> +                    drive_pex_wake_n_pl2, drive_pex_l1_clkreq_n_pk2,
> +                    drive_pex_l1_rst_n_pk3, drive_pex_l0_clkreq_n_pk0,
> +                    drive_pex_l0_rst_n_pk1, drive_pex_l2_rst_n_pk5,
> +                    drive_pex_l3_clkreq_n_pk6, drive_pex_l3_rst_n_pk7,
> +                    drive_pex_l4_clkreq_n_pl0, drive_pex_l4_rst_n_pl1,
> +                    drive_soc_gpio34_pl3, drive_pex_l5_clkreq_n_paf0,
> +                    drive_pex_l5_rst_n_paf1, drive_pex_l6_clkreq_n_paf2,
> +                    drive_pex_l6_rst_n_paf3, drive_pex_l10_clkreq_n_pag6,
> +                    drive_pex_l10_rst_n_pag7, drive_pex_l7_clkreq_n_pag0,
> +                    drive_pex_l7_rst_n_pag1, drive_pex_l8_clkreq_n_pag2,
> +                    drive_pex_l8_rst_n_pag3, drive_pex_l9_clkreq_n_pag4,
> +                    drive_pex_l9_rst_n_pag5, drive_sdmmc1_clk_pj0,
> +                    drive_sdmmc1_cmd_pj1, drive_sdmmc1_dat3_pj5,
> +                    drive_sdmmc1_dat2_pj4, drive_sdmmc1_dat1_pj3,
> +                    drive_sdmmc1_dat0_pj2 ]
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
> +
> +    pinmux@2430000 {
> +        compatible =3D "nvidia,tegra234-pinmux";
> +        reg =3D <0x2430000 0x17000>;
> +
> +        pinctrl-names =3D "pex_rst";
> +        pinctrl-0 =3D <&pex_rst_c5_out_state>;
> +
> +        pex_rst_c5_out_state: pinmux-pex-rst-c5-out {
> +            pexrst {
> +                nvidia,pins =3D "pex_l5_rst_n_paf1";
> +                nvidia,schmitt =3D <TEGRA_PIN_DISABLE>;
> +                nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +                nvidia,io-hv =3D <TEGRA_PIN_ENABLE>;
> +                nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +                nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +            };
> +        };
> +    };
> +...
> --=20
> 2.40.0
>=20




--iAV2CzO3wLZD9NyR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmRBcQMACgkQ3SOs138+
s6Ex6w/8DOOyyRwcBytOffKkmJyjXn1y0v0oz2upvSPlK+VvUWYs8cTF6aEkmsvM
weaUZ4Wl6/8h3UY6GL37usYOGMaRHisKN0JZfg+MXC+BnGsRHBY44JOj50ub5X4E
h/VpvtmVdqfmAjy3i9yN/+fBhfdW753v2/PrPtRvWVqeSd5UVkqA4keQGNfF0Ii5
+ifUigUexq5hVar+CFoxXJjvg2STse7xXs00Uq48zAT5vIKKh+T7e0YJLgCJPrCb
AOpvgH9Yeq1A9vbhF+yFTfXXaC2t1X5Ua09/kGedj/EYXYxuyP5fNjl/OIc9xNCL
2IKZrLf5APC6ZUES8IjNjaobPrhLETvfpdErmWdjf+afYKRdws8xWQ0KwRDaydcN
sSD53GomD2SKOJg8OSzvIMkfE/5hifp7zoBQnT5PAdTqirzsfdPD2J97omLVmjsw
bV7dwzwu5O2ecyc2EUF8gLIIQOO87ZjAtyyQA/zjQW+mioxHge29hPUCx+qWxurN
k0A/YrwquxPyZjDgh2R9imzuHouhGtD39p6t0gonYL2k9zkwxBb4b6YwnxpxzAPP
nfUWTCnplTFhZ1Mvw/mgYCvdiPYcXs8dKFapW24UVYC7u4zAD6+wP978AD1wlH3w
skWbCoFBOf6p1b9vFUf9Fgpw5b7863Ez8LvgNInV9nz723KJwkc=
=8mK4
-----END PGP SIGNATURE-----

--iAV2CzO3wLZD9NyR--
