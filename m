Return-Path: <linux-gpio+bounces-11215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AA499AD10
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77E291F220EA
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB74F1D0DEF;
	Fri, 11 Oct 2024 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hDKVOtFl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D56D1D0BBD
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676007; cv=none; b=ANgW20VW9nznEY1tUWy7C69HgLJFHCd1hKHHzhYocm/+ByTM8RoYhh8kVi18CF9y78SkvDiz3YGXaiGQANoqNJtK6HTorQc0gr0tiUJy92XMwtnsL5GhOSfTqKfBunGj1WORUcQY07rIE9AQtCyTY8Zr0I6fU17ieR0nyK0ltxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676007; c=relaxed/simple;
	bh=l30wW+gjdj+Nz0C4g5pcpbSqGaEnEtkfeWXwM/W5vWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucWntTdsPnxHJQzMn2l94oLfxcJMweEMVhmx5AtEQ7lUkQwsoj0NqvJRCy7M94WQ1NMcczlxUQ0i5Kbq4R2nBZBKHm7vWlUsWW7aFOoaWbjOvnbh1T89UjIHoO7LTn7lR3lRTxjeiQUu3O2UIbOoFQHxRzV5Xxj3980ecS0gNa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hDKVOtFl; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e129c01b04so20655487b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676005; x=1729280805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l30wW+gjdj+Nz0C4g5pcpbSqGaEnEtkfeWXwM/W5vWU=;
        b=hDKVOtFl2XUN+kW7n26S2uaGhUlcHwbl5I3g+pBahgFfLsmwnq1EUHiaJoT1HRLD5s
         rpJovY76TB7mieRbiSbCmGQOJE2Pt+ONzX0Nzz/C5pQS41/O39tzv9og4XTS/Io5zb/j
         VmFQ7iF8PC6F2IIjxsxunUE+3yXeaC2ckZx9beFB8K88JdJsYB/IMLY6Q5AvkwgybrA2
         IGAJ2ujUOq8AxplBtBsLfAZo9ue0Piz8eO/l58nt4keKVZLux6osoiPuMaHHGtpnfgeJ
         j28SbiG3c6zKEcLpYsK3dB0z2KlYzoHNu0tbrGUYQDN+c+AWanxTqtkQiHzpUbOE6BIo
         se1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676005; x=1729280805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l30wW+gjdj+Nz0C4g5pcpbSqGaEnEtkfeWXwM/W5vWU=;
        b=WKGKRfzZ5xOmNALuOz04IV6cEvO/zxHFVLra6DaEWiVq66x7rrKCqMXRntqvcFEYmI
         ytr48BYDjCSklBJWrc7vJitKWS0yRYqSrStGe8iVPDBl9aYIvvwrfdq4QypibeZ8uzoo
         lGGcpMl+60CBt6WcY556n0dLlPuusWNsEBQhI+Gygbrx9EdkVhiOjZYeRIZxLHDp6gxe
         NFMY5gF0wt1HGlAENUdaCJxVAHcK2UKhDuS5whIH4Rm97sZhZBGOSpTqPshM+YcCqqwG
         CdyogyBb9jPAdfmE0Sw3EK42do9a6Uyk4I1ENVmHc32GHAB0AFe6D07WGrHEgklMAFDA
         xUGQ==
X-Gm-Message-State: AOJu0YxMUjYraJwxkL1yWO/iP6MSFjonmrDaYPQYmUYVYS2atfC1LOxC
	FtR+5fRJDA5x4u5ZyFi/Z5Zya0dU7D4zu8oOjgRILA/bjQ1d7THaqdT+iU2bokiR8NEoxeumRrz
	D8YXknZGcxXR0ntvgMjQ76jeIdBdvndU13ktiqg==
X-Google-Smtp-Source: AGHT+IEIvl6IHYWA1fl2+rLNVGHut/djoNf7DACwadNG+VYu5eruiJFMpeDwivG60Fomdi04r3mDbtYVHOozWMFofsI=
X-Received: by 2002:a05:690c:6f88:b0:6e2:18b8:c01d with SMTP id
 00721157ae682-6e36434c936mr8656257b3.22.1728676005241; Fri, 11 Oct 2024
 12:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007205803.444994-8-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241007205803.444994-8-u.kleine-koenig@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:46:33 +0200
Message-ID: <CACRpkdY-LViOFLv8SXzBf-GdSgDN+fh+0+fWHnxSCpu3L7D-Xw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 10:58=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:

> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all platform drivers below drivers/pinctrl to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Hey, excellent!
Patch applied.

Yours,
Linus Walleij

