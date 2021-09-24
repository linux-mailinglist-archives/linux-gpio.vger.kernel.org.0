Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6304176EE
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 16:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346324AbhIXOj1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 10:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346185AbhIXOj1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 10:39:27 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C179CC061571;
        Fri, 24 Sep 2021 07:37:53 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r23so2843146wra.6;
        Fri, 24 Sep 2021 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b+6Mk3O7LpVdzp5Jb5p0whL8l/VrfgCZuRXRsXVkwZE=;
        b=i3qU+iuA/ReBGuS0SfEgPyfrdU1H6FQ4xyvt+bVxEWVdN7UT7vrM4IB5kz7OrGAPRm
         PMWQ2t6ZB8uyRoZtmb16UVO6GcVr6MFEGzfpphgsoOJN3Ql+bLjpHG4puHuWU34Ye689
         cQrtVbxsExeSl3h3wnYC3AYDthfsD5rAaIV6mJE/SBiWLgFJeUPUvgHOzhTgZsN9MlFy
         uspPCYUPAazmxKd8r7kH4NAHOiaNgrPbqdIGOy3mJjD2s/p0gEFXwlixTPTeNYBir9U2
         VC6OVNZmE11lRgwXX11CMMqQKEZjENKONNzhvwNqSyhUt4dXnBwi/EfsfnyTbTSw0C6i
         0UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b+6Mk3O7LpVdzp5Jb5p0whL8l/VrfgCZuRXRsXVkwZE=;
        b=dZa88oJpxqGQzzDJSSh80h3anUkbYlB6N2Tik/aO4000j8CnWLrGXwaIKTOnIrADas
         DIayDtoPkl3f2SEHHfFoZKXX6vRmRjtznlye+GRT1wlkV4pJSA6zlQZmRamYEkOcL0nk
         Cr85HQDfY1NdtAdeD65/Xr31orDe8AZnA53aASy9Gokq88WvWUIc1DDdvPF1bcV3g4vD
         v9/zvnGzKYs8tnKTNbSgCyqOOhIzZbVA/nR7NlW1DNKfKD07vPAR6W11erBRn1YjDn08
         U+LxhhbMMmU00QIwAX+fbpDtKUzxZ/gMGN6BhOBEQEShdC6qgPsXgkcuf46u85ImFfS5
         u3Pw==
X-Gm-Message-State: AOAM530bfvKJ1OBJFD5PAgQyFmU7NZpRr9lQNLpfr6fB0EzSnJWSAxS0
        6r8JcecFAkjhaLgoPcGovGPDbI+rj1M=
X-Google-Smtp-Source: ABdhPJzy0zekgBXJ6u39ExWd89d/LJ97M4KvnMkSsWSgjsAFIrlfRK2lJNuShJDhodXLGAoDsAuGAQ==
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr2489521wmj.195.1632494272206;
        Fri, 24 Sep 2021 07:37:52 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u25sm9751265wmm.5.2021.09.24.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:37:51 -0700 (PDT)
Date:   Fri, 24 Sep 2021 16:37:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com
Subject: Re: [PATCH v3 2/2] arm64: tegra: GPIO Interrupt entries
Message-ID: <YU3ivcSPEo9sf0ux@orome.fritz.box>
References: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
 <20210907073224.3070-1-pshete@nvidia.com>
 <20210907073224.3070-3-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/wSlbaGMGvM3Cnsl"
Content-Disposition: inline
In-Reply-To: <20210907073224.3070-3-pshete@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--/wSlbaGMGvM3Cnsl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 01:02:24PM +0530, Prathamesh Shete wrote:
> From: pshete <pshete@nvidia.com>
>=20
> Tegra19x supports 8 entries for GPIO controller.
> This change adds the required interrupt entires for all GPIO controllers.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)

I've applied this now to the Tegra tree, thanks.

Thierry

--/wSlbaGMGvM3Cnsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFN4r0ACgkQ3SOs138+
s6EOlxAAhG2mBwZxm8ebPAcd2JAcutuyLwtTVU2fNk7MhbxnNsU4XtNZsc4s0cB1
GzUqyiafMVBZ0fTsEQYNsP56M2akjLy7eU/W7sMb2Gh42nJ4+iSGq3BplBXFYMEY
pFQogzsvFm7CIkWMh7jXEBtzM2ipg52tcBRwOHRj/YAkV5a5ASdIJdq/C+/JNFg5
wIFWuT5gbWZBmTfgh6g5oIPj5+I6OnnFzxCq6yqUzlVzHIhhrs0Sd88u3USPefeC
WhV4XDowiS2csNKHVOfcZI91tssC55sSy5OzturyqA+Dh4ojzniqLzmv43AR5Zie
4GeW0HhNxWFZgAxYPBzAYy0EIE/5gJLdGFbw1V2S5iV+alIP+iFMU27iNzLnXKg1
YMluPpcSyZMs4lVYO50fWEOKsXB2C6Vph0yCBRlwUPLXKh/0cOwIjrpI051muU5O
OepyODSmjjfIosTquGIIlxrcDJEmClw7OKL5/RS5d+irBmjlBc65Crd+RdKta2Am
SDVFm88jsE9OLA5K32Bi6XW0qIxNDRQZUr3oEyyN6aVI6gT373+6NkVU/qsYCYH5
PRwSdVIPsxbdwO+eGsH0g5RblzlZBtzi4KH/L7QEPdNHxNwosd+A/07RrkRhU4G9
hxpnatgLfnecj+DtMY8c/PEZGr0dYnk/QoBi8w8ijn8GuYO6WqU=
=XpD7
-----END PGP SIGNATURE-----

--/wSlbaGMGvM3Cnsl--
