Return-Path: <linux-gpio+bounces-6909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 830468D4771
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2379A1F2353A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 08:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679F3143746;
	Thu, 30 May 2024 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHxAtcWw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D8B6F313;
	Thu, 30 May 2024 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058812; cv=none; b=abtpfXGM1vWa9UrizL0hEH8Cy69SgKhwuwaNV+aq4DOKCe7R1SywS6Q+lR7DWZhW4cSn5c+MYa1JWi+ueE+Uuj9kek7i7yI4jenlaUQCBUjQv0Sl9RTjAbALZBuQAaEPH6BIXuJo6OH3uPSnmzappziDdIPWfko3VivKgn6ZsnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058812; c=relaxed/simple;
	bh=dbK4t3fcfO5MCPpp7yG+qUDyTmsM+unfwZsYS1LnJQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ebh/jTk+JG9pSaD+gEONV/1kxjynBVkfG8/9QPd+RiAWTrcrm5exhYNQMB9NknQEY0keZ5puX+vUS6/qEFwq0L3AJ71JpGNN430ARJmcMYNTol+5HGZdoW1T1e3pDHBQi1efz4M/rSbsaV3irbeftOXLfsI9lFjqS0p9Lk5KQLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHxAtcWw; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5785eab8d5dso623232a12.3;
        Thu, 30 May 2024 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717058809; x=1717663609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bhN+9CMSJhPBVcatrdGXA5dYbFmER5HACIQLCV17l8=;
        b=mHxAtcWwObhM9gv3Q/7MiK+o2wyyJiTaA0qpyyOoBGbeph0T3EaFZA7rARbMjNmfO1
         03yxVyJhCMJUzKyC8PYPtFiF3snxPNGmL4fLY8fYFnBUWn1CIzkVYMPp3wxG6iBix8JO
         b43kjuowOtGV18HI41r6htSvwZn2l/gH4a5aIxlJR9cUFnxywMIdzj8e84FYKQgbqVgR
         ix6JLlG+GzMmwLYrMrbBJmsNVZ4LbWq6C15SBPPA7xG6z9ubXYVQCJAXOkjReFfbnx5y
         CyfhozYjbX71U/tsaZaXWTPuiQqYXEOm0rDmwcTiGmj36uh+27n+2LV6/8hltmjOOZGZ
         q+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058809; x=1717663609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bhN+9CMSJhPBVcatrdGXA5dYbFmER5HACIQLCV17l8=;
        b=AJL0GzP3PT6nmuRNzwaHvXq0/D1OtzSHyr4ET2p7B9uQJrgr55dHSflUq2JP8p4ar0
         DG2RUwS5HIn3e2dfYDzV3pIkfVyjQ/0xC/Fzt4sUGV91Udk1YaNqMMoZ9bttea7Cjr1u
         Uq+wxTmfj8xTqQuB4Sqpt+WmfBJDM3ZADwLc470YNmyy4yKLwFlUlqk6jyBW+pIM+iZN
         Hw7Dn8DDTABzCy+ucNBcEH82fErlbqoTBd87RQNTgQz1A+EdDdFzSGQf+Teiy0M92rP0
         0bGbjy6+46umunqXrG1L/njDqiQn8H1CFV2IQUiMqEjwvkAYCy7z5BbL3BOEEc3lSCSr
         q+zg==
X-Forwarded-Encrypted: i=1; AJvYcCVh6YDp8YKcu2CPmhU6nIsYKaWILTT4BkNFc/DuOFel5LJfa/lZir0nJScixxa5I3Ag9vVNWhsEjMBxW3me6EZ/Ss5JmZM/yPBV9kjxD4G+fsra0HLfyuz9Nz8N78q3pCTT7Nupyo4yfDeEMBcFRauVaGdQ4vQZKQknMZ5jnF2MiND+C2DZ1MRxEyYNvKjAfRjRVaqtEOL4c3Rfjyr69TI5T1T4
X-Gm-Message-State: AOJu0YwfboMSX5gzVegiJSqpbSSw6wPhF2bIX7x6SkPwqyMyXE4oiGhe
	dWJlmi01T6xv1O64iqg1qG9ddv7m4wjYvj/9wK6JXJ//xkqJOxl6QNLLqupt61iUxUKMmEhU5nA
	LteExpvDkQzOk3cRlJHYObEiRzEM=
X-Google-Smtp-Source: AGHT+IGhZ222SnMQhbyry0HvJsj0ueGZeaBYgylnVGd8CghV9Z2CLJAbhqXu1kJEO+fB5jS3vjmgtGOM8H/CKvZBbsU=
X-Received: by 2002:a17:906:d92:b0:a59:a64c:9a26 with SMTP id
 a640c23a62f3a-a65e8e507d8mr83036566b.23.1717058808692; Thu, 30 May 2024
 01:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-14-johan+linaro@kernel.org> <CAHp75VcC5t1FynFeHGd+57=AeXKE8u0uduzOfozsG3MEzCPpDQ@mail.gmail.com>
 <Zlg1bGOs3V3TkHck@hovoldconsulting.com>
In-Reply-To: <Zlg1bGOs3V3TkHck@hovoldconsulting.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 11:46:12 +0300
Message-ID: <CAHp75VeiVSxJwjxXyNueinudOfj-WHZEUg32VBTW4PfCfB9Q+g@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] regulator: add pm8008 pmic regulator driver
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 11:14=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
> On Wed, May 29, 2024 at 11:02:57PM +0300, Andy Shevchenko wrote:
> > On Wed, May 29, 2024 at 7:30=E2=80=AFPM Johan Hovold <johan+linaro@kern=
el.org> wrote:

...

> > > +#include <linux/array_size.h>
> > > +#include <linux/bits.h>
> > > +#include <linux/device.h>
> > > +#include <linux/math.h>
> > > +#include <linux/module.h>
> >
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/driver.h>
> >
> > + types.h
>
> This one is already pulled in indirectly and I'm not going to respin for
> this.
>
> > + asm/byteorder.h
>
> Already explicitly included in the code you left out.

Is there any guarantee it will be like this? I don't think so. That's
why there is an IWYU principle to give more flexibility of reshuffling
the (core) headers. And I believe you know that we have way too far
dependency hell in the headers in the kernel. Have you seen what Ingo
tried to do and what the potential achievements are?

...

> > > +               rdev =3D devm_regulator_register(dev, desc, &config);
> > > +               if (IS_ERR(rdev)) {
> > > +                       ret =3D PTR_ERR(rdev);
> > > +                       dev_err(dev, "failed to register regulator %s=
: %d\n",
> > > +                                       desc->name, ret);
> > > +                       return ret;
> >
> > It's possible to use
> >
> >   return dev_err_probe(...);
> >
> > even for non-probe functions.

(this should be "non-probe deferred functions")

> This is a probe function(), but as I've told you repeatedly I'm not
> going to use dev_err_probe() here.

Yeah, I got it, some developers are leaving in the previous decades to
make code very verbose for no benefit, no problem.

--=20
With Best Regards,
Andy Shevchenko

