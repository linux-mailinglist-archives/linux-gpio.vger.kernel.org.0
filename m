Return-Path: <linux-gpio+bounces-4744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 003F488FA6D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 09:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE8122A6287
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 08:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A26554BEA;
	Thu, 28 Mar 2024 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvEEI95d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05762E645
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711615988; cv=none; b=SVoJNBUGXE9nGmVt1zZqPRgLPk0qjMFsxpaCRctDirNcKkDu+M4m9RvlqVBbka8l8PNs7tAib+Eqam6YFBMY+v0M6WydizJWghtL3FtTJ2Xk2kCaiVdVtbzWwZFcDZk2k7KU/jPRdiDS9NpCzCx81N80SZGyCgzyxsC6Ky/4p6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711615988; c=relaxed/simple;
	bh=O4YCUCdpX20goNyPZbTYJiK3vjUIO9G2FatjGdtwvlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aD+XoSRvrKt5qSVWXQtEZE4LWkI7Y935EYoM6Kzx+LW2lMIHc9CvEWhYqc6x+gDkOKaK83dVDidsbk97+YeP5kOt0wrh2iiJvYn5zeO9e/FWDJGQMTneQO4OPx8ASwqS0zhKBGJSSxjXP4/Ev+TIOWuQxfaSibeChSpaDubijyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvEEI95d; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso601630276.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711615986; x=1712220786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4YCUCdpX20goNyPZbTYJiK3vjUIO9G2FatjGdtwvlo=;
        b=dvEEI95dz8jIvwd7nSlHSE7YzOdPstUOV+Jm1xSodQTZsb5HdVlqPmA7ndWrOy0Q1a
         pySKbgyx/kThiBAnZ1g9vcrPpueu97UoEP9iUk8CiQ0Gzp48ig6O5qXZn17A9+2+N98p
         wTWdO1TddUjhuR0dsYSF3CoDSyAW7KSFWfuFujKmIVaEpzmgxceTkbOcOTlMzfCvUMHF
         vNUzIDhI2MoO35k2YQsnNDnJNeYQw79ikh6bKe7/IULJ8TMqDttZmGonQ2F93KdDWWt5
         Qo906SJNVteRDMX+7JOCHu+u22ZSeSrobU2ypruFEIG4l1kSD6XxbgHV7hYJ2oHBbT3M
         z7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711615986; x=1712220786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4YCUCdpX20goNyPZbTYJiK3vjUIO9G2FatjGdtwvlo=;
        b=N3e9cw8JuxoKAP45iVFeEBT9Q3yYBTbU15zMKrNZo2PzlCAC5EwErLDmYg6qfYkpsJ
         7pf+GNEvFSFHLZI0CVD7yvdnp0+7oRNu/ojSJrBBgOSlYqqfKqzX/A5qOSIJxhCng6hX
         3arKc8JG718nWIHhl4kw1WBUlpMod1Rnff1hzY6uYDbzAHbiHHSwK5Yzn0VyVh1uGelN
         YL1u0gKIqZgGQK9iZlfH+rIvxgj3qRipzzNMtIH4uG1YxcOsoqkOQAtcgfz6bSFNegwN
         cqFL8EdbmpKzVv1cDV6SPHyqTZYFXpXtua5SO2lUl1ADxCa2hRcPGVcecPeA6BuDBTF0
         yyng==
X-Forwarded-Encrypted: i=1; AJvYcCU9eQLz/q6zHa8BjStACHhTnXDografSd5U9qUmtWfj3/JZ607lMHoBSz1OFssPMAVtCUYNOBWDADML4IcvpryV/LV/99skzNsWjg==
X-Gm-Message-State: AOJu0Yw+JRNqhExFG7Walt719Sn5tPs1I4qg7eXafjm8mU1NoeRcOqpQ
	ddeCVu3Oviv3MwC+5exYWSUSqeX9pIDRpL2k9Mo8KlLzBaIcjSIW1YFWSLdq22ORh3VJwgkoFRV
	5Y/h4qMb8VZAxGZGWcalS6DkpFF/7E48j7VIkkA==
X-Google-Smtp-Source: AGHT+IF7eUJ67kfFSA3t6w7HWmkxNPi2G8l3mr1WR/LjnA7VxfJvQTc9EnRX7oU7KyIAOA67YZns2niz+mdjKYVDfoM=
X-Received: by 2002:a25:689:0:b0:dcd:1f17:aaea with SMTP id
 131-20020a250689000000b00dcd1f17aaeamr2220021ybg.26.1711615985873; Thu, 28
 Mar 2024 01:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307070113.4888-1-wahrenst@gmx.net>
In-Reply-To: <20240307070113.4888-1-wahrenst@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:52:55 +0100
Message-ID: <CACRpkda5MSsb5p0FEj=XzV+VsmaSEbKF--BkOon0fEPgoLQXwQ@mail.gmail.com>
Subject: Re: [PATCH V4 0/2] pinctrl: bcm2835: Implement pin_conf_get
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 8:01=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wro=
te:

> For years, the Raspberry Pi users relied on userspace programs to read
> the pin configuration. In the meantime, it has become apparent that this
> approach has reached its limits for various reasons.
>
> This patch series now attempts to improve the debugging possibilities on
> the kernel side in order to reduce the dependency on these userspace
> programs.

This v4 version applied for kernel v6.10!

Yours,
Linus Walleij

