Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C71132F43
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 14:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbfFCMMb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 08:12:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53221 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfFCMMb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 08:12:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id s3so3593194wms.2;
        Mon, 03 Jun 2019 05:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Gr8uL1ZbiRgi6+lmlL+2AZVHdd6JTOvP+v0Gm0FVkYw=;
        b=dg6Wmedk9pr6qSmdO2XuCrqUoH6eyfdFDx7E+NxA7XZ1RO6CLFitZCggXFAk/UyLT4
         E/3zIXRsg09U8AaAMVCHmUgIs+lkZSJIndgcUWLJFJNrHC20gzI7Nvobhao9VKy12jxX
         /sAzygnbTq6Yj8CtU4TtKpf/5HunfoalfmT57TqXkhnyZQ5IC6sEwrcGdZq6o+gFLsNC
         GxA+ZruI2gZHgzD3xEHBl92emdXrnHgw/707H+sZ9XErBN2/AWQZ0356cZKTEZtIKNUn
         Pj6p3tQK9U3fmnDIo5OlC70xXSmy6jIHSgA5SOL9JTTdtkCOkCD696FOW2qUsb/yIf0b
         Ro2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gr8uL1ZbiRgi6+lmlL+2AZVHdd6JTOvP+v0Gm0FVkYw=;
        b=VTrVRnMljYiTeLj+4mH7wEztZV5Ao0Ofe6uyI8vAusIqphmC76xF9VpJPqhT+F1rl3
         OoDKLlXqwOWfS/Z799hb31JmTzMLfSsOK1v3/ErD9h67ntQ+mbUImX87mcndvkHymiAH
         hC+i0bxndRTO03NAfBJNOnQqnjDabX7Ww9flbN0wO9U7ZRDI7iNsxL8kQHztmLBOr+co
         t8x4qfGNIfxwVS9Pu1OO8utHwq92z+WsiJdGZSrNv0jgM+nHIvjvL0rEWQnGfLqSN9EB
         +3Rt8D8mlqT9i64be+QB92WyFZ5BjP1s3uc8DJueNyczSdfqmzNh6RVO6dJ/zjmYQ+ry
         AsUg==
X-Gm-Message-State: APjAAAWBX9mZ0FAkrYrOQV9rrRRkHJn5uC8lU2nr4vNV/3WOk08+4CeH
        l+DWHWtnZUqt+HtzYDY/3t0=
X-Google-Smtp-Source: APXvYqzxAfb0ik/mZl5P/EWMos7rAeT0GZe6/1qJUsEvS/MSW4qpsHms9ZH2p0VgEmfgyBDT6W2H+w==
X-Received: by 2002:a05:600c:228b:: with SMTP id 11mr14191078wmf.26.1559563949142;
        Mon, 03 Jun 2019 05:12:29 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id z6sm3337251wrw.2.2019.06.03.05.12.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 05:12:28 -0700 (PDT)
Date:   Mon, 3 Jun 2019 14:12:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190603121227.GB30132@ulmo>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com>
 <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
 <20190603075324.GA27753@ulmo>
 <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline
In-Reply-To: <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 12:58:02PM +0200, Linus Walleij wrote:
> On Mon, Jun 3, 2019 at 9:53 AM Thierry Reding <thierry.reding@gmail.com> =
wrote:
> > Me
>=20
> > > Please drop this. The default .to_irq() should be good for everyone.
> > > Also patch 2/2 now contains a identical copy of the gpiolib
> > > .to_irq() which I suspect you indended to drop, actually.
> >
> > It's not actually identical to the gpiolib implementation. There's still
> > the conversion to the non-linear DT representation for GPIO specifiers
> > from the linear GPIO number space, which is not taken care of by the
> > gpiolib variant. That's precisely the point why this patch makes it
> > possible to let the driver override things.
>=20
> OK something is off here, because the purpose of the irqdomain
> is exactly to translate between different number spaces, so it should
> not happen in the .to_irq() function at all.
>=20
> Irqdomain uses .map() in the old variant and .translate() in the
> hierarchical variant to do this, so something is skewed.
>=20
> All .to_irq() should ever do is just call the irqdomain to do the
> translation, no other logic (unless I am mistaken) so we should
> be able to keep the simple .to_irq() logic inside gpiolib.

Well, that's exactly the problem that I'm trying to solve. The problem
is that .translate() translates from the DT number space to the GPIO or
IRQ number space. However, since gpiochip_to_irq() now wants to call the
irq_create_fwspec_mapping() interface, it must convert from the offset
(in GPIO space) into the DT number space, which is what that function
expects.

Thierry

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz1DqUACgkQ3SOs138+
s6FVhA/+Ntg+Cx3rozwF01ZERFalnR9/BSEZVnaumyiI7sPBN7oUjVKDz2STSBx9
afn5lhn/4zkPKoQSJxSOI/r2O7rTURcgI5oxk7tF2yqGeczzAK5vwIcT5G0nSJuT
TkXRlJ9zfqtPyeB2Yx4GfCWSEH/Vr41qyvSkguXh/i9W6BvLa2P6bswPnlyAxfNT
Koqvr3s1n8XTAe0I9LgMfOysi4z11rkFzFa+mlYUKZ3AEcugwmaq7YB+Vh/h/3tB
kGujCh54G7A+pS4btTFMh838a87X1BsK1wmGYEl6IMGtvIgFgjLXH5OsqY6v7w27
xsy9mSsJvjqkgs3g0ket7A98fJj2cCyPwizWcw7E928I2gsycFTme1eD15Lqc67g
9bs5u4qYz3XmlQKwpfcJrclWOuf2t4oLz1oOmGSN23BgCaeN0LeC8bNwz3qRQike
PF3OjFVuT2akYLqdwWulq7QuChpF+MM08gxyGrDzi5r6LeseHW1pCxkkx1232UdW
zCkLy0sB2REYnGtehK1tPxQsFlgdvpcGkFT/OO8GUs8SlFTi6KMV05obpLyKM5Kr
M2zy80BLHRqTt92WkFbDpDjJDjPSI5/TDIoLeyfygwHnyHYRQgcFK3Amd3ymEkO+
I41b2VVXfoJKe+5jvXJaCOe5k4BfwEzhX9se78FozBsPLC7VnIw=
=9g0c
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
