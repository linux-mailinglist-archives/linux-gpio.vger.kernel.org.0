Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BBF53F865
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 10:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238345AbiFGInU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jun 2022 04:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236626AbiFGInU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2022 04:43:20 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BB25713B;
        Tue,  7 Jun 2022 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1654591391;
        bh=Ay3w+pOSbdVmK6BzMNVqfLp6U+ArfsBVxECebZZhwEw=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Xg1KWgqlAK7BuP05oEzX+YwRJIilw3FVHW5SUzR1Dl4FyvxJxK5h6RhkDJ1AZmKYo
         e5eVmpHPWN8P4OcR+BQuaBWc5MEOL8riZMPZj4I9BIvbYNijduxLTr/npwqxLfsSh1
         zE7EFz6AI4Dmldu0ek7txMh7PR3GzK5W9YLU5fYY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeR1-1oJmqj3d7z-00Vl3E; Tue, 07
 Jun 2022 10:43:10 +0200
Date:   Tue, 7 Jun 2022 10:43:09 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: nuvoton: wpcm450: Convert irqchip to
 IRQCHIP_IMMUTABLE
Message-ID: <Yp8Pne/qdf0U7xri@latitude>
References: <20220606214301.2061467-1-j.neuschaefer@gmx.net>
 <87r141ylry.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tIVOFWmxb8CcysXs"
Content-Disposition: inline
In-Reply-To: <87r141ylry.wl-maz@kernel.org>
X-Provags-ID: V03:K1:uCIINdbr/crnG0UqP4gU8pUDCFhFCNuO7+RjVT8zBN4ohn3IL2J
 +QatUtbpTpGR7Yu3roPRHH1qqgfXFVWYGQ5U+L3KrjkhxLEOR5Agi/vu6tllYRveiLwy0ck
 M8wa4zSVk+UTLaKQK7Ly5Ua34Wtqb6wcfvFF6uevSBH/nmF8gmBVDKSfsiFsT4NW0pi2xjg
 7XWDjIW8sEF9PMYJpep6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2+kpmWndZuM=:bjjPgX7tovcMw41fMZUxhR
 qbX/9qkG/12TD+7u7Biva/wDz24Zy8lbGMYkEEqxevbyXbvTp8/uI4j5EEbvb0lshbjK863Qy
 Tc6bMg6UitSVsaPPZMNirShkZXeQFZfqCY9LAE+9PxoeqZYKhv4/Jnd5hHaBQgeBmci0dyDq8
 F74hqS9rCLJ8h2X+IdP+uRwA+iBx1EnMmCh5u8IBzYsa3tj3uJEGCFK8+7/x5XZDP0QVSMedI
 WPczoTVooWAMe+Oa7Vftbizv6KBQWu7afikCNlnM+xRmnut8O4M8+PKh72znnQ7eq7qz9uNX8
 SFKiP71SYMVqcU/dsgmXMTridFDD2Wu7YAMkMahyHT9cr6boOMaCvFvX/9WUtEjuBT/iG63i/
 6lSSKB9KAYAbhDOkAEQ8ct8SAk1o4H00uuGSYUYSAFtlb1BSCdozkXr77X3IHX5xPWqeIyxC9
 KGhxjStdAFpBMHv0VnjX/yKU0EM0LwuazrTTiY8jWsTwlyQ3SPUHzUvRB2o5lkNbo0JUYjkfp
 2VdobeF6nu5ZjOWz09sQEJTov4msHj7fOydJMXbt3SwjGtmSyHWGErFlb3gMWWMUGGBXGm4aA
 vrqZY8TB/mRNdQnH3SvbiQJAVN8M2bqHYOxXr4L39Z8IVVEp3BiF9Mq2QMqLZ9ll+puW+XlVY
 cz9/xzhvKXn9kCKAlZehoqIj5S8zHQqD6EA5xeFUfXAnMF8TJmLSfrYsgSRz1Y1KPBtetS6WZ
 VqiPaNFLkUpt4R2yyi5DOrOSUc5MAIpLr8vQ8f0LlwFRaiL2iP5X1EIMVXX3haZdb5P6TrXvV
 Rv3T2OIAhJiWhrp1uk5FTECnuOYq4QzdoeOWSV4K425cQObLjpA1kSJX/Uwsc/JFzd8BWMOeg
 KA9/KbXXRkuMeAFCIPfIMhopeuSk1coR//ErD/XSDKUxpA0TE5dKHtL5uxTfBy7rHelU0Rmg1
 ZH1rA3ayCfBzwl+oenwIjqWby+tcYEJgmhnCYEs88hBilbOGb7sfyz8a7/mHWBSZ4i6vDt7no
 YHkDnYB783xmNyXi8zX4wVI5LdqWi4G1ZIlJ5ahhJ19l7Y5oQ1mh17TIq0dRbagJsw3K8PsQu
 Tk6KYa6+46vS6Uf0ta03fGpuzUv4s5z3LpmMkbhxJ+0v5iplo1AwtMYmQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--tIVOFWmxb8CcysXs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2022 at 08:29:05AM +0100, Marc Zyngier wrote:
> On Mon, 06 Jun 2022 22:43:00 +0100,
> Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> wrote:
> >=20
> > Commit 6c846d026d490 ("gpio: Don't fiddle with irqchips marked as
> > immutable") added a warning for irqchips that are not marked with
> > IRQCHIP_IMMUTABLE.
> >=20
> > Convert the pinctrl-wpcm450 driver to an immutable irqchip.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
> >  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctr=
l/nuvoton/pinctrl-wpcm450.c
> > index 0dbeb91f0bf27..cff784a7ce4d7 100644
> > --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> > +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> > @@ -293,6 +293,8 @@ static const struct irq_chip wpcm450_gpio_irqchip =
=3D {
> >  	.irq_unmask =3D wpcm450_gpio_irq_unmask,
> >  	.irq_mask =3D wpcm450_gpio_irq_mask,
> >  	.irq_set_type =3D wpcm450_gpio_set_irq_type,
> > +	.flags =3D IRQCHIP_IMMUTABLE,
> > +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> >  };
> >=20
> >  static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
> > @@ -1068,9 +1070,8 @@ static int wpcm450_gpio_register(struct platform_=
device *pdev,
> >  		gpio->gc.fwnode =3D child;
> >  		gpio->gc.add_pin_ranges =3D wpcm450_gpio_add_pin_ranges;
> >=20
> > -		gpio->irqc =3D wpcm450_gpio_irqchip;
> >  		girq =3D &gpio->gc.irq;
> > -		girq->chip =3D &gpio->irqc;
> > +		gpio_irq_chip_set_chip(girq, &wpcm450_gpio_irqchip);
> >  		girq->parent_handler =3D wpcm450_gpio_irqhandler;
> >  		girq->parents =3D devm_kcalloc(dev, WPCM450_NUM_GPIO_IRQS,
> >  					     sizeof(*girq->parents), GFP_KERNEL);
>=20
> You are definitely missing the required updates to the mask/unmask
> methods, and you still have a now useless irq_chip structure in
> wpcm450_gpio.

Ah, true.

Thanks,
Jonathan

--tIVOFWmxb8CcysXs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmKfD3sACgkQCDBEmo7z
X9sTPhAAspZVvQlkB+ko+MYHXoQQFaAPYipqmfEKDTCkd7SvZ9kncD0DrLt4M5Hr
8C3HAO8oRTJbbV8paWIpG2mDwcKdFZ3laLzfXXiONOrmPJ05X+4vc9VzNhZ2r4qF
9MyKm9JPt0pTNGzO83fN8M9ObGXFUYq3LDPLMQKxxQxVXNjYn11n+TeMi4y2TmCX
iWQYmEIb8M6/jsdZ1woWC4XkvfaPbRji2hKMY/MtLsRk544zNHH6unMueLY30P7l
l7gLM+DpAS5Agw7PRGuYe7xuX5Wpxj15m5FqLeCYLGo8VcSNxy5KR3uXPWEASmmF
S7ecpGy1EJSrJzPCdw9r1tlLQ1aSikEjE/nkAPvWS8RHjQQam97IzKRwIHFBYtjE
DmPaKpVuuDrBbZ8ckdOd7Ys+8srzqd5fY4AAblYsNjownASqCVECX+XD3WI9By3q
OQ8LzqNOh83KD3kAUzI0gIzBssd2ldmLHlCFRejImWWzYnG2Kyhb8jiMwABnhR23
dU3+HZ1SwjXUeAb8ihnuyCDFQzUdrVUlo0sFHufU9kl0x+GVRL8JqyU2GXLNd5d1
G6yLDjAZm1N1L9+3ism0UvRym40ddaM2Uavs+AIYV1a0uahNUImIxk6C3c4byYHI
2FpcO6djb+ZKye8Wt/va9QFMTzf3W7EEoBpUxnHUXs5LJiwRkzU=
=Pv8v
-----END PGP SIGNATURE-----

--tIVOFWmxb8CcysXs--
