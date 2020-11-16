Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB11C2B42EF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 12:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbgKPLfd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 06:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbgKPLfc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 06:35:32 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873D5C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 03:35:32 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id m6so1140246wrg.7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 03:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YJ1gsixvhaNt0Po/UEuGZZN8WnpMMdAR2bJBcEC3lTM=;
        b=S4x+tKIrvnS/UA83UxhvG8h7t5kimiKJ5d2pKwk+7a/29w/+dImfrwslUz1pcEddnX
         oLrbkdi71/P3SdxrRzof2KfS/Sc8GjR8MCzVhp5QdhPesyOEk29iGLG0s1iokex2H3We
         pwPnIrJqbgF4aHFwvwknAG0JqyPs8UdX0mUD7t4PvYo+cVr8KbRJtTdQB+n++6IyNIlU
         qTJSy/A3uv8jozIFPHwPtv8/4tyzOD6uSTu/4va3LEkClSB6NNpU86xmCsdsWIcBlLju
         RS4fh8OO3kr2l27ZVEcGBM5entnuKyavA0qjH/GoldailPGzlrOk3Hil/qcEjLg96Ugu
         c3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YJ1gsixvhaNt0Po/UEuGZZN8WnpMMdAR2bJBcEC3lTM=;
        b=jjlbj5OPM+ahQ6c912oFDcCL2f3cYNMDStSZ0Um3/wUtNTnUGl5OMKbdOQFrKx2D+V
         Kf+R5iYV2glYe/DmELflTrOfNfSteEkAnu11BYHZ1AkzgZ42am6lAxy1uIruUwlkeza9
         oObCs4vtDjo1/k0qNsaQB6kc5LPg1IlW5Jo7FdobBviFqhI1JR6tLV/EfL1dRZcrKX4J
         9vybcz2hcCBJbeOZLnwIAJeOjCSA0dNyIDHepyzn3lDxRJvJ3ksXsx7McxoCf0r8iHW+
         DgdRisPL9izmyM5N/83yhRvwrBHsq8vXEmsKvXVHvDUaaxESeR2QMPaLZyKd5ID/iPki
         /f0Q==
X-Gm-Message-State: AOAM533hVXhz5/kKjbiU0iZIJoc5j8Gl6NMLwXbYltuHgHSE9btiUuHw
        HHvbdWMLBXza7m/cyTg4stA=
X-Google-Smtp-Source: ABdhPJycVkVLW4ftQF/l+mL6WxPWHfnm139n5eufkiDZhW/EDEtSE3gkvSCbaInQgHHgQI9u7EODTw==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr18681918wrm.259.1605526531216;
        Mon, 16 Nov 2020 03:35:31 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q17sm25896491wro.36.2020.11.16.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 03:35:29 -0800 (PST)
Date:   Mon, 16 Nov 2020 12:35:28 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH 2/2] RFT: gpio: tegra186: Set affinity callback to parent
Message-ID: <20201116113528.GB2224373@ulmo>
References: <20201111140628.24067-1-linus.walleij@linaro.org>
 <20201111140628.24067-2-linus.walleij@linaro.org>
 <20201113214448.GA2138577@ulmo>
 <08147080c7af44420e0744249df6b26d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <08147080c7af44420e0744249df6b26d@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 09:02:24AM +0000, Marc Zyngier wrote:
> Linus, Thierry,
>=20
> On 2020-11-13 21:44, Thierry Reding wrote:
> > On Wed, Nov 11, 2020 at 03:06:28PM +0100, Linus Walleij wrote:
> > > This assigns the .irq_set_affinity to the parent callback.
> > > I assume the Tegra186 is an SMP system so this would be
> > > beneficial.
> > >=20
> > > I used the pattern making the hirerarchy tolerant for missing
> > > parent as in Marc's earlier patch.
> > >=20
> > > Cc: Thierry Reding <treding@nvidia.com>
> > > Cc: Vidya Sagar <vidyas@nvidia.com>
> > > Suggested-by: Marc Zyngier <maz@kernel.org>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> > >  drivers/gpio/gpio-tegra186.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/drivers/gpio/gpio-tegra186.c
> > > b/drivers/gpio/gpio-tegra186.c
> > > index 9500074b1f1b..5060e81f5f49 100644
> > > --- a/drivers/gpio/gpio-tegra186.c
> > > +++ b/drivers/gpio/gpio-tegra186.c
> > > @@ -444,6 +444,16 @@ static int tegra186_irq_set_wake(struct
> > > irq_data *data, unsigned int on)
> > >  	return 0;
> > >  }
> > >=20
> > > +static int tegra186_irq_set_affinity(struct irq_data *data,
> > > +				     const struct cpumask *dest,
> > > +				     bool force)
> > > +{
> > > +	if (data->parent_data)
> > > +		return irq_chip_set_affinity_parent(data, dest, force);
> > > +
> > > +	return 0;
>=20
> Having come to my senses, this should definitely return an error when
> there is no parent is present (i.e. we can't claim success when the
> affinity hasn't changed).
>=20
> > > +}
> > > +
> > >  static void tegra186_gpio_irq(struct irq_desc *desc)
> > >  {
> > >  	struct tegra_gpio *gpio =3D irq_desc_get_handler_data(desc);
> > > @@ -690,6 +700,7 @@ static int tegra186_gpio_probe(struct
> > > platform_device *pdev)
> > >  	gpio->intc.irq_unmask =3D tegra186_irq_unmask;
> > >  	gpio->intc.irq_set_type =3D tegra186_irq_set_type;
> > >  	gpio->intc.irq_set_wake =3D tegra186_irq_set_wake;
> > > +	gpio->intc.irq_set_affinity =3D tegra186_irq_set_affinity;
> > >=20
> > >  	irq =3D &gpio->gpio.irq;
> > >  	irq->chip =3D &gpio->intc;
> >=20
> > This does seem to mostly work, but I do get this new warning during
> > boot:
> >=20
> >     [    6.406230] genirq: irq_chip gpio did not update eff. affinity
> > mask of irq 70
> >=20
> > Any idea what that's supposed to mean? I can probably dig in some more
> > early next week to see if I can track down why exactly that happens.
>=20
> I can't however reproduce this on my Jetson-TX2. Can you post the content
> of /sys/kernel/debug/irq/irqs/70?

Hi Marc,

here's the debugfs output for IRQ 70:

	cat /sys/kernel/debug/irq/irqs/70
	handler:  handle_edge_irq
	device:   (null)
	status:   0x00000001
	istate:   0x00000020
		    IRQS_ONESHOT
	ddepth:   0
	wdepth:   0
	dstate:   0x02400201
		    IRQ_TYPE_EDGE_RISING
		    IRQD_ACTIVATED
		    IRQD_IRQ_STARTED
		    IRQD_DEFAULT_TRIGGER_SET
	node:     -1
	affinity: 0-5
	effectiv:
	domain:  :gpio@2200000
	 hwirq:   0x7f
	 chip:    gpio
	  flags:   0x0

This is with next-20201113 and a few suspend/resume fixes on top +
Linus' patch for the affinity. I tried next-20201116 but that fails to
boot. I can try again with vanilla linux-next just to be sure, but all
the suspend/resume fixes are to very different areas of the kernel code,
so I don't think they would influence this.

Thierry

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+yY/0ACgkQ3SOs138+
s6GgOA/8DEiZm83lztgE4t4ulrLhInmQ2uKUMa0WnkBcAU3w9g1mjWeUQuLXPhlE
Y7a2OU4FdiW9pwTVvmJY9q38Voh+pfk+QMUJ7JhyG4W8hm3Nl7dJ26yD/k4/E00b
IJBYiCsjazHSVK4DDO2pMf8ACt0v7hDNivpLQsojadfxV1ajafm66tm0LgD80QPK
K5KsAFf0l1N9wLnAWmiB35jj1tENBRgJu1cRwS28cgGP8Lggd5a1AXEtvPn7FX07
3gxLFaRan4rcm+RArn1ZOso0zM98rO0/3BX54M8Fkrxit8aZrin28oddyFZujz8Z
nwODaG2j0q40p3+Fq8of2hI3dM7cFXk03MoBeUy/+Qd17txecZSXRKMSx93ajfjP
3b6YG5P9ci/0YhmKoRqmdLnrY8WKvJ7ikpL23PFJ4CjMHrPF8CtKkJlJBWnkXZaU
uL0q3/LXiq1YVq1UFFThUr+B2q3wgEm5MOLIGCvxrkIY35akZ2yeDhoeKp+RPaKL
YDF3zsxGO9lPYpEx3DDOMY7T3cyaIVgqDd3ZLD94s7uQsf2CSKRw066gqfUexUGF
PU5jI5Z9pNxmP2L79gQGME0IVDJd7csCxxFmhKMj4VQGnEN4WvNJ2O2Ownmy7czN
2xajywepcm+qKMW3py8lN/K3V/mpVzIi1nHERxEI3oc+puabIwY=
=ynKO
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
