Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBEC44590D1
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 16:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239170AbhKVPGe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 10:06:34 -0500
Received: from www.zeus03.de ([194.117.254.33]:34472 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230152AbhKVPGd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Nov 2021 10:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=TuS1lPMhs8uq9fCMz291pN9jdOQX
        8p+QlOKA+q71wiw=; b=wLzXg45DD0jrpxQRlF5XJEPsvIeITtjkTa/yu4xadc4n
        ZEWR0tjtrHLDQb8dLpR5fcXd9Zsnj3ZROk5zo0lJgUcqzL4neVRzbNBnAucZK/4/
        HQ8em9gfvONtALvTFQz8f0O64cyEIWN9tO387WNBdPY+NguGloaJdlaf4DKLGB4=
Received: (qmail 854439 invoked from network); 22 Nov 2021 16:03:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2021 16:03:24 +0100
X-UD-Smtp-Session: l3s3148p1@4/f+7GHRMLUgAwDPXwnCABI2E1xN8W/V
Date:   Mon, 22 Nov 2021 16:03:21 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YZuxOZ1z9xDUxmte@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20210918083307.3195-1-wsa+renesas@sang-engineering.com>
 <20210918083307.3195-2-wsa+renesas@sang-engineering.com>
 <CAHp75Vdv=0i05EitMi6JjbjML-jFD_1M0q7ps2KVHcN4UtFU-w@mail.gmail.com>
 <YUhGkBdXJUI3XadP@ninjato>
 <CAHp75VcXuYLM4cPAb+rv47wz0v+Q6tjek6tKuBj32K81XxkKaA@mail.gmail.com>
 <YZuKyEcsXb8dwiHG@ninjato>
 <YZuOGAxO5ZslW5vB@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xvZJCXS/qfXIF3vJ"
Content-Disposition: inline
In-Reply-To: <YZuOGAxO5ZslW5vB@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--xvZJCXS/qfXIF3vJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> See 7065f92255bb ("driver core: Clarify that dev_err_probe() is OK even w/out
> -EPROBE_DEFER").

Thanks, very convincing. I'll use it.


--xvZJCXS/qfXIF3vJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGbsTUACgkQFA3kzBSg
Kba22Q//doo1W5DbYl2qsorJAhRHfz8COprRU1yqSZbniDz215iB1BOMoDAsTPvz
mlTperaQXWLDj0GOMm9Gyk1dbkY4Lna+99YacS/blTsmYwy4ZvFFSUDatD4yOTzO
dr3IVhCdaxnQF2wMTiWfPFQfwKN2RrWdcjWOxBHmWlzXgBG6yzXeWF+6+igTjE86
eahwA1c6ZIUYzSAxUWGhEjjB/mfyxL+K8Zd4WecWdl2RqS1LlTH2TcaJCEUPg0qi
DfulahiQvr4xO4IKin6SD6cEcfxn8MAUH+X/MFGGEdKMURD+18Xu5glcEUG2We11
bn2uNOm8/1/S1+QqvBNYCD0VWArP/jTtkPKiV8ABbVKXGh7H3tzXMl3tR4RcEVS7
V50J2fVLzbmAUDK89/g/7zgHGzvjpoF0yF9yCllGfU5j1d+KpfIpi1l1i/YYpuY+
hdiBNlJoaiXlStTHjUElniUNqqCg3USWGA1umT/U5VQqwFG5N1F9LHzpsPsJeRhA
LuDmASmGxWD3Mz+gPrewoWCuqVlOIvzng7EdL68YycUlPqwWSIwQIW6s9GtvMFOz
9MkLimapOYywX+3im0BoU+QW6UG7x8VXTUTyU1RuN3mO9Hr3J2iHNTioZVOWdYHM
wnVhIYQlwt7kfeazAULcy1vxA4snt+ePY4KR+urnJ0os+bkt74g=
=rNqY
-----END PGP SIGNATURE-----

--xvZJCXS/qfXIF3vJ--
