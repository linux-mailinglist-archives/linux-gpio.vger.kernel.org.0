Return-Path: <linux-gpio+bounces-14976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F01F5A1804A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 15:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF56E1883CC2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 14:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B15449641;
	Tue, 21 Jan 2025 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IuEWPewm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D4629D05
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737470824; cv=none; b=gqBvoSXYmgLcFlchq31kxozKK7NmLbgL8/owaTM7ae/7WE2ue9kIv0I9L9iH0OJflHBA++u/In3hJPVn5aQwJBrHhh3DzwNfLLBIb77XT4QbfDTyzT4sKpN12m8NTrR5BaFLOPRh6O88ABd5q2c0DQKUXVLyzoEa/ejHk3ywiJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737470824; c=relaxed/simple;
	bh=JfCvWoTbEzO0kpEF22PE1hnnARbvLJyT/vQ54PthHdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsjOwqpBdvIRzo/QtCFeZpMkN4AfrWR8kedE8ThPQQkOAp83fKgGFVhhlLrcrGcPTIMp1BOKvqxv43RmRSm2DA/kAMqQZ4UAPs5rhCf+x9XOHGpihBf4QyzUlLNdtzPVEydVTUOKlNCgedcozpk7oTnDH4jMxqBaTAnqsXlZpfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IuEWPewm; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3ebbe804913so1365761b6e.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737470821; x=1738075621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yhhp0mRWZvKHvJLLfnJ0LjeNwmaLDCHbk6JWfbHtLI=;
        b=IuEWPewmSQrlZNuc73cjskf0rmI3u2H5NLj0ztn+PLODJPv4wApCWIWU+njwUuyRwa
         wMNPiDW6GRLYjBzDov8f0h9reAtHm9oDhS/J5jKsC97icN41N+5jp7HhFxYfBRwk0aWq
         mwXRGkEDx1BMCeMUYe4LrvVypN5jkthaSrgHPgiyYjxpi6M/PRxOWQax4DvOPJHoaSjC
         i/lwbkSnlgdChPOwF3U6vOa965uhzvr2zJubxOTv6MVKlnitNLOnwsdWaBthlf3nHjow
         hrcAdIJeMX4TOt1ygnBsF5mttOhY+xpN53X6K9mws5ahGTkBpX7B+d3nzrP4q+uoPJeg
         xlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737470821; x=1738075621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yhhp0mRWZvKHvJLLfnJ0LjeNwmaLDCHbk6JWfbHtLI=;
        b=Kq4xdkP16x/keuViWgb5clQ9IKfukvzZB3yONplRRYEl7wpzVMHWch7cz6HyiQ9job
         ef6WTHl8BPsfU93IMslt0UsHoTS6keetTetLgXYJQDEiZ30g3jU7b0rJTld0Jd2QasRR
         K+f0upNbiK5kjFmhnNt3ML7LACBJv4v+QLZsDtx73IhSbpXHvjVjeOG4FkhjVl+URbxp
         b9E8fmbKQ9VDl5C2G8z9kEiNOk/Kx7cL11JoFaQDeMjBvROhr1Jf/6rLQ8LKfggOFeWF
         O/EFDp7ZuST++/HILr1UPA3Ubvj9JKcRzYJYgXPekbxfF7vbdyiUbqgDY7m7MkpEN2U1
         40ig==
X-Forwarded-Encrypted: i=1; AJvYcCUqnvm7rkeedG457Nz5kao1mkXZjsa4rjwWdA9sAgvOiIkABaXliLIraQR64qnZE3WggrfTngRjj75E@vger.kernel.org
X-Gm-Message-State: AOJu0YzIUoxzXIrGaebHEkXL2wY1z8+C7+6ayOfd72bFuByyQjF5g+k8
	Id8mqC7MMJmHjy4DmRrd+e6AryDuOIcPpRcB11ebJXn1qJC1ZV8g8Bpwb/xvgv8eqsHoeaw3b4Q
	TAEEZGRYyVlg3OgOInpdJXNwdcO29wghZJuqnOA==
X-Gm-Gg: ASbGncu3ZZY6SQ53FjiVkgNZtiKGWS8BsDgnJ1T+4BvTWWwFPb0sM8nLK5GLzd0y9YY
	Zie7sotyCGMQqCJ5hrpJVlUy61UX7s7qjpjPsubPVE2pJFcwPQaAa
X-Google-Smtp-Source: AGHT+IH2CfYbF8hfXPnykYK8fykXtjqZXBYffL/Pjc2tKlK1mKKJ7qDc/3PPOkRKkkj5qhUhL1/Cyh93nu3VEPBCrq8=
X-Received: by 2002:a05:6808:800e:b0:3e6:1ea5:6b30 with SMTP id
 5614622812f47-3f19fcc1560mr8171055b6e.24.1737470821566; Tue, 21 Jan 2025
 06:47:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
 <20250120-pinctrl-fltcon-suspend-v1-2-e77900b2a854@linaro.org> <4ac64a481d80785973d038b9292a05781e70a670.camel@linaro.org>
In-Reply-To: <4ac64a481d80785973d038b9292a05781e70a670.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 21 Jan 2025 14:46:50 +0000
X-Gm-Features: AbW1kvYEUqxUBeGd3VHQBBcdayPXs-zQHZichg4BXm23UKs5sRmwc2OmOQH-Bg8
Message-ID: <CADrjBPox8ZXRPSAsAxbPqoib0dgpgQXQF+5grPguujYjoOiy7g@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review!

On Tue, 21 Jan 2025 at 11:20, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Hi Peter,
>
> On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> > gs101 needs it's own suspend/resume callbacks to use the newly
> > added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> > registers. It also differs to previous SoCs in that fltcon1
> > register doesn't always exist for each bank.
> >
> > exynosautov920 also has dedicated logic for using eint_con_offset
> > and eint_mask_offset for saving & restoring it's registers.
> >
> > Refactor the existing platform specific suspend/resume callback
> > so that each SoC variant has their own callback containing the
> > SoC specific logic.
> >
> > Additionally we now call drvdata->suspend() & drvdata->resume()
> > from within the loop that iterates the banks in
> > samsung_pinctrl_suspend() and samsung_pinctrl_resume().
>
> Maybe split this patch in two:
> * first to do the refactoring plus adding exynosautov920_pinctrl_suspend(=
)
>   and exynosautov920_pinctrl_resume()
> * second to add gs101_pinctrl_suspend() / gs101_pinctrl_resume()
>
> This way, it's obvious which part is the bugfix and which part is the
> preparation and I believe it'd be easier to read.

Sure, I will split it into two patches in the next version.

Thanks,

Peter

