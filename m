Return-Path: <linux-gpio+bounces-23898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF89CB160BF
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 14:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3B1D3BB17C
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 12:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D005298994;
	Wed, 30 Jul 2025 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N/kuqWZ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7CE295D91
	for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880033; cv=none; b=HTH1m2mU5zmnAewHiwwVQRr19YcyW9sDhBfCc2HqElGKik9hCtISGYvdapzXFdkPPCAc/gw6RgiFTMxcrT5UsL537yAu+N2ONSEa5XnkTn7lhVsjH0TKdSdgfGbrYAy6JLSkDKyiqcyzMzeGs7W8GwdrPkWDOCUx5UcHnSDCdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880033; c=relaxed/simple;
	bh=RNeM7UB4fAERU2LPOJtuWeYJSG/9TTk9Yot9abhDF6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeWWh7lYNl/0gUctfN5l4O+yQW7pHWrw6NDi45ovfAHb3hg4goN0xtZ2l5zfUTPt9zBaPfa/qJHEfVNTdGLbV8bLCHLxP/leJAcFCVWenkL6gudcGgXNhsdoVCX6QIdQIK2icXRcOh85qfiDg6ULgRYCXjOqDDpkG4Ty6KWm2sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N/kuqWZ+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55516abe02cso1082459e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 05:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753880029; x=1754484829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=;
        b=N/kuqWZ+n2E10szoUZ24/6F4JuCqCRJgIiSJ+13vx4RL08ntqRjKnWOUv3CReInxOU
         RHq+XhAf2t/ltRbFuhsbgN6TO4nPzRBRVuYk9xYDQMSzjwBn4vRQklSpSF0n4x13/Akp
         HltCRODxOSbnP3MX3m0jV2K0dfXv6tdEODM+V8GbBhMQAjLnJ4mC448itgqV7a32K2zG
         6huj2nFU0UyK5TCqYfapyzNciidjWGBZEhjUPUxsGrUibrXSt1YcgTE/WVtg8c93RDxU
         cNIJuMLyavB5KXHA8bfnDrlGWvHGd/mWQHprk+vfnlwGskSesPW+AbY6GuMT3nAC2BlH
         1dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880029; x=1754484829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=;
        b=FznKFLW2pJe+BlE1AH0w5wzKOTXd27Tc3jC4vcDwq2coos/fo7DHhK4PK3u2rbw6bp
         552DjtXrffv5tLEHjbAuuwp808TNJkup7tF2SfXd2sDFny7+TkRPYoDYdtjJ+ahak12G
         QZukoVCQy+3EMIb4y3QrkPmyaYI/OEgNguibLxA0LCt1aejPX9H6FlcR37wKn+sJY8rL
         xV1q7BbN8fn5+iBHN8kRvVXbD57xylUf60zzfhqoYatiYYziDDsZWt/JQerfCs9DbGxs
         jALhnaa+0GZ0P50oOB/IrXFPFjj4gfW5Mcy1NifcNTrO262/649C4zThFYZAO1cq2kY2
         0sng==
X-Forwarded-Encrypted: i=1; AJvYcCWDKNK35NFARw/37hilWhlpASGVY2DUTlcECxGRPRMpgZ+nv5kbshEwDzfPaRXaIIqAoUT7tSteKpkf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy75+B8RECNcvkns1DF+ph5rGD2yoNpbnq4XunLnZS7poC21n4X
	QTPSjdUl0R1N+9z3M2xbU+Pd/htQzKeB5dPkx2h6CjCQxYZ0zEQnBahpFfY7WeRtgUx0pDzVFWJ
	ZiFQ9USGbI5ZGDX7nyO7Ndowu64eWzuHig5Uxv5PZqQ==
X-Gm-Gg: ASbGncuxXqYrqaP6E3e5GO2MpttW82MZyWha6fosbMrHtnUuDcB8wRKPJ2S+TKXkBvX
	+UZTtKgM04PvF8kLWBIYqI9Tbn+1fSFT55aX8ka+Pt2idhzWQw4XH8eatkzm5cttfEtw2i3xOKS
	DF948hG4QG4+sckUrQJ1WYzviY/69Tlfq/0AlYqcbzg/RRTHP/mKu67FttowFfXrksoI48F+9iu
	SziDdDv51EyYO5R/v9ZRq8jvy9CsfAdrxxyCHI=
X-Google-Smtp-Source: AGHT+IGSuyPnAInz8gQT37fKK4pgrT4+RIAYI9IrKjK2MWPd45oP6K0zUhD/GSonCiRI3dzBbJ8n7cWJZ+qNt54xgoU=
X-Received: by 2002:a05:6512:ba1:b0:55b:83cf:b260 with SMTP id
 2adb3069b0e04-55b83cfb693mr305928e87.11.1753880028944; Wed, 30 Jul 2025
 05:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com> <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
In-Reply-To: <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 14:53:37 +0200
X-Gm-Features: Ac12FXya2mYA_HSI46S7KktzTvTwdWuT-o4vBrrr3z0vtr46fp0gRnU_ZqynDBk
Message-ID: <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 2:50=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > >  struct pinfunction {
> > > >         const char *name;
> > > >         const char * const *groups;
> > > >         size_t ngroups;
> > > > +       unsigned long flags;
> > >
> > > Not sure we need this. If the function is GPIO, pin control already
> > > knows about this. The pin muxing has gpio request / release callbacks
> > > that change the state. Why do we need an additional flag(s)?
> > >
> >
> > I'm not following, how does the pin controller know that the function
> > is GPIO exactly, other than by the bit set in this field?
>
> AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> of this information.
>

No, that's not at all what this series does... gpio_owner is the
consumer label of a pin used by the GPIOLIB framework. The flag I'm
introducing it telling the pinctrl core - before GPIOLIB is ever
involved - that *this pin can be requested as a GPIO by GPIOLIB*. It's
the other way around - without knowing this, for strict pinmuxers,
GPIOLIB would never be able to request this pin if it was muxed to a
function (even if the function is called "GPIO").

Bart

