Return-Path: <linux-gpio+bounces-24657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C2B2E2C2
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C00E188A0FB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 16:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DF8334373;
	Wed, 20 Aug 2025 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzXlOZgL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699F032A3E2;
	Wed, 20 Aug 2025 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755709008; cv=none; b=mtSMENAQr9fNzS3ioFzlmjsmZOv1UxjktLEIT+ldNZNCVUWrtagQDYJLxaYIEWjWqkh5/kTbA+DmUxzQnUl+AyT7AAVQcmPbQJKF3BytTOLNS6U/jn/LgDiEjzvCfdi3wxxH5Wog70S21ilIEkCsSFoYl1ycGGw3q2YahZehUeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755709008; c=relaxed/simple;
	bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYTlFChANgJwANf/vA1l1+A/n5C9WEDI9zz9ev/oUJdQADIw7Qhhv/WETNK4Em3Y590/3RuU7zjBV4P3kFtwqtcRJNmkUBK9FoCDs1EVeDn+hfTeLEnKiTlmRG7JTyNuYwyIC9auTN07AzBw8rBgtI5idO+kezIdmHJsjNudyGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzXlOZgL; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-333f8f9ace5so865611fa.1;
        Wed, 20 Aug 2025 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755709003; x=1756313803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=;
        b=UzXlOZgL+DLb+h/ssrjvxWqaM89FHrLKexTPO/9F7bS1rSG2xIS7mD7X3zkIVR3n86
         n+xbISquZLU77GJKp7+EndM7QWWdQv00F7St6fFPe2gfpKTys9wdoXZJasbkECL9SoQV
         YLcTnZNBjUsACWViYVeGE4TGuXwNWyZ0ieWvWli7uint683zEuusE+cb/7Fl112QKrgv
         xIn11oEf4Ht8uj72CbKad/E/f7CRDNsuNLP67MRE5KwAU88DouOO6obq30UOas8sNc5w
         O4mmLd+eADSkB6p8DdVw/rX26XCcwnOFVTf643LKPBToDXaoTAf7oliH/IxIhwIp1l5y
         98aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755709003; x=1756313803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=;
        b=B6dXIYoqMrgTVIxD9GvItO5igz9DSg4HoCzfbeIYLDkt+RRw5bx+Bp2obHsXVyBpPE
         wH6goXNwSHXiCQE/48imMTdtHBkMocO6aDopA89t2jIDqsbRPMFugwRFZ+ADW28wG2Xp
         f/kO4cxrXHutnBxixZDkq2bb3/GQiUbXD7/byjibRS+WzqR4QdvlEXxPxAqSCdCDTuW9
         DaNJshhNGscGLbOaBm8PudxNTbSUDfXEWLaWdtyYTFpffEE4Sv/TLGijJVW6+APb7iFP
         OYLLA7PxgybUXpONHWO0jizNz/gQJ94onp/FeIjUvvlJA+FV7Onugu738LI93v4RqHtn
         TJaA==
X-Forwarded-Encrypted: i=1; AJvYcCViix4osRC8HQIMGL8XS+aMg69EAbvoOBpBBwSYKAVYavvs1muw44BlFozIDja+wQ7TlCZiHOdKThSB@vger.kernel.org, AJvYcCXhcOcOgqdEUSjOU6DEf0BlZNCj0Gs7rortNAY+N4lw6x9x7nqEjqdwpyL0CLgD2ioUdC6FCyZVVO3Mwg==@vger.kernel.org, AJvYcCXzZ5ul4bEngCO5gcB8yEcSO4jYiuVQyeJZG8fExT7KL+CoaIRsjQDFcxZ3K/EJU111ZDbzjhsQi4UiTRir@vger.kernel.org
X-Gm-Message-State: AOJu0YzYtA7824i8RrzrxBOy2DyAdDdUXMlQDWbxqz0WAmsw8cZrMV4x
	A0Y9Xq2RfB6XReEBUlf7+4GAmo9dLpY0pcXuwHPHXeZWGf5ZC6P4+9g3I6yE0d9AcZr1lHjcARX
	zEjSKkrpd2kfRoRMY9XcwDyjzXoSWD5A=
X-Gm-Gg: ASbGncsElzCPHpx2YWGlNi+LbpMo6N2zF+0SwSSIVo3RHLJoNCZbLIkGJUtNxi5V9EJ
	X+T4+i3b6tAMSCNE1qJRAbGZhZ6Zi2nRFE4ZXqFYpRByodKHe49YIHKk3yXA1TqxFrZnRNc2Jyx
	bID8Rvf26M7YDnCnTabyF5gkkvvZe/Tqvn9czTiZubNccE1AiFGNqBh2mvyP8DPoKjDG0nOxBNq
	1+EurnsgA==
X-Google-Smtp-Source: AGHT+IFordkwi+zhqh14qMBLsS0rCZnAYtiWQK4SHByXpqr16/xqAHI6fvghj4M6wGzn1kjHGF8rYjLwee+S/KYPvX0=
X-Received: by 2002:a2e:b888:0:b0:334:d4b:49b4 with SMTP id
 38308e7fff4ca-3353be411c0mr11491871fa.29.1755709003200; Wed, 20 Aug 2025
 09:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-8-jszhang@kernel.org>
In-Reply-To: <20250820154037.22228-8-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 19:56:06 +0300
X-Gm-Features: Ac12FXwH4g6oMn14HY8Y29rYZvc4OR3qKCO04rOR5qjEf-HjYlk-qdZaKMvaQ74
Message-ID: <CAHp75Vdh6MQzEZi1aLf+7J7evSwd76ANKDk6WahWzEcLq1Ew4Q@mail.gmail.com>
Subject: Re: [PATCH 07/16] gpio: ml-ioh: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 6:59=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Acked-by: Andy Shevchenko <andy@kernel.org>
in case Bart wants to take it inside the whole series.
Otherwise I can take it via my tree.

--=20
With Best Regards,
Andy Shevchenko

