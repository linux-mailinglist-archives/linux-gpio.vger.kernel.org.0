Return-Path: <linux-gpio+bounces-22082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC4AE6F25
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58B4F17F600
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCF22E7F18;
	Tue, 24 Jun 2025 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="greaUKvA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC62E7F32
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791905; cv=none; b=R5acuotjRKcOyFYOF6hpyXJi4asIPN95oUm5ZYmX32I/n2cUmOVTiQdDba81d5ikSj7t9eGOYKYDKTAwIhSa+3hIoUrnCHO8hReT4bnN7wPce+20/LDDHRYipOMFDpTyj0zODWPXUrnOJLpds0CNoeh7ocE04jNw8Xz9lb4kX1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791905; c=relaxed/simple;
	bh=mbsb9+fWnbzsLx5rxji39vFSDusnvdjQ+VlMMWao5NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPraDtIhTBJTM1UibnUeuw19wyLVbsft27kWGZLS0dTODtJsAHVErtt8efrrXFqbSXEwun6W4Dtu2SP1PowFMCaukpdhv/yRvRnq/yBg9pxOWNbHCEpvhZx4EX1N61ZPnCI9zI37HiyR9ofgCKO8Zl++Y6GuHAWOeqiBivLg+w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=greaUKvA; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso7646471fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750791902; x=1751396702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgrYreYVLH8FvHoQvhsa3zUNDQAJAjppKx7XORV5c4c=;
        b=greaUKvA3QPRnMukNkOtP1Rs94G9Ik3Gynpo7TPJAyRdeEM9OjvRLrU3i2BCZwhSdL
         Xf6FZTMGRCZBRaXrjV7KEvJxLjCtam936SnmNhEbi5zGwqsQ8870DKYTZnZGjs/3ATZI
         vXQkYyIL+CU2XRdapzIgeH9hWKovuYpX/ceNUtEXFAlYSw+8uCj45VudVx9pKnyLReAy
         s6JbA2D67mA3mo1H02O/adj99e34r8NpL6nnuugv8FQJc8KHJU12ZvBjVbycR+tuu9ud
         l9vWfZuSSoBh0T2sw66WaF7RUGEIvjFNrbTbwpBFr7HUtKCIwZ+o+R0gLNaI9SukfQ66
         Fgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791902; x=1751396702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgrYreYVLH8FvHoQvhsa3zUNDQAJAjppKx7XORV5c4c=;
        b=gi+8lxQiXRV2c/LI4zhveKj2JjH17yuTrBjfHK3Kxvat0QEvErNzjSNoiwyjJHeC15
         39LN2bkzDBaxpsA1cR46OkQgt/iVxkSeoCpvovntOMVuJSrPPVbdltNsMGJ90P7HQBB4
         cl7xg5ZbahC60I4+847ue5KdarYEZnm7JyDQmuas2UWajqgNcCTTRGPMQgkMiWLrdeP6
         Ag+K6VazOumUebARgvvrzYQn4ONlXlgB513Yo2qyM2kDsgBOiNiBbgkbZsaX2JQydDxR
         jHedMndWkyTI74tK6K0GYOzErgHmLqnv+pbnswIP49gMRG5vR6rp8pcZB2/Qw8KRbRVS
         rMQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL5J4nhfOyIHRxewugZn4kEzM9oAeTEAeLxyexdkcT2sJCQ5OTv+TEcFwbSyy2diWrKKpnBQbC5+pL@vger.kernel.org
X-Gm-Message-State: AOJu0YyDQDn8u4sJ0Y+VeDriXP2PtgWJ+BYwP6Ed+D8o+dt2Ry2/c8id
	Lht9YAaTV6H+TvGajk5IXGOzSEKfaPW6iGSdAkoKqlwE1HMqAVr0q3lHWmgD8GH28TUi84qi/+F
	6Js0Vvqf2cO2phNO3cfgdDRGXx5FsoTmU/898FteyAw==
X-Gm-Gg: ASbGncspArq2FMOPdKtKorcD9LB1cAGQSi5RhrAj5b6O39yuIpRVNI6OqkCfTF4tFZn
	1S8mJxYlco0yV8CHnCobOPoGVh09W9q7IUCddRO/i0HGbK7W4RXRFvykAuMXGrApgM564fIXMpR
	+A5q0MpkI7Z9H9fh06dfRXHx9an0+jCNaCK6Mil1F6Rms=
X-Google-Smtp-Source: AGHT+IGRAdbblRlD3BsEideIncBbEmzKvsoZaeWYiP0C3/Bj6arnBv99h8pdXRsP35lURKgQ2I/vILxQ5IGPRudpng0=
X-Received: by 2002:a2e:a54c:0:b0:32b:72c8:9a5d with SMTP id
 38308e7fff4ca-32cc4d3d6f2mr2458331fa.0.1750791901594; Tue, 24 Jun 2025
 12:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <OSBPR01MB1670163BDCA60924B3671D45BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1670163BDCA60924B3671D45BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:04:50 +0200
X-Gm-Features: AX0GCFtEg0ndXbqdWy7FvRv-qpkhJSjku68IPxwnvAyNolU9JWUszgMqSgQ21Yk
Message-ID: <CACRpkdZhHVBc+aGA91Y3hHOe13C4TYwM1E_mH526dTECBZaP8Q@mail.gmail.com>
Subject: Re: [PATCH 00/16] MIPS: some compilation fixes for the Lantiq platform
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Crispin <john@phrozen.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 4:54=E2=80=AFPM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> This patch series fixes some MIPS Lantiq platform compilation issues
> found on the 6.12 kernel[1].

Thanks!

(...)
>   pinctrl: xway: mark xway_pinconf_group_set() as static

I already got a similar patch from Bartosz.

>   pinctrl: falcon: mark pinctrl_falcon_init() as static

Patch applied!

Yours,
Linus Walleij

