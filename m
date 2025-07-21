Return-Path: <linux-gpio+bounces-23559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE377B0BD54
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37DED7A6DC2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0647F2820BA;
	Mon, 21 Jul 2025 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OCKgueS2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9351F1905
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753082145; cv=none; b=Ok/6IwpQDfUjl2Fzn+W7Op5tWfBLntXm0uYsDUZBwG/6dbq/9OOW2jFOR0VfqJJUIsSyK1eXKBVx4FjFjnWkh6E0j+Y/MhHDZb30eXWzj/TLq9kDUecXwnOCD0l/F++qyKXvApmlt5V4uM77q+GiGOdZAI7dGEZejIxgsTDaO+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753082145; c=relaxed/simple;
	bh=3kWJntneY15F2xpfZfpWln4e6VgBuEbyGsDvbnmcEyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSyiRMix/zq8i0dG8Dp+4X1iYExRnb2N1EzAQtBPxsCxUPoagC2FIwUmF8bX85qQ0bS9c8azpgUgBeCyPLJDlrGkEwYwYsj+SVh6LkIz4JVqPJ0nVD0zNOsiN1AWTXXdF9o91oIjmYkhVXtNbKO3tZCDwOUZ08fhVD+uM6B3fqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OCKgueS2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553c31542b1so3488789e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753082141; x=1753686941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kWJntneY15F2xpfZfpWln4e6VgBuEbyGsDvbnmcEyc=;
        b=OCKgueS2usuzji+l6JLEdK8ZMOsPBKj8dKxAP/KVb8n0TPIFZek0kwFWy990fGVAEu
         9xWxHV3Jmyc2/N7uoceSNGyQMt372SqDYUyFDrxfuaEm3FW4K7rO/O1a8lXvb5ogqlq8
         9dPaOvWLv1JlpXpMrv7yV50teqlZMMdR+amQtAtcnNRREc2LjuzXDmaatjDf17mK2ziH
         jTM749JyR5RcNJUHxpCmQm3pPyZB6glUY/ToeGIFHdB2C0lpUPsJVRz6aZydtk1Hk/BL
         S/9szWEV7O1xZoIZs+x35PvvsgHVu2UKoIkkqXKzDeMzER7U1kdT3gOMKH9j8HRR6jWR
         GrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753082141; x=1753686941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kWJntneY15F2xpfZfpWln4e6VgBuEbyGsDvbnmcEyc=;
        b=U7FNcQ21e4lOYSVujPfT5LM12/BG2iUQYwgK5NZlLL2Lb/g+eFVbo2zb4w9xIRaohe
         0+b3Y9Gezj6d1ZeR72Wmn6OBU8eSZxmcqCoYdLCStSNIB06lzbtKyyu6BD4poZ2sV045
         NLrf0qJl1hRR1NzD/7l6b9/87QPRs6KqnMX5xPvuyPRv8ji8Cx/l26ScCP8SvYIXm3I+
         x6xBU2iP6ZJz1Jtqgrxu5KHp858UA1etlBWXi4SlpdmfKZSgSWd8DXEHtsym15v+/YfA
         Gkxy7mIvJ2IGkkpIYC14BasSai0d7OKNLcHeh4rpYkJA9t2JBx3Y1ZoturWHIrOdB0FL
         1JBg==
X-Gm-Message-State: AOJu0YyspIZ1JFRLxNcmnjixneD4M4CWhmhdHarmSI3V625aJ1sTUnwE
	3p3rzJJ2QJMlxzjqaYJBWfwHDPpwekeUngm/ZuYy7/tHY8xDNageiGPzN7n1FtF4G/ooX4XUMCM
	ZGrVvOV+Bon/Xh3wHE30P3e1GSNg3oLZXDme+QQobzQ==
X-Gm-Gg: ASbGncudto6mOnO36XzQg0EhMhXnH31jEsz3yOjpcAFVXvm1e4GPVG0cvPC5hK6az8U
	HgVNftu9VQdmG6VW8ZnVojWnaIJzCmcR+n9cOYfm8P6Cv3DyaX5WdzT+YDdr/kaGesmvtyXOF2N
	gYcdbSpKuYjMOCj3WqnNXPyLikPrb1/tlLmEi9wG22rHcVkMFU5L88I7zF6Dn8YwCLtKZcULtX0
	Sup5PhZ3a29hyO3NBwYATAnEnWmUtyjzbCIxQ4=
X-Google-Smtp-Source: AGHT+IHoxHLEDjHlHodorkZV1hHtJ0D4zBzlNTyb1bMriAvVHhlOrbvypWKNsHRIm0CLusBLTKbVPiMboVH4jIeM8hI=
X-Received: by 2002:a05:6512:686:b0:55a:2706:d276 with SMTP id
 2adb3069b0e04-55a2706d336mr5392459e87.28.1753082140608; Mon, 21 Jul 2025
 00:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250719155825.6938-1-brgl@bgdev.pl>
In-Reply-To: <20250719155825.6938-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 21 Jul 2025 09:15:29 +0200
X-Gm-Features: Ac12FXzTVtVjmolIWgNvvEZYAdt5AC0175_ZgYHQyr1iw-_jkopUeWsIJczkdQQ
Message-ID: <CAMRc=McceMhTUbYKsWrVR5EB-+8iEvCQ7GwW+VnBGgEFeDBSVg@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: rp1: use new GPIO line value setter callbacks
To: Andrea della Porta <andrea.porta@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 5:58=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> This driver was not queued via the pinctrl tree as it should so it flew
> under my radar and it uses a deprecated interface that we *really* want
> to remove in v6.17. This patch addresses it. I would really appreciate
> it if it could be queued on top of the SoC tree before the merge window.
> Arnd: could you take it directly?
>

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

https://lore.kernel.org/all/aHlBZftbEphBYC83@apocalypse/

