Return-Path: <linux-gpio+bounces-5139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A9F89AB25
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 15:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C298A2821B8
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Apr 2024 13:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9B037141;
	Sat,  6 Apr 2024 13:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFFF+m26"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F551EF1A
	for <linux-gpio@vger.kernel.org>; Sat,  6 Apr 2024 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712411587; cv=none; b=AUpvvyMNzXQ2FD6jCrFz6jWuentF6hMLppl7uTwqorOSklOASJEEx+Vs/tXiDfdzp7Wjdi35hU96aOC5kElaf5eDRjYPbjXXF3BXnMKOyTcnv7EzfkvwoLOoeXU6qnco0zdQ5NN8vGDt7osonEoEeVkD2MMK6h9g/eCIljuQWzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712411587; c=relaxed/simple;
	bh=vAU2iG2TWkwawDTo71vyhUdvjUS5ZLF0D7oQWk/9U0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2fBNK6ASfCV6hFe4/qp2WL/WJc2SEbKXEJQcAALgzST9SRYVFT6og02RO/rruvjvzDgBsQIvyaN7/POq/I7gEDoKtQFqU1N/bcqWClx7nlELtk/joFX7964jTbJBGr2hg8sHj2a1il2/uNrvPXz7d46n1vnulNu1beeY7YjOSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFFF+m26; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a44665605f3so341189166b.2
        for <linux-gpio@vger.kernel.org>; Sat, 06 Apr 2024 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712411584; x=1713016384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAU2iG2TWkwawDTo71vyhUdvjUS5ZLF0D7oQWk/9U0Q=;
        b=VFFF+m26gbmIua7vJE8FZ/0ZTtiNfN4tquxGYSXg+H8MsAT+OxxYvg1hfc6D3jeKqE
         fpyijx4B6iTMr8Xs6MhSFsBtDxeDRDhKJRe9dOtfA2BoNvbtTPgEa12S9QYOF4bfkCB2
         nqbW6P5+9CGF33YbnQ6O+HL9Texc0wd4f5nB5s1QuzlRhjKwDTEjBOR/NjGAG7OV+CC9
         //7DqR8wUubzhCHmWQJT5ID97UvEai/mTF6kaLbwaYgVxqgNmRI1KWpeFh028nf3zFsC
         6HSOvBVeQ/rsCpLoQJilwo+9nSKuu1E/zo6rqvBIHVGJ3hIt2ypooNt9qSTkZk9Ghw7H
         +0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712411584; x=1713016384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAU2iG2TWkwawDTo71vyhUdvjUS5ZLF0D7oQWk/9U0Q=;
        b=dsueID+JUIt+PJoNZ5gYiQD4tJmfMc/15M07qSiL4lWNfVI1Q/yyOTTreRwguW04uF
         lx5FxToYSNjhYg0lPIRAsW7kcQcCmZrymwLQpRsDaglEpISWn6LGgQ8jqRFVw2AHaoB7
         nKGHbW0O09RRUw3imxYAsuy8K4jUHS6Y23p2OsJOXQVX+Y0IwRPEgEhWq+Bt6ycpJ+fd
         le3ZW3HDgPArjLy1w7zeTUNdgKdJyWl+EKLm+jvwTABY8Wp+pTH4wEi8swjSiRT2ZEXl
         Hs/NuJt7ACyk93rpYYjoeAK5e+ewIGxYRyHyLZaWEK5Ojs/aoX5kiAnKfB+TEG7cUY7x
         3ePw==
X-Forwarded-Encrypted: i=1; AJvYcCVr9env7fo01qd1evebFChSg+0mwFhQvfOzf6S8n+uwY8KEgzXXHp9xV7gO0qB30O4fQg4Shnyuh7SSYN3wJKHGeI2meiZrAJ4RSw==
X-Gm-Message-State: AOJu0YxAZJpOME0kK6nu3BDW2JgH0seTJyVT20f1/wi0j+i18PJ1Arx+
	IWJR1UOceQIhVEWMOA69dDnCiAkEz2AGoucifNc0qaICSrhLngvWzHIgl509DRP4TzMP96ASBzz
	KN9pLyVH5wtANFd8D/TlsZEBu434=
X-Google-Smtp-Source: AGHT+IHjcNPjoMvLVm/oKc1UV+6VlXEuhtKPD0taSJpnx8eNiJUThhTTNPIr1v9/x3r7cT/fJLNUo0Noo8R0BNdxyqE=
X-Received: by 2002:a17:906:78b:b0:a51:a0c4:5c83 with SMTP id
 l11-20020a170906078b00b00a51a0c45c83mr2294515ejc.20.1712411584054; Sat, 06
 Apr 2024 06:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240406123506.12078-1-hdegoede@redhat.com>
In-Reply-To: <20240406123506.12078-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 6 Apr 2024 16:52:27 +0300
Message-ID: <CAHp75VdmtmV4eEdohrbg9zqbG=mSMJhN2FV9AHWojtQe+hSPBg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: baytrail: Fix selecting gpio pinctrl state
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2024 at 3:37=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> For all the "score" pin-groups all the intel_pingroup-s to select
> the non GPIO function are re-used for byt_score_gpio_groups[].
>
> But this is incorrect since a pin-group includes the mode setting,
> which for the non GPIO functions generally is 1, where as to select
> the GPIO function mode must be set to 0.
>
> So the GPIO function needs separate intel_pingroup-s with their own mode
> value of 0.
>
> Add foo_gpio entries for each function to byt_score_groups[] and make all
> the byt_score_gpio_groups[] entries point to these instead to fix this.
>
> The "sus" pin-groups got this correct until commit 2f46d7f7e959 ("pinctrl=
:
> baytrail: Add pinconf group + function for the pmu_clk") added support fo=
r
> the pmu_clk pins following the broken "score" model.
>
> Add pmu_clk?_grp_gpio entries to byt_sus_groups[] and point to those
> in byt_sus_gpio_groups[] to fix this.

I'm wondering if it's possible to add some code to imply all these. I
mean to have a comparator to the _gpio in the naming and generate them
at runtime and add. In this case if we add / modify the original one
the rest (for _gpio cases) will be done automatically.

--=20
With Best Regards,
Andy Shevchenko

