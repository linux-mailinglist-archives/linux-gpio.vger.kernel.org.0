Return-Path: <linux-gpio+bounces-28736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 350FBC6D82D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 09:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD31D4F7DAE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 08:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411C032C94A;
	Wed, 19 Nov 2025 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GEeosyhs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86513235C01
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541694; cv=none; b=pkkJ+bRUaonFggfz2DEEY4aTY4KcXTaip3f20uuykIuFwtC/h6WyZMnECLtsHkIUq98+yJqoFsKWxEg9kYQChnuVmObJbHQUrqoT6XW/G9+NRSKUtnPwW5bmaiTFInC5fgPTOfWE8bsddelPuN/ix+Lgq28Co2lr2Zbpp68RGk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541694; c=relaxed/simple;
	bh=0tYW5q+J+jg7p6whj8IUO6Cb0nU/tudUvZ0Jz0SMdOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWcO7YZ/7MrSmR1Iz9R1tgo/6Wk90sCO784P2hB++1SplHlKuMtjBNNTFFj7oflS9o7fZJ8vZwDMb/11Pp2tFXmt2UWIQ5FXKb/g5MR74sdpoe0pnFB8olz988bz1VzoUSMiJef/RQ7hBDCg9tl9zPv4O3zTC9Ojd9U9RVmjWVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GEeosyhs; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59581e32163so6447942e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 00:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763541691; x=1764146491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tYW5q+J+jg7p6whj8IUO6Cb0nU/tudUvZ0Jz0SMdOc=;
        b=GEeosyhsQoJIYWYI6yWI27cUlDtu/CMs7GHdnqK+yruIhYMr6fb8q7Q+JEPbfLf98l
         kKAZCfRmgmxmZ0/xRI9Fv9G6NfG7DEkekX1NWCyI7w2a2sBK1jS3h73xKlewS2iUUbrG
         2tiXfyNg4dHrYGuya/8KexlYUoZDkEVDSZXIWZIACG3wV4epEFpgIYJWJQm6UMgBHt7U
         5v/ufKRFCj85YTbEW0Vpi3JR7yFrkZPyEEOtDKNX+7rNGJZLiACtzPWO6yaZrvgHty5L
         eqkcrTVWn8LSkErhM0u5jtxnk2qARAV00PGrRvjG1yqO1k10B13SfbkOheF+EUKEEyXM
         EYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541691; x=1764146491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0tYW5q+J+jg7p6whj8IUO6Cb0nU/tudUvZ0Jz0SMdOc=;
        b=X6PyV0cQnNNleKkQ36L5kjyoPNYYIag2Eh1IrPWkWQW6oa3nvV600DtUyK+oWEekEz
         78qfVeUe5PtWeTbZUd2LPrbs/YfFFBZmUC1Uy9BmrOSj2qvv679Qkp6GjILfonseuuuU
         EBDqLRYW3ITbX+BSrBBbCtIpMFuzXIDIC8Bx5FB7L3XbqvmGX3F3mP1vpVH7pNJhnVP1
         eYdI/BRO0dFuZSAateUmGph/PtNZSCV1fWH49CopmCVO9WyS8+X/aNgNZPKUlIkw9m6V
         nTLFPNpwjyBlNNaGxL8GMWGu7gXOtvQW/30+sHCHtFv39V528x648vRNZS2cKbv5Fjaj
         LzyA==
X-Forwarded-Encrypted: i=1; AJvYcCUwfEdnuIce1gVyHB0nlTNEvwG+UfCKUh+E77zfF7YmoQkMpXyYl58bBy2w4UEQKaBJRqBTiXtiUlrR@vger.kernel.org
X-Gm-Message-State: AOJu0YwngxIYNw76p3skflQZTAnxyotGlnJ1eVDBLzxIuSBzPdoHrHDt
	+ZSCM0fSk8abXPmerC055HljWn2Lj9NwcACBHcUQqa1nyZG1ervWW/XMDZLp1bS4J8wtG1KpzjQ
	JPUOoRlxCgiX/La5aBHp3Ph0UG+DHmboUxlha5oENmQ==
X-Gm-Gg: ASbGncv4X2/Q0qpF9R4Kf+iys9Er6iulEDhp9sC82Tad8kWBb/ctXlXAH4q64Y+uP8i
	U2I986JKmKmFTBGwwolps0ux9iKBAB+1ZohKBgEttJIU9ivq3lhddPJKjSX66oknEUgRoD8Zjb9
	BcG+E4mDRtbgZwr7zW3XYoH9DPI2TZ3zlSBYkcBmZmBvuRiK+WBw0HHt7s0Kyll6h8FrerWdhvT
	ugbiUqyGZ2u0WsRVPoO+Sbdx06iclxvoBTvbYYGwZTZVW5tDgJuJtZuauZHNJCM6W74BSeUq/L1
	2xdC1cS6ySSrZgiJ/U0jwMWeumzgdH3CIJVHVw==
X-Google-Smtp-Source: AGHT+IFj0m70RpLnVgXYJHA6ZrQilDdAuqIo+7K6vtR/xPOdeU8j3GAvEUfECk9FZq+VJIeZpRNq/g4PD4+5OWBDboQ=
X-Received: by 2002:a05:6512:3e0e:b0:595:7fa2:acd with SMTP id
 2adb3069b0e04-595841b3bd6mr6122244e87.21.1763541690760; Wed, 19 Nov 2025
 00:41:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
 <20251103-reset-gpios-swnodes-v4-4-6461800b6775@linaro.org>
 <aRyf7qDdHKABppP8@opensource.cirrus.com> <CAMRc=MfD7ZbwU4akkCJNgmRPwgSOqSVi2-L2dJDOBHrfdD-yZw@mail.gmail.com>
 <aRy31U8EQA1DO/R6@opensource.cirrus.com> <CAMRc=MfNf+WMtSW=Wag0QHAaYzcRe9igrbOeRZiY92KmOH70oQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfNf+WMtSW=Wag0QHAaYzcRe9igrbOeRZiY92KmOH70oQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 09:41:18 +0100
X-Gm-Features: AWmQ_blBVLvP_bpG10Dm1xtqXbD_zmv80z_M4-b6LevLn7IDzPC_ItkNhEwKwzM
Message-ID: <CAMRc=MdKN4Uj4RZk=3L82c0-0Z0CihbAfzVK0zMBb9Tsjh3BqQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] gpio: swnode: don't use the swnode's name as the
 key for GPIO lookup
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 9:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> I have an idea for fixing it, let me cook up a patch. It'll still be a
> bit hacky but will at least create a true link.
>

Scratch that, I didn't notice before but we register both devices from
MFD core. We can just set up software nodes there.

Bart

