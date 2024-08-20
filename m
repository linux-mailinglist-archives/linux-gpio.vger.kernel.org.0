Return-Path: <linux-gpio+bounces-8849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D0F958117
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 10:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B11FF1F253E2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 08:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C513418A6DB;
	Tue, 20 Aug 2024 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g17+gZ1U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C4018A6C8
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724142975; cv=none; b=LNOoJ/HyWmr4O7nUO3f3jlXNmqVpwIUfeRxwQt/MmFkACRyyVnPW99mmk07nRClQ5L7+OKjR6UV0D+lvAUMdyFezaE4/M5uKozthNtM/OXinMCGnpq79e/kFnGqGIHeagQ98AseXS9UC521UmFGWijAbJ6nQ4Ppfd5EMXDctxpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724142975; c=relaxed/simple;
	bh=L1l31PppL5t6QO2Nxrc+NZRgGjWPXKwkVIsKbjjHhPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khWRu1je2a11pJPstoKV4U7pepwx97TTbL9AmguCwMA8x1Fp5aCIbJrFtoi0YSXsTOdSIp0dl4Ienz46RtzozXuO4LWyGQOwTCFQuZQDHHK4ipTPUVA1O4vSXlnJHf/Diq5XEbWrem4aH6I5IMv6xYAaH3Bm9Wt4AQjaPrj7RmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g17+gZ1U; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so7598592e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724142972; x=1724747772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93zvk0knlzhngCWuZE9aqqrY+p0LiG23HSxKJAQQFAw=;
        b=g17+gZ1UNNn3KwKS//KueiCvLqLZolUbEXCzfQ9yEro8Gc5H9pBxKt0+Dsaa5welk6
         71+e7oyChsdPCczX693TQDNdew8p6G0dxYjbO4l+9lbnGCH/am8F2EaErCWpWqpC1H5T
         uX9zR9ss1vdQpseJt9YREYeceuoUi/VDs4LyqWxRgrb75uXd2GkdD5/JvPk2Xu4GtwcL
         d8aYll9ifWt5rijoEZyhCJcumvDMD3kOvQp4BXMXf25DHl+cXy58bYuN4IaBROJ6DbPw
         0GK7+LYY5bpVOf6j7hb5jZkVGnbT9bKttO4CQCYrfbFjvAjZT6FHaOX3IzByGMHG7NZu
         MWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724142972; x=1724747772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93zvk0knlzhngCWuZE9aqqrY+p0LiG23HSxKJAQQFAw=;
        b=gG04Hz2is2wP+auYQibSdzxoLq26uS50eq6TESQQamXqCZ8jCbpVfNQJ2st1h1SQ6w
         B1sp8zV9UHQY1wTe3IfaLWsl4QHYFhLMhpnUjceipkwpWk8r1R+i0IILT0O2gwvp+d18
         nx6E5yYef+9ePVqIcDAu7MV4K719Ds6wYs5FYuO29om8Jm1xFXWTXPTfXzOx385eQQiq
         40Yd6lbpvFdMikqir4uc7waGcGtp33EyHGvcCXbPiJk9kId6DN8/Kk/Gt8BU2Xs4vKiK
         ByVHlCAU2jgjsjP2M6ZHvkFRIAs/d/0oWXkAZX/Kz6mh79pWurEAw9p9TipWDga6O1EN
         97tg==
X-Forwarded-Encrypted: i=1; AJvYcCVEcTX3sap+XL+3ofXlh+wpj0avoKvE5y3NwlNmp+IGrSspO2jQwtXmV5khHZ84QPmsxz8c1MNoyoWw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Q6abKWixQuUbCMRtiuNyrLoULUNRLUjtJediIV6/MYyP97qq
	pB4G/vSRzmfsiYleBndh/bnDnj+2wnW5XvQ8ldGlDK7qFUHcmz3hQY3jCwtnmRBHpTcksjR2OJ3
	Z8kJ+djVF6yxTi7gI5Q9qJrp72aHI68LFLcWBMA==
X-Google-Smtp-Source: AGHT+IF6JHDW0yv2jM2k867VgDYtwHiPlKvEAScFqQhWr+xqZINagdpnc1LL5D7qrBJZzgrPZQXzCCt6UWSCL3EwNGQ=
X-Received: by 2002:a05:6512:3b20:b0:52c:caa6:13b4 with SMTP id
 2adb3069b0e04-5331c690049mr8725264e87.3.1724142971198; Tue, 20 Aug 2024
 01:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820083323.62485-1-rongqianfeng@vivo.com>
In-Reply-To: <20240820083323.62485-1-rongqianfeng@vivo.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Aug 2024 10:36:00 +0200
Message-ID: <CAMRc=MdN045+6LzxeWa9VwuzDDbVy7o0pESXc3hrCxrnatSSLw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Simplify using devm_clk_get_enabled()
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 10:33=E2=80=AFAM Rong Qianfeng <rongqianfeng@vivo.c=
om> wrote:
>
> devm_clk_get_enabled() will call devm_clk_get() + clk_prepare_enable()
> and the clock will automatically be disabled, unprepared and freed when
> the device is unbound from the bus. So simplify .probe() and .remove()
> accordingly.
>
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> ---
>  drivers/gpio/gpio-davinci.c  | 13 ++-----------
>  drivers/gpio/gpio-stp-xway.c | 10 ++--------
>  drivers/gpio/gpio-zynq.c     | 10 +---------
>  3 files changed, 5 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c

I already sent a patch like that for davinci, please drop that part.
Please split the other two into their separate per-driver patches.

Bart

