Return-Path: <linux-gpio+bounces-19003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F530A915B8
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 09:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF5B27A6982
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CB62206AE;
	Thu, 17 Apr 2025 07:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e0c2iG8d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520AA21D5BF
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876287; cv=none; b=FxT+FDByY1pY/pYG+m+e5MRg9aGYHky+UnFEIz7WkfcnrQo6DTlwI9/viSsCK918fYb0/5YlZiLRrqeWtBCdDqfYXUIvIdzR/q/rmeHPLfnrNCNxzYzY070PTorOp3y7iWqO1h+StD1h+qjP//6WZkMl6z29qelLJPL5irjCFIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876287; c=relaxed/simple;
	bh=Lfh3obR/cWEw2XOsXVoh2BjkSwas37Gs2qVr6+P3ZiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRYEbUlfNGwQvg47athlgKbwuab82WBSRCj89uSEh94eme+N8bvlpp7nl+E2idbZb0wKfP3u72fr7//IMk1woqZaDTZ8Bj9eyYq3apNrAGSh42P7lnP0uHBJdOcnMz5L6HCi39nuPTegeUHP+Jtbw9fOciSDLFv8AcSfblRhwSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e0c2iG8d; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54963160818so568587e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 00:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876283; x=1745481083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lfh3obR/cWEw2XOsXVoh2BjkSwas37Gs2qVr6+P3ZiA=;
        b=e0c2iG8dFrOe2p2heowtbTtGPiM+CTsWs64KgsndGHoIcugzkK2IoQUr/wJ4D+xoXB
         5lluTtWwIkImfOkbs0jTe0ZgzTY3oIsJmfsv8Nj0h18qmmLZ1BtYto6itNpzGoQ3XIh3
         0Lbj7EqiWCjdECWED+Eoj5VuQ945kU8Yl2FDTkYunhOTN82Z88k3p8/ySR2OEGpAqXWT
         mEFjdCglhDlYJovPx2jzilC6/2PMgjjt6lgqQnrTvZDA+AV9AfEagUMP35FRbkjlojLi
         n1SBQQkPDachSil6eaIsgr4mQheQvvKJ9DKe7j0KI66Gx//pT5FU4rEHny6whztkWCw7
         Kvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876283; x=1745481083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lfh3obR/cWEw2XOsXVoh2BjkSwas37Gs2qVr6+P3ZiA=;
        b=lr54abiCoKpd/J8IFkr1X5Hir06ojuPH2yaOhXjieSzCpmAmb4BZizuPnFNbs6RxT1
         G35cKyRExLw0ZP0jSl45KWeJ1Aw8bUZJ+JWPt+Wg3RFu7xyV2dg8HI+vNJ1XYkBiVuDx
         uKvs4on2z7pPH8T9GJ/6qEn5hI5BCBe6HdIxfNloLOyiw0a85J7i5KNEtnMdGZIu7K7v
         Ubq+Fel5H+n1nP1FU30hfW8hb9KPo+wr6G/Kun9z0O7/VUvcz4T8XjtV5Fv794RIsz02
         nhZCX95XNpE02RSp3DpppgN3GKAnGVpied/7jA8L2ltCEnoKkROat1flTOM9Kvs/UYrP
         lMtw==
X-Forwarded-Encrypted: i=1; AJvYcCUvFQ7XGIwDywfreehXtBjsiul0ztxOdhB8S/HPrX8ZsN6MWpgkuDEQ9y3F9G737FWQgC+Pn5K3CVn+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7neqVw4trbFs26Z0lbO6qWMYkYtDsIOduKstbU+lv5ecjA6hb
	Xfl9Z9iKeVUE8WvNsW6Ofi2No4waNtZZR1oh2XvFWexfSO21vw/XPAb7AWNluxkGQYLW9hYAoq6
	KQWVzG33LFJFZPcl41OagoSwQoHobg+0YrhL9pg==
X-Gm-Gg: ASbGncthq7dNiLL0sVSfyTyCV6K4C750FN7NzL09gpRvAPAsqv6/BCpdsNLtSq8nbUO
	QSPgn8MteXtW7IQOewpuMvWTBbASB0BfQ62lTbOfYYFdWU1nbQMS/jLA5xg1AfVkaP2nJmDmhBS
	POpaK19vTRutSyavNnzjeQmA==
X-Google-Smtp-Source: AGHT+IF22vTCfimAhXspSKxNw20fTEOO+Y5j7ipBjFCQZlR3SJUnkLoVgGpm+KXLc0G/KFFZHy1BLVHF2mbakXnE4D0=
X-Received: by 2002:a2e:bd15:0:b0:30b:cd68:b6a6 with SMTP id
 38308e7fff4ca-3107f68a9b2mr23447381fa.6.1744876283329; Thu, 17 Apr 2025
 00:51:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-1-9ca13aa57312@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-1-9ca13aa57312@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:51:11 +0200
X-Gm-Features: ATxdqUEzrSa8wQrPj-_TFVtVAQv-K8f-maneQ4kuW4K86GYPU_CNe9bbfkx_wMg
Message-ID: <CACRpkdaqw8o80=coMHv6esa-fVQHc408_==7iaBd3M0VFazEGA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] gpiolib: add support to register sparse pin range
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:00=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Add support to register for GPIO<->pin mapping using a list of non
> consecutive pins. The core already support sparse pin range (pins member
> of struct pinctrl_gpio_range), but it was not possible to register one. I=
f
> pins is not NULL the core uses it, otherwise it assumes that a consecutiv=
e
> pin range was registered and it uses pin_base.
>
> The function gpiochip_add_pin_range() which allocates and fill the struct
> pinctrl_gpio_range was renamed to gpiochip_add_pin_range_with_pins() and
> the pins parameter was added.
>
> Two new functions were added, gpiochip_add_pin_range() and
> gpiochip_add_sparse_pin_range() to register a consecutive or sparse pins
> range. Both use gpiochip_add_pin_range_with_pins().
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

This looks correct, useful API and nice naming too!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

