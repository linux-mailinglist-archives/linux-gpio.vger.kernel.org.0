Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 145F06A5F90
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Feb 2023 20:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjB1TXO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Feb 2023 14:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjB1TXN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Feb 2023 14:23:13 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2CF93DD
        for <linux-gpio@vger.kernel.org>; Tue, 28 Feb 2023 11:23:12 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id d7so11754029qtr.12
        for <linux-gpio@vger.kernel.org>; Tue, 28 Feb 2023 11:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677612191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g/b0uWr3dgqZ1asi/GzAEWATlAUrlU6cnc9Vlezp6Rw=;
        b=suXqrW5RbZvKTDs+nBUPEAkK6erIAK7Tim8NVYd436StKJUEjGF4KRXQO5XLR46lvS
         uN/l6qVH9HXjs8XE9adugrAyiEd7OIYsa4iHSPzknmyI45geTGdhHFjgwYbywFFLxvb5
         Mnz8mdQ+2ABTuX+y2GJpYcaxM4+EiIMVOWjL9HZZo6Z58b7562PlTwROUqgGtVFaYKKu
         yP/XWNXDbz0kwdZUWHLwPRgfTEitL0Xw7DrzneR8ofPtKacz6nnhUrlWnwN2BrXlaATR
         WNTZkBWoGJHO3MtArSCbi+s36ZvdyKFVo9ueLJ5+F243YKi0tiVBwWorrbe71PJU6AGN
         oh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677612191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/b0uWr3dgqZ1asi/GzAEWATlAUrlU6cnc9Vlezp6Rw=;
        b=Et7UdaXCy0DNHR5kK6Ak/GXoIy9Ey1vysgIsU3+eWyhK6el9xlyr3ScbaeiXzpAaUG
         xRF8zPc6yrcyZWi5zogvknrwcRnZ0+njEjga8cESOzxnVeIJa6VYg+r5k4iph5PiU1S8
         M85Ei0UksTV8VEKs+ZOMWfn9cgWPeqKZ8pMOZFcuo3KjX01glC2upnGjJYCk6afElwpr
         AEFDokKmNxCcoFeswZcdkRvcHD4Xnwzx5Lkbz240z5unSJ8GMFOgSWmaZ9T0Mifq0YJk
         L6iWF970t5lQkRZFYl+DNnQyjbe8XjjjwUcTHtLMnmn6BTogaJFyRiJfwcaK4OEfMBPi
         u37A==
X-Gm-Message-State: AO0yUKWgR8UMptQwHrrViGzsRTMhCM7nguSOly/3jTsM5RjcCBadgktE
        dnUf+R+icbE+dWfsnrpyuOjWJg==
X-Google-Smtp-Source: AK7set9rZgqQtBkEW9MPYM/QgyBsfWIyrfbvO2ps+qwOisvx7j9MoM/ge5p3dvNPuOwCguY654UmZw==
X-Received: by 2002:ac8:7f88:0:b0:3b9:b817:e9a8 with SMTP id z8-20020ac87f88000000b003b9b817e9a8mr6867810qtj.27.1677612191309;
        Tue, 28 Feb 2023 11:23:11 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id w9-20020ac87189000000b003b8484fdfccsm6945353qto.42.2023.02.28.11.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:23:10 -0800 (PST)
Date:   Mon, 27 Feb 2023 21:19:28 -0500
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        michael@walle.cc, quarium@gmail.com, jhentges@accesio.com,
        jay.dolan@accesio.com
Subject: Re: [PATCH 0/3] Migrate PCIe-IDIO-24 GPIO driver to the regmap API
Message-ID: <Y/1ksJHUENCwg/jy@fedora>
References: <cover.1677547393.git.william.gray@linaro.org>
 <Y/5RfjJCDdrZbHgJ@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="li0m/Wg1qKuX2nNv"
Content-Disposition: inline
In-Reply-To: <Y/5RfjJCDdrZbHgJ@sirena.org.uk>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DATE_IN_PAST_12_24,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--li0m/Wg1qKuX2nNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 07:09:50PM +0000, Mark Brown wrote:
> On Mon, Feb 27, 2023 at 08:53:39PM -0500, William Breathitt Gray wrote:
>=20
> > A patch to pass the device regmap and irq_drv_data as a parameters for
> > the struct regmap_irq_chip set_type_config() is included. This is needed
> > by idio_24_set_type_config() in order to update the type configuration
> > on the device as well as irq_drv_data for idio_24_handle_mask_sync().
>=20
> The values from the config buffer are supposed to be written out in
> regmap_irq_sync_unlock() - why is something custom needed here?

The PCIe-IDIO-24 "COS Enable" serves a dual purpose of interrupt
enabling/disabling as well as configuring the interrupt types. Since
this register is used for masking, config buffer would clobber the
register if we use it in this particular case. Instead, we ignore the
config buffer and configure the type directly for the device (handling
the case where interrupts are masked and shouldn't be enabled).

William Breathitt Gray

--li0m/Wg1qKuX2nNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY/1ksAAKCRC1SFbKvhIj
K0mEAP940oPJqR3tGyniHVgTfAH+s5UvnI04BQ4PMOzNcFIyeAEA48TRvD2LXfIE
OV0zxY1cUlezhCn3P6ZFTEXzNcb3vgg=
=xtFJ
-----END PGP SIGNATURE-----

--li0m/Wg1qKuX2nNv--
