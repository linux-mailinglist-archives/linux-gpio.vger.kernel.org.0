Return-Path: <linux-gpio+bounces-4018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E003286DCBC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 09:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F0E11F26B66
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 08:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E9169D1F;
	Fri,  1 Mar 2024 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mRZc7NcB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2252F69974
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709280609; cv=none; b=ORjs+YxM8COqf3cVyYTWZwH/UHpkek01PU/94UsbjIH4fxSAhabPxBsusSSL575KVHFDxHaypgBRZedBi4S3DaMFKbmZ4gUiusz+kLPv8nJLom8zl0qQUo6iLq+y3DOd0vLg3+1N1i7D7aMt94slI3Hqye+XBfMAWGlhBz0/tC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709280609; c=relaxed/simple;
	bh=Gt24m6VgPEoo+PtbPdWbeLDUXQElGt2V9/LMi5WVxt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFFGQ/mu+CnbQC7ZNncSF5bsu70YFi4OI777fepAsE9I0p1DxWo/QwS1NKEqaKLNQZJMa1NR0+AU/z8hFLZ/ZZ+0jlnVHBEiTaiQP2swTzKZ1Q9+ny3cgYN3NOfFJf+oTfAQF37W8VnoabYswxNfUs0cTQzkCkzCFfZ/6agNfKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mRZc7NcB; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4d35123b0deso446239e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Mar 2024 00:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709280606; x=1709885406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wk7y2xtTESbht6nwVgBTMrqKWojYrtrLnTeVVOeEZa0=;
        b=mRZc7NcBp+gOFQ/6/ocXaCzNH+8VJaMjzW2XdKDDbkqql3+vZd4xDxCifXAkegVbs3
         aU1e3upsRci7/KXGB9zyeU0UsAJcVdErE8A0QFnTaBfrGSTuKXe03cHDqqHXFbBvDy9f
         5xP4FgBI23A249QKbnqEIsyA+LjvwnqS4O88EBeqxo2UUTLAr1bMlnrRnn4D4Ke7xR6P
         9RFsaBxznZKQif685LxEG91kL7OnXs64Kuv3mUwKVJXJLaOgUgVznLUDya90xyty7eW4
         R9PhBqQCMF+aeuyZsUsHRyUZZrpFVb3XcQKRkHpF9YWgHIuCZdN559eC0TOZxNmcXPSp
         YWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709280606; x=1709885406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wk7y2xtTESbht6nwVgBTMrqKWojYrtrLnTeVVOeEZa0=;
        b=vo0bTsd2j2rvXo4FoHc1bhEADFb0O0lhZTAlcUqCXVosW8rRQ9SouJZJn6Qz/KlRFn
         cj/3YHtvQ8nRB78bPTK5cDikbuWI7pMCNOrrIo1I2HqNWQhUIFDtHcQxwoIIFNEyym1C
         ETx9BZ7K7FzfMF23UmHHVwR2wxQ6PJ/ArO1WqdCvU5MbMJpNEqy/VoDnHilW8KdD1JH/
         /WfNdrJBnacRoic415M7+XUrRG31Tci9b2D+/yJKKvBfIUEHNyiPaTBdFEKKDSNz7inR
         LcYpnAZfck3OzWelEHrnoiIuGFizjlV5lcVykSXTc2v8taA9eazWdz6n1jbrcqvUZZgG
         pSjg==
X-Forwarded-Encrypted: i=1; AJvYcCVZV6pWGlxQTpLMjoNSyFL8RA+pgqjJR9o9jTF2kszjSBWh+phsfMUde9Uu3ZKtjfQnQnBPmfxouaOFBEIOeyb+6pIdMaSNNz7KZg==
X-Gm-Message-State: AOJu0Yyjqxe1MDzkp2NpwQiw0CnLikJcr0HdmRY90nTPmnPyHQI+HMqF
	cfrZRyQ40Fka07PU/LDGmV+Cjqz7zjYTEtzMjb7/yIvRml45UesFjBR+k7VAa9086L069I5Zf16
	HAsByMyXgzW8PIGkAhF9FC4slb4HEE8D/pEQM5Q==
X-Google-Smtp-Source: AGHT+IH0cpHkNFw5IVYbKUvxASmoajZZoX8JeRxGPbUsjHJdZ3rD/qnh+2jzEY44I3Wi8ydUmSlgeHZVgglRmImhN4U=
X-Received: by 2002:a05:6122:6ae:b0:4c0:1bb6:322 with SMTP id
 r14-20020a05612206ae00b004c01bb60322mr594744vkq.15.1709280606100; Fri, 01 Mar
 2024 00:10:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229145303.3801332-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240229145303.3801332-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Mar 2024 09:09:55 +0100
Message-ID: <CAMRc=MfE_OUTU12s2eKj-d8Q7uD_52SrSOFzx2yq_D+fy0rqPA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpiolib: Align prototypes of *gpio_count() APIs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 3:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Two out of three GPIO count APIs take device pointer. OF case clearly
> does not need it as it immediately switches to device node inside, and
> ACPI abstracts that to struct acpi_device pointer. Unify all these by
> making them to take struct fwnode_handle pointer. This, in particular,
> will allow to create fwnode_gpio_count() API if needed. The need of that
> was discussed here [1].
>
> Note, no functional changes intended.
>
> Link: https://lore.kernel.org/r/2ad735ed-963c-4e75-b83e-687ea2c0aef5@alli=
edtelesis.co.nz [1]
>
> In v2:
> - fixed typo (Chris)
> - added tag (Linus)
>
> Andy Shevchenko (2):
>   gpiolib-of: Make of_gpio_get_count() take firmware node as a parameter
>   gpiolib-acpi: Make acpi_gpio_count() take firmware node as a parameter
>
>  drivers/gpio/gpiolib-acpi.c | 13 ++++++-------
>  drivers/gpio/gpiolib-acpi.h |  4 ++--
>  drivers/gpio/gpiolib-of.c   | 13 ++++++-------
>  drivers/gpio/gpiolib-of.h   |  5 +++--
>  drivers/gpio/gpiolib.c      |  4 ++--
>  5 files changed, 19 insertions(+), 20 deletions(-)
>
> --
> 2.43.0.rc1.1.gbec44491f096
>

Series applied.

Bart

