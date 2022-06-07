Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1ADB53F725
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 09:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbiFGH3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jun 2022 03:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiFGH3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2022 03:29:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7AE52B1C;
        Tue,  7 Jun 2022 00:29:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 69040B81DAD;
        Tue,  7 Jun 2022 07:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1112C385A5;
        Tue,  7 Jun 2022 07:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654586948;
        bh=XYqU6+Q5EtxVqe2Yu8p6bkcIv0y6h5laiT+jZyG4ASU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W40FHal6pPLJjDBfv0MAGkHRwpaC2NWHqog+zr9nvc0Hb3C/rbfZumHUIylwUcdPf
         /cXO7UzLUtZ3+Q/Z6FEhvLoz31jQaBKb9CQO2XBJOa8fjEBEsgPKnhQLMjZmsJ1qay
         3yg3xZ39dmrnzNGw0nmaBmscQEYRpw0rU/3UaYYZCOvS9/jS/m4v/Pvz/xrS9Moq0k
         9qAPDNPIuRIPcaUKcST8ofQ5lPZeVyAizKzeQ1zICwLGNIox/EitAW7FMPusKejPG1
         KNRAFJZcrdhOny2Bk5iSfMqDFDnT8hxHC7w9FhsJwGjGJDh6BTFAlfgiLdOKzVlw8k
         2mmUEWJnZYybQ==
Received: from ip-185-104-136-29.ptr.icomera.net ([185.104.136.29] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1nyTeE-00G5jY-FN; Tue, 07 Jun 2022 08:29:06 +0100
Date:   Tue, 07 Jun 2022 08:29:05 +0100
Message-ID: <87r141ylry.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: nuvoton: wpcm450: Convert irqchip to IRQCHIP_IMMUTABLE
In-Reply-To: <20220606214301.2061467-1-j.neuschaefer@gmx.net>
References: <20220606214301.2061467-1-j.neuschaefer@gmx.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.104.136.29
X-SA-Exim-Rcpt-To: j.neuschaefer@gmx.net, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 06 Jun 2022 22:43:00 +0100,
Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> wrote:
>=20
> Commit 6c846d026d490 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning for irqchips that are not marked with
> IRQCHIP_IMMUTABLE.
>=20
> Convert the pinctrl-wpcm450 driver to an immutable irqchip.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/=
nuvoton/pinctrl-wpcm450.c
> index 0dbeb91f0bf27..cff784a7ce4d7 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -293,6 +293,8 @@ static const struct irq_chip wpcm450_gpio_irqchip =3D=
 {
>  	.irq_unmask =3D wpcm450_gpio_irq_unmask,
>  	.irq_mask =3D wpcm450_gpio_irq_mask,
>  	.irq_set_type =3D wpcm450_gpio_set_irq_type,
> +	.flags =3D IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>=20
>  static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
> @@ -1068,9 +1070,8 @@ static int wpcm450_gpio_register(struct platform_de=
vice *pdev,
>  		gpio->gc.fwnode =3D child;
>  		gpio->gc.add_pin_ranges =3D wpcm450_gpio_add_pin_ranges;
>=20
> -		gpio->irqc =3D wpcm450_gpio_irqchip;
>  		girq =3D &gpio->gc.irq;
> -		girq->chip =3D &gpio->irqc;
> +		gpio_irq_chip_set_chip(girq, &wpcm450_gpio_irqchip);
>  		girq->parent_handler =3D wpcm450_gpio_irqhandler;
>  		girq->parents =3D devm_kcalloc(dev, WPCM450_NUM_GPIO_IRQS,
>  					     sizeof(*girq->parents), GFP_KERNEL);

You are definitely missing the required updates to the mask/unmask
methods, and you still have a now useless irq_chip structure in
wpcm450_gpio.

	M.

--=20
Without deviation from the norm, progress is not possible.
