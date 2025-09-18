Return-Path: <linux-gpio+bounces-25837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E489DB500CD
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 17:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A45A34E145D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 15:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA171338F23;
	Tue,  9 Sep 2025 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgT9jkV7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3694338F32
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757430968; cv=none; b=YUP/2PAIScI7uMD4/F553ymKsYNWh8sBOEMDYRY44DJJ/+GP53Ee5tk3u6qaymoemDwmL49rhYDTP0z1O+IPJF+b5PhP5KYnfNq0Vl33bm7OH/CxsOLF+iSotqxBhX4sI3BGsmiN7sgV8Q26RzhfArvE5ayi/1JcBhB/+4yY+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757430968; c=relaxed/simple;
	bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1Pal/08n3qWx8zATl/DBqO6ea7pSE4KDvq7tI0IU6LpxEQq6JIZGcOnvSXSDS6NZBrq1CuTbWfYKrO/VyrRL3n1TSHJ1+J7R6c6+mS46o5iypnalP1vY9DOCNROYhKq29RDQ1Yy1OlCCSeKnjr3+VQn+TrfRI7K3XfiKs6Ea3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgT9jkV7; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b0428b537e5so920507566b.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757430965; x=1758035765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
        b=HgT9jkV72Ek5jVAJfgKMo0NY1Xee9cmxE7wMVdNroBd9lwTzKY1OPToUkcaaiVfA1Q
         w+HqEoBYBV1C4z/1V/aXFwb5/P6xIeCWXw1jQiRuO1E0tpxEogi7KQjSuZ9UJJIfxHtr
         srt6hpJq/20lHtorszEHi+nBfkSNHWCV4LVBWat8AW+UDlMlFa2nD8kXn9kVztF0slZY
         e+pR0ldJH0KxkMqT8dZJKIwlhXD+9IkKn7rN7OgBXD5M05vok/Xsc1I/4m8bHKMAbmY3
         B4QWURkumU478t/8T0f/wz/GzkmiBRU8S4ejTXxSVpSRgMyjDLEeiUcWtV+jLMzKLGV4
         JJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430965; x=1758035765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
        b=SPM0M5RL0DEbgiKvPZ1mXZCaxzrjuDjqUmJO3IeqpCs1W2iwbA12Iia+xG57Id1UYm
         YYjvqqEzdvl1QkFeU276wz1WeoX0sp1Wasfrb3mICoL+RfpWYN7oBCx/d8Edw5rUp0Qp
         azoOJpOWSY2uwyLkzDi0OItPfeUhOq/Hp8goaer34IQfW7U+gP7DsV637wbgHtOk3u9W
         +PdHN7GZc8AVwAw8TpVUpO62ABVi6cfjRyOPGTEFO8TWW69lJXpwNCqz3vbxaqsgXBOn
         5V3742MXNdETpxhnVDWVnBbZlOOVsatzmfciOUp2nkRiVRk6ypn7BvDaDDlI1L6Tr6O1
         nRCA==
X-Forwarded-Encrypted: i=1; AJvYcCUTFYhst/CMraAEDZucP80yJNJ0ZLYe5ddnPdGxYVPZak282d7jQaJECx2bS8PtWkLoZ0DRXyidmVQW@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZo2wYm9Vvh3GQOFG2LAOPHg6mKkDVGOPyIHCO9JexWiO0b+I
	InXUDHzJ0vYErAjqg28qUUgmb7RBPbABABgDKjr66LA5INBQtDuCLK8GpehR21pPvOr0E+z8hHG
	gYtV9e5K203UPKCzqGGnI+ijOD0KnGlI=
X-Gm-Gg: ASbGncuidOduTDmjH7t+XKZMsDZQbJ4iXWPzIvxGnr6BqoneDUeCsvOiSlnDoL+OOtg
	RoUqJMT/AjymN5ecgBkJgh3/PIfWbocak1mnJpuIeXj5Bk+0xBcHURrNwT2p+ZerzTfhk3lIvwj
	oX3CS06rGTG3FPx1E13SH38y9bW5NrntB8rhdZ41ZGdyptXVmYdrG6ERNoxwoXQi09z82lTV2e0
	xBZs6d36g==
X-Google-Smtp-Source: AGHT+IGeaHcV2kH627FcZIyd8vYLnu/2Up2e6b2i9sBG/bmosVjOp6dqHGnQ87UTIB1WpGArwM97TNlubL6NJn+jj/k=
X-Received: by 2002:a17:907:7e8c:b0:b04:39af:bee9 with SMTP id
 a640c23a62f3a-b04b1003707mr1194942566b.0.1757430964857; Tue, 09 Sep 2025
 08:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Sep 2025 18:15:28 +0300
X-Gm-Features: Ac12FXySsG8IXlocwCfN3VG6y5KLpIc0a90AoYqlSY-xU72GOTjlNCZIc8n9fs0
Message-ID: <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:

...

> > > > TBH, I think those 6 all made the same mistake, i.e. thinking of th=
e compound
> > > > literal as a cast. Which is not!
> > >
> > > What do you suggest?
> >
> > Write it in less odd way :-)
> >
> > foo =3D (struct bar) { ... };
>
> I don't get your reasoning. typeof() itself is well established in the
> kernel and doesn't
>
> foo =3D (struct bar){ ... };
>
> evaluate to the same thing as
>
> foo =3D (typeof(foo)){ ... };
>
> ? Isn't it still the same compound literal?

It makes it so, but typeof() usually is used for casts and not for
compound literals. That's (usage typeof() for compound literals) what
I am against in this case.

> > > And are we not allowed to use C99 features now anyway?
> >
> > It's fine, it's not about the C standard number.


--=20
With Best Regards,
Andy Shevchenko

