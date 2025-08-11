Return-Path: <linux-gpio+bounces-24142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294BB2033E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 11:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 375EC1896A86
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 09:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D53C2DCF74;
	Mon, 11 Aug 2025 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wDTP8Tc/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B51A2DA746
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904321; cv=none; b=ioKzbMYUgrUj0J73ctUtcdCM9rS0S8rb2/N7MW6/8L++yh4PJfTXcUOpc88xddHPOwcQ+kLuKHgX8c8mrNIHguLZQXbY5yOhBrloOj9trgHTlsZNzAiDUdz2Hu0jPfghkTXvDITUdDSSvRz+EeObv3ddn7aS2wDfGvyctGp3F3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904321; c=relaxed/simple;
	bh=C1qeDwfEftv9Qtc9NbKtJwR0I8PI7F8FTKOgTziQCs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQOo3tpxLfb4tmC8h2Rve6Etf56kveYj4UJjfGpFwyaIab993o4bRLvi5RgDHzW3w0uvZPh1O3s7FzQk4fEoAf6Yx10qA1sL8AAGfG+sLKc2eW4sBgcns3lv6RwOgESRkpVuqYPPKkvzTcA9sHoS4vSz5Wqugb87jtyAlO8rsok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wDTP8Tc/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-556fd896c99so3558708e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754904317; x=1755509117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1qeDwfEftv9Qtc9NbKtJwR0I8PI7F8FTKOgTziQCs4=;
        b=wDTP8Tc/xSAcV3FGVSEZUXpg513zrACzLoc6f0idkbwpC/MlqlPzktfUIDkz6raifg
         /zLdKEEMCgEA2tzqk2srcKx+gDeSeEZKev1tkQRqW4KT/KMUasctixOSzCEiqkyHbPT0
         NommpQ7GKeyyuKeRd+HtEGmx/sBGmV/4V0HSshZsTVgzDjJjzt5PqEZrggIxNJ7tdcr0
         bRwZCo70bADHyJIT0orxARooOvhJ+WlyWo/SMVdLUhoQCc52GPUHd12FeXrXEQevtbqM
         MsEu0q8JxYKDT/wv2v2NOSgwURR+WPsTvaVCX1Vdg+A8RzQkUlcgA1HhJ+j0lDB0Bi/3
         PZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904317; x=1755509117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1qeDwfEftv9Qtc9NbKtJwR0I8PI7F8FTKOgTziQCs4=;
        b=NHcXdMeRq0TEWBzO5cIEWBK6rOeH+AxsOAGtNDUXh5O+88ndBpNtKQjcjdamV+BWCh
         YL2fehmygCwSbH2ItLpod1nKmju0cjnlWEgMVZXbL9ECTb8QA5F9ZFNOenvUWr0fm4L0
         oi/DjNmEo3GiKZnexYp8xOvNkRpWJkfnyFyr/NcBfCSvXWRc8J87flNifQbI6pVSuhdR
         +Ow4Jmuao5OchPCsXJvh/nZv8aWb57cT1Sj2lxd3+59JN9N+76+oHWfS+swg+XdaUD/r
         IIi5hLt7k3htto3Ds2uGo1WgHJQSsRUgpRmDpsG6iZA0CyqPIni333+ivh+yUxQ9JqEN
         74rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZGAQWOUTfNNr/yytw8EtX0xVBPLaPz0ZUyuGJhMwRCoxW4V6VtzkyVr5WiGSRVHdDx2BIT9UVjzn5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BL7cQyJkMicaKWfDsvG9KsFmsWoD1BADW7XcSetsDzDfL2DF
	j4zBd/D5on+JpwYt/51ZWAher2nRNJaeg7idZ0SPs8stwobHMJTmpmss9Spy/bApmb67Lf8uzRS
	UJ8nhKdz4goi0WL/b5f4tVsExzf1SgRIfo4Szg9lZGg==
X-Gm-Gg: ASbGncsNDxCvl21s19IIi1YeShRaRc4veCV2NFgia8xGuwdUJpY3q5361X5iC9fznud
	lgViU9AEee1OLjTYyxEitowmaRXJFfqvoVs+RitWiAtFkKeqpriPm6ku8Q+0Y0PczF0EgkCVbNL
	qus2hWYOhBIV6E/Al8gJAPaUnav6x4moGUUCgy7IQ4HwpuM06wGZmduNbAlGGWXOL7Idl2rZJx8
	qj46WY25F+7wYFZDZiJGNi/ncbB2owYYaQ/OSk=
X-Google-Smtp-Source: AGHT+IFEJ8Kr/7UZFUl5DP8ogOjUFv7USaGLp1Up0YSuMufZWuE20hE2f9lNt4hFnaJMoKk5CyywiZa15bQxtX2o7xc=
X-Received: by 2002:a05:6512:1582:b0:55c:cbf0:9f2 with SMTP id
 2adb3069b0e04-55ccbf00abemr1611941e87.39.1754904316634; Mon, 11 Aug 2025
 02:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
In-Reply-To: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 11:25:05 +0200
X-Gm-Features: Ac12FXyxTrtG2C5wrpdI0tEHXQwjM85EraScv-lGtxmCx_tl-04aa508XaY2bDg
Message-ID: <CAMRc=Me54AmqRJ3pZFfP3L=Ua5qqk2z_ZwR6FRfafOoTCxmy2g@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 11:00=E2=80=AFAM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> This is the eighth version of this series. I just added a missing header
> file in gpio-aggregator driver to fix a build warning reported by a kerne=
l
> test robot [1].
>
> [1] https://lore.kernel.org/oe-kbuild-all/202506092324.XqSwWl1z-lkp@intel=
.com/
>
> Best Regards,
>
> Thomas
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

Thomas,

Can you please rebase on top of v6.17-rc1 and resend? I will pick up
patches 1-9 and provide an immutable branch for Linus to take the
pinctrl patch.

Bart

