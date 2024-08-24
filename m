Return-Path: <linux-gpio+bounces-9118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0EA95DE7D
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE7A11C20B8E
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 14:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD30217A93C;
	Sat, 24 Aug 2024 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QDMTk9dN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69A1714C0
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724510434; cv=none; b=FUZF1w+TmXEtSSXdL6/Sdy/QUNGr1Hrap1JTg5ihk9xLarrRHk3QgyQC/z284dXY12hKyEZQYxs5mjWjlNfZws8St3ijySLrvL0VQJKBz4Riq5UMokhhAKcRgUY72q9kAANlHn1s0aDSUsuJY/T9bQXlSkADKKLxtb7X3g3Qclw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724510434; c=relaxed/simple;
	bh=M+00aPqAIJfQiLjQyOBdsrvt8KcSjON06jxPta54+9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAM8iXsvzhkEyhFnavtKDAD0J6yaSewOKjNj6d940EA5MFKU4gE2PEC0rj1to/zeug07NG34FMM8dRGJMwfe8SP4PS767R9uxinaRVs4XcBOuSCuZJhGRv/HdrVXlo0jHiJA7DAqh0yR+OGX7apN7yQ4lk99UHqA9YPZ3pqHY8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QDMTk9dN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f01b8738dso2187519e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724510430; x=1725115230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+00aPqAIJfQiLjQyOBdsrvt8KcSjON06jxPta54+9s=;
        b=QDMTk9dNOUy0+i8YYeYxAOhm2q3fWfLYizvZUngq8S02sjpKAIumowxwQQ725rgXzL
         VRb515NEiF/W67k/y8/jF4UHYo4+e22XcW9bUwRIRsXexC+06QXfL7w/DOw8daCXPfS2
         sE0YNMZFJzRP9+52+adbO3cQTkab4SxLymLA/cVd6ThiswP2Fm4suqtEze4CUFchFXFg
         3+g2yu41sTN18vx08KOh9gDv6VXJaLsDT9hurr0jURKFsnwz9b9cv+3fgrXH7ZGLyU2j
         0u0oRnvnXZ77IP1ajyZHhNZqYlHePvG8+9nyH7FKDUKjnK8LPH8Lo+xPpvWF93t7qQBc
         qCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724510430; x=1725115230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+00aPqAIJfQiLjQyOBdsrvt8KcSjON06jxPta54+9s=;
        b=vvBMT1MhbKhLdh00r/GbJHGc+t47ElzQ4wqLI6mmeWucrCRFaC6pS9reGnlNRYbDPZ
         rjvwBB+F3ES0yyBN164odGjmAEUtmcSq0ESgHU/nH/Gyu/VvXSbXVO2Mzgtw7FDrP3Vj
         rfih8TCY03IPwnhZdAE5y4uyM1pXlw4UwvXSh3tNLJMz51n6RB9u4L2tw1Ie8NQZA841
         +qyD8bY/aZ0p2iy5vrjAI3pIO791+GiTxtWf3si+D0OESjMvZHGSh1nKtJd91mf8la7g
         ONxj9BQa24efu3r9yM/5K9XtVX60O80skgJse2ES46UHI0Y9W2mM7F3aqyRxdGuo7H1e
         Mudg==
X-Forwarded-Encrypted: i=1; AJvYcCUO2aa15eTuI2AqdlYTgiV0QV3jHtq/qQ1b8bUMZ41Qt058PGjcCsU/F+koMGHwv2t9V3qQhnimrmAf@vger.kernel.org
X-Gm-Message-State: AOJu0YylHDYyqbvAYwuGc+L9lL+ezouvzs8oBEwhW8VLlOxETpwiIBkg
	kkRXVbvh1F0/i3hcSTUKy/sqE4S13B18oFdfps00hq8xI6GwbPsyAvuBBfEC4z6dXY6aVjFhViq
	hO5bJZnJg63lDmqAhJTgRVOB1aGZBQerTTXUzbQ==
X-Google-Smtp-Source: AGHT+IFUWwNU4JjKJfUkk5+b7VaNM9tcGLgDxOphG4oT66UVqnMDc84a+SVvS7/Tom2C/L+hvh4W6uCE9zsb/aWB89Q=
X-Received: by 2002:a05:6512:230a:b0:533:4560:48b7 with SMTP id
 2adb3069b0e04-53438783ff4mr3214329e87.30.1724510429403; Sat, 24 Aug 2024
 07:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709105428.1176375-1-i@eh5.me>
In-Reply-To: <20240709105428.1176375-1-i@eh5.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Aug 2024 16:40:18 +0200
Message-ID: <CACRpkdaekcM-rGNzczQFFwDcte8cR2D=j6LB9h5W1XRbBtBhJg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: correct RK3328 iomux width flag for
 GPIO2-B pins
To: Huang-Huang Bao <i@eh5.me>
Cc: Heiko Stuebner <heiko@sntech.de>, Richard Kojedzinszky <richard@kojedz.in>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 12:55=E2=80=AFPM Huang-Huang Bao <i@eh5.me> wrote:

> The base iomux offsets for each GPIO pin line are accumulatively
> calculated based off iomux width flag in rockchip_pinctrl_get_soc_data.
> If the iomux width flag is one of IOMUX_WIDTH_4BIT, IOMUX_WIDTH_3BIT or
> IOMUX_WIDTH_2BIT, the base offset for next pin line would increase by 8
> bytes, otherwise it would increase by 4 bytes.
>
> Despite most of GPIO2-B iomux have 2-bit data width, which can be fit
> into 4 bytes space with write mask, it actually take 8 bytes width for
> whole GPIO2-B line.
>
> Commit e8448a6c817c ("pinctrl: rockchip: fix pinmux bits for RK3328
> GPIO2-B pins") wrongly set iomux width flag to 0, causing all base
> iomux offset for line after GPIO2-B to be calculated wrong. Fix the
> iomux width flag to IOMUX_WIDTH_2BIT so the offset after GPIO2-B is
> correctly increased by 8, matching the actual width of GPIO2-B iomux.
>
> Fixes: e8448a6c817c ("pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2=
-B pins")
> Cc: stable@vger.kernel.org
> Reported-by: Richard Kojedzinszky <richard@kojedz.in>
> Closes: https://lore.kernel.org/linux-rockchip/4f29b743202397d60edfb3c725=
537415@kojedz.in/
> Tested-by: Richard Kojedzinszky <richard@kojedz.in>
> Signed-off-by: Huang-Huang Bao <i@eh5.me>

Patch applied for fixes!

Yours,
Linus Walleij

