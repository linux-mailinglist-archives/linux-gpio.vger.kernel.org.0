Return-Path: <linux-gpio+bounces-5873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A35C88B2F8A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 06:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99525B229E7
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 04:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C569139D18;
	Fri, 26 Apr 2024 04:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ib1J2Mav"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E9781207
	for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 04:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714106961; cv=none; b=TQsWWhANmo97gUJJf7/HLfU4+mI32X0wZxaqdBqCrrPl5OGVPwZIdMhO+7Rx4r4an/egRGxak7Hj7V+XZjd8KfZ+ABgYAjpZRc/ohoVMTJxObhH4DcCNNfBKpy+loIWJ6zT6Mx6Ad5x5Bk8Jc4xhzrqTfVzQ6Ep6dL7CrQL3/r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714106961; c=relaxed/simple;
	bh=PEOdBz3rBE61xA8RJj8Kneft4NENI8J9eiJTVPha+G0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tP1rsWHgFvMjHoJpSKv8mOeJafYJZeWm8tsEUk9XPTnCoawRD0KW4/69enZA2HP7IRt/yD2QfLUElUFqPBjHHkz4px27y7rzEhI4ybS3DaeBeicES4QfnTDNtKBnGop+H2/U1ItLeSvyBVH39vaL4KXW7TArmm4bA8QtO2TsTJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ib1J2Mav; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de469a634fbso2069284276.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 21:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714106958; x=1714711758; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rY/c2hQHlJxJvnFu06tV7eDxiJDNiUEPqK+e33tme+8=;
        b=Ib1J2MavkZTM2xJCZdOSvsYusNPIYq8BvcQBEHkUPILsrVlS7CeQ/kDR8shflnvIKD
         9kW52iErtMX9u2xnPPphriR5ovHAGy2JOx23PacP0m2hU44Rcp7pHlXniQ4+dXqWYZ9M
         duOIOWtQo12Ej1P6UhQB8BZTad4BWEOcqgQ5Z9S+PWLDBq4wZ39mytxkwUB7eBWh7H2V
         FVATRFmmPvGrwZ5JiOvXVQBi++r7qnkyTt1Lkby7KoeAjo++8pNZuJbzwhZAL4QmCMGs
         +UIO2A8yT21HY7zsw97QSUbeFcyaMCIuF5rc5gWLESi7IWAizBsh5WPd2LETShMGrgX5
         FfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714106958; x=1714711758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rY/c2hQHlJxJvnFu06tV7eDxiJDNiUEPqK+e33tme+8=;
        b=Su9sW0v4tNu2Fiwkhjir4ZDzjJ5ahQPJVvCDdZMuL5Tnb4FaMqESDri53QvJs2yW3z
         VWo88SPsqkMdJ+NzgjcyFmKCmLhYmleJkkxKFPDb/R56UFCjelTkol/uEvPlY6SEAXxN
         5f07RU2DT/yiUHdXo8t0R9Z805nXSNJ2FTdqb4GAgGQvsDmNatdKnkb40EzEHnrh7Rwk
         5pI4eG7VUQi8wmQVEGRl6g7gFInyP6bngjX7y2rm0y/8e5ov6z+QamUKCw202A8Ky0aX
         z7PLaIaN09rWhQxVvEDfVFxK+Jyi3S9RWh3AnhdEhseNU/Ix6rPYCO/6YtiJ+st2fz3W
         tv4w==
X-Forwarded-Encrypted: i=1; AJvYcCXqPryGKC+AlEZKMs9xj4l6VQBIdTtlrdmqdbSMV6553tOSjJVYMGkpYOOBep7GPnZlG1BDKE2czvhG4GZxyMHCUuVa42znwf52FA==
X-Gm-Message-State: AOJu0YyhV2EMNMyIEDnzvG/xDQUcYfTNnH1jFErGF6aH7CSOTaADbTfl
	ydOefL/zc6bfuwKc0NknkGzd8BvPSzIeedaBzF1ldzUen+QZiAP5a3neBmfrOWp15C19bd1+6ZQ
	Kzx+w9qNfpmB2Es9jSeH2RFUapOieLILMGO2jLw==
X-Google-Smtp-Source: AGHT+IErT/fsXCbVqJ3OYw/9ydZQgVYROe+aIo2oX/8+uLnr9Z6fUkYr+folnvOO05V+FbI1cfo1lioyrXB+7rMEuSA=
X-Received: by 2002:a25:6885:0:b0:de5:5089:32b8 with SMTP id
 d127-20020a256885000000b00de5508932b8mr1539250ybc.63.1714106958646; Thu, 25
 Apr 2024 21:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410191639.526324-1-hdegoede@redhat.com> <CAPDyKFrkPm=JEaiwTcVdqtG0hePEu-D76ec89nzFiF2MxYOwgw@mail.gmail.com>
 <5ff49965-1e8b-409c-8110-1782143c908c@redhat.com>
In-Reply-To: <5ff49965-1e8b-409c-8110-1782143c908c@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Apr 2024 06:48:41 +0200
Message-ID: <CAPDyKFrzcoWYXoe83RvnroEKG6+a6O0+gPoaYz8QV3SLb4wZ_A@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] mmc: sdhci-acpi: Add some DMI quirks to fix
 various issues on Bay Trail devices
To: Hans de Goede <hdegoede@redhat.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Apr 2024 at 19:26, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/25/24 6:21 PM, Ulf Hansson wrote:
> > On Wed, 10 Apr 2024 at 21:16, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi All,
> >>
> >> Here is v3 of my series adding DMI quirks to fix various issues on Intel
> >> Bay Trail tablets.
> >>
> >> Changes in v3:
> >> - Replace "mmc: sdhci-acpi: Disable UHS/1.8V modes on Lenovo Yoga
> >>   Tablet 2 series sdcard slot" with a new patch from Adrian which
> >>   actually fixes these modes:
> >>   "[PATCH v3 2/6] mmc: sdhci: Add support for "Tuning Error" interrupts"
> >>
> >>   Note this is missing a Signed-off-by from Adrian since this started out
> >>   as a quick test patch from Adrian.
> >>   Adrian, can you provide your S-o-b for this patch?
> >>
> >> Changes in v2:
> >> - Address a few small remarks from Andy and adds Andy's Reviewed-by
> >>   to the patches
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >> Adrian Hunter (1):
> >>   mmc: sdhci: Add support for "Tuning Error" interrupts
> >>
> >> Hans de Goede (5):
> >>   mmc: core: Add mmc_gpiod_set_cd_config() function
> >>   mmc: sdhci-acpi: Sort DMI quirks alphabetically
> >>   mmc: sdhci-acpi: Fix Lenovo Yoga Tablet 2 Pro 1380 sdcard slot not
> >>     working
> >>   mmc: sdhci-acpi: Disable write protect detection on Toshiba WT10-A
> >>   mmc: sdhci-acpi: Add quirk to enable pull-up on the card-detect GPIO
> >>     on Asus T100TA
> >>
> >>  drivers/mmc/core/slot-gpio.c  | 20 ++++++++++++
> >>  drivers/mmc/host/sdhci-acpi.c | 61 +++++++++++++++++++++++++++++++----
> >>  drivers/mmc/host/sdhci.c      | 10 ++++--
> >>  drivers/mmc/host/sdhci.h      |  3 +-
> >>  include/linux/mmc/slot-gpio.h |  1 +
> >>  5 files changed, 86 insertions(+), 9 deletions(-)
> >>
> >
> > The series applied for next, thanks!
> >
> > I assume some/all these patches may deserve to get backported to
> > stable kernels, but it looks like that may be better for you to manage
> > by yourself!?
>
> From my pov the entire series is suitable for stable, so if you can mark
> them all for stable that would be great.

Alright, done!

Kind regards
Uffe

