Return-Path: <linux-gpio+bounces-23288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62267B056D4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 11:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8BDD162D4D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 09:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82C527876E;
	Tue, 15 Jul 2025 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GQ7Qk/8E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D01E34545
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572470; cv=none; b=lpP75oekO2sVQKp9zPeH8dU6qbg9T8ljaM8z2fE9zcEm1W5NhSJkd9spu9SMZn7NA0S9HcY3wZHgFsa/6uRXT+i0KadNUNxSUNAV5NSyt4AQpVOxE33OpfJ35bQCdNxPQLOxM2oW9ymljWYfcAM3pErH1rf10Gu47RDHwE7+zNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572470; c=relaxed/simple;
	bh=ZPnUYFeXte+wGcVrHku95wWnH+WOjYkhkT1NcGR9f4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDpPtdgGcv1URSwYKgAiauduJZ66OYRkPQaOmCBrgh7bHcWiNqYebtaSeud15c9906HKH+sw2iLi+eCHOHBgnJHZYekwkuix2W4e20NNNuhrs+WNNOdkyMeduCXYCZQXGrGvX0N1lfMLjD4TEZ7sd0u5PsO9Nu4XLbIRDyu60fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GQ7Qk/8E; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso5801861e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752572466; x=1753177266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9frFAIY+V2SYHwvz5/wQBn91CDy5jKl/J419A9/KOeg=;
        b=GQ7Qk/8EEJYUnD3FDFALrr/NWQhJteg2M+WGMaP0OJytsdaf5ex8iXWf1f5cnYsblR
         yUCEbGcWGYy8Ga5l949Ngm1ggqCOzrUo4hO/jwdqfTaEGdun3i8ShN53BhYHBzFcGAKa
         Dq93YB1iAgZEJOxBbq6MwKqhgDuQIseAfsZCfkWOKB/MTP5veZvI0EL3mfQb7JN/FNqg
         V9+6PpqXNtR/KuSJjN9KhUssQv6rr6KAzy3X5r9HDbbB9bQnRxDiyNpLl+P8egUy0nqx
         U4ZL/EAmyST4eLdnnXvNFIChiQuJlZvL8+mszrEAba0t6zJXOiF8o/qo2yb/u4cSDTtT
         JJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572466; x=1753177266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9frFAIY+V2SYHwvz5/wQBn91CDy5jKl/J419A9/KOeg=;
        b=aia9f9ALSADGbLUZgX7VpCbUjAHiHCsiuplHRQJKr8Mn+oYypAfkK2aMo21SN1nI94
         50WU06bOsQp6rFkzHStJMTkzluk5oos0SzQIXx+2I/TL+OEmsiOtTtJjtZz5yl4Z41Dg
         qbeLSrV4f9V2cd1wGvJtIM2duuaCMxvqFL11XcGSEUyVYEOVW5hmCujcSXhDeSp9uwd7
         +cVQ1qhYFwQQR/xk9MU5olvepr1+mS8SD8uy6iYFH3bcoe3acr+WY9GXvsBBoRNYrE+q
         d0FbPH2KWaiF4E0P6ylPqlMD+tHNfzegyi5m9wZj1C28TSp5JJblTPiaYRssiXVSj3GY
         D2+A==
X-Gm-Message-State: AOJu0Yz4KIWOTZZWZXzWc4XCu9St8Vs9d3CkH9amnogA5EXIcfPLE7mh
	AvmV6exrDVqfmkX+wwHc524jU6sRrg/UaCKEonpD56meqajXMLzffOiFImP8mm4FTuZjXKiwuUU
	IkpbfWSgPmK1RkerCbO1JfOo12C9qWQpwXqXy1AZQ+g==
X-Gm-Gg: ASbGnct9c27kolereLTitMvErEQuwcBd1h7t5WZYRY/+fm9tW0Hk+KpMfrdQ4ThcTEf
	PCB1cHuoN2bfkQtd3JYoTvGV+1AkqXfW8fgsTrlEB6GlOT+TmQJ+jLsVs2ndZ6ZOezHU/PYh/XN
	e+8JZ2qtYQFTjEHDd8QsQAu3scFZNlookemGy05Vboc5VcE4IwguxzVy7ms1O8VcqRl14iNALgf
	V6FrXJ6oMVOxyDaxBpMRxSTqtG69vHTnlcn8F4=
X-Google-Smtp-Source: AGHT+IF7l+aCCh53vGqDZPEeYXjKfcKqcPTJgVzgqxX2aBf7xEZsPYAkQk4pp//wHlpjlPFXJK8omNM6lxfniJe8cCc=
X-Received: by 2002:a05:6512:2386:b0:553:2e59:a104 with SMTP id
 2adb3069b0e04-55a0462c27amr5099913e87.37.1752572465964; Tue, 15 Jul 2025
 02:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aHTAs5TtETHMUw-Q@black.fi.intel.com>
In-Reply-To: <aHTAs5TtETHMUw-Q@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Jul 2025 11:40:55 +0200
X-Gm-Features: Ac12FXyIZRy5-zjS6vp1S_r7Drnw57v79JO8iUTsnA2cPJfUMHUV0dRVv-maMXI
Message-ID: <CAMRc=MfU4fpWvWbfAUi1fDju+rR64ztokq9aVrfW4bHu_7j6cg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.16-2
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 10:32=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Only a single quirk for this cycle which was in Linux Next for a few week=
s.
> Please, pull.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.16-2
>
> for you to fetch changes up to 9ab29ed505557bd106e292184fa4917955eb8e6e:
>
>   gpiolib: acpi: Add a quirk for Acer Nitro V15 (2025-06-09 23:09:24 +030=
0)
>
> ----------------------------------------------------------------
> intel-gpio for v6.16-2
>
> * Add a quirk for Acer Nitro V15 against wakeup capability
>
> The following is an automated git shortlog grouped by driver:
>
> gpiolib:
>  -  acpi: Add a quirk for Acer Nitro V15
>
> ----------------------------------------------------------------
> Mario Limonciello (1):
>       gpiolib: acpi: Add a quirk for Acer Nitro V15
>
>  drivers/gpio/gpiolib-acpi-quirks.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart

