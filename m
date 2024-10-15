Return-Path: <linux-gpio+bounces-11385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8799FA7A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 23:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BF45B20C7B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 21:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160841B0F06;
	Tue, 15 Oct 2024 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ot/bE0Go"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174B71B0F09
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729028608; cv=none; b=VU/tTwRc3A1xAOCHoi+5e/rGvORb96Y4AuQD6eAT/MOwiMPULCfwSEei9hB4rtm3CnzzlaHrLnM9t70DyyZxgsoY78y5k+URSTUOSa2auQlRLgT6AuMuoYY5iK2w0Q1jP5hgk1pvzaeDtjZno8cfZoYPdAN3/hIPl3Zkknu74xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729028608; c=relaxed/simple;
	bh=UAocfkXQ1RPqdmiQZbBlkDnEJNGgmKJGrcniPmvnozU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSIcjvZsqjmreWylmqd2I0NFztQvZBGpQhbTNNS7vwbfsyZRFPdLVuX8SsmpMm2+zQKgSYciUrpCyGU5e0l3CQOo9eoLp9IzXuSKjHLa9HdUevZSnj33qXqizyL44m3TWbRK3OlQIZr5fT+eLVxxDizbDvwjqxMAiWbDKESsQuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ot/bE0Go; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso54411301fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729028605; x=1729633405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAocfkXQ1RPqdmiQZbBlkDnEJNGgmKJGrcniPmvnozU=;
        b=Ot/bE0Go5eP5XQv3yg5dMccCo4KdHIwNNjOt+uGel3jve6jwnDknml+NR1v9RtQhxr
         7A1c43Z6XKjDsUx8fniAAo64dtcGrBHBAz7wtvA8JSBDnErTYUpQFvD/USolHSqxII3r
         wnbHb4TITh9Wru+WRSJ/1IC51LwKTxqQgAdzgQxKZfj4IUrL7L1tc+rLgsG7/r73UBBB
         CJUJUFfsXNAlzp/u5ySMjZXPQrGLX5JeSB45+KUaPp4O1gyyB/pkybYdRB2aEfBM4TGr
         t0S6QMWNKb17KfoRyA/77Wok6NkmB26eXrt34///DQdz/bMt2w3B/piaFYrWmE5/L/mb
         P/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729028605; x=1729633405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAocfkXQ1RPqdmiQZbBlkDnEJNGgmKJGrcniPmvnozU=;
        b=KnenYoHq3PO8lw5hd3oUOvDyLkmKlGbnInHL2gboSULXWplgk4fF9DK/Z23OabmOx3
         t2MsyDPXTvPFRNlz6fn5yNZd+ZG571QvB70RQ+dn+Wy6K1Oh5FKdbw4qjHVK8UsLsI2Y
         9h2s7MA9clSvvwGBksO+8acHd1TIwSGNAv0CCIiuqJVMm3mvft2b6NSm248vjqMoAR5s
         WRbJlk1hg0j8vJfDHH3Eai48Hxo5YoYwo7rf6LFxLIN8hUGWBzcpP1qfVy0nzxtAqqsn
         gdgRmYM+ipE+ii+Blt8hG190n6yCJ83eX/off0i8+X7TqOhIrWOEa/H7Oq937XGbEaJ8
         jjag==
X-Forwarded-Encrypted: i=1; AJvYcCXO3Ika0AAz45db7dMyU7hAe06pWMZ82Q4lHu4FyopQwpjASLF+cqLPtFIbNLGmj/Le13MVkWuGPwuZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/zl8X47n05E62fbir/Ui3tNGOiN0PPfyVRMYgJXdFqIRmKTt
	+tmi11NPlJe7wYv9DzqN3/I9zkUrxoQd0An4jhY0uz8uuLTMCdpJPhF2eZNvz6V/76vDf4ph6N1
	ijeSqvnG8Qp8SCPe06fFyIxvrY3HRhn1lEIoz+w==
X-Google-Smtp-Source: AGHT+IHcFZjjWlAFiGgDJy1iCFs9nmgUCYhCnPRRLVYBx8tgkTIO5wjNRXsFMThYHYMpQBvlpgTUbBolK0yS7+ZfOGE=
X-Received: by 2002:a2e:b892:0:b0:2fa:d354:1435 with SMTP id
 38308e7fff4ca-2fb325d4154mr75684441fa.0.1729028605199; Tue, 15 Oct 2024
 14:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015162043.254517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241015162043.254517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 23:43:14 +0200
Message-ID: <CACRpkdbYF5WCy7yc3t6VSU8CK-MKpxQnVWmRE-YCSKJ1hJDkug@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: pinmux: Introduce API to check if a pin is requested
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

thanks for your patch!

On Tue, Oct 15, 2024 at 6:21=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:


> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce `pin_requestesd` API to check if a pin is currently requested.

What kind of function name is this?

Do you mean

pin_requested()?

> This API allows pinctrl drivers to verify whether a pin is requested or
> not by checking if the pin is owned by either `gpio_owner` or `mux_owner`=
.

There is nothing wrong with the patch as such, but it needs to be
illustrated by submitting it together with the first intended user
and show how it is used, we don't add upfront APIs.

Yours,
Linus Walleij

