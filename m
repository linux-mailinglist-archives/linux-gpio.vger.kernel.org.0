Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 268272DF25
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 16:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfE2OFi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 10:05:38 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44292 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbfE2OFi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 10:05:38 -0400
Received: by mail-wr1-f66.google.com with SMTP id w13so1862608wru.11;
        Wed, 29 May 2019 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OdP3KRebtRtoVUv0qXGZAHMYjFS2Zd6QzuriBo5GTh0=;
        b=kI9WNicJ7W5vf1GVJAKRkpGR30yq0Fx7XJvJh9lqjzeWg3BXdFmwmZNxE5EUdf5OVg
         kapIrWWmre7HyOP/6tByX8NJJnTg2YYUiA6SibRKjr51hE+eni3tSdPpCtJtEFsZUUAh
         fMxeEz9lLVfByl1LtX8mJGKnt0p95BWJf1LZPPTo3E5HBFj1NSwUe76armQdLu+GhiS7
         8KYLBZ/CG9lFEt/HFd9z6AC5CU60JIBOGbmDeRovXMidU89bZ19DOCr4tMABbEuFL1CT
         XmdBg+ZVlvJUOWs0kbsoWz3WqlaXOqWtfr2RYKuBEmsYbCt8Bh677u6BpthcAB6dXjDu
         nG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OdP3KRebtRtoVUv0qXGZAHMYjFS2Zd6QzuriBo5GTh0=;
        b=pjHlbT5nPDwc3nX3yo19zHo3eWBJj5IRPyY3pW5tMg8y7c+OoGJM0XWW7A6RcsP2bk
         /F+vZlyg+uSKLkdMFHKz0IV7QU29/Nb0spCF+SuKKHjoY0xTXvRQqG4yhgN9Stqn9l7l
         OIJMWk6NneWLrkBT6ofaJ2qHFfWXs6h/xn4PUVhZIar3x4ohyqtBkUGPuSahvdaHZh9f
         2hpchjTgdASne2ut9HgPnduB0e7YwgRnEqHQ+KzdWKay4VnYeFp3xCehbuaDSRelAojc
         p6y4zn9pkeSPaQGXsmxd2gz0KsYAQoFH/PtZ5GPMz/bQ/calQ8ToL4C2C84SYIMAbxlm
         cbWQ==
X-Gm-Message-State: APjAAAXO9kDkUXTH8vCQdUtU0EHZ4sW61XZ43dWqt6IzOvObvp1P+V67
        YfAOHPLtJ2RAdOXI02hNBMk=
X-Google-Smtp-Source: APXvYqznD6mFjagAWebxU1mZ1y6DLk1J4imu/nA2x1SyZeP06Df/2ZVAnFU5osuGbxgrvhEkxOkcLw==
X-Received: by 2002:adf:fd09:: with SMTP id e9mr307567wrr.292.1559138735670;
        Wed, 29 May 2019 07:05:35 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id e10sm1008232wme.3.2019.05.29.07.05.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 07:05:34 -0700 (PDT)
Date:   Wed, 29 May 2019 16:05:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 12/12] soc/tegra: pmc: configure tegra deep sleep
 control settings
Message-ID: <20190529140533.GC17679@ulmo>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-13-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline
In-Reply-To: <1559084936-4610-13-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 04:08:56PM -0700, Sowjanya Komatineni wrote:
> Tegra210 and prior Tegra chips have power request signal polarity,
> deep sleep entry and wake related timings which are platform specific
> that should be configured before entering into deep sleep.
>=20
> Below are the timings specific configurations for deep sleep and wake.
> - Core rail power-on stabilization timer
> - OSC clock stabilization timer after SOC rail power is stabilized.
> - Core power off time is the minimum wake delay to keep the system
> in deep sleep state irrespective of any quick wake event.
>=20
> These values depends on the discharge time of regulators and turn OFF
> time of the PMIC to allow the complete system to finish entering into
> deep sleep state.
>=20
> These values vary based on the platform design and are specified
> through the device tree.
>=20
> This patch has implementation to configure these configurations which
> are must to have for deep sleep state.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  7 +++++++
>  drivers/soc/tegra/pmc.c                        | 18 ++++++++++++++++++
>  2 files changed, 25 insertions(+)

Please split up the DT and driver changes into separate patches.

Thierry

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzuka0ACgkQ3SOs138+
s6FCsA//fh/p3ojaGOHMfFLR+qGf638G/KcNXtTMp68llwb1ViJHJc22xgK1KWD2
lpWXSemALJE5XOhe/8AzMk9JW8VBf01LyGTw8bD04Pd0w3rpmhQLQropO6kyPLwc
jFjYmIKk0cQUHb8DdpEHapIP3zTNyb9qmI2PVD0qQgu0VKChkP9K8DdOHM7ivMw7
iMNYTLvx+58br9bk7mwjafZhSUtyVxFmHLIB1QdG9tFsJ3gPoAZoDpno3ZqnxPEs
F8G3smiqAmTIC/GG3VX0wkjTGH7Jwydkl7b/jEMt9ahoLZd3+UB2IHkqkC0aOyAe
yg6cpE7y/KAtDkIL/zonFQ+vXcyq0Wpt5OvL/cTHrejkJYiOlfJjT08W48aF7w7g
gJ3GX/FinqeHj6RbL/wIUn2cUZjWoxFLZR/omEaKhRFWJH8btiUmNTUcyAvwqljF
KLuFUiFjPckzkLYYvBAJiZiFq79gplX6awktiZSV1i5JmGVl/pmlLDM01ptStFhO
stzU65AN8C4IOzZ/l5INhjq05I66bVL7vCiOfFy2UNL/BiGXIIogJ+f4RnqKEmB5
6YuUSFfUEyuApVIRzPCOPU/v8Km+NphHNGLyKryAj1Q8lhtnSYbEVX9GPX/6s/Wh
9DFpVpgVSP8hbLJK2YGx5jkO2FEYDnEG2y8GRCY+dUud5VAASAg=
=A2bx
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
