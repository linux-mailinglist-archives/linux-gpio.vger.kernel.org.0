Return-Path: <linux-gpio+bounces-30365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E633FD0AC5C
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 16:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E30230428FC
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 15:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40153148D9;
	Fri,  9 Jan 2026 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xns2sR0A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7809B311C35;
	Fri,  9 Jan 2026 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970842; cv=none; b=go/2GbQCjLBpEzCo1SF3ZNWQMY6fmDg+eYsFosMkXP0ekq3699YA3QH2C+2xNuliYpco1cLkAFvP0/aVy/kg6oQY2UnEVhGAoFCzBltdL9OHAZVBJMTMaeQ+Sv6/Xe4EbLuE04hWDS8314vb1TMF4LwX6elMVfLJoW9sn+AXmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970842; c=relaxed/simple;
	bh=Aje+uGaatS/zZ6bNqKgQr6KrwxvEUtlz9mxwKyBPm6Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Iiz0fPjZSIR6qVs7tGb7xPQ0o8dif9tmoS9sQeBSsSxc8H0sna0/awz39FHF0iHrYFvDV5jNRShVy4XOSBt4qtAFGfvJdyfF39/VesQwfKN1sYRTVPgOjJXab/Ap2kKtbMDgslo7dzwl4rmqt0sjd5RKtw4C9u1+WSbI665csJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xns2sR0A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93B5C4CEF1;
	Fri,  9 Jan 2026 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767970842;
	bh=Aje+uGaatS/zZ6bNqKgQr6KrwxvEUtlz9mxwKyBPm6Q=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Xns2sR0ARWQXilUvX2LGNDEE3RbOu7CLPxRy6wKLgwGFtUwODcfWzsK4bSb/XJka1
	 Cc+pWh29yLq8Kxj/aFhF1FWqUDgGb6Oro4fHWN1fW+yuw+7AlACIP8IgsAol74Df1p
	 0O2RPjgZm+3ddPlRG7/nw+cSOb74+nnC43FPj8qcTpgC6jiJVQutMohEVTD2ftRC/i
	 5QUNmDoFrPmiCo2WSpyG8VfyeoBWL+ue10b/icCZnA3QOXWv6qBgw0Qu2VsU5PTigI
	 qkx6boK/bSrWXSmbHk2Om+WG14Io99HmTyf0eDjvHMA8zlf5N6wvb4VMOEuuFTs3UA
	 AwqdW6ZXIW+og==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=10cc56e18556c84b8d11322d249db501f6592cdd11082fd7f7b4faf97a42;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 09 Jan 2026 16:00:38 +0100
Message-Id: <DFK5CUIFIIIL.35VKCDMDEXVGS@kernel.org>
Subject: Re: [PATCH v2] gpio: davinci: implement .get_direction()
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Keerthy"
 <j-keerthy@ti.com>, "Linus Walleij" <linusw@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com>
 <DFK4BWTWHHQF.2IBES82YDKAEC@kernel.org>
 <CAMRc=MeV7djF27Jd6DWEJK60Fe-PcFSM_8dN2ydXXYSKPWVAMg@mail.gmail.com>
 <DFK53GQFDR4C.2E5KOGMEGY61P@kernel.org>
 <CAMRc=MdJhqKMH4ap5zDf0Andy9h2XF1Z9bME6XvMSY52YRWGBQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdJhqKMH4ap5zDf0Andy9h2XF1Z9bME6XvMSY52YRWGBQ@mail.gmail.com>

--10cc56e18556c84b8d11322d249db501f6592cdd11082fd7f7b4faf97a42
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jan 9, 2026 at 3:51 PM CET, Bartosz Golaszewski wrote:
> On Fri, Jan 9, 2026 at 3:48=E2=80=AFPM Michael Walle <mwalle@kernel.org> =
wrote:
>>
>> >> This will need a
>> >>
>> >> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO suppo=
rt")
>> >>
>> >> Otherwise the sa67 board will be broken with the defconfig (or any
>> >> config enabled ARCH_QCOM).
>> >>
>> >
>> > Can you confirm, you're still seeing the issue with:
>> >
>> >     https://lore.kernel.org/all/20260108-gpio-shared-false-positive-v1=
-1-5dbf8d1b2f7d@oss.qualcomm.com/
>>
>> Yes, latest next, with that patch applied, still causes the same
>> issue. I don't think it's a false positive as the same gpio is used
>> as enable for two different regulators :)
>>
>
> Yes, I responded under the other thread. Let's add Fixes: and use this
> as the solution?

Was just about to reply to the other thread, but lets keep it here:

Yes please, that will work for me.

Thanks,
-michael

--10cc56e18556c84b8d11322d249db501f6592cdd11082fd7f7b4faf97a42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaWEYFhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iwLAF/SrbfBAxhP9uSbyM2FBVvXXqpUOePY65S
U26hE8xLMG6KbuhotQs9Ad20lJBszw0tAYCeaP1KcTw/KcJIWdwvCbwlZy54ebvC
JE+ZcQwGT/Pumda5m1pCX7Q3J25A12gr5dk=
=DO3U
-----END PGP SIGNATURE-----

--10cc56e18556c84b8d11322d249db501f6592cdd11082fd7f7b4faf97a42--

