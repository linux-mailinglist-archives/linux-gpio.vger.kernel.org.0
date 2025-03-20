Return-Path: <linux-gpio+bounces-17816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F870A6A185
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 09:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15DF464926
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 08:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8CF20B803;
	Thu, 20 Mar 2025 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EmorYNF5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFF71F4CAA
	for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742459826; cv=none; b=HXbQsbXhfvFizZz1eifWXQKaD/T75v548KYLnBxwcagTzRHbA0A1BBtXUDa7h6VoFCrJvwF6P7kieBovHSZssbfRu3Mt188dqCIAlwMB7fAjjZCI28rVbdKUuRgznXpmPbMM8vjfLvqEWAj7EKPBDbeamLBCMpwKBIrrLSbg4ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742459826; c=relaxed/simple;
	bh=hmUcDbDQE5/qhB7rH9uJRIBaGhkE8xeNL8a0ANCqzoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKX/0nb8bCaqNG6tUV3uONsft0XvlUEqzN1tQ6ycZ5SNH3zCnrgmyu1vnrJygKQArTXJJ8Lf73k3HLzUpR3KzfQw3YJEqV2ev+R7tGWgqEgvKK4oiKSqVhs7mWAuDwGxMod3PU4glt7D8qyHmuo7xu47zWeSgNniho1TAvaMmHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EmorYNF5; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-543d8badc30so665160e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742459823; x=1743064623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmUcDbDQE5/qhB7rH9uJRIBaGhkE8xeNL8a0ANCqzoQ=;
        b=EmorYNF5kFZKr2odU1VCRdH4nipyx93A0rxIrVH86+rRox5GKKCkUi0lMhwWXUejlh
         wqKzjZniLUhZzkQUE+hdvCnCga3X5TaQxIziEX4TceVybS3Wt+1u7LPNWRUSjH86sSTp
         5YHEhN+4bzAw2HSUhcct1D7MPoUCiGyM+cDXcHixaJVYmFCmYA8T3Mz5dCpq0q5Lg49H
         OOXHWYBkmPedzFhd+YNPLm5ihh3gwL1QFwDS+R+HzJUpHnlDtw2wjHYF+AITvnvLdd6g
         9kaTywEuinvvWKJA0DVII3pwn1dB4ukqcH+47JpGqnVNR8KoPvQUhrUkCa3S+pO+bSJx
         DiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742459823; x=1743064623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmUcDbDQE5/qhB7rH9uJRIBaGhkE8xeNL8a0ANCqzoQ=;
        b=gke75U6YjctxSbjPyHXFOA/2DCltaWh83Nt4y5N0YS0W3qk3Vl/WR+N3TFNOaqYBa7
         JhAJ5ZoDMF2YGR2Ib3ZpuP4UnxSifetFS5E5cEIQjFKJQNuWaI2vV3AKB6t5vnzMDZQk
         PTPyaeBwPE36BvJoUxro4K7cDK3q7GzUnBf2iajVxTrJJgQN6e1jxqwTZNEuQNbDOCYu
         yFppypeW+gNdm4Z7RCzuNo0r1Go2f+EfA4qFLyXxxT9L2SMenrJKBA3+RbVe9nEYGF+l
         F+5GTS5fw/Kt2TxQ4XROaYbeppcfmrqKikoI2YtVznQPuvN4KLXFLk6ueBnOfRcKHQyI
         U3bA==
X-Forwarded-Encrypted: i=1; AJvYcCW3cv/6Q2wKKTs00xfSipPumx6uXxQJxD6OOow87Cc7IU4wxLzI1/oC2Ffsh7B5Re5hLPQyYke0TyfI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7bQcw86NI8rdsyIqfaKY0a7L1qgumQIrkK3X0gSr6gYEKCpIZ
	H8756rNVJHfXMKnYojLzPdkR0kE8Ijyr0js3qVZrvJJPo9YF1SqNxG6JKzZA06U6T+FGa/i0UbH
	4RpY5GVs1qCNj19ZgMxGyYwC+nbI9MMT7HReR8Q==
X-Gm-Gg: ASbGncs2fxulCKAzofbYnk/K26qRTG0hvDNRFIth/etgsPWs1bKWT/dxgsEURFGBLYg
	fdttTYSQHecUCNbT+BZNqtVhgu/bw2Xz2zAQIsMcH8CjL9NSyVwCpM08JyuMHVitG5cgx8iQ5Sj
	luWcOThxv9xUYfvfn2GYKTBhJBeoLGXuO2rQ==
X-Google-Smtp-Source: AGHT+IGsqlhVahQRSkG7TbLmF/njFBK4TQEE/FxA+ei/ZkOhKqP25xKFQdLZXuNAuoQDmy6F4aIS+teAw64uIFaJ5P8=
X-Received: by 2002:a05:6512:3d8b:b0:542:213f:78fd with SMTP id
 2adb3069b0e04-54acb21ab86mr1803850e87.40.1742459823013; Thu, 20 Mar 2025
 01:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319092951.37667-1-jirislaby@kernel.org> <20250319092951.37667-31-jirislaby@kernel.org>
In-Reply-To: <20250319092951.37667-31-jirislaby@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Mar 2025 09:37:12 +0100
X-Gm-Features: AQ5f1JrZtQ5rI7bFzzliGItNqbfzqd08CVSHd4xCDa6EbYGurwkXp17lVO1F46s
Message-ID: <CACRpkdYYyrD1qiSj3=F5yqxxoTTJn+rKovpotCk+UZq4TMCraQ@mail.gmail.com>
Subject: Re: [PATCH v2 30/57] irqdomain: pinctrl: Switch to irq_domain_create_*()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 10:32=E2=80=AFAM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:

> irq_domain_add_*() interfaces are going away as being obsolete now.
> Switch to the preferred irq_domain_create_*() ones. Those differ in the
> node parameter: They take more generic struct fwnode_handle instead of
> struct device_node. Therefore, of_fwnode_handle() is added around the
> original parameter.
>
> Note some of the users can likely use dev->fwnode directly instead of
> indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
> guaranteed to be set for all, so this has to be investigated on case to
> case basis (by people who can actually test with the HW).
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I assume there are dependencies in the series, if this is something
I should just apply to the pinctrl tree, tell me.

Yours,
Linus Walleij

