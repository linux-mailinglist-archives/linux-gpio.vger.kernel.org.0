Return-Path: <linux-gpio+bounces-25386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF39B403E8
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 15:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DF164E3A88
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 13:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE082FB975;
	Tue,  2 Sep 2025 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eJsfRfy7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463F12E7BB1
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819955; cv=none; b=nnqawbU+tnt9Q83CZrC2gpOJ/Gx0UYpDxVhqkB5IMTTO/FMq85fj3VQX6a93brM5yihkYHnQTZsai7QzrYq1uCzXRQ86EVm95KbCDyKfiLFO4CHSCim93gczq2tKAoUZL8hIWLfBtkYRlBsmy2qYxLzo7/O7rFfBJHdrpKwXYJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819955; c=relaxed/simple;
	bh=jQHix6PgeTZogNqwgwBs7BQIhf8j8t/QOXmjjj2gpJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJDd30y8cozbMUUWZIYauBArlkKjo8lH75tghzfD218nBUDnk7ASIcaCpj4D8yreh9j6IguddZnQWSWHp9hvIElz5XYTjbufd4XYgikAh8zLtTJwFo+LFP/ZoSaWl5aEx2L+rgicRHUk0eg4A62uUHXFZi7y2gNEfU+swE3XiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eJsfRfy7; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f646b1db8so5114164e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819951; x=1757424751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnoH1+ZsxBYCzbeJtuEiwBsgC/lAs0DmEqE9uy46sWE=;
        b=eJsfRfy7h3BUAwuHZFdWnQ1XEmgUS4W4ioUSft3a0cM8k2qYL8mnw++Yr14fOcTq5Z
         gixFnvABxwl6FgdLjksEE4Kg0Gh92ca8rsuwMIUUVG7fzEblgv+WSbY0wstNwGC8Flof
         bssAp/xtUDvgSf3+Y9lXKsjqPFEg6ivWWkUauDEyuqkgZQLWaFiNwgXh3HGwmuhQQsoa
         FrnqK9Y0F8TH83mGYh2r4PtLPfX6vAzBD52TpDzQ1HVUpOPaT3k6FjNBobTNwKNE6Wbg
         NXDke4iEvQag+5cZTPSyuU7xk7pj21WsXgVlJd8QTmu6fVV/X1dAS0RMBMIEwNg8y3Sb
         sRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819951; x=1757424751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnoH1+ZsxBYCzbeJtuEiwBsgC/lAs0DmEqE9uy46sWE=;
        b=upWPvNUJAhQPAuFB1+n2g/JwfnN5uzwHsJGUqUce4ZPIXPjBjJx1DuYURHZ9ulv/P3
         RRJ9A7lnh9cGidLMgZ3LHSCxitnmLmyU/j8e8L3SgGi5AsU4ThsY1c9iles1AJC4uXak
         JkolgQGjpCEyOfIJTwx7CfeKOM7Wh+BsFVQMPIIEfPk3Js8nGS6UcP92iuZbadcvhwoZ
         wzIuj/jc5WK6DqbwLBBqBmlCc6W6lh/XA4WNO9SxjDgARKZT2TJggtJ26KCNMHEl2hUT
         nPK0HpdwtsMV53V+1TkHyWqzLWn7CkGpeylQIt040570qPRQ+5Ulug0G1qrEsV44dYtc
         V2/w==
X-Forwarded-Encrypted: i=1; AJvYcCVUIzdJ2D/EyHRn5JpTbydvtBQsJ2Pax0RHlJW7R/YWZfn7OoPSH7whvc1pd3RI0eY0a0APqjKE2w+9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6DcagmCqB+58f2Py0JjvycVTMAkcN0p26vxDj/Kw9kCMD6Dv
	NWBTLqkubGC7vM15iJpGyThFZkXKOpyKMS2gyBRm3isZdPMMUmQ/tZuRBuKfSvOYPAmzsbWE4R8
	KbeQoimsYxKm4gXRPkqtWG2OQIQYFy3zT9pBiE/8vQA==
X-Gm-Gg: ASbGncvItPqfBuJktw0ZoW9Pd3UhKflGhIGb3W158mQ1QD8Pu7VUQdPHlaPCEs7Rua/
	VMoBwbKfppbY6PYobC9UX/VJ/7g4mu3eY1/rQivEwzq+ooNgpgrKpefUNZyUZMuPv89JPrXboNn
	CQ7jrGK6X+ckStEwFfSfNKW7MTBKQtQTGsQpncu1fE2NIrBrvbIR11QP327vcI+0dWWqA43M7Rv
	Dj0D4MNH0USsPlzLb7/Rwa/tDh08GPCXLY59DA=
X-Google-Smtp-Source: AGHT+IHbC8qI4AC5+0YZNljCnPe19ZYxRaps+B2CcXld1o2mGtDbXzoveQoI0IeEbDNxVlYlEUG/+tn7nGWqsyLzmeE=
X-Received: by 2002:a05:6512:3ca9:b0:55f:55ad:2263 with SMTP id
 2adb3069b0e04-55f708b6c5bmr4286185e87.16.1756819949961; Tue, 02 Sep 2025
 06:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org> <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
In-Reply-To: <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:32:18 +0200
X-Gm-Features: Ac12FXySKFnql5rdsxfRBFF-2EejY2a696V_6zV_jaWq_9WtZl4uQNoHEj4w7YY
Message-ID: <CAMRc=Mdnp8T46Gi_xZintgc9AZGCGiRPYc9mR32Xwodxy7DLqw@mail.gmail.com>
Subject: Re: [PATCH v7 12/16] pinctrl: qcom: use generic pin function helpers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:21PM +0200, Bartosz Golaszewski wrote:
> >
> > With the pinmux core no longer duplicating memory used to store the
> > struct pinfunction objects in .rodata, we can now use the existing
> > infrastructure for storing and looking up pin functions in qualcomm
> > drivers. Remove hand-crafted callbacks.
>
> ...
>
> > +     for (i =3D 0; i < soc_data->nfunctions; i++) {
> > +             func =3D &soc_data->functions[i];
> > +
> > +             ret =3D pinmux_generic_add_pinfunction(pctrl->pctrl, func=
, NULL);
> > +             if (ret < 0)
>
> Why not simply
>
>                 if (ret)
>
> > +                     return ret;
> > +     }

Because it returns a possibly positive selector number.

Bart

