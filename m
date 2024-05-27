Return-Path: <linux-gpio+bounces-6660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8458D00EC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 632A61F25C3A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8D613BC3B;
	Mon, 27 May 2024 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RphZbBsa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2071607B2
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814803; cv=none; b=ccMaSLdXVS/y4MLm/ZACPn+Aiwwd7qVwONtVNXHkX8SCk+7QxGc6jKYcp4BcUuX3POqhqo8cuyGh6QI0PRWgkocTL8JnhYAWVBtdtj0akMG8bpx4wdUKfyt+ZRylyOFki64NMQSvc/uuUB7p0T2kvaOiYBnJ+rbql+UmI8nK3PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814803; c=relaxed/simple;
	bh=HkaP6glwKL/GZZMmy621Cw2Bayb68Wj/BHPrr3EyiO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qls2Rxhze55ku5M/LhScvTqgLyWNdLb/H5kCds1O1fO/YkBaAw9ewiJczyjviMuRZYRSETXjt0sJTt8GBjAcnX8a8C/7Ol4kcP8ktINCxVbikVPVslbNd5SywbmUVZx3j29KaUQeeKdS8kvCzIqEEqCimvmzLyzjiX/nFfeTZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RphZbBsa; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-df4e503983fso5352225276.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814800; x=1717419600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wywx+DoAm5KgDivz+e0k+JypCKJpEVBBW6X7OipnxCA=;
        b=RphZbBsaDKHLL3mVGp//+NbB/i5gEiymO6lgy5ToTxx/TEtVM93laxTh3kdHxSHpuC
         LIwg/a6JvRsonooJ5hboHx+tcOLiuTswOS35B/e/CUuhwv83/wTsKITxLhZfyWFvIAxO
         13nvZqT3xds1FlTyYihvr9+Sp1/WfRlkG6jJI44PiQ2Y64K5v2d1S65gLRIt5VWefB62
         ZsTG+BQ7yYxLoJg6UFqLAoxg919V29iMss5s8ydPbpyhP6yjVjQJ/+4bIAkst3ztT7vd
         AR3VuXKbjr8MIQW/vwYk5iH0FGmJpCXOVinPjQyBBxXlZmVQfKjpIN5ZbqpOceLFg0ri
         zC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814800; x=1717419600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wywx+DoAm5KgDivz+e0k+JypCKJpEVBBW6X7OipnxCA=;
        b=bGOOn8xCViXbRAwZCB9wDNG6hBU2wThpl2bI7lcN7KztMT+DSStatJA88wBJOXQdvy
         RabasNArnaXQtEWdezEAWTzpncHga1wg+me7Fcjj1lzarL/1GuIylpcHwrc5gOJROtYY
         6RSowBV04Yagy8B4qFr2N2ZKsHAT2oW0k3OwLt6L/Ta0bhPUq8es3hpRb+m3ZUJj3jzO
         rKjfPZ01MSouMOuaSvMSPwuQUouI9l+6+9okzH0fXrfXf03PcPiK1KVxH83F7HeByODM
         20qvbo9NNpnRbFS+JcMTmjH2MTqIhmTIq3Y0EACFDpwZ5cP1ldXsr2/vfRQl9TnbH10Z
         C90g==
X-Forwarded-Encrypted: i=1; AJvYcCWBKrFjha3FkVOmyClQtw0xT9izXJSOQGyZZNPGUPv+ofaWngMM8WEDjvWKkDsRU9YkEdPyHQKKxqA+cIUi7XPc4l4qmXvob8lYKA==
X-Gm-Message-State: AOJu0YzLHw3DZko42EqSVidgOfyq8jZpBMK6zOdMeLGIvpxaEHIZZKJ6
	nPzIdfeUGNvZjMEmyIN3X9bpPW+rYD+aW92ZBE3YAuLK7/3WNqGL/v5iZtIy5igPfGzjC4yXstP
	Edh3SLHKRLHOY0GUpLGVypjPCzIB72MQs58F/9Q==
X-Google-Smtp-Source: AGHT+IFb5DbLkPdaiOEZs/ep03FNPZZ+bNRgzDn0ZDr8Mf2yH8mLV7AhtYtaaqlTf4TIqDPk7TtDNMGL41zvuu8XISM=
X-Received: by 2002:a25:8392:0:b0:df4:9a10:4e12 with SMTP id
 3f1490d57ef6-df77223e466mr8632612276.57.1716814800453; Mon, 27 May 2024
 06:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521012447.42211-1-ychuang570808@gmail.com>
In-Reply-To: <20240521012447.42211-1-ychuang570808@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:59:49 +0200
Message-ID: <CACRpkdb9EZ6fpLHO7a+A4szM_wc6JT6pxH0e0EWCOX6Mg2KkcQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Add support for nuvoton ma35d1 pin control
To: Jacky Huang <ychuang570808@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 3:24=E2=80=AFAM Jacky Huang <ychuang570808@gmail.co=
m> wrote:

> From: Jacky Huang <ychuang3@nuvoton.com>
>
> This patch series adds the pin control and GPIO driver for the nuvoton ma=
35d1
> ARMv8 SoC. It includes DT binding documentation and the ma35d1 pin contro=
l driver.
>
> This pin control driver has been tested on the ma35d1 som board with Linu=
x 6.9.0-rc7.
>
> v9:
>   - Update pinctrl driver:
>     - Fixed a compilation warning reported by testrobot.
>     - Removed unnecessary gpiochip_remove().
>     - Made other minor fixes.

Patch v9 applied for the v6.11 kernel.

9 iterations are certainly enough, if there are more comments they can be
addressed in-tree.

Yours,
Linus Walleij

