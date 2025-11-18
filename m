Return-Path: <linux-gpio+bounces-28697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E6FC6B7CA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 20:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 607BD4E56D4
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 19:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5292D7DEB;
	Tue, 18 Nov 2025 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uN0Ch6dJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC2F1E3DE5;
	Tue, 18 Nov 2025 19:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763495220; cv=none; b=N/3U5HfG4kTe7U4yqjujwxENl9OFsuwS3MNSP7s6mbQ+wqYiMmGJf68cD0xUbe1dfiY+sfVLa6+t5Iw/Ocs1pNkVl4b3aYQPa+4V/XokTMByX9oDkq//dpGgzbB7vwldSmLrMGjZkGQipkXlF81/FZVR7lDxEAI/Vyp4xtOeMrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763495220; c=relaxed/simple;
	bh=LLV5ulLhdVg2ftls0Im8pJBkD7VEtlgCURwkLWF5u+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXW/6YHpwHH99wF1hurTzfLZpIi+AbBE7TJ1L51UmbjiavDALjuiLt06JPBhxPDeTmp8jumpjITYrS0a0UBXm4FFIAXtF2OTvMhZesMNTvbXEPA+7Q5VNHWCbhkQ8c9h756lRyEckuxETMtZNChLxjUhR/VkLwAk2FjdWbZdgws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uN0Ch6dJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DEDC4CEFB;
	Tue, 18 Nov 2025 19:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763495218;
	bh=LLV5ulLhdVg2ftls0Im8pJBkD7VEtlgCURwkLWF5u+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uN0Ch6dJWqu554qFfFd7advQobZNg1gWL0A+tf5iI8GT64lHAFsR4Rb7yZOLDwwIR
	 Wyy067ong3ccLceG42iniJiAPmdfcJOuMdLNBreRnnqs2KbM1WmrZ27N7C5Y0fPukV
	 B3RNrpTYlktLo4DEOIaEpBednhS/xZjoaArucvjlRo6clBrcah7SrvubrL+9kSmRxx
	 PsVcBRIdEXK6N8y8Q8+UOUg6OgpEU3BJ1vRzZwtNsuG1lteFrtUrfdvlABA2ay9k72
	 9WmYc+Mat9ZD/BPzjF8+6Ay2VtVA0kEtPTYyFhL4+yZy9FYspXxk01bRwDZyimM5VU
	 DO3dXFJOFOkng==
Date: Tue, 18 Nov 2025 19:46:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Message-ID: <d567c3fa-2e50-4ef8-944a-da4222fb96af@sirena.org.uk>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
 <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
 <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com>
 <ab0b2e6b-7d2a-43e6-b8e7-c97cb9763798@sirena.org.uk>
 <CAMRc=Mcafi6+kRX+9sVOLHCegdU33+omLg+aW4RqeiokymxPNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aM9xPQKM74VxiVWS"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mcafi6+kRX+9sVOLHCegdU33+omLg+aW4RqeiokymxPNQ@mail.gmail.com>
X-Cookie: Protect from light.


--aM9xPQKM74VxiVWS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 06:27:23AM -0800, Bartosz Golaszewski wrote:

> Oh, of_root may be NULL...
>=20
> Could you try the following change please?

That seems to work on FVP, I've also seen the same failure on other
platforms including Orion O6 and Graviton 3 but didn't test there.

--aM9xPQKM74VxiVWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkczSYACgkQJNaLcl1U
h9BxCQf/TvcoYIbZXiH4sSxaTvyRmoYCCaWX0P5G0lauZn1wuaRwQwiWSl6G1ls2
EO/JYc8hnMEWsVvnMEadMf3mce8so+hpfu3pNT1dE56mvdjtKi4hsgl1t4zdBGMh
8KBUEU1T7p1w9yffhyhVEx6gMJSdqNptauuNhdGHTbjuvUf8mlEkLt6PibGiWIIc
Apx0tuSDZ5Ukthzt1GKXXrgkeTDHCk3vN7ePQZcmiIkRkXN1keffSzVJDMyJWIT7
WzLnN/33WACiMLJHKD60fg6oVljFVRdyul49K1exjVRY6smlU3Ia0X599uu5I+p+
ACqJMb+YPN8x3OV0oSUTRByRCyO7wg==
=jedi
-----END PGP SIGNATURE-----

--aM9xPQKM74VxiVWS--

