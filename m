Return-Path: <linux-gpio+bounces-9075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B98495D174
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EDFF2842FE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B9F188A2D;
	Fri, 23 Aug 2024 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SdT0DOok"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF30188A21
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427172; cv=none; b=Hx63Y/Pg/kYK6FwVmLBQpat33bGLXzEdj7iEJJeqNlmgC+lUG0J1EeTQxA/1HTU1/3I1vzw4dBicuhG7uWBwKHnGOx7DnpCkCHNblMLGlNdQmLkALQW0B0pXXowH6RgWgRQiENrX4aE6THmu94J8y3aJSz6dD7jwjlCR/9MWbaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427172; c=relaxed/simple;
	bh=9aXyELinQfYwyLATQYHkwQS0PD0DQrUrkpCY/Wkcr1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YABAgDzlVStFhTfDolnhvJRsCXMMS3HhVS+ZQbWYJuZQnOzooeWrwBwqRHUfw3V3ri/w8QcjMKSimGbidZlE3WhJyQ4vBCsSc2rdkObcHz8FzmnEC3SwfkO3V5fHINMR7yW1eOK/zWWLcXQui3B8Rc3FlG3MsCGYFWElTrb+DMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SdT0DOok; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5334a8a1b07so2805899e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724427169; x=1725031969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aXyELinQfYwyLATQYHkwQS0PD0DQrUrkpCY/Wkcr1E=;
        b=SdT0DOok/1R2S3HMr8BCSjCFesI7pNklyEfTirJPU1Z641PMlbLjoLJA7BM0VPCviE
         DESgvjRhPlB4L1CYinYutRiTJTy/vWaOVCeaK7NktmCNI3G0inXhNuInHuPAPLss2unR
         Hk/nql9qejBBRpSq4huEWJaFEle0rMKdYZtwI8eSsAA6wcIb5y+jV95DUkW9fPCpmRnE
         Gy8TptnFjtvG6fmm736FEJYAvEcXp6w2LsYyCS1w4n+94EIwS4Qgn0TmhC5zIj1gTCmS
         aO5MhUVOgaZ6B2A/r9Fx0V2mzcUu2dUXPCslSiv45snGBo8e8JUkO/1Sl9kzN3MOzaxD
         luYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427169; x=1725031969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aXyELinQfYwyLATQYHkwQS0PD0DQrUrkpCY/Wkcr1E=;
        b=e1osuomFUF9Pt01mDkxaJafhodo1BU6NBgH2ZVTHQh6grWn0preSn9dpLjl5AIwIuY
         7KavQuiIUVQAcN0bRyU8T8Ss1Fw9B8zrdlwMBI4+l1QioWFa3dmbJN9ZhzFe2DVrh2ra
         UAEOP0yHQ3nnxrlhSDAqnxORl/1+1j0xEIehPaOI+VnjEG3kTtLEim+RlQlNT3qs2PSN
         NZuC48bh8J/UqOxsH7hBJz6SFQd+BPAUnIM1FdK0WxIDuoC9RO51rXoplLj90fBQ/MI6
         K4xIUJPSUSAf9U4QrIpjCxrHB5FPlouEE0etfGxdkn2QGlucaC6qeeWWC18kBZh20lp7
         aFsw==
X-Forwarded-Encrypted: i=1; AJvYcCUbTWYhPxXPKIGQNbeMPjhXlPJ04wB+5K57N0Uiz3aqTxhYJaVtRvSO5vOipEwNigjpE7Pds7eoo8WC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn4zfgU6DYqOWbBi1OtuiDxt1zQgw1/nxLJGij+fO/w6zcQxxr
	Q38LkiMldjjh2dDRLBM1Y/bbPfVslaNivIcPM7+QeWge7W1dikTMzwoAjz/P/p3IeBFb154vT/A
	rhGMCgruZEf4RN4gJnhufZELXmWsZvB4+pVLgwQ==
X-Google-Smtp-Source: AGHT+IEYxslfLVF7+4zGqGpVr0fUIcYeQYYcG88hw1QjYn1vbcqIzy5iBUMugSQ9ALglpqd3RGOJWBHD6ds7yHhxQzQ=
X-Received: by 2002:a05:6512:3b24:b0:52e:9382:a36 with SMTP id
 2adb3069b0e04-5343883b0c9mr2013199e87.30.1724427168328; Fri, 23 Aug 2024
 08:32:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5b992862-355d-f0de-cd3d-ff99e67a4ff1@ek-dev.de>
In-Reply-To: <5b992862-355d-f0de-cd3d-ff99e67a4ff1@ek-dev.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 17:32:37 +0200
Message-ID: <CACRpkdZZu4i_DPx9hZp1NXBv=4YBvknrMdaKni1vDeHb5+_rFg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: make it work with current gpiolib
To: thomas.blocher@ek-dev.de
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 1:16=E2=80=AFAM Thomas Blocher <thomas.blocher@ek-d=
ev.de> wrote:

> pinctrl-at91 currently does not support the gpio-groups devicetree
> property and has no pin-range.
> Because of this at91 gpios stopped working since patch
> commit 2ab73c6d8323fa1e ("gpio: Support GPIO controllers without pin-rang=
es")
> This was discussed in the patches
> commit fc328a7d1fcce263 ("gpio: Revert regression in sysfs-gpio (gpiolib.=
c)")
> commit 56e337f2cf132632 ("Revert "gpio: Revert regression in sysfs-gpio (=
gpiolib.c)"")
>
> As a workaround manually set pin-range via gpiochip_add_pin_range() until
> a) pinctrl-at91 is reworked to support devicetree gpio-groups
> b) another solution as mentioned in
> commit 56e337f2cf132632 ("Revert "gpio: Revert regression in sysfs-gpio (=
gpiolib.c)"")
> is found
>
> Signed-off-by: Thomas Blocher <thomas.blocher@ek-dev.de>

No reaction from maintainers so patch applied for fixes now.

Yours,
Linus Walleij

