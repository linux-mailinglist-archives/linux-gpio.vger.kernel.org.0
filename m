Return-Path: <linux-gpio+bounces-28756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCDBC6F04C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 058CC34ECC0
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0E43590DB;
	Wed, 19 Nov 2025 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XiCf8snx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D76F3563E0
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559658; cv=none; b=c0+10ENRFRqQ386VH3HNL7n+bjc4zDLgJdxImm7dWTANmBRTQCYfY32CW/Sd6iNLXmCCNW6HPuQgsLfFjLz+DZvdZvK6IUemLsTujUcASEXd3MF/lAeFb1zgSVSSfHoeRuu1pn1to6EPzZb5RPr7deLVcnIGS+d+v3tA0B36pEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559658; c=relaxed/simple;
	bh=p1VeUzD38gPmtyIu7qtbXNax1D8JulnLI68nD5CrDU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bu1Rdq3Stu4csngg6PbpiSIKIgxzaYCk1u/aITrU9ZMCHXYDK0gAPPNCCvfKYGNYVBV2jcmC8YV+ALyCGrD7pYkKWWsoyMgu0rS4cWLBslQpJBJXl8lC/h/3vz3cQW0ZGPedIK31umtPIz3051Q8gjTq0BaaUzHNrklvyw+c6rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XiCf8snx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5959da48139so1238700e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 05:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763559655; x=1764164455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1VeUzD38gPmtyIu7qtbXNax1D8JulnLI68nD5CrDU0=;
        b=XiCf8snxqVcz+bMzd5MLFfQXPyEiwMTSyJ0McqqwKfZF3pd7XYsGEi4M+ppJCV7koF
         pWGlqe2FWDYc+4juEWHNKVB0D/BsZWd5400+G80200tpjXb9jJ3fWw0OzZeXEBHXuNHi
         4FvZZ+01rLNBPza3XAI4lW+Uhn9pQVZOo3Q5R6aG55pn2QOcLwxBZbJpyXZSn4jv+R86
         aL7957Cki8isOkPGx7+uUKHiwFz8VPzcU3/Xr4Yz/q3f0FzQ8dTjAAtSNT7YnKVOmdLa
         0fZP7P2SMMc0CWrZUS5A+hHrzrpxRym0nsChlYPGjLhzFPJgfmKpU1zhxgYEbsKo+qak
         W3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763559655; x=1764164455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1VeUzD38gPmtyIu7qtbXNax1D8JulnLI68nD5CrDU0=;
        b=iinaoCKrCNls3uZBQbbEBV/XrQRkw3/lmoO1rY1hcl8uy4W11ldXqLq2Y7+agk0vGh
         o75NZioGlezVwAxhp3gMAtiNhB8P/e92dtV5T/r9pXw9tjG+MHdSQwftlg8lLy/RJg7Z
         uZOD5UnMQl0wWzNZ+T/1dqrZ/qhdL8VMV7dIxTt/ESVoPjf1Y/P7RkzHbIPFv5smdNWD
         5yqSLXEd78coS4w1MVnfw80M6QUIH/X9ALPyR4UdMZgLQs6h/rTwQ11uSPPsH1G+Nnzq
         aQpIhSxrI2H937UYWjWMzQDcEqV/yTvnipT9NDLUdiR368Z+iRF7XpkCoeXNUuLMbFoa
         ydAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr+MoUwMsiMIH88OL00lDI9j2ukXt0XhcStg4vCAsvPtbhyquRBJ38YLUa1+rKdIEIGBdrb/Xc5MC7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0sVKXCD5QR6sYRoW6tmoBavS0VHLRYCIjCgZ39GbzDokxRgqa
	Iu0ou61uxocztSujO8EFzSW1MHf+V/agy8OUkp6JGsnKjbhGq3PrpJHW0oy48JXVPIOCCKka43I
	l+/+ZRMoTQ8w3ApaR1Sa0ZSmuuY1xHumuCBzUcU4ILA==
X-Gm-Gg: ASbGnct/9doOgsVRSlnUoutiUl+QW1WPa9e/X5DkifaqOFJhUeAJEqmn3HuASpleqdD
	O2+j43+8KFBFDhRzqiK4FJjDEyEGYjZMkp7x2geCH6DDxgT6KNoemjgZOUaQM0FEXnux/hZ414T
	ll1xEfhTHpSQrhQu9sIRBpsiThpkMwdX44Rmj40JICJYRDN2dsM6TjGDZoOTxZQFrL7iSOA0KsO
	1uAkXUhvorR9UenN3X3ox+IIkdgGHo9IS3hJ7d8QU95qNt9Y2Hqn4LmpAOrsnhpk67IlYV0P426
	a+clmA==
X-Google-Smtp-Source: AGHT+IHJqn3Q9sPhFEgzMw/vukdNcUT/GVv4BESPUPflJb4Mu3DDqG55U/y6YAHksU0FJOcXRT5fsp/raa2CukOp/os=
X-Received: by 2002:a05:6512:689:b0:594:341a:ab1e with SMTP id
 2adb3069b0e04-595841fbd7emr8740927e87.31.1763559654402; Wed, 19 Nov 2025
 05:40:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org>
In-Reply-To: <20251118003229.26636-1-jszhang@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 14:40:29 +0100
X-Gm-Features: AWmQ_bme-apOhLTLN0FLgYrYqF5_wu51DsT5ZOn-gWqBj2C9VIwE3ootHtgkuJw
Message-ID: <CACRpkda8GmEbFeSmGexcs-5aaFHiUigPhQfF_ynJRN1ix2f6nA@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 1:50=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:

> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
> left as is, because the memory for saving HW context is not trivial,
> if we convert them, then the two drivers' users may complain for
> !CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.
>
> patch to gpio-dwapb.c is tested on real HW, others are compile-tested onl=
y.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

