Return-Path: <linux-gpio+bounces-6206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A29CB8BEA71
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 19:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4ACB1B2331C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 17:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AB516190C;
	Tue,  7 May 2024 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRF/Ew9X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00A4A951;
	Tue,  7 May 2024 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715102245; cv=none; b=rSc8kV0xRfpmariT8DSAaQUjbi2EWqMR1dCnEKoQZGAxnqLTabL+XVauIK/YgvKEn/QD/dHCtLMiqUP246yjgIy1VlzwdaSB1t1M0DgW4zFKE0AebJd3NFFZXRUqA6uHsVM6hDzlxi8UY/i6GJWGaNy5TXbfl8RwaNm817P2US4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715102245; c=relaxed/simple;
	bh=tt10DJ7fLHqtt+N8vHO5fh/JA2Lt8pJk91/4mSduB3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAkF+xt4n3ajKGH4xIg41Udjhm99HrMPh3yjvgzh9Z4/4ATnHOYPWUTitP4oGj0LS8QpSFUOaUhnkZEBNDiI/MQFGNmJ8ZfOzT/4+x8t7fF3TRjBK8ZmSACEo+SHMJv0lm3qToAG53oVJfYvqmUHNp9cb079qi8qPhr2a4RDIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRF/Ew9X; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59b178b75bso604683266b.0;
        Tue, 07 May 2024 10:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715102242; x=1715707042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aU3pwl905vszgFU7HmwRESNu0Xm5cT15cD2mMAswx3s=;
        b=KRF/Ew9X6gvX+noHrDQEK2lUttRBh279tLKA8zZEINsqXubOAFnBH+ru/CMwP24rwq
         oCfpcqeX8i+IRb0aXuxiFgE4zGjDgQDRmK5ghMI6KpLt77TZFYQRGUP5lIEc13QyTO6r
         HCbB4Qnp/2lDc4sTmYY+jf43WHkhSXPTDotR3qq9MEGQwPGCLlTVy3r//zyBFuMfdAfp
         ORBuhyVnlIRroHQbs97nHWI/M7EeSye8t8b6SIa26vOYlwfPRBKe6QUUY88+lyJhohMx
         GqFaxXpOtseC9CFcZbnV/H7REGhFDFfFxli51K2z5R0ABkFcrLnRKlTt9CS/kifRP5Ru
         35Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715102242; x=1715707042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU3pwl905vszgFU7HmwRESNu0Xm5cT15cD2mMAswx3s=;
        b=IHUCVxm3dcK39h8IOYxEuVFb9OAJqyFN0fHCjgiUhrX43lQtPFiqffLMzCIEsxMyWP
         qgvSHH50a0EMekjobZ7aNZu/NcqTqyxkd17i0ik2GOcd8KqqCz9H0xw0o+dSoRBSzyVz
         yvHZazeyflAAS1uRyCP6sqFOWnSHwYfNW2kwbpvDZreNZqHoc42DwS3S4cpsqh77rlui
         mqVG3bNmE/lMGW6PdbEfVu89Hoj6RnBwRN7uhEis+KzN0b7CIKu+46OOZ8mON8oTeBwH
         7b4Rdi5dg3ZUtsOom85GRkt6U2BqiuPnn3Wsxhe/Wq6ql+pfLLZ7mhaXD49hQ0I+SPOh
         LpNg==
X-Forwarded-Encrypted: i=1; AJvYcCWOVh+A+l/aMeF4FXBukRFye1L5/UtKyO2G6/IkzVjc5HdkULzoU8LIKvwwHBz1re+S1hyJGNNauWvYUlA5foHyosvti95rQMYNX5lYNrDPjGREuf93WUWw1CMUkzA8lgCIX1iL/8KO9oSpjFv+WQetAtPm20Tw62hJNf7d4qsKSS5rcV1cW55uX3T2VgtoOWQo87lygUlQq6onJwp9MNS6bkmi
X-Gm-Message-State: AOJu0YyuJ+0SZZEDsgBcGK87TVF9sKUQqAk0zJyjyo3LMPjxL0UzSy5N
	yW/CAbsXR5K9t5gvzrEZS0eZrPDIuzJV48HrX7CZyjHwdhp1f3rCQYK9P6wpJy4sdmzZyZoycRy
	4v2pGc9E4TRMuNqntVIMJ0GWHczs=
X-Google-Smtp-Source: AGHT+IG49CF7WhQZ87/VBmjtQFbVERL2rpkIsMgd7aYOztjgT0HKRzqzxOGBbKp1dCnVBrBbx7oAsUgIjRXIjMeChfU=
X-Received: by 2002:a17:906:488:b0:a59:ae57:1663 with SMTP id
 a640c23a62f3a-a59fb955523mr7210766b.19.1715102241777; Tue, 07 May 2024
 10:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-3-johan+linaro@kernel.org> <ZjknxSsyo20b5_Tm@surfacebook.localdomain>
 <ZjpCL_NQD7X3hasO@hovoldconsulting.com>
In-Reply-To: <ZjpCL_NQD7X3hasO@hovoldconsulting.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 7 May 2024 20:16:45 +0300
Message-ID: <CAHp75Vf0raEoVmvRKNxDQ7wdAOtwWYp_fQ1m8WBdnWEFGFOrYA@mail.gmail.com>
Subject: Re: [PATCH 02/13] mfd: pm8008: fix regmap irq chip initialisation
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 6:01=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
> On Mon, May 06, 2024 at 09:56:05PM +0300, Andy Shevchenko wrote:
> > Mon, May 06, 2024 at 05:08:19PM +0200, Johan Hovold kirjoitti:
> > > The regmap irq array is potentially shared between multiple PMICs and

...

> > > -                   dev_err(dev, "Failed to probe irq periphs: %d\n",=
 rc);
> > > +                   dev_err(dev, "failed to add IRQ chip: %d\n", rc);
> >
> > dev_err_probe(...); ?
>
> This function won't return -EPROBE_DEFER,

This is not an argument for a long time (since documentation of
dev_err_probe() had been amended to encourage its use for any error
cases in probe).

> and that would be a separate
> change in any case.

Sure, but why to add a technical debt? Perhaps a precursor cleanup patch?

--=20
With Best Regards,
Andy Shevchenko

