Return-Path: <linux-gpio+bounces-27343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C71ABF4EE4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4903C4F19E6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 07:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B553273810;
	Tue, 21 Oct 2025 07:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rNiqkTOE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D263242D6A
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 07:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761031145; cv=none; b=fXmJ32S7ExS6F+k3bVPM9Y9B2pjtdeAmqeidmNVT6GmUkhsQ8dsZ4dFxMSazMbVODX3203P4/P2Hjdi+KvYI8HD8W6T6X6RRDQEP2+S+aPLvc5DPuMaUkVXgtPVvfh2NErrQGSZvcCnET2XSxLCL1H+aW0+DMLYyekQrtKbfUdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761031145; c=relaxed/simple;
	bh=TPytR/oh6ERL16e9/CIiX6YLokDAnd3+ZVvWKR8z9Ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/UZlwk3MbvPVDNmXqP+ZikUcf8sniJuQ0KHH1thgd3sYag72UCSYCEs+xY9pzGXAaJGl/Ije+5TG/+oOBPGib8yCwbNt4+598Y0gsMP3YQt4+sn6o17ASI+LGmmdeNOerRHsbUREtTwCDuWbhHgGUjaSYqdObIGWwN5abeddNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rNiqkTOE; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-36a6a397477so54201741fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 00:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761031141; x=1761635941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPytR/oh6ERL16e9/CIiX6YLokDAnd3+ZVvWKR8z9Ug=;
        b=rNiqkTOEE2wr8pfFYWxEaambhqBtYh3BqPl1yvuPB1LSzEWGmhApEoCb2pMdG9iIGj
         ZglZGFd15rW7it3OZw/Jbs5j7OOL1IdlNqGO3SW4wWg/m/rYudY+4j4SY1p9P22rkheP
         KnfC2YEjfbdA0zu+gDzmW14NmawK3TdO+jgziS4hbhp0fw6ZUV9NB17HwY0vAy3jvZYe
         +WlRGNpRAcqiXUtMr3vFl718Y1yX2rk3ZCE8olN8c1rzWZWnS0pf/rJdAoz1DmDidWAM
         iM5YJXGlY7DRhMiUb8jzYpav9mjn+vwm+iCTE7TfFWKYZAAAk4+JOETCoFwK8DCeWSOR
         NBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761031141; x=1761635941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPytR/oh6ERL16e9/CIiX6YLokDAnd3+ZVvWKR8z9Ug=;
        b=P9JV8oqPBjLbM8rfwyFAU5PlS8ZsHfFAoCUWhPrXL+rT44ZUihPpd7mpjajDeA1Tro
         It2/5C76RajsUIzNbQ5cqxnyAidG0D+q83QOKTSZ5g2DzW8nz5kCdhXWyV3H0gSWhpY9
         /inB8zo9blIVJzngeq93Q3PhHa0J5lXp80vzZXtyMF4LygxKnXNodda8646fClSpUktN
         9TLSvRyKJWy4UuHtGaBxihng5gHoNI8J7rym6nNDizt8ROiAfmSEXBD9SRTfN5lDwiJv
         LcFNCYCqgdkdTJx+fZeTorrKTYTMIQn2/OZZeC5caaGon41GeR7Sw+SEpmR8igmH567T
         6viQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdeCLAFySlvOhYmEN8oEe5rrXxrPxX9Z0TBg3uHF77TCLiiCUzAqEXXYQnU11v6D9TCQ8nUCmPur1I@vger.kernel.org
X-Gm-Message-State: AOJu0YxvV6v53WTT5kOBa51Y+M6vw4zmrto19yflGFbSxpVgO+yts/Sm
	1NGP1KQpZ/l/TqIBqFAOuOmc1PJrc6ZgJbL0TklCoJ9JBmsda7qj9T34IipWMDTz46xBSg/d8oe
	oF6inOLCydClFGfXwW63XpGr8CwC+LeEbuUv6wzuPYw==
X-Gm-Gg: ASbGncsugelOTEyI/N/a6trwGXdlEqxBXzW330EHIsP1DuAU/hr986wk+GHGcPgU2/V
	NRyvvyCI8/ORWGgr8YO+Q0VxsWFT2bLs5pixVIdM2pBO9y5f4R1TPi7hDqbJnbAVbMR0lMbY+B5
	PfSFZAEslKnwbrgXs5Ij5NmzXomPfU4FkiBGSjBa2hNJF7It9hborNJ9wjhw23WTVRvJiBjZHNI
	GpPbwqIYxUsYeEl+qlF7S63wBuyPCo6ye3xbwNjm9YaKiVKUcuu9LIeYfHc
X-Google-Smtp-Source: AGHT+IHb0RcnFdyK3FEcqMExpVgW1RnfxelPLl+VNCZ83YgYRm+qQ4EwiVuw7VnhH+G1ZGS+9xMxXTLRxCadOJ89KJs=
X-Received: by 2002:a05:651c:150d:b0:35f:73ba:e758 with SMTP id
 38308e7fff4ca-3779781655fmr61252801fa.1.1761031141518; Tue, 21 Oct 2025
 00:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020115636.55417-1-sander@svanheule.net> <20251020115636.55417-3-sander@svanheule.net>
In-Reply-To: <20251020115636.55417-3-sander@svanheule.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Oct 2025 09:18:50 +0200
X-Gm-Features: AS18NWBZyaqA8OKAlBvNyovq2S3rJ2ezmux_KHn7yd_S_2jjXzxCSZ8a2vy0_b0
Message-ID: <CACRpkdaqXzogkbcnR3uaDeGFcVtwmUq5DbETSqzjVQECJROF7g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] gpio: regmap: Bypass cache for aliased outputs
To: Sander Vanheule <sander@svanheule.net>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 1:56=E2=80=AFPM Sander Vanheule <sander@svanheule.n=
et> wrote:

> GPIO chips often have data input and output registers aliased to the
> same offset. The output register is non-valitile and could in theory be
> cached. The input register however is volatile by nature and hence
> should not be cached, resulting in different requirements for reads and
> writes.
>
> The generic gpiochip implementation stores a shadow value of the pin
> output data, which is updated and written to hardware on output data
> changes. Pin input values are always obtained by reading the aliased
> data register from hardware.
>
> For gpio-regmap the output data could be in multiple registers, but we
> can use the regmap cache support to shadow the output values by marking
> the data registers as non-volatile. By using regmap_read_bypassed() we
> can still treat the input values as volatile, irrespective of the regmap
> config. This ensures proper functioning of writing the output register
> with regmap_write_bits(), which will then use and update the cache only
> on data writes, gaining some performance from the cached output values.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>

That looks good to me for sure!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

