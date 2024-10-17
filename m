Return-Path: <linux-gpio+bounces-11548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2569A237C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 15:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72BFD28A37A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD951DE8BA;
	Thu, 17 Oct 2024 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aftDWt84"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1853B1DE3B4
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729171064; cv=none; b=cIpxz2XUtyGHCw9Tk8VZPcGdNp0aQfvlj8nuuyp1Ca60TQVowT5j1Ia1kOUvKoFFCxgE9cKXyrqSAOOZclYs2yGZ1oNaOdSSAoV7UlolQUOzyWTTO/+X8KZcKhP2LTSHnhrBdRPfRuWwsSv1+9xrRVUDZXGm5ZgDSs7WjtB4m1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729171064; c=relaxed/simple;
	bh=M80KJaUJhwYjKgSWSRxGEkNHoJKkVbBVNZbxQNfoSa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7JfoR8GjbnuZPb1uMZNYAEBj0nT2SfHJhcJ0CAMzd5AcqZhfdiNzscDHtot7nt+pIYVsTRiAtzy/2mnPWUkRsHQVwcQJrqXqBwdCpLDE8yHzrOGbIw7qYSR8JvX8vlV+gbtuS60rPhkgi/LSPpzSs49yhoLmy2xIxnLrRYw+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aftDWt84; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e5a5a59094so7962317b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729171060; x=1729775860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M80KJaUJhwYjKgSWSRxGEkNHoJKkVbBVNZbxQNfoSa4=;
        b=aftDWt84hAC7wHUkZm6vXgWrflNsT5qLxnO+/kzev8dLjsLbYYLiCYOCrxmQhYlV2I
         /zsrk/m9d+T/KOeGxpqno2I9KKD67npTA41WPw9302GFBguOj1zzhqRmxVsx8JGkUqP1
         93RHUinqlekrq5EdIAeUmaaM/sqgG2WdMpvUWVaWANSJcQmdynRxamLBWf8Jnk9ZHLoA
         qbYAyB7HlvQXrvnm70I6t7wEQt32iY30dhUDVfE1P0P2BvMoKfhUm5OstlYbTV9mWEEt
         3J5p0gqexfTFpDyLU0XhXpkvTMLQnDRvE751oNEblttODwhHbs7A+hifTI5x5sw3KtyK
         ibMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171060; x=1729775860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M80KJaUJhwYjKgSWSRxGEkNHoJKkVbBVNZbxQNfoSa4=;
        b=L5osdLVrsXnEv7eqxpyDNF9GLpSaAhWCbfdYabgm8cRj0jniw9PgzTlVzNmEPEKRYz
         mKUH1daf69wLWSwyQh+vHEQ1cZZ9eb1oRr/1nBTykO8YgqU29s78NK4dJRlZk93im5Jh
         v9l3pmivW3vRe0iUM8WKzk0h/rUZNOxzKl/uv4V+EUtfWBwLRzc1LaoAWwSiM3uXGEk7
         OBtL7srutbOA4EfgBs2VRq2x5Li0rOo//ItON669tGddnveZsmFMxTD1l0Lnoza1uEQO
         qkFSy7BnbIEUOC2M1iTyNwsOYLigTdV9lXyHikDJbR9Qv6YNzgofTfi0hummckgPn/Tk
         7nCg==
X-Forwarded-Encrypted: i=1; AJvYcCVGZ+wg0v7zOARF3MV04HqnCS7VhTqTyTjRTLxa70YoDLMUapMoScTXE7RSZYxf4tkpXtw2mXPH3qdl@vger.kernel.org
X-Gm-Message-State: AOJu0YyvHvs9EU3XVDwvMDNokly53MfSPX65NqnZJBRXQuNN9hdqQMBQ
	5ekFtqPVGzzsoDavDKaCAVZr+8xbisxxx2Sq8vJtnAhGpgZRM3vfXHPx1pEQJjKuG2kx4em4bAp
	8x1UQCWYVer8Me+EnDstM77RjhVZ10lkqJ8TCOw==
X-Google-Smtp-Source: AGHT+IHQyuuZiFyiR/8CqgHZ3Ze1mX3TGpRXO2WJHrKDNOMyyMzBPjljeY9XOAQRYtgoHlWy6njYbOGztV57jWUiMbI=
X-Received: by 2002:a05:690c:6408:b0:6e2:a129:1623 with SMTP id
 00721157ae682-6e3644d2f53mr155636427b3.38.1729171060105; Thu, 17 Oct 2024
 06:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241017113942.139712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241017113942.139712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 15:17:28 +0200
Message-ID: <CACRpkdaTT1DDi1qVXJ8OBBrfQM_BxpESRuSx2repL=vjhJd8WQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: pinmux: Introduce API to check if a pin is requested
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 1:39=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce `pin_requested` API to check if a pin is currently requested.
> This API allows pinctrl drivers to verify whether a pin is requested or
> not by checking if the pin is owned by either `gpio_owner` or `mux_owner`=
.
>
> GPIO pins used as interrupts through the `interrupts` DT property do not
> follow the usual `gpio_request`/`pin_request` path, unlike GPIO pins used
> as interrupts via the `gpios` property. As a result, such pins were
> reported as `UNCLAIMED` in the `pinmux-pins` sysfs file, even though they
> were in use as interrupts.
>
> With the newly introduced API, pinctrl drivers can check if a pin is
> already requested by the pinctrl core and ensure that pin is requested
> during when using as irq. This helps to ensure that the `pinmux-pins`
> sysfs file reflects the correct status of the pin.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Provided that Geert applies 7/7:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

