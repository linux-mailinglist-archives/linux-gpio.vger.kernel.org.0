Return-Path: <linux-gpio+bounces-24681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5038EB2E56D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 21:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F188EA23E50
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FAC280CFA;
	Wed, 20 Aug 2025 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eL7rr3br"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671F3275AEB;
	Wed, 20 Aug 2025 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755716720; cv=none; b=Y/Hw96SqmvP64ndzIBg9WJSTtigYPeyWzP9Lon3jgcLTsD8qktculJTI7piXyWgkYmdCejhWOMpfWWxXX35xw/rowZSM0IrCC08jq9XivHR0TPG7ocO0bDW19OQDjCSaO5BXJkV4SP/sENGl0E8EU7FW0dtruFLepZ1G72SbHWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755716720; c=relaxed/simple;
	bh=dqORxA01ddfu04i5AUCIuKJMwCymPmwnJNmkHBTnk70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vamy5UGiToO/JhHVVprOzvQznSRMTvBZivAPEIK1NUMBYh5lvaEOXahpxvY81oPvV4bmtXca5Wj6b8DiruIU4ONzek6FlLuckB07iGXdYQ1Bv1zMxqwjMM8Rdel8wcsKLq+W7xxes/0dp9PVIh2pLKnoKIiEaadi7B3CcN9svls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eL7rr3br; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61aa702c9ebso514433a12.3;
        Wed, 20 Aug 2025 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755716717; x=1756321517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqORxA01ddfu04i5AUCIuKJMwCymPmwnJNmkHBTnk70=;
        b=eL7rr3brxLEjsRY7DSOGpOHudpVZk+mxO+bQ0fcryc7sDEEnfQequlf1qNWDLoR12S
         dHJHrRC5u/eSYWHAP0xbHnnczRWKES0QH/SsdkBZp9Kyvvdg9zFkdRJ6OGVflOq0f0jH
         70GSVhbjLC8Fa6w3nh1kf526wq0C7XOPBIBU0uxsydynUe39Z7cNsvUJ/auz1ZAUKXiT
         xPjCw48bSkwJ8kXf3XvOhLKXqP1162tUmZapSiHANq7oPObt17ZKfmxw8aGMujGye31V
         ZITDqVjA4x9gODUHpaXHUGIS0JOXWjCvPcJPdqY1aWZj8HEcB+NuqHI2YjAITUN/xbVA
         zhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755716717; x=1756321517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqORxA01ddfu04i5AUCIuKJMwCymPmwnJNmkHBTnk70=;
        b=psXH69mOMzngV8W619fRwDgDDr6IJ8C3ch6H+SmvPJBPtNVE1lOTz6vyqlDFiwi6mR
         BzapoLcSwCVD3UnQ7QWBzdjv8kmBUpwI3WU/moLCzgn5HER/78R5pou2N7YnB9va6C6k
         EUEanhe1rMIB/VBOoK2xMRjp/di4nyLLqakKQ2TwVKaPZY0FNEt2XGhgH+KI2wTN4eSp
         64TXsgREdWOYsVHVFihTlEgvU6zHOrANGMIiJ2yt4Ni6T5kR7kO8S0wZ644FWQBB8c7s
         Ad+n7/zrx0d9I59WuQdWegjImQC8q6AdCvjIWonsx6GjeK1qP0UlFfkuaCgscKngjGqF
         OaOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEOTQ/rBLiL3D0HxyhN/pfNpDyUv13D+dLzeF0QAshfS3LW/z7Wk9Y5VhnVYLs0btKjzY/jkigZdVfaRBc@vger.kernel.org, AJvYcCWhLdEdB/Jco43Y72rZuIjROW66lx8XezXSbrjVEsAGdvCHudQQxk+6s67G5d2dQ2lbxTQpkxRv40TF@vger.kernel.org, AJvYcCXvJ8d3XbFjc6MpqiAGM1eufDSu8Dd6DzcTjAkZ/ifg4z2uiN56jIxEZ4L31m4hhvx8v2W0vjLztH8VEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYt+z6XALMpuZzmecQf95Z27iF6rmj1JGrCrzQcFmh9M/L2Vn0
	hBb8e0Y5xy5FD3iiFFIuKz7KmZmK6waZfUbshPgG3aZcal1BswdOnJZ/DvDGm2By7mmgV5+TqCR
	b4QKBa0bgnltkwiCEtyGi7Zx1L53Q0bM=
X-Gm-Gg: ASbGncucWhc13uAYkDE4s381toW3Asu0g+elL4Ql7SI1NFb/tf1DNrtTlb3Hy+sfEM7
	2KsgUZqgLutJybkyIjjYirfGgmurrM8pNQ3GGC9vc68F/Vyf16AD6iETAQzC1DhN9dyKzuZDwdi
	b4cECR0WgwDGlr6V1sSsfXmJbDKmDpUIMRHu2B4f5+J2Q2ZzXeYY9UUc7eG/9rkTGvjHCsQqVjw
	iPWPxbzTaz8gOCM0g==
X-Google-Smtp-Source: AGHT+IHJiPRx0SngC7bjC2w4GtEgXQh9A32wKEsxcZ0CVXXlaP6DEiOwl/6IKq6V3wKbKch1kJfDHW692elgTcsQBhY=
X-Received: by 2002:a17:907:94c3:b0:ae9:8dcb:4dac with SMTP id
 a640c23a62f3a-afdf00a8cf1mr325925166b.14.1755716716491; Wed, 20 Aug 2025
 12:05:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-2-jszhang@kernel.org>
 <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com> <20250820191039.4f8af41e@barney>
In-Reply-To: <20250820191039.4f8af41e@barney>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 22:04:39 +0300
X-Gm-Features: Ac12FXzx226wSucqjOB8xNIk2YZERgxrOlmASf3USK3y_yzf_ctFUIqwnOa-1u8
Message-ID: <CAHp75Vdpgf3DUMQw0mYqhG=9UrYG8KWrobbd387QZapBor_LHg@mail.gmail.com>
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
To: =?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 8:11=E2=80=AFPM Michael B=C3=BCsch <mb@bues.ch> wro=
te:
>
> On Wed, 20 Aug 2025 19:54:44 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> > > The dwapb_context structure is always embedded into struct
> > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > > data overhead for !CONFIG_PM_SLEP.
> >
> > I don't think it's a good approach to add a lot of data for peanuts in
> > case of PM_SLEEP=3Dn.
>
> It wastes 36 bytes in case of PM=3Dn.

...per port.

> The driver currently allocates the struct with kzalloc and stores a point=
er to it
> in case of PM=3Dy.
> So this probably has an overhead in the same order of magnitude (pointer =
+
> malloc overhead/alignment/fragmentation) in case of PM=3Dy now.

...per driver.

So, I can't say it's equal, but I leave this to maintainers to decide,


--=20
With Best Regards,
Andy Shevchenko

