Return-Path: <linux-gpio+bounces-20209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A59AB7EB6
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 09:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2184A1BA2EF7
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 07:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0D61FDE1E;
	Thu, 15 May 2025 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DoZim4mZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD4B219E4
	for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 07:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747293685; cv=none; b=U3a4zqS4eecdacVUqajiUGZS0S8b20KhbFguEUusXoPcsrTOtLlLmvPTmB7ZajTEb1CFfjCdgQXPU3TiA5Lk6Dt834sdfwLGbMI3b6gs5uzvCprMKgWgWo4/I1xLE9d3buIyM3TS828qHrABLTClDec8ebt5p1wq9lCwBszXff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747293685; c=relaxed/simple;
	bh=rFA23rO8B1u3kvxa4WIKw/RxaGLl6GEtW0gjkkQkqnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYTJ5w5IdJJA4gkbmUp/UBXWv1PXdVMiOX9yXINfhjpH5BGl/UrG/xILOUQxXizcDP9Ib4QC2s/xVeekGyQZAAOHeWsA9dQxQnuzy9R/iAAlcmLoGl/74opSlVgI0vw5Rsp4GGJ2vXiL44wKRF5p99QCUP8+MSsU6sToDn6RB10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DoZim4mZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54fcb8b889cso547400e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 00:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747293681; x=1747898481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6YK9RRVMXkVGqlU6GqJxPV6A7A/9haPaSrRoUXo37E=;
        b=DoZim4mZARrtzj7AnQpB3ITf5KOj5QfSWZyAVA8sLcfWoPRdLWHMynnKR3U6XRKzC0
         ks94JYHXBT1VgCvckLijuffJaAjaD5wy4HCHf6TreUkywkmhsbDZ6/EIZ0tthgngmaHz
         TV19Vh4VWhdVGKPQnIt4Od2/CqVbfSieM6m+PfDop3KVXhDWhBw+rzf/ySNS/UZvj7bY
         OnhWUTXL/+FzbWiiWDXUvS6h9vYNnefybU8gHgtZwisfRtvN1cFGsZQyshdfkUR8ilS1
         q9ncl/JIfPPvCeLClbw4GqyV1olE6hnECW6Lv6qXr2HdNWUI6JF7+haWW7hv/tEb34Wz
         N0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747293681; x=1747898481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6YK9RRVMXkVGqlU6GqJxPV6A7A/9haPaSrRoUXo37E=;
        b=uhnHYHCRRGHJnwCMRr81PxwjTnMLtOoI0/99g+hFJ5rt8u+P5hCmasJQXON2ZxcoG5
         ZEPX9acdE/QfzWlK1TntY3dEGpZfl4l9x7YBUiv8nF1gRavbjY+HuYczPh2DBoFR7vpd
         5bSs33lsAYWPINCkGapMnwcmiXJKJbJ0O8Na3Novq4zYGBfdNR6uEkj7KTUGH6v8JGMM
         HUGgd+fxENtmRQHuJdl8GHN3s/OSyUVY0zxxDloPGY5iVSaJenmXQX6NHvCRgVnIjuXH
         bou1hAC+9P6b9YsqSFFenrqG4n2V4MTp13/YRzSz7I0J4uwz/ugcFZFgQp0AXxIgF0hZ
         TYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnwYbZ4BEs7/h90aYvNrL7wm3T73TrFUUjNu/m4d0PvDpc46F1GEFVR1PLp5PrF+DxSd9bMxE62iUS@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3elaeoqaYOIkYlf8T+FL5O4MphePRYXngCGkfYcG5QAZeUX8
	QgNWo9sv7JAJ89LB3wHELI2ucF4VxZlhgF/t5HAV2an47vTLcZDU23L8GfMuIWm6ph2U3Mxak8q
	nIzOMSZjapp/3fBIs/meDwnnH1H10NuzfckYMtw==
X-Gm-Gg: ASbGncuV8izNgxBS8dTcp3OM0BUFTB6gmq/GtZnU0YZKQyuW2uV+gnDtQCebpNbVZzd
	aG5M3xhSJzqOOC7FCkBucVejm+u8c/dC04aJoA2m/LuqGZN+OsVnJ/PNsBRXCt/XL1SlTH3uiwK
	trEtQe/FBpupViuMNmN9ckDjJ8k4U1X1nsvCRTg+uYrRs=
X-Google-Smtp-Source: AGHT+IEQDghWbCxuBbPh7MoxRvTvC4TcoQ8cazusXwqfZHPvPiHoVHrYr5jD67moVFO5st3g3yaGcaBX8eP9wX1a9UA=
X-Received: by 2002:a05:6512:640d:b0:54e:a262:c93b with SMTP id
 2adb3069b0e04-550d5f9ff82mr2562008e87.18.1747293681475; Thu, 15 May 2025
 00:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513100514.2492545-1-andriy.shevchenko@linux.intel.com> <20250514155955.GS88033@black.fi.intel.com>
In-Reply-To: <20250514155955.GS88033@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 May 2025 09:21:10 +0200
X-Gm-Features: AX0GCFunPKAkQp3YlQHAKcUwsKeCICBeSwG40YsLNZHuw00mxaGy5pSg_nbMeyM
Message-ID: <CACRpkdbhnoffwtwVTMRaUAGVEpLfAESQNOb1PvYOer=V+og97Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] gpiolib: acpi: Split quirks to its own file
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Mika Westerberg <westeri@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 6:00=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> >  drivers/gpio/Makefile                         |   1 +
> >  .../{gpiolib-acpi.c =3D> gpiolib-acpi-core.c}   | 344 +---------------=
-
> >  drivers/gpio/gpiolib-acpi-quirks.c            | 363 ++++++++++++++++++
> >  drivers/gpio/gpiolib-acpi.h                   |  15 +
>
> All this -foo-core things look redundant to me. Why not just split it out
> and call it gpiolib-quirks.c and put there all the quirks not just ACPI? =
I
> Don't think we want to have gpiolib-of-quirks.c and gpiolog-swnode-quirks=
.c
> and so on.

For OF/device tree the quirks are in gpiolib-of.c and we probably do
not want to put these into a shared file with ACPI (and swnode?)
quirks as systems with OF compile objects (Makefile entries)
and ACPI compile objects are not always included in the same build,
so having them per-hw-config-principle cuts down compiletime
overhead. Also it's pretty clear separation of concerns I think.

Yours,
Linus Walleij

