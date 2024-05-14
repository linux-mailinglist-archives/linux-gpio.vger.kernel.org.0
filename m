Return-Path: <linux-gpio+bounces-6360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB1B8C4E3E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 10:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D388AB21A38
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 08:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55FA2374E;
	Tue, 14 May 2024 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxCkwklR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966A1CD2B;
	Tue, 14 May 2024 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715677094; cv=none; b=bFzkzbaPy4YYWsbDVvM3woOmX29CHU5mLroXugbAF8pKitF5bXuWA45e4stOO6xu3ncwwtypKSvcEfXei92UT0Kas0h5iqs6cN+Ola93ugJOuE5X3aRAsArxIMALFjUMGtIExSKcHBqMJ0ASDpsNKzxtN5foJmXL95nBW387HG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715677094; c=relaxed/simple;
	bh=nmSWHP/7w2XXi5gqUGhq1oDAIeIkIRko45FLPobWyh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4OfXLiAdlyN3fTwDBVvbUxba9quYnE8SifHnau9NAVl5B2VoWubyVQcah1fp3hr8xttSEkYeTmlNttFdW5i8NJRgUBxKXan2ZXeDQFHEQdgRjF6KgBUBqaVagoK5iIs64ZBXElf9HJIX6WHyysjXgMc8V5qyzNuTo12hcymFRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxCkwklR; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so5990427e87.2;
        Tue, 14 May 2024 01:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715677091; x=1716281891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmSWHP/7w2XXi5gqUGhq1oDAIeIkIRko45FLPobWyh8=;
        b=BxCkwklRZtnEctp+TPYihbw55hfl61y9NKe/2k/WKMeehPJWM3SgTts8qxPKsYUn4i
         f4wNPxnnEVkQuiYOz1pfojqZCVSK86cTK9BaILncAZb1RM7lJxKJfL6unQkOKcAOvBy2
         cJprqj9jYO/dfBLoLTcRB9SGN5jm9WBVPCOvbShLvT/vF2gwLtf63m9RVDEDOjcU4eMH
         KXi6v+yo71OgzXjp2pv4R0NhBcI2wBsopzVMxk5SWDieO5vC5cTdV1dCR+1C/A3v/hDM
         p8CYyDY201gMf/+xLH74wJHa/SIbjU34SUb3zoRU7prORFZp85fhAMjxY5FxPLUMenXn
         E6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715677091; x=1716281891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmSWHP/7w2XXi5gqUGhq1oDAIeIkIRko45FLPobWyh8=;
        b=KCLi6nRcnI3vu1yk2PQoyvsLXU7ZfeS9/ZdeGAjkGrRKgX/tf3NKFENgIBOJxoplHu
         MwcM3CQy+9ld5c1onfNRENhd1FgHChuxj+WqMFvatvxCZVyKlhqmBvXJkSBOox0bxkXw
         nDBVaq0TNOw0cmAR/u0OgQ5ugZqClU99f6fDR5dgM8Sr3wo3R/b0DwNFSTKEIb2fW5nX
         kydhn07ika8LMfW87DQLPoW+r3TUMx+OMRoyygkvtHFkiaTi7x8r4g7Rj6seJe9+C6ZV
         zo2AM4s+CHjGy0HZWvpf/0Q5lpkiWym4CaATaU3kIw2rU3tBOF8txrpn1CqW0tfvuZAs
         k2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWUrx0K8rlSKD6URABJAgp8y4E4OGG7xpG9rENbGThKvmz9DoALFYZNnPUY4z1rPCMPbwslxj63T+KsTHGuM07CxTfrebl9hrw3rN6Sq2LomNUNypGpt11PHVKthfNDUwt7cHkXKYFE+g==
X-Gm-Message-State: AOJu0YziWoaCNbidNDxMU2yWZEG6H5ftW6fn1U3tbRSoqAw7uzIAN8pz
	tXjlt3RThWCLBFYaazHlaR/ggnLjg1NCaget5GE6e0VCrOKSOjxF3YcNHjDZ1N1XbgThiJ8v54f
	6wYZaDyZnrDkh/1ZrPPqP+3zHsM8=
X-Google-Smtp-Source: AGHT+IHBiYYJ4qCvwIlREAqkG54ZZVqAoeXidteGIr7923JBkW2v7acOCqih++zi8mPdH6GkF30u4GJcC6B72D3pTk8=
X-Received: by 2002:a05:6512:3b0c:b0:51d:4af6:bb86 with SMTP id
 2adb3069b0e04-5220f666ad9mr9115188e87.0.1715677090709; Tue, 14 May 2024
 01:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
 <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain> <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
 <CALNFmy33wMHBcoU9ei0vVsn0gUM7-0jdkDDq_Loa3=mMWXiWcw@mail.gmail.com>
 <CACRpkdZhY_Yz2jHGXWO5_t8Qdey8me0Gytds7V64GYOFoEC2Dg@mail.gmail.com> <CAHp75VfA8G6KyhD5_HDyKWp5AdpsnnQ27gzTDRRjDRCVXkT-ag@mail.gmail.com>
In-Reply-To: <CAHp75VfA8G6KyhD5_HDyKWp5AdpsnnQ27gzTDRRjDRCVXkT-ag@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 May 2024 11:57:34 +0300
Message-ID: <CAHp75VduQV9AULWNrnCZpMjSnUSpodsQQPwOH=Vs6E5JsrGmwA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>, Mark Brown <broonie@kernel.org>, 
	naresh.solanki@9elements.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 11:55=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, May 14, 2024 at 11:51=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> > On Tue, May 14, 2024 at 10:39=E2=80=AFAM Patrick Rudolph
> > <patrick.rudolph@9elements.com> wrote:
> >
> > > Do you have an example where muxed registers are used in a regmap?
> > > Is there some documentation available explaining the existing
> > > mechanism? I'm not aware of anything.
> >
> > The regmap is sadly undocumented I have had it on my list for a long
> > time to document this gem, but I never find the time.
> >
> > You have to mark registers that cannot be cached as volatile, then
> > enable caching in the regmap with e.g. .cache_type =3D REGCACHE_FLAT
> > in the regmap config, then it pretty much caches itself.
> > <linux/regmap.h> has some cache maintenance functions if you
> > run into corner cases.
> >
> > (Mark will correct me if I say something wrong...)
>
> It's about introducing pages of virtual registers (from regmap p.o.v.)
> to access the banks of selectable registers. The cache most likely
> will be the same, i.e. MAPPLE_TREE.

More specifically I'm talking about this data structure, and we have
several drivers in kernel that may be used as an example.

https://elixir.bootlin.com/linux/latest/source/include/linux/regmap.h#L485


--=20
With Best Regards,
Andy Shevchenko

