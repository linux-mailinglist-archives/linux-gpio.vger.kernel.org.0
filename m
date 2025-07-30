Return-Path: <linux-gpio+bounces-23895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71543B15D84
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 11:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D44195659EA
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 09:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C22275B1D;
	Wed, 30 Jul 2025 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y6v1Y+rP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE7F26E71A
	for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869294; cv=none; b=d1tcVoU2Tw4GfSbHw6au6IKN5RhDL1DRAOkWJ3t6SFF9hovbKpUfr3XJyVqAPwkgrj7Euk8FOV6eiOk6BJr97VCp8uHk3RU38ejWRHzkSX0ZjDGJIxf3BxWedKPH3ay8GQCcb83fsqgcQi8db6aQ/HY6RIwYNS6O29rv3OyOB7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869294; c=relaxed/simple;
	bh=hp7bAnlyWbMe0UagxjClRdoFhPBImgjJBDcHhbMOPBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGCWQn3bdYq4Rda/svzYftdh2yEPcgXmwM3fPSelXjBqFIY1oG8fn8GnEiZI4CTbQu422dtB7WTRhAF8KGh5ChlR7M1aRqja780JlcqTA+S+ctr1w6CkO5/9N7BVDmMddNWCMzL6IhsxzRzEJFMQkvuGz1TJFFjJC3xFam1UBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=y6v1Y+rP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55b827aba01so321007e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753869290; x=1754474090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=y6v1Y+rPEVDHOkrqc2KWOfhiugmQ47csz1p9+cPsKrBxMu6N++Lx7mDSVzJx9n6oqS
         UB5hMz5e/MChLsSvAmzP82OKI7y6HHDsJkHIQqJ10ekWc9qTbZH4JevVzniY4W09B0A/
         VbMUa0prk04D/p8/3TRqlWvGNSKC2kXTwf/bhns+HC7/CXVhXgBURVJR/9r87Bn9GlN0
         gv/+LXG6hJV0a64I7ABkBgPr6iaKk6lKUYzENYZv0W+E8GgTmxZDjeJpjUQvzGsRYgUw
         UIsm9yMb4dS4lePbwKM+ubqez2QY+tIytNFSDWF2gXWKi7MulASGNSolQFMpNoSrFq9C
         RciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869290; x=1754474090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=jaIeBNsC3PuO7a9O9QfXazdDMVMOGIH+prlkA2eOPJcgg7/XSLpkFUMuzpHGceOsV6
         FrYhcWx2NNBaiHNiLhHyy4XwbJd4Ri776qEz6+j4Y9uDYE6mx81dJvPFISqRxYA26MFf
         b2orsPAngMyLLmunDcf11RTg57xn7ri26sLFLa6lsynF+XZCiouGy8LCFQVSqx9jWjbS
         zpYjYq1LTyahzB9awYjyub7yfyEyjfSesgo5pEhdXC+EuDJAtxKlw1IT4CYhmQxruOtp
         4XEuVOL/FwZS9c3kTKxMFPMtr7orvPvG1TEwkmnF+7he5knc/3YAixKp3IMeXL5Blq04
         weBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJqgv11dINYbxHfy2dAXoe7ckhgRCDqUaMhdkG4oNoUKNu1w3tUiJb60c1R6D3Ci77dQO9FL7/f71K@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfpg11n9GnL9G9z0CJzQcuVafRPivsUy63hInVT+A7mOsBvP2
	VCBNNWkIUpz3IrYedfnu7STps6mhMEqBnCe9TuNvJ1dsJIPzJUDci+6A1PCvn0riqsCHD0fT+mN
	Qw17SDz6cFJxmI6YQVRp6H7H4NPEGUztSXseahZiFJQ==
X-Gm-Gg: ASbGnctVfP7dDq4bnxEq45atfQFus18efho2I4MYxuPdU9xec3/SX8lzyx3dZB80AfW
	8RYNAbD5QGyjjQM96YIb6TvCuIGvgr6ji6EfSXPam93kFCr3Bdefd3J4CGJQzlbjMC74DmcZlhE
	PPB1WEwV1/+z4wMgFTPqJ+RCZaoDtXmGIDE8d2g7AFOjh4n5OGjvh5oHk/O3K69rpl8X3XxBnuV
	DvMR883p0al0qCooWhqfCRCopxNN4dnIXmZ/CM=
X-Google-Smtp-Source: AGHT+IFD0mC+adTu2tQIUqoYqi4YbEm6lb9KfHl4WlQUhUVwQ9owZPBnvnUOvhF+89ksRVwAv/r0YIR9B2aVVdKhoAo=
X-Received: by 2002:a05:6512:33c7:b0:554:e7f2:d76b with SMTP id
 2adb3069b0e04-55b7c0b0f66mr939851e87.56.1753869289592; Wed, 30 Jul 2025
 02:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org> <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
In-Reply-To: <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 11:54:38 +0200
X-Gm-Features: Ac12FXyouWksKyGI1Z-cYawOTPPQ3IbuMxJxWat2oIDr-ST0nxIlLBCifNIDusI
Message-ID: <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
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

On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> >  struct pinfunction {
> >         const char *name;
> >         const char * const *groups;
> >         size_t ngroups;
> > +       unsigned long flags;
>
> Not sure we need this. If the function is GPIO, pin control already
> knows about this. The pin muxing has gpio request / release callbacks
> that change the state. Why do we need an additional flag(s)?
>

I'm not following, how does the pin controller know that the function
is GPIO exactly, other than by the bit set in this field?

Bartosz

