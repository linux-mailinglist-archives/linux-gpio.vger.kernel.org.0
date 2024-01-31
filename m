Return-Path: <linux-gpio+bounces-2786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF48843A2C
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 10:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CEF01C27B25
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 09:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C426EB65;
	Wed, 31 Jan 2024 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q+Fa4+xk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77F8657DD
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706691619; cv=none; b=Oy2neyGRdaa11LhHbVC5JO6UMjG1xL/IdtDT6oC+8fVOnPe8ka2Q7/5sZo0bhepE7n0Rz4KfKqZdiJ2c3bMTHII3I+BKYn5h0BeNAluU8JR6YStBfTq/hChLxZGCzvseAySkNMyzXctSLKhZJskkOH34U58eoLKh4F6KBRvHkO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706691619; c=relaxed/simple;
	bh=4P30cDZJoK8lB7gKvnrdCDa1fyR371TkfVJY5FVRBso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WE09jEDJMvddECEHROJXDizZJVviDQrQypgHRkG0A/aWf97DoIVewP89bOFOGzCbqDyc5V7WpAM7augJNUQBzDBNwSBX26eVm4BJ9EQrWtb6do1diXeOuTg4r+LYIAyFclWAiBvnQsVQRwbHdfXq8hrfUdvOYI7zAnPGoW+kRYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q+Fa4+xk; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-604059403e9so7788437b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 01:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706691616; x=1707296416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4P30cDZJoK8lB7gKvnrdCDa1fyR371TkfVJY5FVRBso=;
        b=Q+Fa4+xknqGuZ1jER6gHM0aX/zbkOIh0YiJ+8zfTalq208itEMP9X2/C53ym14Owmn
         qcfYTBF1sSYpBR1fcivEyZVD2k4QoDWK8mJAgGiNkUNmxdg88wz1l3tvSJy0uW8T3uq+
         L2yB/lpLwjGc48eD9ExRg9UMnbZfJqydDoTLHyRB5L6MUI5QVNgNO6/VFOs4qdU5Hlyo
         VUGZeOC7GnOaLcJRQdlR/Pm5LcgH2LcE8KGlXGhzO+bBYtz9KUl1cy2gjtWkjC3LHyrO
         brGFTg1rsnZQiSgoNlOejRqpLExbszszXpoBd/lQW0R4INJrrWK9gMflsOe6I0s0/DSI
         vwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706691616; x=1707296416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4P30cDZJoK8lB7gKvnrdCDa1fyR371TkfVJY5FVRBso=;
        b=iozoa7meTGzsbKAVJRl+xmNA4cTDrAfEHqziM9815ox7YQ377jpNBsKx7JK9Wz43ke
         GFpwUqRouRdq3VVoynZ0efKsaSeLhJBIVipqTOyzAX1dUfMNTnW4wZUJSrcXAI2ek6LO
         wW3Di3jrk4C2yYXNGUHJZFsSDpgAHZVtU/mqGL8A96Rcx7cgypUMqVX5l8PXaUrVRbKR
         XA3DW1iKb6wHU/LF8gQd9TE3DsVsPpUiJ+w3eyh1x0gUTxA+EDQjNKeMJY+NTIGTEmGv
         2g4yOTut6e42kh5fW+iSoJLEu9oComBgsgeA99L1/1+mI8d1EwTC3sKy9nhGqwaBlRSB
         3yMw==
X-Gm-Message-State: AOJu0YyGRIWM05AyWiw9AL+ijHWUL+1jNWW62aDmBGFXwkvDgsbzPy8z
	KO6xEOP7eoJqTMwsQGb3JYt+mZnTheVyFJqPBIDUZYLUuGL9Fu/QValdIOOhmDcF0TRcZEhJXiW
	7z3MrqqJ/QzTXAB5mInj4HbkLaynjsJ39oU3dJJtINcTYbLrR
X-Google-Smtp-Source: AGHT+IEvB7JEzDy/bd9wdN/APqpYnJcD2om3sihib43VyDrw9Rp4bAVf9j6uDJjuR1z5asPY3/CLOdSDCQOVGQayMGA=
X-Received: by 2002:a0d:eb16:0:b0:603:fd33:8b81 with SMTP id
 u22-20020a0deb16000000b00603fd338b81mr708880ywe.21.1706691616679; Wed, 31 Jan
 2024 01:00:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125081601.118051-1-krzysztof.kozlowski@linaro.org>
 <CAMRc=MesG1nYSxx0osmQEEXCvs-6B4s4=TFYW5wD8pOXpV+OcQ@mail.gmail.com> <a3d24e7d-404e-4c02-99a2-8838ee7028c9@linaro.org>
In-Reply-To: <a3d24e7d-404e-4c02-99a2-8838ee7028c9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 10:00:05 +0100
Message-ID: <CACRpkdaus1oRCiafiJjqTkARcKBuxvNfeqDrve7ZdG4UqnNX5A@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: add gpiod_to_gpio_device() stub for !GPIOLIB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 9:59=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> [Bart]
> > Why is this needed? Users of gpio/driver.h should select GPIOLIB.
>
> The third patch shows you the user which will not select GPIOLIB. Why?
> Because there is no hard dependency between one core framework (RESET)
> on other core framework (GPIOLIB).
>
> The first two patches are added for the same purpose, even though there
> is no need currently.

That reset driver implementing a GPIO chip has not been reviewed by the
GPIO maintainers so I looked up the patch and replied, we have
review comments.

Yours,
Linus Walleij

