Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0C8EC593
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 16:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfKAPWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 11:22:21 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55736 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfKAPWV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 11:22:21 -0400
Received: by mail-wm1-f68.google.com with SMTP id m17so406764wmi.5
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2019 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HaLjPJz8SL1LvC1IMmq/+6QBMZxYTk76MjI2uYbLync=;
        b=ZZ4EQuQBr3zY4wyU/oZyNFjb47mE3Ttpo0YbPD7Q3a7I59f7pWYBPaK+rmFSAZG3oz
         qRL7OesEgcbeJt3EUlbqcA+foUUqpKUiym01AtwqS6XQOP8sPGg9LvbKn3IdFJxHU+WL
         S1Gs++Ut+TQJpu6TtQm2gGI1uP0X0oF4Sba4ZvDE7qHE15bud5MU76F87KNF80KI4OB3
         55TaH6IIMctoDYD/GsWDlOBM7NVIDAfcF2Bjk28aFv6Y5UQh3mvYmk2DxwMA3rSTNd9w
         JyreCp3ZLxDxTnoMlVm5W/pWCRLezNcQ2ZeBOxzQFXlsuwjhIVzpbK7ADQzyLcpL5zVf
         eIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HaLjPJz8SL1LvC1IMmq/+6QBMZxYTk76MjI2uYbLync=;
        b=sCDhB1Nh+VFPhCD6cyaJBfuL41iP6XGmKn7vliIu4nh+6YV2Glm0nxqFYwQrzVEQfw
         Va+uy72xC4kCLYCfd0vWZ/J+fwPAOABbz9j0qmZB19xt5oQ3n6evYRC3JIsF1drc3f/A
         nFv4t1F+wfE/AlZfwUf2NaZ93OYVF/JoOVud9EcreejtvAG/uvudCyyaXR3UL/b6dLIQ
         upX3g31QV2ei9R0bG4Wd9trOZ7rOGTzd95mK7jVB8fl1KumBE8EpzFvpHlJmrf541ybz
         +Rtw1KRf0uwiMAj6lmNmoGY4bAqfhs+JT2/USJnoLa0wQU2Ckw+Amc95dZ9Fde+zM+Xi
         KUOQ==
X-Gm-Message-State: APjAAAXsgzYuvcyYlML7DCfx2qaGLNHlgadd7wI89pWjGbUf1Q5N+jLy
        IoRYF57PDg8vbVrMzA3ihnU=
X-Google-Smtp-Source: APXvYqxefWg/lay/D94L9uZCWFZ9defPWmylu7GW2GQ3Iwtmb7B6GyXgAtOuGR5Dmu0h5CZu6B75XA==
X-Received: by 2002:a1c:9d07:: with SMTP id g7mr10836024wme.53.1572621738915;
        Fri, 01 Nov 2019 08:22:18 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t24sm11685462wra.55.2019.11.01.08.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 08:22:17 -0700 (PDT)
Date:   Fri, 1 Nov 2019 16:22:15 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio/pinctrl: Add pin ranges before gpiochip
Message-ID: <20191101152215.GA1361939@ulmo>
References: <20191030144940.21133-1-linus.walleij@linaro.org>
 <0e8c15d9-c805-c1ee-f8f0-528866c7ac1c@redhat.com>
 <CACRpkdZZcfttLrVSTH9RQi3ANcB-uvwOtHUQMiH5m4faaekqjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <CACRpkdZZcfttLrVSTH9RQi3ANcB-uvwOtHUQMiH5m4faaekqjg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 05:07:17PM +0100, Linus Walleij wrote:
> On Wed, Oct 30, 2019 at 4:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 30-10-2019 15:49, Linus Walleij wrote:
>=20
> > This does not seem to work I've tested in both a Bay Trail and
> > a Cherry Trail device and neither will boot the kernel after
> > these changes I'm afraid.
> >
> > I think it might be best to pass in an array of ranges (*) to
> > gpiochip_add_data and have it register the ranges before
> > doing the irq-chip setup.
>=20
> Yeah this new way of populating GPIO irqchips seems to be
> pretty imperialistic and pull the whole world into the gpiolib.
> I don't mind, once we have the semantic in one place we
> can get it right. (As with the previous ordering issues.)
> Hopefully it saves us from other problems.
>=20
> Thierry: is this approach for pin control ranges in line with your
> initial design of the new way of registering gpio irqchips?

I'm not sure I fully understand what the pin control ranges have to do
with the embedded IRQ chip. The embedded IRQ chip represents a different
way of using the GPIO lines, so anything that impacts the IRQ chip would
presumably also impact the GPIO lines.

Generally speaking, though, I don't think there's anything wrong with
adding ranges to a GPIO chip descriptor before registering it. In fact I
think that's really the only way to make it work if we've got a
dependency on these ranges being available.

So technically at any point after gpiochip_add_data() somebody could
start using the GPIO chip, which means that technically there could be a
race between the consumers and the call to gpiochip_add_pin_range(). If
there's a dependency on the pin control ranges, they must be registered
before the GPIO chip becomes available to consumers.

Again, I don't think this has anything to do with IRQ chip. If you want
to provide pin control ranges as part of adding the GPIO chip, they
should be specified as part of the GPIO chip structure.

Regarding the imperialistic nature of this: back at the time I think
your argument had been that you wanted to move as much boiler plate as
possible into gpiolib. Seems like this is very much in line with that.

Thierry

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl28TaQACgkQ3SOs138+
s6HXKA//X5MADwyiVvhflkSZCXdZWqQqDm2C6RA4KFDwaNix9eQyz1WdiJm1XpdK
vuTi/3RAy4DU3mJ+ArsGjrGQzi1tQiUesD3s3dXMIIWdV1I9lKTmjIQI09CE+Ti1
MkN/q0dTxBR4pF3ebzC7se0oerW4hc0vFoDS7ApcsOuQNYeelTlsIOO/XaHK3Gb8
shpzDV7F8jLj41P9qWsvC1SSLcftbatETiS1+Cz8CUY1i7EZqa/P4HYfbRPOB4AP
JvEKHqrmb2/ylIg1SbA/Oy8VSOMi3aA9ks4W0aL1HC+VjsI+qBfB1VeJ/KNOHqq1
Jky7BrR446T23GgkitHdoltoc51OitIBXbJkEheyrj1ZPVYTg7Ac5arqHOmt3Ehr
nV71qjV0dOWrsD7ULQEQYeVFabJOw02jgZlPd90tusBMyHMqXcWc9FHynhpMoAM2
jgjJ376XltFNW8p6+mnOD18N+PC7H2G809HMfL3Hd6hbcZ6nQrQPxgRA4b44rq1V
SDTOLHM7vQFi4ceJ+gnOGSINsx45WCVoseureRRiZXh1lccqvZTiI4ovPh/JFtak
XTllrzZfsRruEk2mdejbOoJEjHX1cxPNeAE97ECWsjpNsSs+dzYHNjXZi+rIxX57
GwzAKFvFW3HISh4vi/Lsjf4Rt/YIh5Go/wIIQus67if2OF9Fo9U=
=P+iK
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
