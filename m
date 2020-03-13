Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D67C7183E99
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 02:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgCMBOm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 21:14:42 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42080 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgCMBOm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 21:14:42 -0400
Received: by mail-pl1-f196.google.com with SMTP id t3so3398086plz.9
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 18:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qjJQpmCt5+Bj9s6c4s+LR19PtXcVxgKdoWHiu9bkYTQ=;
        b=ioxcf3KuxHGJhBxLvtkftHAjwxfe80OwNQoZQR/Pp1c1SYS9B05ySCLuCRJkYpahjD
         UAeGpcXsg/PJMedH/ysx11Kkzg8+blc8KVMsiarjLsqK/xMYVtuUb4QqUAeojq2NoGAR
         ngZZ9OVLfT/8JGWyYLIN8AUyTqOgZrHB0ggOhz8y53vU1I2h2LUmJJCHV/dnvkM6V7Kf
         xS4lozQYmarpPRug5843N1LqDhDtUQw9fJQm9pDPHDB/61JWPknUkm4yGziPgHREXmsT
         ErMQcnfKafrImA2Gg4FZesvT+vUqq3CrsGMIMd3taLGrgJ+AytAvD+4rJb/lYfPnSw4E
         GWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qjJQpmCt5+Bj9s6c4s+LR19PtXcVxgKdoWHiu9bkYTQ=;
        b=bw7OTGOVG+toL6aHWc/9pXWMXoaLBES6bTK4UKIUnyFqbnM+w0i98qvIUZv09dSguV
         lVT1ve4pU9QynbFApplXPnAghfzTGZ87eE9S7fhlWPsNCfezcxaHioSr9utIjtXhfwPL
         ClulGmT0BnWYK8ubQbrPK2yTvba7ofRGM5iSOoskAVWrG8sGEjXjjtzpXlrYrUNcADKO
         RdypMC0gXhT0M5fGMKEucV0GsPPRk0i1ehGdNwSX/yE3g156KeYCwPxyeHfQIRxEqext
         v9VZWk4vg4ZJtR6g53qZ3LMuA+GuR0oRkV50qnAsefrTwfIOomwPusSy2KxDd8/YRi3a
         Tj7A==
X-Gm-Message-State: ANhLgQ24ILJjVgR5NyvrbODAQ6dw1CLhhHyQ/wb2wDLtmvQ3v/JzQxjU
        /GT8H9YtsbsOVGqzzna15T4=
X-Google-Smtp-Source: ADFU+vur+iiemI1+aG1P3Vu0iQdSxjThTCmqPqVCPsUTFIKFYy+QI6LVQomeB31rWA4BYbm94LvIVA==
X-Received: by 2002:a17:902:bc8a:: with SMTP id bb10mr10744319plb.102.1584062081279;
        Thu, 12 Mar 2020 18:14:41 -0700 (PDT)
Received: from pek-khao-d2.corp.ad.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id p9sm9875428pjo.28.2020.03.12.18.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 18:14:40 -0700 (PDT)
Date:   Fri, 13 Mar 2020 09:14:31 +0800
From:   Kevin Hao <haokexin@gmail.com>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/4] Fix the regression for the thunderx gpio
Message-ID: <20200313011431.GA2424240@pek-khao-d2.corp.ad.wrs.com>
References: <20200114082821.14015-1-haokexin@gmail.com>
 <CACRpkda7LmJPkMG7hXq9MxHL2tYM5uTCEotdSbtaKxhtBQPW4g@mail.gmail.com>
 <CAJ+vNU0QCQP7Roud7AGVNOreDwAbZ4HBmpXp4P9DEJPDB5eOag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <CAJ+vNU0QCQP7Roud7AGVNOreDwAbZ4HBmpXp4P9DEJPDB5eOag@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 01:40:56PM -0700, Tim Harvey wrote:
> On Wed, Jan 15, 2020 at 2:20 AM Linus Walleij <linus.walleij@linaro.org> =
wrote:
> >
> > On Tue, Jan 14, 2020 at 9:39 AM Kevin Hao <haokexin@gmail.com> wrote:
> >
> > > Since the commit a7fc89f9d5fc ("gpio: thunderx: Switch to
> > > GPIOLIB_IRQCHIP"), the thunderx gpio doesn't work anymore. I noticed
> > > that you have submitted a patch [1] to fix the " irq_domain_push_irq:=
 -22"
> > > error, but the kernel would panic after applying that fix because the=
 hwirq
> > > passed to the msi irqdomain is still not correct. It seems that we ne=
ed
> > > more codes to make the thunderx gpio work with the GPIOLIB_IRQCHIP. S=
o I
> > > would prefer to revert the commit a7fc89f9d5fc first to make the thun=
derx
> > > gpio to work on the 5.4.x and 5.5 at least. We can then do more test =
for
> > > GPIOLIB_IRQCHIP switching (which the patch 2 ~ 4 do) before merging
> > > them.
> >
> > Thanks a LOT Kevin, and I'm sorry for open coding and breaking this
> > driver so much :/
> >
> > I have applied all four patches for fixes.
> >
>=20
> I'm running into an issue with thunderx-gpio when using a gpio as an
> interrupt with an mfd driver I'm working on[1]. The breakage appeared
> with 0d04d0c146786da42c6e68c7d2f09c956c5b5bd3 'gpio: thunderx: Use the
> default parent apis for {request,release}_resources'[2] and occurs
> when irq_chip_request_resources_parent() fails with -ENOSYS. Any ideas
> what happened here... It seems perhaps parent_data got lost?

No, the parent_data doesn't get lost. The reason that -ENOSYS is returned i=
s because
the its_msi_irq_chip (the parent irq chip of thunderx-gpio) doesn't impleme=
nt the
=2Eirq_request_resources callback. As you can see in the irq_chip_request_r=
esources_parent() code:
    int irq_chip_request_resources_parent(struct irq_data *data)
    {
    	data =3D data->parent_data;
   =20
    	if (data->chip->irq_request_resources)
    		return data->chip->irq_request_resources(data);
   =20
    	return -ENOSYS;
    }

So the commit 0d04d0c14678 does change the logic of the original code and m=
ake
the thunderx_gpio_irq_request_resources() return -ENOSYS in a normal case. =
But
it doesn't matter now since the thunderx_gpio_irq_request_resources() has b=
een
dropped by the patches in this patch series. So your code should work with =
the latest
code. Could you rebase your code and git it a try?

Thanks,
Kevin


>=20
> 1. https://patchwork.kernel.org/patch/11401555/
> 2. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/drivers/gpio/gpio-thunderx.c?id=3D0d04d0c146786da42c6e68c7d2f09c956c5b5=
bd3
>=20
> Best regards,
>=20
> Tim

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAl5q3ncACgkQk1jtMN6u
sXEu4ggAsLnjx56vlLZ39HZReSK9ytUuFWMPiqHwYMgiHbZ3fo5PCa7i+vRlL+jF
vqLEA8cSz/sNWuBg70efZgCPcOYQCBXF1hol991BX125DKotx4OkHet7CWnsepfQ
677ahwbxjt7C1oli1rzJoRQ5wbIsovVxV+htdB2tT5I0I4CrVNC+LQKy20H30wYv
lyYJl1HDcCxplJAuW34ZsTQAezI2HRT685lQzFqOr0sDd3WQENf89f4012FcnFXu
mOPBZkMcS+SzDhCG65BEGql2w8Fh2o9yg1xyf1FVty1IGt2DBhDES7gsn7uRgdl0
EPDbxIuCSmNcnZVssxfehPLAr7DCWg==
=r7TH
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
