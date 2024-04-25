Return-Path: <linux-gpio+bounces-5863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111F8B2645
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 18:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7302A1C230CD
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 16:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A988314D420;
	Thu, 25 Apr 2024 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTCznw8G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EDC14D2BC
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714062133; cv=none; b=gE4Hnikd+rMu/YKhojMdGeKsxpU6Yfp3Nx9+/OmhKAmjAwwp84pglg9c+OYg8YA1QEIu2OJhWC7KA1cnalQu48N0NRW0FUmorTbNs7T6E9+3EUhlAMXse+W7Jya/gN4h5uiJ+Utv9wVf4YjgI3sXGYvsnFdpH0SGWZmUOyOSdek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714062133; c=relaxed/simple;
	bh=NPYIUp6jIY9PQ8ikjnrRZ5j4GlWdfxLCMFcklaEhFsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qN8Aluv3PCHPtZKZjX5icDt2X+RyZBmhbAiyrkk3P8sYeL9ufZzdgQp/oZsbMeB35GYPZKVzhDwKX4vZjmKQqGW92FMtyOctVx609d35uGf1tJINnYos9MD82zh8mQv83kBdmcFLwvdBc1zQ36De/JQvqs1rsKrHrH8QDZ+VtSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZTCznw8G; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de528effbfbso1383242276.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714062131; x=1714666931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K79KBPtPcWztYHUIKemEI+PZGidRnE/fUHigN04mppg=;
        b=ZTCznw8GsHnp7hHBfjbBz8jknzxjMtkyvarKDbzRh9pqCAcrQ5/xBIZcZ+YhRjNWiy
         yUPQpy88EzErkdx+xaX+YUEfCAULtD9ChgO7qc+OJ94KgMR3vB46blqQBr5z/nyafcca
         ihsXC1NRBFIpDX9aGEwXnWf8gpAbsFtOQFQXBIm1+bqZYZeWhto0KqDfBa7DHokbq8m6
         BxeEvZhx+LGpbB8kSDCg7IBWi00vxm1xWfcekTkr1sDcSa/hCBhrT4c/JHjdIBdvqGfU
         Eog76v/w4B33ClbeDrp/2XOTDKM0QN5rqP+gPVP2j4EJw3e7grold3jIe47z9+nE1hPH
         /pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714062131; x=1714666931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K79KBPtPcWztYHUIKemEI+PZGidRnE/fUHigN04mppg=;
        b=lvvb6R30aAbLn5JKQ/QJUX8dDsVa13Mo0cc5asKHmrq651tTQtaO0Oti2hDUrK/Jx0
         VaGKaINyC+086oPIKtTY56WSQoXxk3dDITf2K8JlUUiOSmnYlzG8GJH5D4pwmbT6aF5r
         bXEKibRC0lUnmPGzCWSn1RlPRxl7pzbX4KJc4RTgoACdKQinOBkVlFR0id8huAdifgNb
         yZdoAw0coId1+M400QBv3GRlZv+T7Gz/hE6wpwwc4vg1gbrRE+6/k3tTSuwm8ihnycGm
         EoPI2z1eh4oh9AKTTMD6uzbqb1aUDcvthk3uA5TGSjxsTriZ8yidUgdDAfbgSFJpmcEp
         WcBA==
X-Forwarded-Encrypted: i=1; AJvYcCXXNvASYqhJegnVgxJZUKVFJkrhLpsvAonU/YuuNlCNCnkpX6a3jtte9TzkHDrlV0cH+BfLOPosu+f4anN4GDUZVG5YVQ8yRemJ0A==
X-Gm-Message-State: AOJu0YzbRIUkfyMVQ5m5sMFtQtTkGZ633hU0rxJwFaO1i4JXV751xs/q
	p+8RZLlg9UurgJ4JLgzhSgt7x3M42vMUad55HQ/BOpRio54HuuSQoYWKP6VVYhqMo+bnFyPJ9ge
	JkOED2DEThwMMNT/GEtY6i0dQc/cSLQ3vtTpVNg==
X-Google-Smtp-Source: AGHT+IFTSx051iBTZTJNLHS0foAg1b72fhkCwf0yB6aJjwxbuYymy6qMskwcGJTMlGgNNfy8taVX4tPWEDKUY757x1c=
X-Received: by 2002:a25:850d:0:b0:de5:5a84:7640 with SMTP id
 w13-20020a25850d000000b00de55a847640mr150794ybk.19.1714062131045; Thu, 25 Apr
 2024 09:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410191639.526324-1-hdegoede@redhat.com>
In-Reply-To: <20240410191639.526324-1-hdegoede@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Apr 2024 18:21:35 +0200
Message-ID: <CAPDyKFrkPm=JEaiwTcVdqtG0hePEu-D76ec89nzFiF2MxYOwgw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] mmc: sdhci-acpi: Add some DMI quirks to fix
 various issues on Bay Trail devices
To: Hans de Goede <hdegoede@redhat.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 21:16, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> Here is v3 of my series adding DMI quirks to fix various issues on Intel
> Bay Trail tablets.
>
> Changes in v3:
> - Replace "mmc: sdhci-acpi: Disable UHS/1.8V modes on Lenovo Yoga
>   Tablet 2 series sdcard slot" with a new patch from Adrian which
>   actually fixes these modes:
>   "[PATCH v3 2/6] mmc: sdhci: Add support for "Tuning Error" interrupts"
>
>   Note this is missing a Signed-off-by from Adrian since this started out
>   as a quick test patch from Adrian.
>   Adrian, can you provide your S-o-b for this patch?
>
> Changes in v2:
> - Address a few small remarks from Andy and adds Andy's Reviewed-by
>   to the patches
>
> Regards,
>
> Hans
>
>
> Adrian Hunter (1):
>   mmc: sdhci: Add support for "Tuning Error" interrupts
>
> Hans de Goede (5):
>   mmc: core: Add mmc_gpiod_set_cd_config() function
>   mmc: sdhci-acpi: Sort DMI quirks alphabetically
>   mmc: sdhci-acpi: Fix Lenovo Yoga Tablet 2 Pro 1380 sdcard slot not
>     working
>   mmc: sdhci-acpi: Disable write protect detection on Toshiba WT10-A
>   mmc: sdhci-acpi: Add quirk to enable pull-up on the card-detect GPIO
>     on Asus T100TA
>
>  drivers/mmc/core/slot-gpio.c  | 20 ++++++++++++
>  drivers/mmc/host/sdhci-acpi.c | 61 +++++++++++++++++++++++++++++++----
>  drivers/mmc/host/sdhci.c      | 10 ++++--
>  drivers/mmc/host/sdhci.h      |  3 +-
>  include/linux/mmc/slot-gpio.h |  1 +
>  5 files changed, 86 insertions(+), 9 deletions(-)
>

The series applied for next, thanks!

I assume some/all these patches may deserve to get backported to
stable kernels, but it looks like that may be better for you to manage
by yourself!?

Kind regards
Uffe

