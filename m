Return-Path: <linux-gpio+bounces-29730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B134BCCAECF
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 09:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57A3A30155E4
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 08:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2833321A1;
	Thu, 18 Dec 2025 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYtvwKsf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F2331A5C
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046683; cv=none; b=FCZatpJoynv0HOxkGG2Rl2r9WM3eCaYoBYfSGrNjiYSU98PhTi+gdMOXoGUfWTflBqDC22ta6ocz9RgMbwHPJu1OnBH8wLQQI3cZ/hMdh3Xy6mXtMjWg3TD/4psqrNr2f2A2qPaWlltDih0he4dkHWmwHtozTIyGxNk3oEG3E4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046683; c=relaxed/simple;
	bh=TrsC91RxEXnUnzwriEeTqPCTi3Ox+UG1XNp5n7oHr4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYAT4AD/SFWQE4UmcJQJqnx0nqw/bL/IYD8PoDADetsSgSR+k+sBa/ZhGiULacFsa/nG556WY/UCmSVqY2t329l4PpExRQqpAnnXdILpVFIZlgrqQ+WEl8u6KIxdGq/ETciNVz4zhqtivkucvB28kl8BczJopfETbloHbJxjn5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYtvwKsf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23311C113D0
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046683;
	bh=TrsC91RxEXnUnzwriEeTqPCTi3Ox+UG1XNp5n7oHr4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bYtvwKsfIcGRpWafwo0ZJQv7zh6DoxTcQsJS4kf8SzuOf9Oz9AMkYYVQVIIweqW7B
	 eOQbH5Mmul1zcuCDhJeB0IMUM4nl7h1Dlt3Ubw+Prt6PWqIOvvvOJpQTxnaJyMFgDN
	 PuDEwZmoBjtFaFwV4qlEj//QhAZbA++0LE/Xy8uYgeEffvqtuhLNT2OqfEAUO5Jy8k
	 VI+av49Y2B06Z+oXpJvcS5wQfGepjgwVbT3UPGjWG0GmO3Yye4D/AdX7NpulX3qTIK
	 Zh9xtexiDN2FgMJCDELIX1hhXqFQnGcc1EX6cEavEAdsWlwFQBtDDeLHtuETtDd+nL
	 cieZjvOX/Z5YQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37a3340391cso2489471fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 00:31:23 -0800 (PST)
X-Gm-Message-State: AOJu0Yxy/IlxeNel3cSj3M02gzrE7Cx3FuexJE+VH/RSw4n6aFyP/zcX
	2GWzCtYysrk2V+MnPcDXLCb+sgxxecl1sGl17kZ9dNh+9DAhPzcOX1RbpcZFLGdEALE/2j6PX+4
	GVSF6GuVgjW3iP6i5fMmEVnEjbIkl+y/9pOuYB1FfgA==
X-Google-Smtp-Source: AGHT+IFvbHO+sfAUbdhMYj77JcpjMMVTkA/7pMfzL2BI73/i9jq6apoHAq8Blvjjb6tRnnWjNRj5YbvRTotchkNiNtY=
X-Received: by 2002:a05:651c:19a5:b0:37f:9168:c26c with SMTP id
 38308e7fff4ca-37fd08d4095mr63962511fa.41.1766046681744; Thu, 18 Dec 2025
 00:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217063229.38175-1-rosenp@gmail.com> <20251217063229.38175-4-rosenp@gmail.com>
 <CAMRc=MfnN0sD=yb7NO6ixHC-mhv2Cg5qw_wb8cZGtg23chwmOg@mail.gmail.com> <CAKxU2N_SM7EauHNpu+Ko5bHfFUkONMVGYNRfp6jAL_wjcJn9wA@mail.gmail.com>
In-Reply-To: <CAKxU2N_SM7EauHNpu+Ko5bHfFUkONMVGYNRfp6jAL_wjcJn9wA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 18 Dec 2025 09:31:09 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me7Ogsa9qXzwzdS_oWfVXaAYhK4E9onB5FfOO8LAU4pdw@mail.gmail.com>
X-Gm-Features: AQt7F2pasGzvkH17tYspBarbWVe0uHohBn8RjL3Zb3mi-7i2iyP2w9K6wn4lB5g
Message-ID: <CAMRc=Me7Ogsa9qXzwzdS_oWfVXaAYhK4E9onB5FfOO8LAU4pdw@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: realtek-otto: use of instead of device handlers
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 9:26=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
> >
> > Yeah, no, there's almost *never* a point in using OF-specific accessors=
. NAK.
>
> Argument made to me on netdev before is it's pointless overhead for an
> OF only driver.

Would you mind posting a lore link? I'll gladly chime in.

Drivers are OF-only until they aren't. Vide: lots of discussions
currently about supporting ARM laptops and servers with mixed DT-ACPI
setup.

The overhead of going through the fwnode pointer is absolutely
negligible while using generic accessors allows taking secondary
fwnodes into account.

Please don't tell me people are going around the kernel converting
drivers to using of_ routines?

Bart

