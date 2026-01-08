Return-Path: <linux-gpio+bounces-30280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4101D03C1A
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 16:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E2B7309B67D
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 14:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4343803FD;
	Thu,  8 Jan 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOKtgMLO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E4B36E488;
	Thu,  8 Jan 2026 14:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883608; cv=none; b=aSbHPgH1AYURooESbBdsVhTOxwKQSZaapbW0F0T6hE4sO/vVZRDHHZhEGZHqj6DFB80BJh0jb9ZNZi+gRIlYw5QcKkLdcLQeMjgn3W1hP1NqD/DV3HG3G7hO64uooKdhaHvdy9Lc1xhz24QroOU8+4NB8Ip1J2rkAyjDCKhiX7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883608; c=relaxed/simple;
	bh=2ei8nRnBAMWW9W6WszkkXLKWBiHlzTnUwXvTR2tRXME=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=IT8zoS6/UzIgGhrPwK7lPTyMF/H/2BBLhg7VGtfd6xZKOxjAuOs36y7yHj5CueTu0ifPPEOLhFyx7LnucliUfBhs9OW5ELNL5frybXPta6E81xJSCvyfm+xUsKNQBk45k0CEIlIcQqnWCIDYB/L4qrWzfmodpSkdSdu/AKqIjQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOKtgMLO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA07C116C6;
	Thu,  8 Jan 2026 14:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767883606;
	bh=2ei8nRnBAMWW9W6WszkkXLKWBiHlzTnUwXvTR2tRXME=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=UOKtgMLOfyWCtqWtHypoDAaD5/hZoh/E4MzZsFgxwG0tK+Azgci2tjpkcWrwpm80f
	 eZeK4Ssue8j6PZAsgHMEg9kIo3y6GeN9P/sp5IxVYIUbARxVOV/8D4kwbhmj5C3FbB
	 TnQ+FnUlNMt8K+YyhcBAXaAi4RuCRJgQdQGTZRz56PrjcVXREWl6TTuFo8GHzgwWim
	 CKbDvguGhsu13yTxzZVqUq0+NGrpByBbD9lJYi736zGK+Eip6vVlKFpxZ/rvJOKnFM
	 1mQNaSTjXFqcQoFj3TsSSmhdQoE/79Ydh6M7MJVmuV+CI3728uh75GKeb+atncU7SS
	 nTp0gpiiFXw9g==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5411f11ff9f9c069b7f705877418128e825c926029051e168dc800dc1521;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 08 Jan 2026 15:46:36 +0100
Message-Id: <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
Cc: <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Kees Cook" <kees@kernel.org>,
 "Mika Westerberg" <westeri@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Manivannan Sadhasivam"
 <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Andy Shevchenko" <andy@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>

--5411f11ff9f9c069b7f705877418128e825c926029051e168dc800dc1521
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Bartosz,

On Wed Nov 12, 2025 at 2:55 PM CET, Bartosz Golaszewski wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.

The problem here is that the aarch64 defconfig has ARCH_QCOM enabled
and thus it will get enabled for any platforms, right?

I haven't grokked everything, but does GPIO_SHARED=3Dy makes any sense
without GPIO_SHARED_PROXY? It seems to me that the probing of shared
pins will be deferred indefinitely.

> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.
>
> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> to also cover ACPI (even though I don't know about any ACPI platform that
> would need this at the moment, I think it makes sense to make the
> solution complete), Dmitry (same thing but for software nodes), Mani
> (because you have a somewhat related use-case for the PERST# signal and
> I'd like to hear your input on whether this is something you can use or
> maybe it needs a separate, implicit gpio-perst driver similar to what
> Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> last week in person and I also use the auxiliary bus for the proxy
> devices).

This broke my board (using the arm64 defconfig, works without
GPIO_SHARED of course). I'm seeing two issues here with my board
(arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67*):

 (1) It's GPIO controller (gpio-davinci) doesn't support
     .get_direction so I'm getting ENOTSUPP during probing of the
     (some?) shared GPIOs.=20
    =20
 (2) GPIO_SHARED_PROXY is default m in the defconfig, but I need the
     pins for the root filesystem medium, i.e. the SD card regulators.

-michael

--5411f11ff9f9c069b7f705877418128e825c926029051e168dc800dc1521
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaV/DTRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jkBQF+MtwNQeOvtcMN0ofh9FJstZG1LqdasjYc
4/kT44u4mQt8stCwJA4J/rprAq7X8ayrAYD1LmLKHnkWQUO3PxpeH0TQvkMeEsd+
4ITEdyzXpVm0JxSd8OaCMSAhsekBmk6e5M4=
=cIVp
-----END PGP SIGNATURE-----

--5411f11ff9f9c069b7f705877418128e825c926029051e168dc800dc1521--

