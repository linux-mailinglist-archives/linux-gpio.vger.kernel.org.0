Return-Path: <linux-gpio+bounces-30207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E22CFC8ED
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 09:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F8393001FFF
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 08:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD01527281E;
	Wed,  7 Jan 2026 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kc12Rdla"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D76B4C6D
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773859; cv=none; b=XHWZW+00X4wOOP2i17d3I0Hnxbef8hcw19WfbxkwhpVC5woANNU2jYKYJqNduDxuKYAaTZAgxbm1kgPj54t9rAZxNQDaw+suSLE+5pD1o6A5fB92cK0y4J0JTxysemQfM0Q17biBSy67Ij2Sa50+K3icmJpU3lS9aNMpkgVgeOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773859; c=relaxed/simple;
	bh=yHvZxYU5euKC7OvX/H86k4MTqK0gyY3mkHGyE1CbFsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2XTgP2QS7vpiFqc27LKSjqUye+E595mbgus8Qwop5/lxPGf6hKltwyahPxEyUeUUxTxkt9E+Nzqj998DqQG5/o571QD0MBYrmBJaCh2nDmwzQV70T9W3EN/gVuzJ56IwNKI870fBA/lVwPSzdg9YFgQmG0jaDAwWC9IHixSEOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kc12Rdla; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6455DC4CEF7
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767773859;
	bh=yHvZxYU5euKC7OvX/H86k4MTqK0gyY3mkHGyE1CbFsk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kc12RdlajmgBp4VO28xfAGu3TmO9Rb5u1Ttnoy1AIYK7ZOZcS+Jth+Icp0DZaFFHr
	 ptyc8E+e+uux97lrpYp4OvR5Miootp7oinxo4gosWklt3dpn7qBGuVccNNekdUdhot
	 ycu7rnh+/DDFc/uMAw/5wV5V40TGkQ86wOECiwzmnA25iUG2lad+uV24bRHc/kP3EP
	 tCi85c65fjud1i3zPbfXrHU9ahYKusJ7Lrev+XdEDN8UeLE++gn1xnLS8xjTzsed24
	 8Ke7C33H0pZ7C6EVxL7iN+oN1eZiXXzyz1e283PqexGAqxivQ3eJ5/mXJ/o59Lhgg9
	 NZQ4DhPmdk+GQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so824781e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 00:17:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBpS4G5BZTyu41mEymMQrfnz8g1llKy6qcRfLJnrkm4MFcJBTn22rtIv5GEL4OnXgRo+MRApkXdUYA@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGViKkX0Qg06soHPeuOCicrvFNBgo1vpQOiScuu/A75I4bwKH
	o5+sKLqEPR62socw7dzwGiKKxNkMX2Ms2ivgP6aQWTNMgZjRdaPhQmNNuybuFzaVn7bEclG53JN
	50oUh5ItyGdz1lexSsZHTUMPv/24gyFF82PMv352W6w==
X-Google-Smtp-Source: AGHT+IGhjfpRX5tYf4QtZIp/XXzxXAS586FOU8Nn1xmktkPSATl9LqL0Cc9yw++6v82PHuyDotuvatMbvwRYOzVdzHI=
X-Received: by 2002:a05:6512:304c:b0:595:81ba:fb4 with SMTP id
 2adb3069b0e04-59b6f040ef1mr506257e87.47.1767773858013; Wed, 07 Jan 2026
 00:17:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107030731.1838823-1-daniel@thingy.jp>
In-Reply-To: <20260107030731.1838823-1-daniel@thingy.jp>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 7 Jan 2026 09:17:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me4HTLTVDG8Z3iZhep3hi+_1C8=mwDG5Rpnq+zAX1HG+g@mail.gmail.com>
X-Gm-Features: AQt7F2oJ-7wyysYKAA5jVn8TKqxVcqPv50T0XTlelsLEgxwvdpPFOZWBlXpW4dU
Message-ID: <CAMRc=Me4HTLTVDG8Z3iZhep3hi+_1C8=mwDG5Rpnq+zAX1HG+g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Let the compiler remove unneeded compatible checks.
To: Daniel Palmer <daniel@thingy.jp>
Cc: linusw@kernel.org, robh@kernel.org, saravanak@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 4:07=E2=80=AFAM Daniel Palmer <daniel@thingy.jp> wro=
te:
>
> I like devicetree but I dislike the way it removes the compiler's ability
> to remove dead code because the compiler can't know what is in the runtim=
e
> devicetree.
>
> One common pattern is checking if a node is compatible with some compatib=
le
> string that should never happen on the target machine. i.e checking for
> something that only exists on a very specific PPC platform on ARM etc.
>
> For weird people like me that want to run Linux on FPGA softcores, proces=
sors
> from 1979 etc it is better to have the most minimal kernel config possibl=
e and
> for the compiler to strip out as much unneeded code and data as possible.
>
> The following is my quick hack to add a way to hint to the compiler wheth=
er
> a specific compatible check is even possible or not so it can remove dead=
code
> and then an example usecase.
>
> I think this is cleaner than #ifdef..#endif all over the place but maybe
> someone has a nicer way to do it.
>
> Daniel Palmer (2):
>   of: Add a variant of of_device_is_compatible() that can be build time
>     culled
>   gpiolib: of: Remove a bunch of compatible checks for spi controllers
>     you don't have
>
>  drivers/gpio/gpiolib-of.c | 6 +++---
>  include/linux/of.h        | 2 ++
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> --
> 2.51.0
>

That is an awesome idea, let's hear what Rob says but for GPIO I'll be
happy to take it.

Bart

