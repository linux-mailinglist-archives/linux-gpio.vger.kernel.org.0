Return-Path: <linux-gpio+bounces-10637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDA598BFE5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 16:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE7C8282130
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38451C6F66;
	Tue,  1 Oct 2024 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dt1kxe2N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F971C6F57
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792952; cv=none; b=Hhw0XG2slPPRdjUuFtQWqqdJU2apdIRmJGSrMb3MRrqE/itbv/Eyp/eUa5CpONhS61HVwLIHUU2qsceXrd9aoqYUkaxN6oBLdQUpHB376BtiEiQdhlxKD7qSAzxUjsPFjg0A2Oz78D6mzrKJtnD0LuiTyegwFq2RiXPI9roU8gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792952; c=relaxed/simple;
	bh=ZTLAPL4/a9ZeqzSRMsFNfRjn33WA5sSh1xdLRSoZZl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqCFO/ZcPpPgF49+X2HcIVBWLRp+U58f/KkWjTmpfy8Q1OxKtScYVOfgrM/IhQCP8SJpeuY003l0JbTByNF1OHgV2lIHD94NctE2sQqhgFZPxztHb0kPsQXnjYQP9Jig/nOdjOjfmgJMGLHmheD/FhtYnPaGgFa3h5T6V9cSE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dt1kxe2N; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53997328633so3104492e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727792949; x=1728397749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTLAPL4/a9ZeqzSRMsFNfRjn33WA5sSh1xdLRSoZZl8=;
        b=dt1kxe2NiiL5bUMbL+DiT7/KclXey+k14z52e3aIrTEb06FUnzYo4vz0Tp1/ZG4pQi
         B4lQgnSAKCdWZAx/vqLGYmSf0ULx+axAJTgwi3VG1F2PH2SYsRKF7erpLqjb7cQSNGKC
         4+pyuXqMy+rDoIgFE5NGzU5Jbk6IFHwLhVOuieJ6lXdsnjVUI4cXOXFOr9nub6mfwOs3
         /WK6+6/uy6S8iVkGEy9zhHB0i+bHsgyfKT1iTg68hG5tHreRXgTRhKjaaUmjRMllfdkK
         1LKUwrWlTBp9lkQoN3vcgMFl/FOLsmNn+oL0pEUlc48zQwUsrko/40vlPDYsTUCGcgbv
         fOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792949; x=1728397749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTLAPL4/a9ZeqzSRMsFNfRjn33WA5sSh1xdLRSoZZl8=;
        b=oStxIL3vBEIiNuhYqZesImaGcNMslGGi/g/eHNSg5568quuhpYuJQNnOWtw+fmhYuK
         t/ZjvbtC6sH6nNkUUjM7UEfm/DK6+R3G6QccTBIl04/kKT1YhTGgNTdDLETUsNISx6yN
         NYA6CwZKaRg2zVNurzRAMyd3AMFPD/ZC0CdfmEvWMrHMQ0/Sjs5byReA7iiQT7HtRtph
         In74r2IyvJaRF3DmyOwkVmiXQn8f9bMF+0aoAvEgpZgVn6iuMtQAkpSI/GVyQlcStGP5
         bVhWNqMuBloZArW/2ofclDV+uHFv4CZJTRn+yaqsE/aDlngcj6nW2Sg48d+BJtdBD2ne
         cq4w==
X-Forwarded-Encrypted: i=1; AJvYcCWYLJUkgEnberr3Vo0rGnDYUtN7p6Ibf2ky6E5PRV2aLvUz3+qlYMzmqZ0Op63aMRK4XmvoPr3TehZR@vger.kernel.org
X-Gm-Message-State: AOJu0YwtM5qILyy5Hdp8FN5wzE97v0WSlGp/7R7RpCklRvEH958F0jgg
	VQBcEcCCkLYbeRvGSpVpNUIu29y4Vd4TqPNOh99nGf2EyaWaNVFJ+MsYChroWYLNQ7CVoMBAgiW
	tFXGSDLomI/FxnIeQIUq7VMXh3OjJEY+E8Y3Xzw==
X-Google-Smtp-Source: AGHT+IFE+BbJrrISlBUyPgv+/xZL7TxeBTUPX5ZjbaQ1CFA81WRoxPOYTAY1J9iq5dPpbRGDpAq5fqHmiNZTcfKL22Y=
X-Received: by 2002:a05:6512:6618:b0:539:89a8:600f with SMTP id
 2adb3069b0e04-53989a86942mr9620037e87.23.1727792948844; Tue, 01 Oct 2024
 07:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826095723.1421065-1-andriy.shevchenko@linux.intel.com>
 <ZtmqdP6Q92vRWh_I@smile.fi.intel.com> <CACRpkdYSPGsQt_FQDurtwmyaLtB3=gaay-hLN2QdOj25e3sK8A@mail.gmail.com>
 <ZvFGctwe1vu9lQmd@smile.fi.intel.com>
In-Reply-To: <ZvFGctwe1vu9lQmd@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 16:28:57 +0200
Message-ID: <CACRpkdY398EUQE=OxBD+saCzSeYK2-2oQM2Bq2rjqRu55b7nNw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nomadik: Use string_choices API instead
 of ternary operator
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 12:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Sep 23, 2024 at 11:11:12AM +0200, Linus Walleij wrote:
> > On Thu, Sep 5, 2024 at 2:56=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Aug 26, 2024 at 12:57:23PM +0300, Andy Shevchenko wrote:
> >
> > > > Use modern string_choices API instead of manually determining the
> > > > output using ternary operator.
> > >
> > > Linus, do you have any comment on this?
> > >
> > > I had sent two patches of similar changes (different drivers, thoug),
> > > one got applied and this is not. Anything should I do about it?
> >
> > Sorry for late reply :(
> >
> > I thought it looks weird to replace just one string choice
> > in the middle of everything and it will be confusing for readers?
> > They will be "but what is this now, this looks weird".
>
> Do you mean it's incomplete? So, i.o.w., if we have str_output_input()
> it will go?

Yeps it looks half-way otherwise.

I wasn't a big fan of the choices but no strong feelings about it
either so as long as it's consistent I will be OK with it.

Yours,
Linus Walleij

