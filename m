Return-Path: <linux-gpio+bounces-5689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB68AAF51
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 15:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C92841C2257E
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Apr 2024 13:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2BF128387;
	Fri, 19 Apr 2024 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="doKKNFpX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02BA85943
	for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713533367; cv=none; b=VqMguFH6whgbjtBh9l9GmtLj2jVS0jwgQPYJpTy5YzbJkIkuXCz0aDi74oOQ8Uuif4de7rg0f7yNFgl+WQwZUTK7NX0iT3NE3tvx+PQHmZ683l5v+CGJcm65IW7qZt7yIUUM938SW8gnmXbo7tbNCQgzQtkk4Gdrll+tZhwt1fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713533367; c=relaxed/simple;
	bh=7JAiJ5Etf3MuJKuNZBjkja2+rCHW1cnBdM4LUduqTKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJLjjIzKQ71OOQ3b3Dtvoepb9o6vlZhxnRm0j5FPwpYk/3q2kiUzFuQqqygLzm0SRTqMsOcRwZPNKHo3hZs/Q+ulJCAhHdsovDt65wmCqh5F39S2TnMXJ+g70eg4F7mJHKFrWL+OspZApgWFuCJzRNxxEzStXzlvwVXIXi96y2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=doKKNFpX; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61ae4743d36so23182817b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Apr 2024 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713533365; x=1714138165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JAiJ5Etf3MuJKuNZBjkja2+rCHW1cnBdM4LUduqTKQ=;
        b=doKKNFpXWbFPX9Hk7DLkM9Zs03XuC/xLc1N2FAiVqVzFml+x+GA0Sd57E747W7pqXs
         8hg6JSR6s1ii8m5DeiT/LCpPNsZfJLHxHOB7AF8QBNhBgXlz2AxnQm1MOWpOnSFndsIj
         hB8tgllVCjXxje8dv2cBH9Qc9agmXUjz0Z/JxDmzolY+9YUhrXEwbbbtLxcDwBHiAHto
         O0ZRcbrAlifHDC9X685pTo38FLoFL7BjR92BLEZDcGTnpJzfPso7G9BKB0Blbf1zOANY
         6EankST9bH1KDEr6mO3Tb3cq8TIDpXI0oraRwCbo1yM3y4i4mTUITjqXkybYPRld/Gu0
         d9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713533365; x=1714138165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JAiJ5Etf3MuJKuNZBjkja2+rCHW1cnBdM4LUduqTKQ=;
        b=eA4AEzpeEFhzUje6S0sDTkSAqECdbToPtNZ/GVIabceFfb0wTar9dcaR8tNxHbx1sn
         Ztl7MVfrSoFjv7iQy6D4uXE1yaiwoByfly9p1CHUA4Rifh3xnChPUrFMpL4ndAYXAqqE
         19DH++HVHkui7bk6DX2WykGzkhAlz2yTkCzBTwnfuJ5Paff7AHX8UlA4mhuT5OhSXA0Q
         MAI4TDtZNIEWrGGa9qMKMACeUtQ4ZvNIMzebvtHaPtJQQaS0x/QaOcYUpp0GC53ldqtu
         4svSU4S8Vo9z0sD+pLF5cUHznbpAdd1O0ZOz0t+UHyomAYbA5hxaSQhUhqOAI6N/V21d
         aT6A==
X-Forwarded-Encrypted: i=1; AJvYcCXyTwo2KdJAt/EKmDbvphlwDerOIGPPgVDUCrx7W3bxXjj30RIcAv3vfJ1MXnTcYlKtFGh8wPGENyapvJs0XXGjA9uF0InMPFj36Q==
X-Gm-Message-State: AOJu0Yy6WORval/lxPzA4/+6xIOZBlwFXfVVaFvXILZYPj26rG8GM2bs
	JwWgiWueW+eLaJUDMr6/3FPJAqO0VqV7BLCoYjN5VKH4o/bjsgAVAcjPPBA39yNyGd68WhLJUtL
	cvv/j3DMdGzG3SkT6DuaR4bdoXsxnxH7SXG2b1Q==
X-Google-Smtp-Source: AGHT+IFgMs/8AHU4XdiOhdZmmG+AX6lMDzgX2zHpudUuHQbXt36lKVWz9la2Pxkh/EmTXCCM3Oc22brh0qqFa3E8lKQ=
X-Received: by 2002:a25:86c7:0:b0:de0:d45f:7c5 with SMTP id
 y7-20020a2586c7000000b00de0d45f07c5mr1937027ybm.20.1713533364785; Fri, 19 Apr
 2024 06:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdYaXVvtt3b9rFxU4ZNShD17Bm4XU9X3h4dY501iJy3kPA@mail.gmail.com>
 <ZhlSaFWlbE6OS7om@smile.fi.intel.com> <CAMRc=Me489H-mTfT1hfUsY47iKwoaVsf6sgkiBwBVkxJOBo9UA@mail.gmail.com>
 <CACRpkdZRp-DFQgb3=Ut27DHd1w11_aEY0HbLjJHob=C5Ek-dyw@mail.gmail.com>
 <Zh6FkejXcwBTAqIR@smile.fi.intel.com> <CAMRc=MeXV4_MT5_DKYtHqO+324dFJnr+Y1UtR9w9mj-y2OOqAw@mail.gmail.com>
 <Zh-MMAjf6hhNOCpL@smile.fi.intel.com> <CAMRc=MfJdfwP7=a3govCcj8XHR7uPwCf2BA+BiWqif74pW5u8A@mail.gmail.com>
In-Reply-To: <CAMRc=MfJdfwP7=a3govCcj8XHR7uPwCf2BA+BiWqif74pW5u8A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Apr 2024 15:29:13 +0200
Message-ID: <CACRpkdYHuw1K1VYbTH3YzvmZevt_whNsd1ce58wCSd1+B1np5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 8:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Unfortunately my TODO list runneth over. :(

When in situations like this, patch the objective into
drivers/gpio/TODO so others can pick it up, that's why
I created the file, and it has actually helped a bit!

IMO you don't even need to send edits to this file for
review, it's just a work document. Just edit and commit
it in your tree.

Yours,
Linus Walleij

