Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFBC13ADDE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 16:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbgANPn0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 10:43:26 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49900 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgANPn0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 10:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZCTSH+k6xThdH79h0I5oh1zVw+T2m5gqrWX7QMFhKd4=; b=UpQ1WewlV5QqhtFdaZ8w6ORpF
        8M9iXrAUdbtW9g5RYjBjRrjEDY4WYvrb7K/SZOdWF5OskeoDuNHqszDZeK8AHaoLAH7unGua0Uiuf
        Onsb4Voox3RhmYdBl7MgsARFkeAKvNV6JjYHwLu3CouBWfw4L+7XUAqTJXgQDH0Sexj5g=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1irOLa-0000KP-L6; Tue, 14 Jan 2020 15:43:14 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 2CE91D002CB; Tue, 14 Jan 2020 15:43:14 +0000 (GMT)
Date:   Tue, 14 Jan 2020 15:43:14 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20200114154314.GZ3897@sirena.org.uk>
References: <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
 <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
 <20191216114454.GB4161@sirena.org.uk>
 <20191217073533.GC31182@pengutronix.de>
 <20191217125832.GF4755@sirena.org.uk>
 <20200107083654.atgbjhrnhyax2gqq@pengutronix.de>
 <20200107130911.GD4877@sirena.org.uk>
 <20200107133811.rua5i6lflzyzlh24@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yhqQ34TVR4fE8mPU"
Content-Disposition: inline
In-Reply-To: <20200107133811.rua5i6lflzyzlh24@pengutronix.de>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--yhqQ34TVR4fE8mPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 07, 2020 at 02:38:11PM +0100, Marco Felsch wrote:
> On 20-01-07 13:09, Mark Brown wrote:
> > On Tue, Jan 07, 2020 at 09:36:54AM +0100, Marco Felsch wrote:

> > > The input signal is routed trough the da9062 gpio block to the
> > > regualtors. You can't set any voltage value using a gpio instead you
> > > decide which voltage setting is applied. The voltage values for
> > > runtime/suspend comes from the dt-data. No it's not just a fast
> > > switching option imagine the system suspend case where the cpu and soc
> > > voltage can be reduced to a very low value. Older soc's like the imx6
> > > signaling this state by a hard wired gpio line because the soc and
> > > cpu cores don't work properly on such low voltage values. This is
> > > my use case and I can't use the sequencer.

> > My point is that I can't tell any of this from the description.

> Therefore I want to discuss the dt-binding documentation with you and
> the others to get this done. Is the above description better to
> understand the dt-binding?

That text really doesn't feel like text that'd be idiomatic
directly in a binding document but some of those ideas probably
do need to be in the text I think.

--yhqQ34TVR4fE8mPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4d4ZEACgkQJNaLcl1U
h9CJjAf+Lyl6pKu3ywfkP8t2CeYxi0Fz9ndEKvYqp7nK6CZxn8OgX9Jjem3iwm4w
vhgB2B06edcnP8wIDEgk8YUMirzG0/Rc475SlTvVg/1BYOaGftqksTiEZfHJf0qt
4mcWgT+Agw3YzPMkM6kahAu243KxKHAwojM3iVV7gb9PX/rOVtInStggPxzdcxtk
jQQo2RvYBo2mEBArehWE+PGGT2/JElQGTLyhRVx3BrhuAXXoNKuwkS9fUrVAnyk5
m5kKBygRDyY4MdZ/a53/E8URMDJbctEtveN03mzI+QQ//PMDTufBPqSmURaODb5c
PAal49kxIE8ZAfvvCgimhdhS3yzmTg==
=m6uy
-----END PGP SIGNATURE-----

--yhqQ34TVR4fE8mPU--
