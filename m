Return-Path: <linux-gpio+bounces-5567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F58A7617
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DCB2B21D81
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729B05B699;
	Tue, 16 Apr 2024 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="arJ5KGVQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA26D5A105
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713301693; cv=none; b=Jl6RRewwUF5iW5aKZfD/nnAPJJpU3gza0qRS1cd+k6l8adbkJ4Az4rs9zBTBubvv6imckKdcVpwjs9Inei1iYOwQHC4CaIWR+dQox110DK/QUiqA1K4tOgci/E8M5y2yf2DmKzW2KBNU4ebkxN/EuMW5z251gro6hPyPCSK8otg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713301693; c=relaxed/simple;
	bh=UtU4N8okJqSAEdf1gnSV4ZXUyH8a1M/0//8qvJWf6cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5QLcRyXMd/z5o+d2D1cPaKMDXGvI02B2BR1CW423Sr2HooXJr/Nj8DiqxhGDadj8n2ISFt89mZRQpDxBtFFwem7mmGeWUGhJNIGPyO75YGq46WswN7og693od/i9O7B1+lfAyYHFwkEfNzo0qc15RBsZj0YvipHhvsMeVgfhv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=arJ5KGVQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516d264d0e4so165171e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713301690; x=1713906490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtU4N8okJqSAEdf1gnSV4ZXUyH8a1M/0//8qvJWf6cM=;
        b=arJ5KGVQS2l3pHCWt+SSVMZRDcS3ohbxb5NTEhA/lnOPBqE8TwNQxvHYBSBzYA/Da2
         jIGozS7S1xtC3FBFW6Rd4+REeDmX85Cpw8G8o+iJYAL9PS9IMWtr+XNVRHrvZvnmnpx7
         bGPIRwmH/WQ0RbNNoBmspIQXcGyRdzjEVL1oWNcmMNAtVYwMMMJWnyu8JFfXvHB5E9cz
         BopvktTDI5oo9NRjUY4LpFeWOGCmJX2CgOcx9DQQWWG+NH8hQKFTpxVvy9tSb9u2cwVU
         I1xIllDoOz6cwN9ObB/0pUMCJKWXeCF840twRtvm3Ot55cUioAzELVybLl3R+PIuycll
         I5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713301690; x=1713906490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtU4N8okJqSAEdf1gnSV4ZXUyH8a1M/0//8qvJWf6cM=;
        b=sjArJ42tG7koXQLPH10BsefUbbBGuf6fL2wz4J+fzoDHBmjaS920bVwE7ALd9gm6UY
         vkwtA+8WgrNStfnMkNtp7SL3FXqOrx0fDLy1Xdx1q5oTiOcPnwo2RNFk/+8NWdUkV0tn
         srBw4aQkbpR5UV9FIxLjh9OtGHlOzifpImtLk6wwVZ/dHS5HHpPnDcYwSb4vCo5A73Yw
         0RmuRg86TA9XSmWe2jTotaaam6BIucdzUD7NWw2sLt5Fqdy1PA00RHJO2MBSTfZtI3WQ
         /OS13tIMswrxy4GPPaXPcJuHnWaHGfqEQH3h3VFaX9LguKe2UKIsw+VzGfr8p+/LoVII
         OUvA==
X-Forwarded-Encrypted: i=1; AJvYcCXoVcBsqZSxo5LcX9hqBdhrOIdTPaXho4tiZwPMkP+3/5xfDxE6D4WvjaDmiX7PXij8D1PH22Uj6tAnOXJZKvMHthmHC9qNcuu2sQ==
X-Gm-Message-State: AOJu0YwE354rq6lv31JdwE6fuwDmltNsTCRhX3CsUMlHwYsJy2ToWxhi
	P7evXV/NP6nS/9z9MxGEvEtPgrfMU6olq60vujWHYwFuGlCgD1JetAZEVHydQVzNss5VNBbfTuO
	O9oHffcDHQ/9XphAFdOzyMiXH2m2F7pSV86lsow==
X-Google-Smtp-Source: AGHT+IE8/UaVIMjV4kmwMH0LjKA/GWyrorfbQqNq2ie3gzWFSDuXaYK3c2mtzJXVYq5vskx9fsdHL6C1Ceqc7XdUXW4=
X-Received: by 2002:a05:6512:1106:b0:519:3643:c3ee with SMTP id
 l6-20020a056512110600b005193643c3eemr586278lfg.14.1713301689792; Tue, 16 Apr
 2024 14:08:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdYaXVvtt3b9rFxU4ZNShD17Bm4XU9X3h4dY501iJy3kPA@mail.gmail.com>
 <ZhlSaFWlbE6OS7om@smile.fi.intel.com> <CAMRc=Me489H-mTfT1hfUsY47iKwoaVsf6sgkiBwBVkxJOBo9UA@mail.gmail.com>
 <CACRpkdZRp-DFQgb3=Ut27DHd1w11_aEY0HbLjJHob=C5Ek-dyw@mail.gmail.com> <Zh6FkejXcwBTAqIR@smile.fi.intel.com>
In-Reply-To: <Zh6FkejXcwBTAqIR@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 16 Apr 2024 23:07:58 +0200
Message-ID: <CAMRc=MeXV4_MT5_DKYtHqO+324dFJnr+Y1UtR9w9mj-y2OOqAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 4:05=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 16, 2024 at 02:22:09PM +0200, Linus Walleij wrote:
> > On Fri, Apr 12, 2024 at 9:44=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > IIUC include/dt-bindings/ headers should only be used by DT sources
> > > and code that parses the OF properties.
> >
> > That's what I have come to understand as well.
> >
> > I wonder if there is something that can be done to enforce it?
> >
> > Ideally the code that parses OF properties should have to
> > opt in to get access to the <dt-bindings/*> namespace.
>
> Whatever you, guys, come up with as a solution, can it be fixed sooner th=
an later?
> I mean, I would appreciate if somebody got it done for v6.9-rcX/v6.10-rc1=
 so we don't
> need to look into this again.
>

I'm not sure you got what I was saying. I don't think this can be
fixed quickly. This is just another bunch of technical debt that will
have to be addressed carefully on a case-by-case basis and run through
autobuilders in all possible configurations.

This type of include-related issues is always brittle and will lead to
build failures if we don't consider our moves.

Bart

