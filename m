Return-Path: <linux-gpio+bounces-30362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95673D0ABB2
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9F7E3008C50
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4005310624;
	Fri,  9 Jan 2026 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQDic7Cf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD4C30FF23;
	Fri,  9 Jan 2026 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970107; cv=none; b=EqWq1O8sR7g6YI52NtSw9MDmh308Yp7fOB+3nX+ODmTVeBkW2s/HBoPcb2KKoSn+gxHFrmemaDTj64bi9J1qLKqDoWYkMrrE95i8Uo/Ds4zqnI9xkXNapg+adHGaG391cQUNGxiIPTELtsFoaTmgR3w2yoddkYBR+rw+u/0AXRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970107; c=relaxed/simple;
	bh=UFN3laAEC/lQzR9niQO8cAwurAuz2ZqV01Yo/5Lyldg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=fX9gw8PdkUMV2kPqQ4Eso2rid6Ug9Xe2m/GMyYkxfmtzswPI+FX7Slidmxhd0bZ7bojhsI6/D1SCQ3ebqw1j4a4BnZtP53VLMSCvA2NZUc/F0GP9BNG3KV1WIOpyXAOpEaKY2U3qnsVsIBHHw7/iWxrAWZTfA6ICBzqyLpslcjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQDic7Cf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BDEC4CEF1;
	Fri,  9 Jan 2026 14:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767970107;
	bh=UFN3laAEC/lQzR9niQO8cAwurAuz2ZqV01Yo/5Lyldg=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=vQDic7Cfe9lAnSRBc+67QceRUAWtYiRLr3bVoSj+Xl5b/mBmO1JUK+NwR0DUEbmEn
	 Inj2lhRo9c0Axb0g9OqKDh36hXE/jrFx9IJY80wkMivsbJR4ASRks/2iJmr6XnIsDV
	 qApHO4/XrVwfMNVLxotHFcInTsDXaBTOwfdgdZas2zB27ih3gj44Xv96pmc7I8UCDc
	 cNyChtn+ZKBnKgbDC+kVImbNBKd1PS6Bnx8gIPl5xZX1GZV+lNoLwMHMwJ/E0ANtsB
	 YWXm+7H9Gb5VZSyjgQRxyPS/b9sZ1FxQD4yKnMMznX1UKrXoL2MOMlqFk9VMAcc663
	 ofmejoCr5LUsQ==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1b802e9832ecc9650ec7774842aeacc48ff09eb0eba8bb8a1f0158f8ccc2;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 09 Jan 2026 15:48:22 +0100
Message-Id: <DFK53GQFDR4C.2E5KOGMEGY61P@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Subject: Re: [PATCH v2] gpio: davinci: implement .get_direction()
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Keerthy"
 <j-keerthy@ti.com>, "Linus Walleij" <linusw@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260109130832.27326-1-bartosz.golaszewski@oss.qualcomm.com>
 <DFK4BWTWHHQF.2IBES82YDKAEC@kernel.org>
 <CAMRc=MeV7djF27Jd6DWEJK60Fe-PcFSM_8dN2ydXXYSKPWVAMg@mail.gmail.com>
In-Reply-To: <CAMRc=MeV7djF27Jd6DWEJK60Fe-PcFSM_8dN2ydXXYSKPWVAMg@mail.gmail.com>

--1b802e9832ecc9650ec7774842aeacc48ff09eb0eba8bb8a1f0158f8ccc2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

>> This will need a
>>
>> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support"=
)
>>
>> Otherwise the sa67 board will be broken with the defconfig (or any
>> config enabled ARCH_QCOM).
>>
>
> Can you confirm, you're still seeing the issue with:
>
>     https://lore.kernel.org/all/20260108-gpio-shared-false-positive-v1-1-=
5dbf8d1b2f7d@oss.qualcomm.com/

Yes, latest next, with that patch applied, still causes the same
issue. I don't think it's a false positive as the same gpio is used
as enable for two different regulators :)

-michael

--1b802e9832ecc9650ec7774842aeacc48ff09eb0eba8bb8a1f0158f8ccc2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaWEVNxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gENQGAmTNT/upw8XHmQLQ11Lz7gS0IovJuGl5l
b1TOzb6WQeiVVdouv6k0CwA/DrJF6TLGAX40O69lAHEJn0dz3fclFVlgQLdXmV+6
be/I0jY4iA+vLQDNyVP3uy+VP2JlkeZqe5c=
=Lvpc
-----END PGP SIGNATURE-----

--1b802e9832ecc9650ec7774842aeacc48ff09eb0eba8bb8a1f0158f8ccc2--

