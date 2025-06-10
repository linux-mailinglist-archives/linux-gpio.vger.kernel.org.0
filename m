Return-Path: <linux-gpio+bounces-21294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C01DAD45AD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 00:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDA8A3A696F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 22:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E542874EA;
	Tue, 10 Jun 2025 22:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HNuDHYPl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B789286881
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 22:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593335; cv=none; b=d5BXDnEBXBIgNL+za0475mdMuOJzu2EQT5Kf/1oAB3Gax0JGRxToC3Rw5Q694T/0jm2K5dMGfCZtBuvrnpnYn6aBnZecDZdY2Ix6lwY6Xj/BcIPJ5RjkBYans3qaSu13cIaopD033wMe9LdJwAYNcvdS1SiGEn0TWSEyNjzUcxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593335; c=relaxed/simple;
	bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihqIvfJya7dk8hWvjEibNNAuO+PQ3ft/Nur4m5op4tQVxWPuOVinLyYYJgI1IsW5IJGURRQUwMoWd9c3hUZxDO83X7ecoxUm/68zThclGwTP5snbgXnVGj+I8AL+wzv75ZXpsgRna9CdeFfkainev+YRB2IfjvNWF2VaScxPd2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HNuDHYPl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-551efd86048so6055871e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 15:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593332; x=1750198132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
        b=HNuDHYPl+K2Zm5Mnxn2A5pYoDofWUVMI9eny4zxnJqj9L+tNaq3dT9srblTB9Cl+Yo
         cMdG/rtMGo02HzGBe2TU3voDdHpHg5Eb9cK1o/VLXS0Ng2MjiKY9lrmh0Un6XNL643eq
         cEhhRXkcoMAEZTdH0eBxGpsluQHJJtox9sdfAuS5hd0vRva4vdtsTOXF8ChPGfVsOLvR
         KLOza4yaAa/VOROLBFy9QhzupDz0JVGzXkYMKwwFLmjR/rdX2++MX6ESNmNZQOceaQuJ
         oAFBK9EKp6EK0rChdUA5oZfrJ35zRnxZtJmqJqVbcocgfahNKuCTtVGupI6Y82qhuSh8
         qcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593332; x=1750198132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
        b=T+apx6HJE0DPIQ73mLY1cqM5Ka+zY8+/N4uHfyehOBtM72zNR2941f1AKQQY5D6BdB
         o9yLd4+7OAi2cz6wPwc9r5A60q4P4DLjEVuRQl3nereZiKNOQ6uHvxfG0wy3bkQkEdKd
         1znAQICVKegj9htjaWQ03F9AQ3ZHXpFx1Py+mSXFXK9i116ufdBN5cjmJR3LMojSQqnN
         xpZ0RntvLu0y9Xsd3EBQ9G/tJZTSvxJe60ptxqNzQJiPT7ItGKz/ZBqoo+yERgeuaEoV
         1HDjRWm1rem0p48HX3l1VgYBfkDPEpyXL7eEPDUi3Q/WBlAMURCLXCxsSnobBhLVfE/H
         ZaqA==
X-Forwarded-Encrypted: i=1; AJvYcCVcOEefz6TN16ojyCU1OI+c26/RxDY6WtbUgmwJ5EPLSbluLS+BLkJHNdL3VzHbEbJ2MLtSa+fYWe5q@vger.kernel.org
X-Gm-Message-State: AOJu0YzN50bDuzTJ7C/caIcFFxp9IwWNU1lhaJboPuyEmmt8VB86ZaXi
	KmoLBUXd5+WfxJZNS+G0VexqmEx5B8dJRq4NR0zVjGoUaQ+OIDZ6Xr2hTIPTtBpB5nD+t51PIMp
	k2+OkcVQ+Zuhg4px5HKaKNzdTcU5veoKenPbfD3I1Dw==
X-Gm-Gg: ASbGncvAllAapLM7wCtBY4oXbtXWQvWTil9ieE7PvvYad+S4j0dBGs5DPLm/3YbcW2j
	GAotefSBicCxAcr0WG+zlGZcftzdlbmQxlQw0fP1QOLF9EAoiCUh3pgihBpdYnMXodC0uae703r
	iseSGYz725/MU1Q60OI/KKpLYK94l9/ZIDWtOL1S7VJv0=
X-Google-Smtp-Source: AGHT+IH8MetiTltiLxVsoQdcqnz9SyKbfeIivBe6BgaYPax7FqypUr47bqpDDYKrtQHdmKVxRlIZT6Fr1Q1yswx0lfM=
X-Received: by 2002:a05:6512:3b96:b0:553:202e:a405 with SMTP id
 2adb3069b0e04-5539d327776mr135286e87.0.1749593331540; Tue, 10 Jun 2025
 15:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org> <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:08:40 +0200
X-Gm-Features: AX0GCFvL7R8uIhwfFeu8Zy5wwVjWQCtUtnOLFaGyd-WVGbMxfXjNiZWqOaZW5QQ
Message-ID: <CACRpkdb+1uYy92975JbFUgvO0GWZBru1A8gOsF_VY-opzxopSQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] net: dsa: vsc73xx: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

