Return-Path: <linux-gpio+bounces-6207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2289C8BEA6F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 19:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBA3A1F25791
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 17:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A06E16C45B;
	Tue,  7 May 2024 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJLpzM2x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9320E2576E;
	Tue,  7 May 2024 17:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715102594; cv=none; b=e+6oFmDvR9dBTxVmcBGAtVEmcwSLmLP4Pl6lJtV6GXWswO85lpdcWqyN//zEWeF6Dk1KA4qZaFfjh1zGddxM9K9nPYOKvmpourOxSGxyJWFKLgoXc4dC1rmgdPm63kcKROlRj7UIfcrRT6V1Q4UeoJA+3alI0dg4p3KuN+1Lm2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715102594; c=relaxed/simple;
	bh=3F87m22ds3DtRntLOJQ7ftRIl7lcVxL3MvLrxRHABQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=et9bUZm4KKSZP0Tuo7RzkhO6fGtumSX8pYF6NYA6kPnRlD29137gBNRRCw9d0tjGRkhX2mOWBM+txocWVxQflltD0tfYK+4/bdGAuyQbsENpH4cKRIbp75yW+698y8ZAJJ4Ph9aimWEbZ5PxZr0kSgrWDgDnqs+ZQ68i8CQVatA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJLpzM2x; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a59c5c9c6aeso667351066b.2;
        Tue, 07 May 2024 10:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715102591; x=1715707391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtpEy3EJrN6MtVyzu+KwApVVoDL/88fc8jtoTZBIjpE=;
        b=RJLpzM2xiBnVBzkMorajdYftDzO7BBQtsx7+ijGyaYqPbmud6X0v7+O4yj7f4vVrod
         eZTzEJBlGQsh/5+hKQhP2vkFUZDDobheT9cadF5suv07A7PfLSK+eWIOcIuVq8EcMPsH
         stH8/86Xenz9J8FT7e00xkCrvqIFur/sY+25BtX0VkYivv4AmT0ki1S7oqpXV065wCIS
         +DHcfFKb7CNzRYPEgzdISuChgvQBbt3aC7NefyHQONTwQTdEuyuiTwbnmtNhPsF4SLzU
         oOdjwa5q72r698atZcqLKSIRaEkPc/fxLbPPVyrjk2CGVg3RZsEd7sFVrKCX4lrCazoF
         DqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715102591; x=1715707391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtpEy3EJrN6MtVyzu+KwApVVoDL/88fc8jtoTZBIjpE=;
        b=r/5HXM+GpEfaAF4Vbj7eCkBmhOE5RerZcdFhPlSFEAprOfQDYi1GlEEVqkCYgWH3VD
         xc2HdQaTn+3oHXTIKlKMU3ow1jAgIejVK4T/Ns5pugLECNRL29EwNRdDnfqWCJCKWOMO
         fh5Cl4Yf6eI+DF5F7LO/axHlfVQKdMAsXrXXKdyYz6VjjF21yNAxU0ARB8NEsWwK4Jm8
         far2yfP0FoYN+mDbJU4wd/hAw4DJ+u0Gq/MhyTKET1cV/KUT0cGA7GgCmnc+ToPhwjAT
         MGF8G1ZUqG/kZLLkruoZ9smsiQ3ikw5xsBi3j1L22XljFGjiLMhhEzyo5lHNsi8HKd3q
         6PbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo21MPbX0/6CwJ0NJbbQUtq2jdwZeZCROeCosGSv57S8x6lmg8RvD3FljtWPVmsrYZgy70zDLuNXZh7UqGe1WqMfirzIdzgDac6yduCz+g/pmSSyBsRyjXaJjq/2enWnMjPuhpDghzTuA7hdpnvGSNRNufwAX+vQFzMFVO55L5Aku5La3EyaC1Op4jXxVHnq6/+QyEESRgqovwc4ECTUGqa/UC
X-Gm-Message-State: AOJu0YyF/Uj6KLHMKKZwgmomG7RbKDVx0olpJ3JRGrEg/KqbdR3X91Fn
	A2KQ8pNWIzM56hmlY2gaA7f2pAZkYMKWyqO76CU1wEa7TszBxjZw1JerCvIFTBj4k27BqU1hWeK
	4FinNjy9bjrmsuarFIuygVNqeYIFxGUrJubc=
X-Google-Smtp-Source: AGHT+IGXdccpEUeGZ+Ks9kMHiGVxDjhaCsFZ34YEEfFp7COih3bNCh1tz4j4I0IdvGWomksccuVx14Kw2lbIbTh6psg=
X-Received: by 2002:a17:906:4c58:b0:a59:9b64:216e with SMTP id
 a640c23a62f3a-a59fb96a001mr7247866b.46.1715102590903; Tue, 07 May 2024
 10:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org> <Zjkq_nWyvc6bUtiu@surfacebook.localdomain>
 <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
In-Reply-To: <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 7 May 2024 20:22:34 +0300
Message-ID: <CAHp75VdUFMvkj-r76H7GFZdpcoh_nb8v6CBj4wBHztNhiaWULQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
To: Johan Hovold <johan@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Tue, May 7, 2024 at 6:44=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
> On Mon, May 06, 2024 at 10:09:50PM +0300, Andy Shevchenko wrote:
> > Mon, May 06, 2024 at 05:08:29PM +0200, Johan Hovold kirjoitti:

...

> > > [ johan: rework probe to match new binding, amend commit message and
> > >          Kconfig entry]
> >
> > Wouldn't be better on one line?
>
> Now you're really nit picking. ;) I think I prefer to stay within 72
> columns.

Not really. The tag block is special and the format is rather one
entry per line. This might break some scriptings.

...

> > > +#include <linux/kernel.h>
> >
> > What is this header for?
>
> Probably the ones that are not explicitly included.

Please, remove it, it's a mess nowadays and most of what you need is
available via other headers.

...

> >                       return dev_err_probe(...);
>
> Nah, regmap won't trigger a probe deferral.

And it doesn't matter. What we gain with dev_err_probe() is:
- special handling of deferred probe
- unified format of messages in ->probe() stage

The second one is encouraged.

...

> > > +MODULE_ALIAS("platform:qcom-pm8008-regulator");
> >
> > Use ID table instead.
>
> No, the driver is not using an id-table for matching so the alias is
> needed for module auto-loading.

Then create one. Added Krzysztof for that. (He is working on dropping
MODULE_ALIAS() in cases like this one)

--=20
With Best Regards,
Andy Shevchenko

