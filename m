Return-Path: <linux-gpio+bounces-28528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F707C5F734
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 23:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D067C4E401F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 21:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB323307ACF;
	Fri, 14 Nov 2025 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dvq7y1MV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F218B2FABE3
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 21:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763157477; cv=none; b=Kx+reQhflnqYgZjzOH8GG9yozdpY/BzuESrrD01431Sq1EQi5CIJa1fkc0xC+UYiq7ZUz6sOEp0o20qQ4l1fiUACfGA6coBkTIDvtcGzd5PyRwzwFtFNaI7/J7W+anlU2s+XgewCn/ZveYY/BtYQKhJqtTMK3+sTsXvNon94nUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763157477; c=relaxed/simple;
	bh=NejWZ+/c7eJzxkqIJLUq6kOMKEwS/zt3yIZkcOMgvtc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hcr3I3gyBbjOGiz40nG+dNKNKcRXMTuxU/VOEpWkmN8AHB+0YAodiBVfodMBHMGaW5QBJ7HMxA+eVQooQY7ch6enqBSwOroGNKS20mvKj0PeqA4TDNtZIGsoAUV/3DMgg33R93BeT+502sJ0fHjbfL/gtnQCgOiu3VvOusX9Hdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dvq7y1MV; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso1306141f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 13:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763157474; x=1763762274; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vbNWOmHpdEa5AGQhVuTfa8JxnnOc6K3WrOIf2UEgPrA=;
        b=Dvq7y1MVyrcGRpWXca4pLx+e+8RdgNkKTnASp232YHPUasCie0xPxnL9F7Rp+RCoyq
         xo6RX4VzSZ6jRzeRNwOpeLA56N452p7lXYF25nlHdwaghfFqeXqbU3kaSwY1hnPqDJU/
         W1GnX0hoRP+jen3R+qFgFgruB0GTikL++sxvCePrrLkMHK5LlOw5h6XpCGMgnVhsotEe
         6uTF8cmdry+dmzj/0Wtw5EhxPuG0nR0OUHaW75A2EG9HIPKG99ObxHI1fv9w1UyBAwgS
         hQahVYFxliyUAnTbEXMEsbTII9+Uw01y5QzWXXhYKlkbJ+nIvTjHizQNefZM6N4EhhPC
         Vh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763157474; x=1763762274;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbNWOmHpdEa5AGQhVuTfa8JxnnOc6K3WrOIf2UEgPrA=;
        b=N4DL4Cce4v7Xysw+0KjNpjo7X6gka3Y/zbtUjG9fH/9uMDTpGa+SnVXZojcpEdbx4F
         6uEeMago/4epzvZOIhB2vZGBzQdgvWIW21kmnkwzp+kcVXYKJ3CCHwLtqlXy5NDXoQEE
         upETOuwuaciUPFSYsag+K7xTJk5Dp/hZaevBekGHQ9s8YP2WTCV2OkeJ+FtXZCOlzA72
         KeQY8Cq7ELbS9d2KTe+WghBi2BN010luKb++Jt+UVuqhDfdGiyYXNVd0LzRdJu+trCXz
         YDtf+wN3JUhmBGSdqtENnZd1wYUPGnZ64IIQtecZOSggaUhyo90Uk7QmS0aBIZLkujwr
         h7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWYawSPzXS2L1q3EFhVUl+HiD4e1yBEw/0vmghrsFAcZGhg85IC23BsjOxesheIBCg2QFoZs6Y6INQg@vger.kernel.org
X-Gm-Message-State: AOJu0YyUB5V2kTVUA4uzu6/f0LQ0UKWdtkkhvyWBfmPKcjdeR9VAABht
	vycyWEGiFydhypLxVduNFaFKTELfnEXYP2tt7g+iXgSFZCnnuGTcLWoWGSHj2NAVnWY=
X-Gm-Gg: ASbGnct8+nMeZyjcKoSkUIT5XOb/Afev2YDpJRa54Jc9RAfmAxXuke+hJ1XEfqWnwSX
	lORLTASVx6Qu4SVBIAald7iFRZ+e4rQGKxWqcgqf978IFIcwYFbjWX0KHzpnjlyZfnTIVdsMX2i
	5lCaBLLXsPMhBi8JlPv7nxIxU797uI3YUM1QBpH9KJzq+f3f64foLG3Wc/P8b4aoPB64nOFPmQH
	fFnqfgm8tlo+R5yUwzuSHL3hXz4POXsDQAHOALvcqpiWjWc7yQVRgatfq4IZSXHBoWxc/CbQeOO
	FirvPGh9AUK3vPVXuE65GIScyymURYepewml/UG/5JllocRxt2sM7p4yPwtcb5W+OKHFbOQK4ot
	BI9dvFy9YO/DpN55wDepJed96Vsj7oxK0pGI7w3sG9dfzO10iAgHGRWnguX333am8qMCOOUGeav
	463O2MLlwuxxTw8CD4gw==
X-Google-Smtp-Source: AGHT+IGZJojwQ5TmPU9HbJqZqk3xKa3jFdu0oCf5mPPHwz3sSCeo2kX4zEUPEQ1wpVk6J/TBJSkFkw==
X-Received: by 2002:a5d:64e3:0:b0:42b:4061:2416 with SMTP id ffacd0b85a97d-42b59396ee3mr4481398f8f.52.1763157474288;
        Fri, 14 Nov 2025 13:57:54 -0800 (PST)
Received: from draszik.lan ([212.129.82.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b8d6sm12805516f8f.28.2025.11.14.13.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 13:57:53 -0800 (PST)
Message-ID: <f1e9a9e35f7c16d8db0e39128eb184f3f42b7d02.camel@linaro.org>
Subject: Re: [PATCH v3 09/20] mfd: sec: Add support for S2MPG11 PMIC via ACPM
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,  Liam Girdwood
 <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski	 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin	 <peter.griffin@linaro.org>, Will McVicker
 <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Fri, 14 Nov 2025 21:56:41 +0000
In-Reply-To: <db7e95dd-2361-4579-b52c-b9556da4633a@sirena.org.uk>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-9-b8b96b79e058@linaro.org>
	 <20251113162534.GO1949330@google.com>
	 <45ce203c03ec34631a0170baa7e4cf26c98b9cd3.camel@linaro.org>
	 <db7e95dd-2361-4579-b52c-b9556da4633a@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark,

On Fri, 2025-11-14 at 16:46 +0000, Mark Brown wrote:
> On Thu, Nov 13, 2025 at 09:43:29PM +0000, Andr=C3=A9 Draszik wrote:
> > On Thu, 2025-11-13 at 16:25 +0000, Lee Jones wrote:
>=20
> > > > +static const struct mfd_cell s2mpg11_devs[] =3D {
> > > > +	MFD_CELL_NAME("s2mpg11-meter"),
> > > > +	MFD_CELL_BASIC("s2mpg11-regulator", NULL, NULL, 0, S2MPG11_BUCKBO=
OST),
>=20
> > > This is highly irregular - in that, we've never done this before.
>=20
> > > We're going to need to have Mark look at this.
>=20
> > I did see this in at least one other driver, ah yes at least
> > drivers/mfd/88pm860x-core.c is doing something similar, maybe others, t=
oo
> > (I stopped there).
>=20
> Other drivers doing something doesn't mean that they're following good
> practice.=C2=A0 We do also have drivers which have multiple identical IP
> blocks and are passing in resources with base address, interrupt and
> whatever for the IP blocks which is different to just passing a Linux
> internal ID number through.

That's fine and I understand that. My reply was in relation to that this
has never been done before.

I'm happy to use an alternative approach that can solve my problem, if ther=
e
is something that I have missed. I think the commit message for patch 8
describes the problem in better detail than this one.

Cheers,
Andre'


