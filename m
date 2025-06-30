Return-Path: <linux-gpio+bounces-22456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC58AAEE769
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 21:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 294D316A5C1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 19:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361502E267A;
	Mon, 30 Jun 2025 19:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kef4Qk5f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B1628BAA9;
	Mon, 30 Jun 2025 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751311437; cv=none; b=iABG/JLhoKf0EtdHztR+u4ABgPE1Hc4CHO6oFEN+iaKi+aRQ9HjMDJZDkZJPvf+n8HChbS6dkvmNxJ1XxWMdzpMLtzyzCH9gGmCFFVg1t/qNU37OZPtu8jQkCWHwoqMzD0Is0MMUScA/jkXVnok9e/Y8BcuyOyK48Hl1QYS4mE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751311437; c=relaxed/simple;
	bh=vx8p4LrmwwD+sMFaTXDI5Q728j6qK0yWBF9XsU5gmE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGAig5Ne6SdmVKfAOcYwTNwCjBKDLYLBrHBwKem+3v8lVQS4VcokirVaWT3ZDuhB3CVKuIRIwz4RoWUAQeGKajfGekACHcU1FHQ5Wc6QWlB0m+ChJClLSY2eNtMQ9ElBsFkUJ5esnKsq5EFaAp+jTeN//a/yEX3/1MLkAnKmUas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kef4Qk5f; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b10594812so2950867e87.1;
        Mon, 30 Jun 2025 12:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751311433; x=1751916233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jn/+L4pxELuf1sWjbIbM9DsEd5pufNcwaC9b4Pd43GI=;
        b=Kef4Qk5fMq/VU+z5YoHoFIyDmTu2YzYy4xAtKapVtATMxrnfXa5FOSfr3fb7y9n8OE
         JP8asMrYAOeOYLOdYdN/eZsy00YgJgNfDDlhQSdtogBIWlxSt7jBjxUnOy3pNJj5n65c
         A/2c5QnzeyDgvUIgUrvNDkLfSueQ+zd3pCethy3ALSbv5ELtMcQZDcqfUeo+vpBk+cwb
         0cUrO4KuVJAFn1NGxEDFUuOwYKBZEbUZ5IYapzGfa4eT32yACrxZS806Xv5QI+E/HSsV
         8k7Y87H0ZFhEve7IAdrtnXcOnhFH4OcV55b9ehY0Mf8BBPFCIO1SemcwZugQ2gpV8tad
         aZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751311433; x=1751916233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jn/+L4pxELuf1sWjbIbM9DsEd5pufNcwaC9b4Pd43GI=;
        b=FFdBilapkVvJbDPd+gA6gEalQgNfBEdFRTDpSOSznLt4hcvErLLerwu32hCHSl/HTY
         K4wFaxQpV23k/+Td3a2XustuhIJEfms4QYMC7+ASs2x7TEX1tKyLMhg6em8taXD5cUf4
         Cj8vCgrDWNw+tosCR1R6M2VlQluIiiarnJDA5L3qzMe5Ss0T8Dbq6UMq5KaiQHLRQVNr
         +fVaeWutmGeF6jdhIzMy+xOVrmYWChmplSZhdagIyi46Ota9hIhwbBNjU3Q6Ma5K96cQ
         /nxDDAA2a+CYkLqOVTI6dynDUt+NSCLKUEjxv8et2VBkKobn972e1BV7dzGg1cv70849
         yHbg==
X-Forwarded-Encrypted: i=1; AJvYcCVGKrHmtKcSGyCQP/3ce+rE4hF37J7OxyfSbkRjgGMHK2hU2fMuRMIXCGzoJwnP6IzVyeH40c+kIMCXRI8K@vger.kernel.org, AJvYcCVHUFZjcs+bBRwjoQe5dx/DJgs8OqsLGDuahXQFrQGL1A092XtsT6zUBR/TBrq4G8CGBHVON7JJIi56iQ==@vger.kernel.org, AJvYcCWkkEWRDU5K/4FhCgHFsQ76FRA1CD9CnCBiJZPE8V8CFC1p3YNCnx6O+qqH5mhSeyNnITgs1TofXkkMHwQ=@vger.kernel.org, AJvYcCXywtg/hZXhOnMUUJiatctt2Fbm0gP/vOJFyMqAd1H4p3oSI6gDWzmyvOLE2EtqOzxuRKFfvSoHTO1Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxGr2Xs6BEsPhk5Our6kQAYQqEgenOW0XDyCHHBmPJSF9QTKWaS
	nXcobR0+1AMUh8CLZNQ/8TPRlwt0Lfl9A7O26fM9X8rxHFn2UBLm1cH16SRoZ64IOwq7EALmbIn
	WU8GbSp4XijhsWlmidA3eg9VR09wFFOA=
X-Gm-Gg: ASbGncvbbuD/vzhC18/9j1H76flrwJrZ4XB11m7k5bdfRreGkzgjiovUh5HcH+hhOMO
	Rfj0tAobw2PjbL3LczsSfrJyB4LcauXg+tCGfuxaK8ck7HUhpp2n1hbVotIXwaZAiSSh0nrkVFU
	+C5QZB3W6FMudqTk+8ujceps8RiFxDX5cuIgB8eDT45aA=
X-Google-Smtp-Source: AGHT+IHSvtk2+mcwHs2ctXMmbQbvFIwjvr/sEpRif7t8chrU/jIjLv7TuxBVBAZMUEYrxjjLff8xGAgBFVWFtqdhxcg=
X-Received: by 2002:a05:6512:2c0b:b0:553:d910:9328 with SMTP id
 2adb3069b0e04-5550ba1c986mr4772818e87.44.1751311433216; Mon, 30 Jun 2025
 12:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com> <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
 <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com> <yslfabklduaybg255d3ulaxmzpghyj54zdfeqkx3oxgisxf6fo@2wecuqpvvefc>
In-Reply-To: <yslfabklduaybg255d3ulaxmzpghyj54zdfeqkx3oxgisxf6fo@2wecuqpvvefc>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 14:23:42 -0500
X-Gm-Features: Ac12FXwjhZP5aLmd3zOs5OWbEltS7LC-Virp8dRvQq07XXeGgRwfJ1dPyQiwFuI
Message-ID: <CALHNRZ8jq++KVKxKP2-GwMA6CauP=cM2_wt==MRAV4mOzK2kxw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:23=E2=80=AFAM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Wed, Jun 11, 2025 at 08:58:49AM +0200, Linus Walleij wrote:
> > On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Thierry Reding
> > <thierry.reding@gmail.com> wrote:
> >
> > > One thing that's not clear from this patch set is whether we actually
> > > need the Tegra186 pinmux driver, or you're only adding it because it
> > > happens to be present in a 5.10 downstream driver. Do you actually ha=
ve
> > > a requirement for setting pins dynamically at runtime? Do you need to=
 be
> > > able to set a static configuration at boot that can't be set using so=
me
> > > earlier bootloader/firmware mechanism?
> >
> > Actually, speaking as the maintainer of pin control I hear the followin=
g
> > a lot:
> >
> > - We don't need pin control, the BIOS/firmware deals with it
> > - We don't need runtime pin control, the BIOS/firmware deals
> >   with it
> > - We don't need runtime pin control, static set-up should be
> >   enough
> >
> > These are all enthusiastic estimates, but in practice, for any
> > successful SoC we always need pin control. Either the BIOS
> > firmware authors got things wrong or made errors (bugs) and
> > there is no path to upgrade the firmware safely, or runtime
> > usecases appear that no-one ever thought about.
> >
> > Aarons case looks like that latter.
>
> This was a long time ago now, but I have a vague recollection about
> hardware engineers telling software engineers that muxing pins
> dynamically at runtime wasn't safe for all pins and hence we had to
> do static configuration during early boot.
>
> But then along came devkits with expansion headers and then people
> started using scripts to mux pins to the right functions and such.
>
> > I think it'd be wise to send the message to any SoC system
> > architects (or Linux base port overseer or whatever title
> > this person may have) that a pin control driver is usually
> > needed.
> >
> > The SCMI people heard the message and have added pin
> > control into the specification for that firmware interface.
>
> I'd agree with you that there's plenty of evidence that we need these
> drivers, so maybe I need to go back and look at what exactly the risks
> are that come with this and maybe there's something we need to do to
> avoid that (I'm thinking along the lines of certain pins being generally
> safe to mux at runtime, but not all).
>
> Thierry

So what's the path forward on this? Will this series be used, or is
Nvidia going to bring back the pinmux scripts and regenerate
everything in a new series?

Aaron

