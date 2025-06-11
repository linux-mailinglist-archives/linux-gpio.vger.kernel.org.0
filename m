Return-Path: <linux-gpio+bounces-21330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 207ADAD4E0C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2E31899EF7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456942356C4;
	Wed, 11 Jun 2025 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDRZqO4C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3068F21D5BB
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629724; cv=none; b=aQuaQ/gP4DhbSWVK4F3cdPemW1vu5r8OgvgqTy4eH+zDd4BE/iWViUuHBtPpcFn3N6oCU7NquI/W7lVeC2jT+TWDYbtNQIdVAOHqD7IJuy5upsdR4G3qDjzOZb3I2DjGPTn2nl83ThppQnNCpl0Yas3nE4/7D2jkDhiPf94PzWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629724; c=relaxed/simple;
	bh=HrK+fjXuNMTzaspbfpBJkL5+ySGJqLECAndyoYw4+FI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZ5uOWAberhHeDDqCxC3I8wVnqMW3ZUQJXas5svBO5pC6LUNEpyKBx99ClEHwfilWhSiXTR929qerZOBQKH5JDNty0+s3FMZLbAHmxThUzIZOwwxfKCTzvPs8tkzGvZJHyX+GZ7OAaGjW0txUBsav5ASlg1KcLKPkXUH6Nuocbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDRZqO4C; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54998f865b8so5986363e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629720; x=1750234520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrK+fjXuNMTzaspbfpBJkL5+ySGJqLECAndyoYw4+FI=;
        b=DDRZqO4CiP6+iw1QjA/n0pien15XMCJPfU44/gPw8Cj+73JB5xUv3TwKqJaOhDaQZF
         KNctPy5+8y1VY9cEc+dHU975CWNYfm+VW8DQhGpkRGa9byfvvhOM/3WX3xebbslreFTx
         pShuwY2ABRucJj06pDmYTOViQbGna9sAl7Dlz8fFQqdk4ljeS2t3hkg3+au+7Hjatfg2
         GRdey2xlvQANzXzG4GTvMdHiC2AlkqIB+rMxJFx0I8DWWMor0jqrGwGlcr2QlF9vjU/t
         s6uh9uxtjK5HSFPrJyn4ah3iu56IVIfUANCjD2XsZ2QX2bGxf6YR4hy4LvVkcoa7zQXg
         9v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629720; x=1750234520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrK+fjXuNMTzaspbfpBJkL5+ySGJqLECAndyoYw4+FI=;
        b=mOHyZqPXRtikzZYC13BEbTnwtGauszPJA0wtZqkIjKU1z+HUpYNgWYM5eNoEf7Akil
         pafQoIl9iXk098RLs5DKe5BCkjQVHDw9hGVgBsBFiH/kXOF+bHfxAHOYgJAQpAIMdSuT
         0APqwgTijqqkxL+RbsO5o1Aywp2rakIf41TQ8HWazBYYYqPEY6fGRAI0iu197c86zp9I
         g7SmTXLKAPXv58DwU4HgnnFoqjPTn+Cd6OMuvpkhgHAThrrnWXZFDOFp1ia9dxfqxSY9
         a2ZuCR1IlNCy8LJamzr5Prx5wl2l2zk4guumwDb3WiLSK56jn+9f131WQQihPG1gy1q/
         ehkg==
X-Forwarded-Encrypted: i=1; AJvYcCUI67D5NpfN96asIfU4tsR2mRVwwWwQh1RUiwgg4In+roJZUu2Xt7sjlUWwjV0gmGsQct1VT2BAB4jM@vger.kernel.org
X-Gm-Message-State: AOJu0YyhPpdL5ybVMC3/WxoKupLXBU+GNTi+IzKT5s3uTWtbKeKPKFPk
	m0/lm5d8qnrVYUqsV8BSbClZjqqNbTRAvgS2Sn6Fag/zIexTNI0Io5CpbTVPJFjHWnZHl91Of4K
	RB4bbhnsOi58LFTGPebjIcyR5DaNteirwQExs76SwbQ==
X-Gm-Gg: ASbGncuslCmEiAXekYFsHYW+XncDAgW774uT6zCwYC9/XsueiwHrlyyciv89aa/tbhA
	0pGcLRFIiSuT0Ci1VW0TKvf/KvBtDiaaxtDDwNzMvdUr3aLgbo8gmNveoanfRATjbfVajSx0Uby
	CzExgF4zMF8dIQQvX9YqbTNieONlMhtb7qxV0aYtdwfLU=
X-Google-Smtp-Source: AGHT+IGR0Y/93VVyrH8AzUrFWp70nlSDqNruUFMm4UV7jm7BjftROqjtX30zSjJ4NBa9AEQATxZYP0Rwq1AxFIJy4b8=
X-Received: by 2002:a05:6512:3a95:b0:553:5d4a:1cdb with SMTP id
 2adb3069b0e04-5539c0ba692mr751444e87.5.1749629720259; Wed, 11 Jun 2025
 01:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-1-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-1-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:15:08 +0200
X-Gm-Features: AX0GCFt1XNmDQpiNmSvIlyyQmR0jxybKOgH-Yc_e-uNH-Qplwmkg_68xB-OSgLk
Message-ID: <CACRpkdY4p5wn==AWupxH-=j9a8RDZuR0+0UAVWkpPgJy6OdgWQ@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 01/15] Documentation: gpio: undocument removed behavior
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Since commit 700cdf7ed00f ("gpio: sysfs: make the sysfs export behavior
> consistent"), named GPIO lines are no longer exported in sysfs as links
> named after the them. Drop the misleading bit from the ABI docs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

