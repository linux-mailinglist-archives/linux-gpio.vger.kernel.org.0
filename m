Return-Path: <linux-gpio+bounces-27401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF9BF73F6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 17:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098A11895ADD
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 15:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C167341AD8;
	Tue, 21 Oct 2025 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvWju1/n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAD128E3F;
	Tue, 21 Oct 2025 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058974; cv=none; b=Z3/Tvd25Usg3YKGmAYmrNTbbHHk2BKjMtYoz3JZavC7Kc8H22dc4jXSGPIeFMtG6C3C8beHaI+8NpSQqJKU+wNSiBDHiFETeQC29u1UhDBLYMK+i6zSZ3z/nbd+GjkT2uKMaCPXK+A3I65ZMxVNb3GHwFOW2uRxVvzT/JpxBaZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058974; c=relaxed/simple;
	bh=vhE+RkNn0col2gY895QKZKl2jXFzW3GNmsKSxd/Byyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jE6WZQeLsAIWAS4Yw1peY/3WInXowY5SUkHB0Y6uPm5vGyVPdJPwkIb6ML6tKPfNVilFQgU2t+Wk6giqfxentoJV/C5Ov+Q713aOozpxrLj+N9+o4Vsw5XXrCvscl8SFAAJNBKLhYV7X5NorpbiWoysI+ziEpC5d9HtY5nR1MU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvWju1/n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC4FC4CEFF;
	Tue, 21 Oct 2025 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761058974;
	bh=vhE+RkNn0col2gY895QKZKl2jXFzW3GNmsKSxd/Byyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvWju1/n0Y5xoyyQydKo2kwI/JVdRlyvcUHqYfHuYE0YUuQVMuCAwInNLICiPvhcu
	 3sV84TP+jJTa6etwgVtT33o8fJ91zPJ9YPgQQvF3VqGkRilB89pJ9mZNbbSaol6ZV4
	 No8vP6j9z8s5boOQTpvv1e1JmAZ5WWAoC+auLqt53ivk/n9TbXFQIuqCaB1eIOHiln
	 EyFFk/y51ylFnygyqdH3DLPH16uuCYVilvBOUW1HIYGRbclgYK5kfp1mmw+ic8cLpS
	 Rg2TMqLZ2fCrw4Y06PRqE3sJ3lHLtdDJT2SZRs6Pe3ocrlV8gyX7bZKdP+ygrm6KWe
	 oAQWDEkRC4XdA==
Date: Tue, 21 Oct 2025 16:02:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <0bd2f438-6151-442a-9ce3-77624e74682d@sirena.org.uk>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
 <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
 <CAMRc=MdOCHJEyPxN+-g71ux68=Mt_Q5P9611QO7Q8J9e8UJv_A@mail.gmail.com>
 <0e1f3a1b-46ab-4eb5-ad05-70784f9b9103@sirena.org.uk>
 <CAMRc=Md1Ve4hnYQOryYEXG6_HSPJrANrr9gj2FMzCwsD+q5Cuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qt72tdmZbvUAwbO2"
Content-Disposition: inline
In-Reply-To: <CAMRc=Md1Ve4hnYQOryYEXG6_HSPJrANrr9gj2FMzCwsD+q5Cuw@mail.gmail.com>
X-Cookie: Accordion, n.:


--Qt72tdmZbvUAwbO2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 04:42:11PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 4:08=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > I'm not sure I see the need for deferred notifications?  We'd need to go
> > round all the users whenever a physical change to the GPIO happens but
> > it's not clear what we'd need to store beyond the list of users?

> In my mind I was thinking that we only need to send the notifications
> to users who already enabled/disabled the regulator too but you're
> right, it seems like a loop over the relevant pins should be enough.

Ah, great - yeah, I'd expect notifications either way just to be on the
safe side.

> In any case: this is outside the scope of this series but I'll see if
> it's easy enough to add separately.

Yes, definitely outside the scope of the series.  If you do something
that'd be great but no pressure.

--Qt72tdmZbvUAwbO2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj3oJUACgkQJNaLcl1U
h9CGegf7BpG/mRuGc435GzxtX0o4gZu98cJAOQC0hGm5PC43OR8VmUUNDzOnrcs2
N7uW4RYBTDDP15v5VZbKmj7iK9tO+zl7/fW3+sRYf3xTeQc7bxwlKUNJefJO7xkG
Szrgvpv3f5CfFjyq2GRO/b2ydBRiRPknhYT2oJnKBYM63OMUZp7JcXh8kDnEKcOM
dzFAVsq5V7b1mOpiA+VVS5KaUNEDascKcMqs8o9fX/0mC9kHIN45dY0SrBbB4bBq
dG2U2nsSW+AhIWsiad8MQzDr0SEVWwVR5HHhduC8bsSCfwUvAgmP1gG6BVagb3SQ
wQIcYgbHgVh9jYEzddKFCQpgpc0F7Q==
=PZYy
-----END PGP SIGNATURE-----

--Qt72tdmZbvUAwbO2--

