Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2544B68ED70
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 12:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjBHLAQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 06:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjBHLAP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 06:00:15 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC0C13523;
        Wed,  8 Feb 2023 03:00:10 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id m2so50242321ejb.8;
        Wed, 08 Feb 2023 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1asaVsL67uDTeMHMjY3+HYgNBPJeSvWdCKAZIw2Cx/U=;
        b=QHKgPZIj3prWBWBqD1Kvu70LXseBYEkO0qjRTk+YLOji7vDhK2ITQvUCagaYIBo5sM
         9k6ODZlD6LCfHDrJXhnoS/kNkfjGyYUPBxsGgmhr+gOO1D/YPcoY8JubtTZA5i2XC4lc
         QFDkwipSd7g6Ltqg+rStcWLMTxLxhRieWBeqA1CrvEKupf3ojKHZP4rI4rxf001IvTZ/
         VjmAafNcErhExs96sKuKD8zJPRyDIa2oEIwX5riWUEJcoqxKk8iiM0kfCmmC/5mJnTG2
         ai1TIxVzCEfkTavAoxkDJAsclB7hBIbricNNTgkRAA00hqGaw4BqpszbxOTPUrX4KVu7
         B9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1asaVsL67uDTeMHMjY3+HYgNBPJeSvWdCKAZIw2Cx/U=;
        b=XnT8USBcxnyPyHWtmKXllomFkQKN0di6aRfE7ZlFMVuJ8hX2+kUXFFei8h6Zsz+SM6
         PSbJ89whJj8dRpc4ApDPAoM95vbHm51+CGeSs8VluYH03aKElENomL3buj9s27CH30GN
         8r2gVf8mH3y698C4mUYMMljF4pbe1Cm0hZXWe4QQzDCDTRlDDVNe640pnWYmRolnWoYA
         nIP3UAnMsLFS23qP1IXd3jAPieOLw8AxjlkLzEw94wG2t6lssH0F7snH8gZgTtLuUgv/
         4SdZtZm02fzdSG87LndR5cKcX2O6RnsfVPzRIdyyZq3swaIFZHm8YO6ihcbHXqpVssJm
         4Hmg==
X-Gm-Message-State: AO0yUKW3HTJ6t7PFxhVSssAprr63Z/BI8uwWTRRXhfXK5Hfvcg+mfcI1
        8bFEHzWwBov+a9W+DfVdphU=
X-Google-Smtp-Source: AK7set+h3M4dTTjV6eQfhtv9GxjfgvyhyRDGo043ono9xjHvUd7RF5hD7B3DWJ7TFbAeSbL90oPCEQ==
X-Received: by 2002:a17:907:1c18:b0:878:481c:c49b with SMTP id nc24-20020a1709071c1800b00878481cc49bmr9907402ejc.1.1675854008919;
        Wed, 08 Feb 2023 03:00:08 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b7-20020a170906490700b00883c1bcb25bsm8225951ejq.109.2023.02.08.03.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 03:00:08 -0800 (PST)
Date:   Wed, 8 Feb 2023 12:00:06 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Prathamesh Shete <pshete@nvidia.com>, jonathanh@nvidia.com,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        smangipudi@nvidia.com
Subject: Re: [PATCH 3/3] arm64: tegra: Add Tegra234 pinmux device
Message-ID: <Y+OAthBgds9InvKp@orome>
References: <20230207115617.12088-1-pshete@nvidia.com>
 <20230207115617.12088-3-pshete@nvidia.com>
 <f0d58e5b-74df-26cf-592e-302a00d08eee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xCVRCja+b18Ov+bt"
Content-Disposition: inline
In-Reply-To: <f0d58e5b-74df-26cf-592e-302a00d08eee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--xCVRCja+b18Ov+bt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 04:33:42PM +0100, Krzysztof Kozlowski wrote:
> On 07/02/2023 12:56, Prathamesh Shete wrote:
> > This change adds pinmux node for Tegra234.
> >=20
> > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra234.dtsi
> > index eaf05ee9acd1..c91b88bc56d1 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > @@ -701,6 +701,13 @@
> >  			interrupt-controller;
> >  			#gpio-cells =3D <2>;
> >  			gpio-controller;
> > +			gpio-ranges =3D <&pinmux 0 0 164>;
> > +		};
> > +
> > +		pinmux: pinmux@2430000 {
> > +			compatible =3D "nvidia,tegra234-pinmux";
> > +			reg =3D <0x2430000 0x19100>;
> > +			status =3D "okay";
>=20
> Why? Anything disabled it?
>=20
> >  		};
> > =20
> >  		mc: memory-controller@2c00000 {
> > @@ -1664,6 +1671,13 @@
> >  			interrupt-controller;
> >  			#gpio-cells =3D <2>;
> >  			gpio-controller;
> > +			gpio-range =3D <&pinmux_aon 0 0 32>;
> > +		};
> > +
> > +		pinmux_aon: pinmux@c300000 {
> > +			compatible =3D "nvidia,tegra234-pinmux-aon";
> > +			reg =3D <0xc300000 0x4000>;
> > +			status =3D "okay";
>=20
> Also why?

These are probably copy-pasted from Tegra194 where these snuck in. I can
drop those when applying. I'll also prepare a patch to drop these from
the tegra194.dtsi.

I wonder if there's a good way to detect these. We'd have to run checks
on the DT source files, so that's a bit difficult. I do have an
experimental script that tries to capture some common pitfalls on
sources but it's quite ugly and slow, but I guess I could add something
like this. But perhaps there are better ways?

Thierry

--xCVRCja+b18Ov+bt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPjgLYACgkQ3SOs138+
s6H9IA/+LMt8lERmSw6jnTQDKmb6uD6M52VeAwJ78k3XsPBv6s7tS4D8Rli77udU
ywtHS/GeI/tnrvfIlVzaDlGkkOfJeny5Q++OVtKUDLPvkM0t/t9VMr+PmUUsqj1D
PSBtZjDGJXqPokcye/YhwM5WsI8TewxNhKovhtrFYxYKU/8D0FfAvGMRPrLtw8Vv
B6Ke94LFb4g5GzGxNd2BtObTgTQpfbk1boj2FjCL+JWacZmrMT3WIN8aEXVH6Jsy
DDXVezarj6wKCGFG8xBV+DPNITzNljd1uq7hCJZg0Z+Fg9uNWYoMpocK2pOccJPb
9g3lutP3G2cfeJhsgjCqLmiS9LqwgZA2WCBdE3SkL2JUjSsiPE4ajM1+8mNtRyL+
wtsX8cGzSgXWxGEMXsyhwmONDf+1vQ8K5D6bKDQMh/gunczRh4rDW/T4poCZKa2P
6qdxZV8ta0NM0BnfVKxFdo4IPWP8LHXrK+SH/LvUYO/wnBanVEVuwAUGlU0pn69E
1V6wkq1wjhcIZSDXlp1mPvIaYtM8gfYT1yJxGd4Z0y0OjEYHY4Y3XHslbxkLeK5d
bdVw1csGhEFn2rK/TsGQDsqDK2AaEHKIUywdU+1yfoVlKfnpLwcxwKirB1VncWnX
l7MD9oykAZdRu06LNpipX2O+WWTt2hIIt8+5EZh4KeQifh/AS8c=
=gkQk
-----END PGP SIGNATURE-----

--xCVRCja+b18Ov+bt--
