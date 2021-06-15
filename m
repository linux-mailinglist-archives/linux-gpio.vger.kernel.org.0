Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAD63A7CF3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 13:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhFOLOw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 07:14:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:49694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230436AbhFOLOv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Jun 2021 07:14:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16B996145A;
        Tue, 15 Jun 2021 11:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623755567;
        bh=WxY5rkcQS0EHPv/TtiTjUoaRUw6sqGDv93IItc7eQDQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uiONthO1S4skT70c+w+dfv0BbT+jk4V1NWc8h1S5xPPjiyUp18prJoR5GYWJ5xrHq
         7h8hwjOIvzILTpBA50BTHIvkmy2dkVwFqfZN3TzBW6UbK8YUP5dPCPC+Zv/d0fQLsP
         v/Q1o01nm2x2ANUcVeP83+m7vOHvd0oyixcQEmOhc/XRq++U0eSf+s3BdRfXStVlsQ
         GSy5BTH3iHqYWc/k3wO+KFRcBII0MG0ovXWcIRvtUxMfFXyR3+fV2mqEC63Ves++q+
         F9/7rX41b1rUhRm06YDMpLG6Vs9Bil9dVfsReTDvtI1K9fAD2h2LsyeODPqDNJwGW7
         h9l1nUworz8LQ==
Date:   Tue, 15 Jun 2021 12:12:28 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 06/10] regulator: qcom-rpmh: Add new regulator found
 on SA8155p adp board
Message-ID: <20210615111228.GB5149@sirena.org.uk>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-7-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline
In-Reply-To: <20210615074543.26700-7-bhupesh.sharma@linaro.org>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 15, 2021 at 01:15:39PM +0530, Bhupesh Sharma wrote:

> +	{
> +		.compatible = "qcom,pmm8155au-rpmh-regulators",
> +		.data = pmm8155au_vreg_data,
> +	},

This is adding a new compatible so it needs a matching update to the DT
binding.

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDIixwACgkQJNaLcl1U
h9DmWwf+I+6UuRxm1bqPiKDzx81Hg6sNX9011K7cArsSXzcFymC7fLz4D3UUJ4IQ
pmA3xcRHxfCUkTS4xwDaNXMY6QaS6q/G9/UaWn64DWcfF4AIdgOwj/oxFypoAt8f
48Jt7NyaMYK1EFHoZan91D49xCu+dAMrKo+6jI29kH6ZrP+XzoVxAN8KXPKLxa+M
VqQKyWg73/97XppC6FJnv8xleWHDrkO8FXPDDXeMB0r+TnGzG7fjvUlFenkxDdbS
39Vh6uuyvRyuxpQBXSOyV2BNvhXqhFVjhyrzC1c4+T6p0nn//rIclqVzwalZy9Xi
dyV7IuGmP//Y7nii3Kqo86AtpwKyKA==
=nLmw
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
