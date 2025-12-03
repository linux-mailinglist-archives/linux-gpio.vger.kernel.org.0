Return-Path: <linux-gpio+bounces-29237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1EBCA1ECE
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 00:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 555FC30062F1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 23:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCC42DEA9B;
	Wed,  3 Dec 2025 23:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i52K43It"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA9D25C80E
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 23:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764804026; cv=none; b=hM4r5immgJQeWrTZqRxlUa6IgGGOgEtQgemeNT0QrQcLcBJvWYndof/yw4FiVVSeogf4stl7bK4Ebw3w7pDcsqwwtzG4j7sHbXNPE56MM9VhRw15k/JRevxgSNgM6eRV25kxsadpj1iu+W898u3yxWVTLsw51V3IniCcmhkEmqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764804026; c=relaxed/simple;
	bh=d0GfyFGM1Oph0pY5oAbEauVJi8UkgLE6QU9SfUb2YsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmJwQsIwuREcmqDtsk/GMoAdiHvJDfD2Txsz/MA6vbnREATjtfknjzEPWtGaCmu+7C33gqrQxqx32sd8S1Yw30Su/bUulI1bOnloC0eaoOZBnvlRdhLKlYbpiRah76rYCYmjum72V/NXCBUkREOHClYeGuAOxq/8t5SOUe5z6Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i52K43It; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69944C19421
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 23:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764804026;
	bh=d0GfyFGM1Oph0pY5oAbEauVJi8UkgLE6QU9SfUb2YsY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i52K43ItRJf5Gem+Kwl6iAnimM0datLWEvGacELCt3p4FULhukjH4QT4DVLavFWpI
	 JEAkp9xSM3Z71lEYJ4anaihlGwP9XrBIqAsLsIzneOwZvFLrgvgA1+O4W5C4r/ohAx
	 R8nV7z9NLtoxn9otR+6OxbgLljweuWOlfh9BX3f04zZKyXiJi/EKKAhUGheI7j5Cp7
	 5yGbVwAEHxfyrhFwjj6B6eg9aaG69KJO0U9/QttH/xPYGQ7+V7Z7ZWBPGn1xNgQr+I
	 x5Yx9ajGl1N26NlLSfMn5jZpEmjVV0K3nogbO4eUjT7k5f33GKNMpZ29+2wAIHXeIw
	 nHK88laEj7D5w==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63fc6d9fde5so233278d50.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 15:20:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVspw+dowCAsVLt1B3BxAIZ96QB23xhR/tuMjKEfBpMWII6965LjTZWS+3O+F+QRh6OKiKyw6rkfdyF@vger.kernel.org
X-Gm-Message-State: AOJu0YwpIMi2NRgZ7wjGRaZ2h3fIwXBdQYHdgDE56NgIIbgfNSE/ojMM
	6aWBhoVuniqPg4fnkCP8yVIVkrseb3i7ywqTSrlNtgapjQxM9K2YbvOdaWtn+jz5lSmGtfZg3pl
	BqKF+uJbvbK7DuUdedMPhES6dVpr5xkQ=
X-Google-Smtp-Source: AGHT+IF6Ubehf9UyFyN7R9CQHHKnaL2+kuEjm67boDEH1TzAwnXzKTEF1gwP+gQVaHPkySSPQ+49jv0HL03LpI29228=
X-Received: by 2002:a05:690c:6982:b0:786:8a25:9967 with SMTP id
 00721157ae682-78c18902a3dmr6870477b3.50.1764804025792; Wed, 03 Dec 2025
 15:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203061347.381-1-vulab@iscas.ac.cn>
In-Reply-To: <20251203061347.381-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 4 Dec 2025 00:20:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLnH-ZT+9YMxqZ=TV=0fatXSRcFkJMk-snEuRSMLdfD6PQ@mail.gmail.com>
X-Gm-Features: AWmQ_bn-byFumMhepCmXCRHPlxHjGckHiBtylxRKGopQpAJ4h0Hwa7EoKago8dU
Message-ID: <CAD++jLnH-ZT+9YMxqZ=TV=0fatXSRcFkJMk-snEuRSMLdfD6PQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: Fix incorrect type for error return variable
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: tony@atomide.com, haojian.zhuang@linaro.org, linus.walleij@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 7:14=E2=80=AFAM Haotian Zhang <vulab@iscas.ac.cn> wr=
ote:

> pcs_pinconf_get() and pcs_pinconf_set() declare ret as unsigned int,
> but assign it the return values of pcs_get_function() that may return
> negative error codes. This causes negative error codes to be
> converted to large positive values.
>
> Change ret from unsigned int to int in both functions.
>
> Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Patch applied.
Thanks Haotian!

Yours,
Linus Walleij

