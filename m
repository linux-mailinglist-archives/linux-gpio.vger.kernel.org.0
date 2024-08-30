Return-Path: <linux-gpio+bounces-9439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C4C965C79
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 11:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1778BB24CDD
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 09:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A7B16FF37;
	Fri, 30 Aug 2024 09:13:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6446C171650;
	Fri, 30 Aug 2024 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725009185; cv=none; b=fevfDY0M+kZI2Ip2ysyOtNdSqyUBVPKIqmvEgc/SFnTonTMUtso8XDeQwAaddfc+AGeto3EKDQ61VddU11QkF41XAdwsbpIXKMEjSgpUFBsHRtmjBkUByJgwB72N82MndQZ2SaZa4wXhN2nprcD3Zyb4vEAhiEdiccXNrPMcBGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725009185; c=relaxed/simple;
	bh=Hpvg87zG8KAP8+Qw4uvNllQvQHp8Ub8BWaUdz7xUQRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hs9kCiR3/T1m9hjV4n/n6nFYsg1ei5v9avN6BpH/ZneABodoUFRTjIwV9/0M8gMEIUAaVfWATl/D6BGqPPWK2R++J7rvD2gh/pIPfrdu8i9w2NEb9Vl8JDqfZWOOewoAwCS1AtyjEfQQpBsj6okeHzxeKJesTnOcrTH8ei9O6jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6c130ffa0adso16065677b3.3;
        Fri, 30 Aug 2024 02:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725009181; x=1725613981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daF6lSM2+LMkrRjbALvD9vmKglf9+xqjtzTYJxCfy78=;
        b=qdLleSuxVK/3ROXA+NlbqpiznDPKjeWsWKhzw+szLUAsZAD1SP1q5+19TYmfbEioYm
         +XmtjTmHn43Vhvhg95hTKWOWil91toI5WYnu6GoBE//uQu5QSE5H4RhHp+scCWYDfw8u
         mi9TOCuF6sQbMGsuPjy5unxvAcIMb9SZi9CaqrwaZDcpFri30nxKCSWsKJfmdgP4W4fE
         VG/18u2WZba9+cMkxqoIygL/iGxMrl4/OfH8BEnioLk0WRghqazgTYGtcGK4qlf/PiMQ
         9YbErb3RiIahUMVBa0uUjplN3nTjDhHDgHEZUotfizmJSC2FSrFMQHO0S03dOnd01Gat
         RU+A==
X-Forwarded-Encrypted: i=1; AJvYcCX0NzZptck8pjdTOLRDbneijR/RSuznW1UZZIynfdvfUkKwFrKaoVsxpnEOKRJbyI8+IWZpR1oxN+szs2g7DkbYZyk=@vger.kernel.org, AJvYcCXHYY9XhYlbO/nY4sKbbiYva7zxEwPoZVBNfHtRt5en0i5riWLUHny/dvAgrrLEeBeEEHKg6zSCPsRB5RBL@vger.kernel.org, AJvYcCXVd68TTPaWMf7OgkrfSKw5LFzqQ+j8+8QCmo4WiNHS06+GvLAxVLB+rCm7uP/Zs9GZ3Zxq+6xEnqcS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoq6DZGRcECWrbDx1o9CpsUKClG/lOAwCYzGg9UUBMkRsxCNmj
	YlRmCH4+xCopH0MOTjKG5Bl3DXEhr133QXtb/kyD1SfW8uc/dtV3JyWr2YrL
X-Google-Smtp-Source: AGHT+IFMiAK0k9Db4xRo8voBpaKwrWiAXXUhWC+R7qA2ib/SWvZO+CZnuxw9C41Lziu83AalVOYIIQ==
X-Received: by 2002:a05:690c:389:b0:6b3:9cc1:97e4 with SMTP id 00721157ae682-6d40f829539mr13719717b3.30.1725009180668;
        Fri, 30 Aug 2024 02:13:00 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e15dsm5542477b3.66.2024.08.30.02.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 02:13:00 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ca1d6f549eso18568517b3.0;
        Fri, 30 Aug 2024 02:13:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3TxIQtMbxpiCW+94xDsFH52IKNSNSJGdsdxX7+qvcp3w/wOj1VqfExwucX8jNoG1ZWX2z5fTd6Z+0i2VATsxtmTQ=@vger.kernel.org, AJvYcCWgddHANIizXG4IGLCEt5wjRAqHEodiLWcNJiavczrU/hVk4VdAeAkoU1YmPeiQem1nQ4QU7RWy7Xx6FAfy@vger.kernel.org, AJvYcCXk+hsBPa6Dmptk0X23vPYKDHFN0mWH66FdAXIqvFcYDvXkErdkOwzCz7T0ZiSiWtdCY3S+si9c2HBe@vger.kernel.org
X-Received: by 2002:a05:690c:fca:b0:6d3:f51b:38c3 with SMTP id
 00721157ae682-6d40d88d522mr17797587b3.7.1725009180020; Fri, 30 Aug 2024
 02:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829194841.84398-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240829194841.84398-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240829194841.84398-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Aug 2024 11:12:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqxXovL--eT75XJx+0mozdAnfUU4gcVWcomJrmZ4SROA@mail.gmail.com>
Message-ID: <CAMuHMdXqxXovL--eT75XJx+0mozdAnfUU4gcVWcomJrmZ4SROA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzg2l: Move pinconf_to_config_argument()
 call outside of switch cases
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 9:49=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor the `rzg2l_pinctrl_pinconf_set()` function by moving the call to
> `arg =3D pinconf_to_config_argument(_configs[i])` to the beginning of the
> loop. Previously, this call was redundantly made in most cases within the
> switch statement.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Updated commit description
> - Replaced `pinconf_to_config_argument(_configs[i])` with arg in
>   PIN_CONFIG_POWER_SOURCE and PIN_CONFIG_DRIVE_STRENGTH_UA switch
>   cases

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.12.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

