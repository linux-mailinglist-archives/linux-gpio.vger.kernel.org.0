Return-Path: <linux-gpio+bounces-28866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3A0C72845
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 08:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 777F834FA99
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 07:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52A730146A;
	Thu, 20 Nov 2025 07:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC1dRrpy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FDA3009E1
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622209; cv=none; b=ILNlk927dS8wX5ZcLl1/CrsmmC4HP76nrGYASvPK//ZhjfdwojfgDHZt1QmqD0rObiShnYORuFwlWs9RzBt62jyqMYv45aJ1vcSrcJfNflnE5bJdWG1Khvy+G4h+ESCg41xBdf028YxOIWWbvbYYsaddGBeV7WSKKFFPJ+5MjY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622209; c=relaxed/simple;
	bh=yWaDyoeVkfBsdzNbNQDJMpjz5f/8LqjkZB0jvU1mrao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7XLTa4IEZMN39iJxJDZS1UH7aetPMuSZyW5BEBHv+PzAOvw2VXRKsDsURTfZMwik0NEyd5YYjG3HKjwvMoQGMV8+63DlT+5rCLSzQpsjvRZC66yApl8QYTFPp7lDY0H+AU6vQGvouF6BvgyieYiBv2s/EoZ4Swy46BR5e04ksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC1dRrpy; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64165cd689eso134754a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 23:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763622206; x=1764227006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJJgvs/ZqyDxpPWXe/GBTfmOfPXUTk9veRBGRsYfnYM=;
        b=BC1dRrpy0cBJzBvNYV7CDMWO20o4v8qJh4M0occ2QWhx6g3imByjktwxgrA8NoT3qy
         Qx2Tuu7os7p6InukXZLgwxR/zQV8XsgXA+YNtH6THdnlomVW7zh5moLJBq47U73Hjpxu
         gtmiklWkJamdkMajGGK9Z6Z/5WmJCVLJ9cMnY09kJS3UJQjnSVbbngP/KohigyroCVU+
         sTvfTmcdTbk0rMMps0PeaZwNadpetxuOhIFq16EB1DQqMgulQYyfxZnHt00WkyzlLQvZ
         Y9SJox4gUODiQ4PFZJE0nyyieKuSwXdzQvPKI/RSJn4aLsV4QZpFHmgN22H64vEZmRwP
         pcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763622206; x=1764227006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJJgvs/ZqyDxpPWXe/GBTfmOfPXUTk9veRBGRsYfnYM=;
        b=iT9vq1fVhOLKmK0+zOZznYYspRCMq6ZegUWEb/G69Ll0UIodPySMUJ+TXMHCO/gMyq
         cqDKcH/UigziLf1f2lpi7dYPoE0pB6DjuXub70BRWkkZvArffeNdYT5C5qZhT34Xi9WF
         0LCdlIIrcJ/NwVAn6FH9uqW+/Ne/h0abuQOLm8uIB4AFDmkU6bslzwUXz2/cZq034oSF
         GaiAow288DwNMmvYF6zBH/45FHzHR8Ic7bydFiDgH2xykZwBuggLzq/7kerGgJq8BapS
         8FDnlU1GIBDOUzy7z05q3RkwkKEqr3EhWJRa6hri43QkjyoIJU0i0UGtdwjIN46F+jat
         DrEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW3KWVhHvFh9PH7tSu0pCQP4evFtSYUqTdhFDFLFXXrT9PiO/GqC2x1F4PulOtw3OWGc7CZo/cu94f@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfI1febiwcDBl/W5VR1ihcDK7CPUd7Q/PqjPs3bkdv0GGtcLC
	SA9W+B/X5nvb4s2P9c40nxAalU5TeFwHJO0cS/SjCoJBfJdzm/Y2o5Z+9iqYpkyl2fz7WE996AF
	6W036p4y4bof6Zzak0bUbLwiDLXnn8o4=
X-Gm-Gg: ASbGnctg7J5Mu14jI+EmACQjr2q2rLlUQfAhQ11uFcTJ3T9sVeQCq5NT1h/MFH/m8Ge
	b0dLn/YeDneB2hzYip4yC0W1wB3L53RlBOHrHEM5SZwQwuDCnJGIFoGZeuHF68qBT1HIHN0Z0Bx
	mHCbnpFohoNH3XRegIAHaHZNV5hwiG3QyMLFq2mZ3Oy+0BWaxpkljMPKS1rhAE+ME4htBKTPEat
	6rO0vqcNYM746I9R+Er40G8/1WowjYFrfMputofv67SxuD+x+DA88Psb8CgxImOSwYpnOgwYn9o
	IUX9dXcbkmzgFqdAJrR7BnAUVWI+ZJYzcEQsPTlhVp9GrlvX51np+9oIlmSOiRh4oRec/EA=
X-Google-Smtp-Source: AGHT+IEA8GU353sKcnteGmKTMEBzbiCaPQJCce5ujMTjOBQ1mFHaCHAzcFHXEgsI1VWuM6dNVzZd0ZtPLCtRbzcDf70=
X-Received: by 2002:a17:907:7f1c:b0:b73:37aa:87c0 with SMTP id
 a640c23a62f3a-b76572b27ccmr132695866b.23.1763622206151; Wed, 19 Nov 2025
 23:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119163327.16306-1-jszhang@kernel.org> <20251119163327.16306-3-jszhang@kernel.org>
 <aR4CLQ_2-kUM-e2F@smile.fi.intel.com> <aR5gpsbw_r-y4JdS@xhacker>
In-Reply-To: <aR5gpsbw_r-y4JdS@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Nov 2025 09:02:50 +0200
X-Gm-Features: AWmQ_bmQiILHNoGbrxHaQiqyqVXCGmcrQ_qH6-ZV56DmIu-i9MkYErmA4p9ogqA
Message-ID: <CAHp75VdxDz4hG8TH2yGbQ1CmFTSd8m+6sBfuvD-aybuXY9SoQg@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] gpio: brcmstb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 2:46=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 07:45:17PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 20, 2025 at 12:33:14AM +0800, Jisheng Zhang wrote:

...

> > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > > -   .suspend_noirq  =3D brcmstb_gpio_suspend,
> > > -   .resume_noirq =3D brcmstb_gpio_resume,
> > > +   .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > > +   .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> >
> > Can it be DEFINE_NOIRQ_DEV_PM_OPS() / NOIRQ_SYSTEM_SLEEP_PM_OPS()?
>
> Yep I agree with you. But IMHO, it's better to make the
> DEFINE_NOIRQ_DEV_PM_OPS() switching as a seperate patch and merge this
> series which wants to clean up various #ifdef #endif usages

OK.


--=20
With Best Regards,
Andy Shevchenko

