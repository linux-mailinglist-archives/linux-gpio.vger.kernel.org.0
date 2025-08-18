Return-Path: <linux-gpio+bounces-24506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 370A6B2ACE2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 17:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CDCA7A5489
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 15:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E13261B99;
	Mon, 18 Aug 2025 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tu1frsJp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41946261B97
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531443; cv=none; b=CjibLXMzhQJVRX4T6crVbU/yi6+PbmMBigyGQhOOX45OVpzqAmNp30VpDmdAHq90Y2GlNNpsTo1601mBdyNdXukyrZvpBjVK26N32++8W67BRlXQwloI9XQNEOAiJ4PwF+iBxjs95kMr6ZlTMpbN1iCuTYJignsom6WGw5HB20k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531443; c=relaxed/simple;
	bh=zUAzaEIJ5VMfDRyaLBauOj1IcucT6KEg1btGJxZi1MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtHNwYYeQdqmiS62iwzEvlcsDMC5lu3LpIXvwKPdlKRV0l232V2NdFz33EdkANaeEQX587gruyJlpRTjltEJlwaJU0krZZJQ7uug7yOef1CiGX7DBSnl/aTNluqBKL3fbUZ2NCrNS6QNuFfr0WfscojqED1JUsQCAYC5MCeUXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tu1frsJp; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-333f9160c21so32823411fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755531440; x=1756136240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUAzaEIJ5VMfDRyaLBauOj1IcucT6KEg1btGJxZi1MA=;
        b=Tu1frsJpFKIuD2HBPbWhMEcBedXII/ApZ3TmPnE0BcG5ACP0VmvGkaSu864s/MLxuC
         S+dNANnCZGRgFBY0H/GLTamBYCzuxLui2B4VW9ygUzb8bwN5Vinvn0RZX5Fyt2Mc9fzs
         3UY8m3tT9A5cDx9OlzkZxyuJuH8zQn4v3hJtTGDhW1p2w9P14q9qe+H4G6pUE8BKvcvG
         0iVtTzj/3fTMvP9S6LzgBWaSt7im54nvWMSBrmIew+FardCLSiXeKyE6xLg8Tu7zkKaG
         aJWSTNtz2ulEHNwTkxDLKSwWJUtRS3hyZmSDN4rbUfTL5sx8bFWXQl47RbV9lqb1ffH5
         Ghig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531440; x=1756136240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUAzaEIJ5VMfDRyaLBauOj1IcucT6KEg1btGJxZi1MA=;
        b=mRXgIDMB2CPGVzCX4m9Sfhvr3hWLSN3ud/70fyccEPIW47jMb0fq7vaB3OLDXA6vXQ
         Xcwrc+3jbibTIU1+fVL7QnxdUxoyt52qR/TzbQTRMTJtzLYu5yr4UlF9NZIwyQHpDzR8
         DpFSomN5jlQrJPxlMASvMtz3o7bKiAUpx4w0szYxjE/UFdq2yVRx/qVjFRM32StvXoVQ
         qoc6ARdYNqPCHdwy5TUItWbbSw38BFhR/cVwAvWNyIVs2AtfumLXfgI0CjH/k8dBUNGy
         LTUOS5Ax6zYY4nFI+ByiEhZlDjUSnArxuAxuFDDuaBnfpWXJVo9KMLzkUipw/f1OkCDP
         H2mg==
X-Forwarded-Encrypted: i=1; AJvYcCVKUTvQGK0wlbl5u2CH2OKIAcyXCN/Rmf337fxlOaplDD5kQ4dmnQtKLEQbRLcNg/eI+pO9mE1b7BTL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Uod0WPcSNiXJSEIq/DVFwKOdNAWzqtF+XZT8lXKKUO3YrC/1
	5oKCKBbEDb8nVXWFP6DO0FjXRWAjOC3bTRlDHk6YggypMAKTISngW774FWDlu7jDKPR7sVDUfPS
	qkQwwKLncgm98X+VUEgr2dQHz2l5GuGR3+EDn9eEZPgspRGWhh3cZPgY=
X-Gm-Gg: ASbGnctlb5WX/NRNqtteOOAgoQfTsaWWjaT449aIt9XXmSwdH1fDFbxE4U0Y+RzoCp5
	kktFTXETFYBv8EnEJAicLy8d9hXAyf8rqsCS0dXl7eHdT5dYgO+CAq5YepQlTZPuNRHJJKO/Bdf
	NN2lCGJh6kku8qqJFbjYhX5OrD5KsDu4Cay6dUITAwQjKvVA5CeX7JtjoYD98OCXREDgO2zMBW7
	VZz6pA=
X-Google-Smtp-Source: AGHT+IG+GVJK4tzT6ecV7Ro8lqSck4UpyGZZpSEzRFsmZpSpnYahkHkhTdkt4MWZBGxnnEyxsT/xMtxcYazU23WLelg=
X-Received: by 2002:a05:651c:1503:b0:332:1c24:d33a with SMTP id
 38308e7fff4ca-33412b8af4amr28525231fa.3.1755531440277; Mon, 18 Aug 2025
 08:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808151822.536879-1-arnd@kernel.org> <20250808151822.536879-11-arnd@kernel.org>
In-Reply-To: <20250808151822.536879-11-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:37:08 +0200
X-Gm-Features: Ac12FXyuxmUcXP36pNiGdk8Vf7slpD6KEC6V4qN7-65Nz5kxvlVVKGMXuopzvk0
Message-ID: <CACRpkdZS1uOMsT3h-kyNQVrVW0R+1mmmOB=EAmqcHQSpo4qAYQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] leds: gpio: make legacy gpiolib interface optional
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Anish Kumar <yesanishhere@gmail.com>, 
	Mukesh Ojha <quic_mojha@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Dmitry Rokosov <ddrokosov@salutedevices.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 5:22=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> There are still a handful of ancient mips/armv5/sh boards that use the
> gpio_led:gpio member to pass an old-style gpio number, but all modern
> users have been converted to gpio descriptors.
>
> Make the code that deals with this optional so the legacy interfaces
> can be left out for all normal builds.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I like this, it cleans up things for current systems so they do not need
to carry around so much legacy.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

