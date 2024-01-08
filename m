Return-Path: <linux-gpio+bounces-2061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01052827823
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jan 2024 20:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3035B1C22E44
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jan 2024 19:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9225F54F91;
	Mon,  8 Jan 2024 19:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GlG+GYPB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569A54F85
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jan 2024 19:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5e734d6cbe4so16142977b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jan 2024 11:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704740945; x=1705345745; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DdFDb54bQ/iPZlWQVp8olWIpdQfHr4McuEO6nhlwfQY=;
        b=GlG+GYPBaC93H4it9eM8pRSdwurFyP2Ql2YuSkEGmab95FTEjZ1k6R6yI37Vm8Ux0o
         Wmi931NCs9UBulRCUo8yNib1/G4lfTfNbsP40owBq85u0UpZ/HPKoiRO50cNR52ziYga
         wOVmUYSZ1ZJqDk4n0q7p6oQg+RqzFJimvrofs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704740945; x=1705345745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdFDb54bQ/iPZlWQVp8olWIpdQfHr4McuEO6nhlwfQY=;
        b=uTg5Enjj3r2Tso1xyHf3dQgIi1Ye/pE6lxjNAW5HRs7srdnkLJNE4tYcrqwh4e025g
         VmZwGc36bbutEjWLkFR6wIciZ/pi/t0a+gH0XOF6uptaaOJb4BkOIaQd/2mRTBHae+mS
         rZm5iszL9/cKU7GARz50cteuIF/A4qAnh3Kha5qDGTafVyNEuuo3xF9Jiru8OB8a2ke4
         J84f/Dodu74v9EnaQktN0jaADehxSYuhNLCj1uFZLIqFGBwhsS9oQxvmSN31k4zKqvak
         P6wlgVILOjFGB6H3ts0I0dYV/YoGYGjTrAQYAMDC4I90layqjWlLU3DbgrdHp1lVksDS
         iO+w==
X-Gm-Message-State: AOJu0YzNvxoKZBf6GMnzN3c4i4A8YqqZ7XF+2nqU/SNl/jWuCMxB7fxG
	AWPGXLdIq6X5rYBJ+5ISP7wm1aSG4AtvSKK1+KNBnvRqnm9n
X-Google-Smtp-Source: AGHT+IFqbTaQBwF5KFHSC80fhApdUGgPLP6zXYivf0vKMqkNEHamGGwAXksyQIg4izP7sJkzpmbX+Xe8BuslOn3+lWc=
X-Received: by 2002:a81:f106:0:b0:5f6:dee2:2b25 with SMTP id
 h6-20020a81f106000000b005f6dee22b25mr2099819ywm.80.1704740945135; Mon, 08 Jan
 2024 11:09:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102210820.2604667-1-markhas@chromium.org>
 <20240102140734.v4.2.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid> <ZZlnNR1-yKLSIWeF@smile.fi.intel.com>
In-Reply-To: <ZZlnNR1-yKLSIWeF@smile.fi.intel.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Mon, 8 Jan 2024 12:08:54 -0700
Message-ID: <CANg-bXA+zuPAYHKaYihkPN1W3+78gBx_Edvhb-a6DqD_adJeaA@mail.gmail.com>
Subject: Re: [PATCH v4 02/24] gpiolib: acpi: Modify acpi_dev_irq_wake_get_by()
 to use resource
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Raul Rangel <rrangel@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Len Brown <lenb@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Missing blank line.
> We put a commit message as
>
> $SUMARY
> ...blank line...
> $DESCRIPTION (can contain blank lines)
> ...blank line...
> $TAG block (may not contain blank lines)
>
> > Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

Looks like a nuance of patman I need to iron out.

>
> ...
>
> > +                     unsigned long res_flags;
>
> Why not calling it irq_flags?

irq_flags is already used within the same scope, although it's
declared at the top of the function. I'll move the declaration to the
scope where it's used and rename irq_flags -> irq_type, and irq_res ->
irq_flags.

> > +struct resource;
>
> This...
>
> > +     struct resource r = {};
>
> > +     return ret ?: r.start;
>
> ...does _not_ cover these cases.
>
> Hence ioport.h must be included. Did I miss it?

You're right. It didn't break the build, which means ioport.h must be
included indirectly. I'll add it back.

