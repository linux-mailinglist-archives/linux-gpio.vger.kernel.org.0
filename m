Return-Path: <linux-gpio+bounces-14079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6091E9F9373
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 14:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E98B16A3B5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3688215713;
	Fri, 20 Dec 2024 13:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PwEHSxbQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADA52156E2
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702210; cv=none; b=hSiLQhvIglZq1rzSL/Gml4MW4qjlcpcocdQ94KOVDwCRybeTIPmZLp6J2OHplAuY322wzK9YeQtyCzXkg2v86oI/kZhTCd6uI5i5v+YiB/cibx9GvxmzOaEYAKtRpb2ZoVr4ad7dzczDF9sZHUwUNNRTr8sU+aewjOq5Liy0IuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702210; c=relaxed/simple;
	bh=EiLNvhF+p/gRrf+ZOc4n4bTdepkoH8gI+80apVv57UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPMUzU/AzsgWr8eQclpoNFnjzt2tTkftkr1MIKw5lD2oxRM4tZmDcDv8Cttn07piNQ51dJUGAZGT0tIY7dd2hV42rsVKXkzfVAAFztJuMNY3JHwx2u2WP8hfSy7jsRF2H3h1UfzxGSr//xPlbgy+KUjvC4hc9mVORrBgE+7LSgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PwEHSxbQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso1939860e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 05:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702207; x=1735307007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEdZ5RPSrj6yXpJZhTBXGFDlBtr0FIL98ttp1DDesfw=;
        b=PwEHSxbQI86FcGNexRq6KGNomEjATZU15oyYIjQbMFoHO/c2xPnO+OHAtKhLzMDG0r
         gvy1ivhF/rS+2Qa0RmUUkkZzRSwAI6GVh9oPL+TjjSm8ycAQMwWEaFtQsEPew2JxtVyj
         0JnaoihehRiIen020MqPVdgpv8LoVAGoOmAqv3p1gCnwO1g8smkzzVUq5RwJATvU2HQG
         aGd+uyKgSBn+62kjpPVgEu+vvmp9h9gNi9kQ4YYfG22ipd92ScdphMsJg0KuGetSSAWf
         hGA/akkcyx9kmCcu/7RQDG0EkFC+l/r+UE1CV0j36IApYV6mSlKynQV6vKEOS6n7p6fL
         +b4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702207; x=1735307007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEdZ5RPSrj6yXpJZhTBXGFDlBtr0FIL98ttp1DDesfw=;
        b=KlOSdgSRY7/XTDAsoX4nkTlk+ROQH4CqAtTnBrXYmA1CmYS7FKPUBks/Vp84QFX5Yg
         Vsaylcq3z9pVvvWn7cgSjDZZw06y1+5VhrsigDMaxkyIKB9xeCW2q68QbNpcWhuFs5gV
         kQaXwckkUTlpceaSahMSlmjKjYXr+FWtUJfjPb2TLe4V/Fy/KQWjoQETpiFtuiTZpbV9
         dcTy/RLD0rLjLgppDaBQRG9d/fL8Ho8ZvZZjuvr/f8AzjeLAWrkBJoxxZT8Fs63ecflH
         6idT2mSZYUG+ueumgaWNbL2Q4l1IGGM3dutLBfd0nTqcD5YgX1Cklfyj1Kl5HtJY4JOc
         2wEA==
X-Forwarded-Encrypted: i=1; AJvYcCUgLFTF23P68z+KXK4A4sl65K6EQS9VakbPBYNptg9k/8XQEMwxV0f8g49mnU6+XhMr4EBzlNmk7i/p@vger.kernel.org
X-Gm-Message-State: AOJu0Yx676i0p1HwmUsNLHNnhe0pXGj4Id5Ou/XD4KiZNq5U58Ssq7Kn
	0xbuyIx82Gy9kKprOqJd2J9fX5lRE0dp/wWZygqLbmY/7VQ/EajXS3+Cfpp7Hb1C4WKPjAsRLuK
	uu5ecguhzwhkOLI4cOoutMRAgjVwCvlSTYTMAEigSy8NRrzhQlbZ/Cw==
X-Gm-Gg: ASbGncusfu42iU5S8CH2CDz8hCeWr8wgLmT5wBpztJggo0g4rZZplXsXHyzJr1A3n0P
	wLPEfbH1EFX7n0wlEUZuk5nZiw1Ne90W4BlDqCw==
X-Google-Smtp-Source: AGHT+IF3s05v/3dHu4MNM5fgrBMasEat/+jpfkQcN/ypKfTSnxF4KeFtLQaYiuvh+AowCyTVG/nHh41rXZykXhVk580=
X-Received: by 2002:a05:6512:318d:b0:542:2192:3eb6 with SMTP id
 2adb3069b0e04-5422956bdb6mr873694e87.52.1734702206865; Fri, 20 Dec 2024
 05:43:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com>
 <a7b98f12da735f735b33200f6324360fc380e6d0.1733739697.git.matthias.schiffer@ew.tq-group.com>
 <CACRpkdbRdT1=30DNyn_=7rfqsnppfbdBr5QXCfWyM0f+FzLjgw@mail.gmail.com> <dc83bbd1cd960f8a5daa7ad687f419609f5e14b9.camel@ew.tq-group.com>
In-Reply-To: <dc83bbd1cd960f8a5daa7ad687f419609f5e14b9.camel@ew.tq-group.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 14:43:15 +0100
Message-ID: <CACRpkdar+8qS6r30WwCJBjVuqc16xnruVQa3y1m1rKAnJbcN7Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: tqmx86: introduce tqmx86_gpio_clrsetbits() helper
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux@ew.tq-group.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 4:11=E2=80=AFPM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:

> - I introduced a tqmx86_gpio_read() wrapper around regmap_read() to avoid
>   dealing with the indirect value argument all the time for an operation =
that
>   can't actually fail
> - I also kept the tqmx86_gpio_write() for symmetry (just wrapping regmap_=
write)

I don't see why we can't add
unsigned in regmap_read_cantfail()
that always just return the value if this is a common problem for people us=
ing
regmap MMIO specifically? Could perhaps be restricted to mmio.

Maybe Mark has objections.

> - I introduced a tqmx86_gpio_clrsetbits() wrapper around regmap_update_bi=
ts()
>   (having arguments for set and clear was more convenient than mask and v=
alue
>    in a few places)

Isn't that what regmap fields are for?
regmap_field_set_bits()
regmap_field_clear_bits()
...
but I can see why that would feel overdesigned, it's not like I don't get
the point.

> - I was still handling locking outside of regmap because we sometimes wan=
t to
>   protect a whole sequence of accesses or other driver state

So reg_sequence cannot be used in this case? (Other driver state seems
to imply that.)

> - The TQMx86 GPIO controller has a write-only and a read-only register at=
 the
>   same address, which I understand not to be supported well by regmap (at=
 least
>   if you also want to use a regcache)

Hehe yeah that is a first! I never saw that before.

Thanks for considering anyway, I can live without regmap.

Yours,
Linus Walleij

