Return-Path: <linux-gpio+bounces-25431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED65FB415AA
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 906D05E4313
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 06:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E6A2D949F;
	Wed,  3 Sep 2025 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3rFveK/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91E2D8370
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882554; cv=none; b=VVKXfhtXnWM/ZkKQJ2oXpW/UMktaCZSc2mmAx4viFoKKCessXbO9ZiuHNZT7rBHcZnwGgR2i+QlyrHgWWbjVKBhb/3Rk4EzsKHn7VXbcx0U1vZpvyOrxDJwiGh3VkuYxfs04sM16weFOVqOfSxL05js2jGmcA7HdWkOJ4cn/aUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882554; c=relaxed/simple;
	bh=IDpAPdDZzSrb50R42xhvKngU2V5A6SF5b3FmEOfvqg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMGRmZE7Xraeqrk7HxvDV92O1fBbnIVb9/feJMcqk2u3g2TDMvH+E0wQRonfSrbHx98GtJdmOxBHUKFKHTfBJJBEYU92gn7AkHU/d3w4jQQrJeWypxY/vUcjV+Y0Sb+6z/ShouuOAPCh7qrxMKnK8Zb4wquZRBUvt6gRbY63xrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3rFveK/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5607c2f1598so2570667e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 23:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756882549; x=1757487349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3izdWZnZsKRsTL0QdhHG4QsyOhmQjAte3ln1Hvsa9JM=;
        b=s3rFveK/DerufccgV308IX5ZL1EQTpNBvnv2OoPrVxGVnnw70gcoUAIIue6AKS6gLd
         RjIdQCf6Szjbh2cdtMWczIRM9TQps8MJQnaH/skYZDAjwIHNc4eQRj/pfYN54Z8HrPOH
         liDihFO+YGHGavpIBo5sD1GB/OicAG8pSXBPPGANOXEDe9aXxpClBM4/Y1jPZcwUg/3w
         5HRIQJIe1B2JJ6eW/Rx5m8jMrXF84mT1dwpjwOyjeJM+4eJbm/oUmcN8tdeLWAe9KjqN
         ak69+AvDyAKtWAK4GM5odv/j0RDQqPNiFupTLVZTbuSeiy2wQCtrFAntyOTXW4a3dMx3
         9bLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882549; x=1757487349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3izdWZnZsKRsTL0QdhHG4QsyOhmQjAte3ln1Hvsa9JM=;
        b=NbbFzm45gxD4CQZJOvE2F2RwLbOUoJjQeK+axfDvlFJI28z1sHDAHTOgeo7P6LLR/P
         5ffCKJ+rVo993pdHnHtWG3b68SCo6AKnkDKp9TeYwltrfv4m08NPDyytxuYVYxYAcFVa
         yLp1JjtcE3FRIEx4zupSFI4v9B165XMExMngaAGAr5Ca7GimVWZIZpoq84DWzHy3tCd6
         eKWWNJHowRzL4MV/+I+wtfPUiSIvYwHLD8gWguo59o2YGxmQAOqOKFrc3FMS5Yv4A5ES
         FBNMpgpd37UozAEcUZlqN31C98Dl65X6buC95gmM4Hhnb2dtM2bswBNfWjvjFI67m2tE
         Rs/A==
X-Forwarded-Encrypted: i=1; AJvYcCXDki3FOVrYfV+Bc29PDcl3DTO1mj5c1V6mEsx9SAOyblUWyxQUVDMLSW1vzZwsAhYxaOpbafL5T0KK@vger.kernel.org
X-Gm-Message-State: AOJu0YyM+gidtXFnevA0sExLNFhBlbrsJwNwcV+6eNwgKfpgKlVyWRvB
	FknOqNI14Wz1ht2sI1to+yVTaSxcP5TMIqwPBvgCldVSmRxF2AWHzIb7vl13uGqYNVaDzlk1TvE
	/Y82dPRfSDiyeiN2igCUeC44NzRSlu7Jz8/B4QYzNjA==
X-Gm-Gg: ASbGnctAzan5fpk63rLh0jTywA2bKadYZWvCWdvMUejkJqk1EO9xNKBzVE4sXSqVCo9
	U1jsN3fyxdM3lyILS6imUiODcutJQC/74DazD57doO14aKnVzdQWGxfFiwVBMtyjtjyZQbIucyP
	jGHT5Pp4+9tuRbEadqkxXXrPO0p51J2lcvn/lMK9xrI6VQ0/T4KuL2gVy8coCGMEd4c7spE62go
	2aRy+g=
X-Google-Smtp-Source: AGHT+IEmLx7loP9ZecOZBO3528SSI/yRm+MhYRdfiMwPjoy+KPrBG8249IPqTCwY1GOtN0xl5pEKKGRDKB/zlEGXKBU=
X-Received: by 2002:a05:6512:2392:b0:55f:6e87:10c1 with SMTP id
 2adb3069b0e04-55f708db54amr4348155e87.35.1756882549501; Tue, 02 Sep 2025
 23:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
 <CACRpkdb=U=h5OguMuy9G6avCCN6Aem=2_60C+_uBsrY+UvD5ng@mail.gmail.com> <CALHNRZ-dRvaN_SyHRfAsq2MO-ec8rzkeCy6CtJpYdWTobf1-Wg@mail.gmail.com>
In-Reply-To: <CALHNRZ-dRvaN_SyHRfAsq2MO-ec8rzkeCy6CtJpYdWTobf1-Wg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Sep 2025 08:55:37 +0200
X-Gm-Features: Ac12FXzeaQco56Y2RwPUQv74y9to5SIPZF1IYZUjwIRBuYrEJbptpSe99KCxkJ0
Message-ID: <CACRpkdb46OwzNQuSp0+QQVjy2LojMyhdE7XrNwdsyqGi5okASw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 6:54=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com> =
wrote:
> On Tue, Aug 19, 2025 at 6:30=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > On Tue, Aug 12, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
> > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > > This series adds support for Tegra186 pin control, based on a downstr=
eam
> > > driver, updated to match the existing Tegra194 driver.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > (...)
> > > Aaron Kling (3):
> > >       dt-bindings: pinctrl: Document Tegra186 pin controllers
> > >       pinctrl: tegra: Add Tegra186 pinmux driver
> >
> > These two applied to the pin control git tree.
>
> On patch 3, Mikko noted that I accidentally amended the formatting
> changes intended for patch 2 into patch 3. Linus, since you've already
> picked this up to your tree, is it too late to fix this properly in a
> new revision? It doesn't appear to have made it to the main tree yet.
> Or do I need to send in a fixup?

It's one of the first drivers I merged with plenty of other stuff on top
so I can't amend it, just send a fixup based on my "devel" branch
(or linux-next, it should work too).

Yours,
Linus Walleij

