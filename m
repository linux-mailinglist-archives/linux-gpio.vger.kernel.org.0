Return-Path: <linux-gpio+bounces-4811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CED50890FA1
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 01:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BC5A1C2D807
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 00:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF261171D;
	Fri, 29 Mar 2024 00:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fwz1Ps1x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE93182A1
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 00:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711672051; cv=none; b=lffgSKhT2mpAnmbiu7NEBuICnQihxUCCX26wRxZaUKGDguu+xaY9q7tPRU1B5jN0JezsNUZM1kqZXyCuvSS9HO+xC3hY/8C8GMRhPxXs8Q0tPjBjA063dLmKSU3aNiB12wR53QyM3p3BW/kiBUj9INv/LPFhn2EmGQfjgDz8LXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711672051; c=relaxed/simple;
	bh=4uZoi6R4tYJ16WJEHODsDr2Z0XIv07t8qsQd9IHe/QI=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ha9b7qaHjpdvSEB+V9dhSThFcwduMW1TrH+Dq5fAxhRdLazgmAnJqUgXqDIkHi121neSc3NifsLn58AMXT6zYcX604p6Dg+s7ymVbWY1ERCPnzUQPK++MyPa29IeUgdIGzZ0nL8zxq4+ZzxXnYYvjaJgt/rwKKJLRo9H+8I+joM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fwz1Ps1x; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-515a97846b5so1629417e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 17:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711672047; x=1712276847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TT5IF46LbV2sp7MvkMpydbH4CV7mnACWRZmlPJNbqIU=;
        b=Fwz1Ps1x+zpWHF3q1L1WP/GPTbtTFbicvpgr9fwzJGXo7ZCvpXYlAQrkeBp92P/mPZ
         dPhTUDh8bx5Ppb1pQeMg3PfSbBLS4ApkJZ+J5HCHa3aE6CKfy7FTzp8EF/6rKaReMwR+
         u64rH+0wbaA8ylAVgbjjO9yVUvXCPH/i56a48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711672047; x=1712276847;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TT5IF46LbV2sp7MvkMpydbH4CV7mnACWRZmlPJNbqIU=;
        b=O+ccKBsnXahYROuv5COTvVfgcnEVhXbOI0I2/DjwukGTjhf+zQApPZY1GHckf87BHE
         x1B1ixsJK01HZ2quDCutjQjGMX6eOzuA/5hBSriFsLyBAsSIxp97lf2XF5ITzrJSdwWh
         wgDqvNmKAwDKzJuuzaNj0cD3HjZ88582aj1yKpJNOTqI6AK7qgxqJ2+9HYwaeG32f5lg
         sgVllFQcOug/JmZrHYnnkvrTii6exP9C2f6SjhI2SYN5N8QQHXX7BaUpGnH+lsQyovNr
         LQIViwJ+MV0Mjw6zOAvbHQBprlTCw7gEgmnVyhM/MXAIFUA/Fp7IYRem09VR4RcgqVaJ
         TP5w==
X-Forwarded-Encrypted: i=1; AJvYcCWt2h2Kld0TqQfDkETg35i9DavO2X+rTUGu/88igiLhmG2Oa5CCmjHxI2IZgkHpHgDn69FwQH75pmEh2DhH2zGj5qPemcQBE6Fk2A==
X-Gm-Message-State: AOJu0YyvsIUy6m4deWussCZptTsW4ya/gV1dgoV1eYf4uxMhYjALHK3O
	SuaK527z6PAhRPzz49LlzF07RGqdaW1yWNgmzdmZingNCQxI3PSowgI0q4AOOYFvb4Zhy3JHdZJ
	z9HbjhSFoT8xbyENRVci34/vqslCrlrtqoHQv
X-Google-Smtp-Source: AGHT+IE8xq+rgjw4+GNlACAGsCekxMZImgqTNVGCyfejaNVABL8zRPZQ0ygAvGXw3IdOWjjc/7UeoW8BbOztxvb6/cc=
X-Received: by 2002:a19:a408:0:b0:515:ad80:566e with SMTP id
 q8-20020a19a408000000b00515ad80566emr579597lfc.27.1711672047665; Thu, 28 Mar
 2024 17:27:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Mar 2024 19:27:27 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240320165930.1182653-1-andriy.shevchenko@linux.intel.com>
References: <20240320165930.1182653-1-andriy.shevchenko@linux.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 28 Mar 2024 19:27:27 -0500
Message-ID: <CAE-0n510RRchFH44Up=Dv2C+oKCwyyjkz_YZvc1fNiq_v0uoQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: Fix debug messaging in gpiod_find_and_request()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Ferry Toth <ftoth@exalondelft.nl>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Andy Shevchenko (2024-03-20 09:58:47)
> When consolidating GPIO lookups in ACPI code, the debug messaging
> had been reworked that the user may see
>
>   [   13.401147] (NULL device *): using ACPI '\_SB.LEDS.led-0' for '(null)' GPIO lookup
>   [   13.401378] gpio gpiochip0: Persistence not supported for GPIO 40
>   [   13.401402] gpio-40 (?): no flags found for (null)
>
> instead of
>
>   [   14.182962] gpio gpiochip0: Persistence not supported for GPIO 40
>   [   14.182994] gpio-40 (?): no flags found for gpios
>
> The '(null)' parts are less informative and likely scare the users.
> Replace them by '(default)' which can point out to the default connection
> IDs, such as 'gpios'.
>
> While at it, amend other places where con_id is used in the messages.
>
> Reported-by: Ferry Toth <ftoth@exalondelft.nl>
> Fixes: 8eb1f71e7acc ("gpiolib: consolidate GPIO lookups")
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

