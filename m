Return-Path: <linux-gpio+bounces-19451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2679AA090E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 13:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B42533AB77B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 10:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9312BF3EA;
	Tue, 29 Apr 2025 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XH+gpxAg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E755176ADB;
	Tue, 29 Apr 2025 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924401; cv=none; b=oPw4UUquHGMiiktN7z93OqnGJg2+vz+uIZrpIP/RVhm5OQ6/xbohr0sy8GZhtjXQ0aTNhAwJXZVOxxHs/D8SWG/0O0vSwkZL40B757ulWNWr/DzEm1SSAAEtm6F1CWQbzTZrg/p/GgYunDop3q5G530+Ni67QWLuS/imSoIWnkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924401; c=relaxed/simple;
	bh=xYx7vVMODEw3waQ3jXqBqGbAJdRANkPSZXchstFSTSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+tM5e7FD9taq29lT+coWLNJrN0owM+0XWbjEzN3JvVyPRa7RNVdXLN5+bWCcozdI7JzgGCbeJCQ9BsbDdIlXVL+gTf4S4KPgU0Ria8iNSJvf58qqn/pM/oiyz6l5OC1MXfPtzd95Z2z6p8MKSycxfVGUaOCHfc+V59c3coKQr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XH+gpxAg; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acbb48bad09so1091038966b.0;
        Tue, 29 Apr 2025 03:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745924397; x=1746529197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAhibOWntv/JIa0M4k74yL4qCdZZ5IyEkuemH9Z9jOg=;
        b=XH+gpxAgKx9yVc+i6bzhNJ82faq9BJW0cjBbf/q+CzqiWCOYNyGCct3QRSDepPa66A
         zNvyCp5dfBn9LXhltXBHrS1nNKso/pegFm18E9+62M75iYLZfJVgSUIWj0/FqGZ0EMzB
         asroHfWGw7JnQB6aId6vze+6zRjv78U0nJuvbPJnMMdDJliOTUnhBJ7ZFHSNjDmA6rBs
         J3ePYryhUSd1I767Jqrre8eSxSkxGjDaXr1RmWySowKBxzG3AwZGohG4zoiOojRpvKKK
         ZRtOHj9vMQvRnrKO9e1YlmjlfOgPLcW6o0W+lOZQZmiu7Ykq+F7IlwzBdY3O47zUiPwq
         ndXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924397; x=1746529197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAhibOWntv/JIa0M4k74yL4qCdZZ5IyEkuemH9Z9jOg=;
        b=vLQ/B2RLJXIdNA8Xs3lQmIEeSAjRA0yBGdqjsVVVhluGZ66fOpZecScD+/Ss71i4RL
         RGpBP8I8mPSl1UaeDPbneEaW7hzOQe0U2yj7U1RRo7yulqKQkDzN0yBM3G5q8gSQx321
         UJsmS7iSwhsLJ++ncPnjIDF0L2whrvyObC+oJD9vs3b0mwfnNEV41J/A8zr7aZLbcRwV
         inf7Lm0GDaTgOcWABVK59kENtXNGJwCtcZknrbflQ+NJNy9ckg1oFyeo4ZI+gF2bBp5Q
         CAOskM9r3DtBJ1iWlFIw1wyGHtwuE0fyw9C77Y4+8GvGe5KNpiWEjLREalQn8EHpcb8X
         df5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAKgm4McVnFo7Zv7dZYoB8fz5mgETNWhVpnsjX/jK1PKQPqM+KngQsfUeuFXIHPnIKb2v1FHVc3/oA@vger.kernel.org, AJvYcCVsY3wkmevBYmecQAM2WIJh5hGRJfV9Rf4asEe/TCJHCmko6JXKflDhkSt0jWJLEeLvGPTc8k+e6STkStbV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn5eoAwFy7TWcGhEw8PjaBLYcXBNyrrKXnmjaw6QqExV+yXq5c
	CizXWkzGEoXpphqha23MYCe79Ie50JyGtufTOXFbSrpq/qOo610XFdQ683hEy3jcIApG/7d7h/V
	cWmTvm1jyN9IGcZV2i/1VVYGUkoU=
X-Gm-Gg: ASbGnctoee/VXaxVPXPgJcKY1VtDG/YJjvozWwbuPmlhJoEnRpwk29pIV6kIP4SdQSk
	VAnAQIpvqF8qFD1Mh0rlrKiGUvOVxl93mjwg8u4kcDATxuZjR3WwBkAs4MPBQif5acw7+vyvJzl
	afbvBrp9ipOMAEVknja8ksWw==
X-Google-Smtp-Source: AGHT+IH/NXv8Ns/r4ELzIeUjCBq1C8X3IuRvUDL2M1p517q3J6szG3n+1EsZKhZkYWyLva+16eIhp/8IYP2isELwNdA=
X-Received: by 2002:a17:907:7daa:b0:ace:6a25:f56a with SMTP id
 a640c23a62f3a-ace8493cc59mr1172294666b.29.1745924397295; Tue, 29 Apr 2025
 03:59:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428235610.11324-1-ariel@simulevski.at>
In-Reply-To: <20250428235610.11324-1-ariel@simulevski.at>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 13:59:20 +0300
X-Gm-Features: ATxdqUFO3a5WRMEYxmo6NOZKv9hXMs8WfdDFruZ68XC6mnwev1lM-GgXl7oxlLw
Message-ID: <CAHp75VccaDdzW7SUyLE6Y+HLFDHdcc78JZTFD5wbAeOOdPEqOA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: intel: Document Tiger Lake reuse on some Alder
 Lake platforms
To: Ariel Simulevski <ariel@simulevski.at>
Cc: andy@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 2:56=E2=80=AFAM Ariel Simulevski <ariel@simulevski.=
at> wrote:

Thank you for the patch. My comments below.

First of all, the Subject should start with: "pinctrl: tigerlake: ..."

> Some Alder Lake systems, such as those using the PixArt I2C touchpad (PIX=
A3848),
> reuse GPIO IP blocks similar to Tiger Lake. As a result, enabling
> CONFIG_PINCTRL_TIGERLAKE may be required for proper I2C device detection.
>
> Document this in the Kconfig help text to assist users encountering this =
issue.

It's all nice, but can be written in much simpler way:

"Some users may be confused on what to choose to support their chipsets,
Document supported SoCs and PCHs by the driver in the Kconfig help text."

Or something like that.

(In other words the "touchpad", "some systems", etc are unneeded
details. It may be other users who have different issues, you need to
cover all of them.)

> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220056

> Signed-off-by: Ariel Simulevski <ariel@simulevski.at>

Reported-by: ... ?

...

> @@ -54,6 +54,11 @@ config PINCTRL_ALDERLAKE
>           This pinctrl driver provides an interface that allows configuri=
ng
>           of Intel Alder Lake PCH pins and using them as GPIOs.
>
> +         Note: On some Alder Lake platforms, including systems with
> +         the PixArt I2C touchpad (PIXA3848), the hardware reuses
> +         Tiger Lake style GPIO blocks. For proper device detection,
> +         enabling CONFIG_PINCTRL_TIGERLAKE may be necessary.
> +

This is too narrow and too detailed, nobody needs to know this. Just
list the platforms the driver supports (take the example from the
existing list, i.e. INTEL_PLATFORM):
"Currently the following Intel SoCs / platforms require this to be function=
al:
  =E2=80=94 Tiger Lake (all variants) // needs to be double checked
  =E2=80=94 Alder Lake-P
"

--=20
With Best Regards,
Andy Shevchenko

