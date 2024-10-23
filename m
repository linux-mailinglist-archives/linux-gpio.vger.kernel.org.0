Return-Path: <linux-gpio+bounces-11850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 084C99AC77F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 12:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4B36283490
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408F419F438;
	Wed, 23 Oct 2024 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OeqQ9+qM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64E19F131
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 10:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678270; cv=none; b=g/JcyI1+wTkQYLyaxo/smIjAmZWHIe6ayXNw4zUXRCkizgoRfA3QBmJsUbXJaq2C8eWNXIXKvnyPlnKhSyWa5omkplZCNTpiIZpgphxMG3VdQxHh2o2QgOwkXSn8j5tsCKyoWt3M0G6E04/pjMcc7u/rvGDtbjpyLbv8vTScPcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678270; c=relaxed/simple;
	bh=5OOvHNGAVgHImRA4rtLY0Acms6nJmTWGumvJk2gBIAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0qKeNKAs7MzOl3mHK0Fxd1BIUNJS/j6kPHYR9ULsC0ikIbhwXLC8YU492HuoiO9mgsgHEMCVbQuOl+25AxFczmlC6wJNRgZSD8evukZVqmEypgFeyYcSjSXXmjBa/VdL0ryIpGTfHC8r9eOChk1sS6LtMEfVPImMTDDjcIbWZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OeqQ9+qM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so8683065e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 03:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729678266; x=1730283066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OOvHNGAVgHImRA4rtLY0Acms6nJmTWGumvJk2gBIAw=;
        b=OeqQ9+qMCYtymPuyjpdaeRRMaaY+/apAS5h7MWxznHYIcjoEGqt0KskN2I85Lm6QEA
         KVse3nAg6vlCHWe52o8IcidcKEOM85yh5WTRYAYTy9MngCZJ8up5wAYpWpklD7GilJ9C
         qi3tke/qctp+QV71mbLnc+AqR/a3jIsrMGP/5gVqpPQfjptIKzkJ39f1pYiM3zDO8izX
         aJ5rQg0Gc7LlwN5IMk4+hLcU5QrWtR4vUuhQyUgj0Bsh7LtWVb1JS/SYcQ/rkNQw5TIH
         +1axe90Mk2ysXnlluHABAe2jwMHfkcYv9/G3aNHlGh7hxVYlcdom/U5KPpvKa1Log8WU
         /uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729678266; x=1730283066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OOvHNGAVgHImRA4rtLY0Acms6nJmTWGumvJk2gBIAw=;
        b=FQRqpgMlIOXwvvoHEx+KcjrudlBEHfAVW7vHgz28CYyBhULVsuC+P9X/eIipnX9+yy
         dDnQqatu0yP0mgjFaBRy1OymJMvHOGAseIpz+4yQ7mOk63ULrvB9/YImlkMxTsDILf5m
         +5tKKjRxKAuPKKv6tdJFeBRfDGBfA+1wvPSEfTxqr2VKp6TsKVhtogGAVVKtge8/MsHv
         xA2J1wWRiaYTTEm7ykKatEVncSQJdcU/8it4ibyCW6sybuPuFtPn42MdVSkXesSMMIEK
         JfpVmosGmLESMCSb8j851dAN/ikfZNgRFR/tnPNCfssTaXcrSiMgvhKbNOq+YTtbxWXJ
         58Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWw4YPpWSP8yRHyLRr+UIgF8bObosIuLD3XsAEuLeXdY2+cHN1sNoXgogfOUQMtXjXIZRk3Gt+2hbro@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQ75pz+7/z+oQvBf0FZ7uM1JKPy+M6zGkqM+m3FBTe9TLfr4A
	wKvh0z/c8fgPBo4b7iUGbHndiA5+pdVe+AQQ3lu4SljUL1jSev+ndu9/lPuWrY/NSwTdblkxlFM
	SkFmwqDtZgrQTfUElYdQVCo5Gxe4QRpCLUYLSVg==
X-Google-Smtp-Source: AGHT+IE089tWVwoXd/8Hysqc4S/uDg7EGVHjVvwgua3xypehCFmJa3XmQQ+EwelSROlylF6cOjc2uO3oYJn05SS9GVs=
X-Received: by 2002:a05:6512:1114:b0:539:fde9:4bbe with SMTP id
 2adb3069b0e04-53b1a30512fmr994214e87.20.1729678266366; Wed, 23 Oct 2024
 03:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023044423.18294-1-towinchenmi@gmail.com> <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
 <5e1b807f-82ac-4ab8-867c-32b2bf2a91ce@gmail.com>
In-Reply-To: <5e1b807f-82ac-4ab8-867c-32b2bf2a91ce@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 12:10:55 +0200
Message-ID: <CACRpkdYjmwHaHPTmjOKR8E9kYQBZAx04Ydby7HKZzE3KhbNh2A@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 11:37=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> =
wrote:
> On 23/10/2024 17:05, Linus Walleij wrote:
> > On Wed, Oct 23, 2024 at 6:44=E2=80=AFAM Nick Chan <towinchenmi@gmail.co=
m> wrote:
> >
> >> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
> >> iPod touches and Apple TVs.
> >
> > This is a good and important series. FWIW:
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Are patches not getting applied since you resend them?
>
> This series along with the watchdog reset delay series mentioned in the
> cover letter have not been applied.

It seems to me that the watchdog series is only a runtime dependency
and these binding+DTS patches are well ripe for merge.

I suspect the three Asahi-affiliated maintainers are too busy with their
own stuff (like M3 support...) to respond or queue patches as they haven't
responded to the patch set for the two months it's been floating. (OK
Sven Peter did respond to some v1 patches.)

If nothing happens in a week or so, I suggest you just send a pull request
to the SoC tree (soc@kernel.org) yourself. Perhaps you should even be added=
 as
comaintainer for the ARM/APPLE machine support so things do not
stack up like this?

Yours,
Linus Walleij

