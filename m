Return-Path: <linux-gpio+bounces-21761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFD7ADEC5F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F6C1177058
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444602E6D33;
	Wed, 18 Jun 2025 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q62LiJ4a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E41C2E54AA
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249670; cv=none; b=PPu/+JRi5yW+3qZ0XX4wPJnopqsT3XnR8JXwH4LeVbpU+Z5jc7pyqIp9BsCSLAO+B7Dma/MXjzCHDim8uIvir9ECE4iy0xsNGP0ck6nkFy5HvyHIxEDTJJclE24xYdIjFsUj9tdOW2TnxbhHqIXZYm00788HPmWtzQqVcPVquy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249670; c=relaxed/simple;
	bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0+xZGF6uC2uuhlExvjcketbc8NW5Cm6ENAIgYeETYxC8uBH/OBmWJq2HgM0N9zPfswh1mTHZSot7rRYeTdh8mFCQwa2NNX4Ve2TI0lS4gWjfBM9nsWgROC3WykxtqiOLJi3W9tvCwce3l4Uima5383GWnK4cPm/OdW1Kl5qTk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q62LiJ4a; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso6991481fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249666; x=1750854466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=Q62LiJ4anBM9mCtPO1s1wPQafnXMiY44Wb6sed9JH7B+3kqfcj6OlRn0afcRWdxW2T
         GbRcS2/PDp9OME8vCM6aCKmKaSnRlRkd59Vywk+e0f+LJKKgmpr0IkbPHWiFpdeQJTed
         Ki1UZKrjGbTKc3php1hkcjQXclqOj8kH4nvJPUbCkJ64BuXCSjNYt7EpEJ9H8YK6/UAt
         hYlkTo3J5CwzbkEY7LCkAbhwCYvxdwlCVBsecB6OxorgUdahP0dPqdIUTSpYbRS0VW0b
         jmNktZZFxYS4UhcC6SxCXM/VnJgbSDqrjF/aSDVzedYhZLiOR6sWKcwvIHp7m1Ky8hvt
         U3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249666; x=1750854466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=GYQfUho5vagBQo+9QxucmlWfsmv6U+KT68PUkZnSngrlbQYn8I8RUs4iT3x/45svsp
         US8dwt8Vtne/XLfcxaIuApDX8skpddno3292H9DfOytXHMSoCNBdbWtEpVn6cpP+HRzY
         NFQBQBnyK6KiGIlhpO5/WmUMa0aNwmvLsIj+YxE2XqmoYU96M+i/UiWkOKhb+GV90d4K
         tSH+5Cwr61ygIjjuib8JlZMVSeR5Jpv4S0duHzv/1ZXi/U5WDIPxjwXnnM6CPZw1xp38
         pXbGd97a68Gk1iHM6ZoFfPZWj2B1HG4gCkORGQewV8weSPLV6CXrRn3LTQK2Zv88tV7W
         fNcg==
X-Forwarded-Encrypted: i=1; AJvYcCXYtkM10CFue4QcJPlhPdLzFV3fCx0GM9ssH2WqtzcrWPz8WJdVDWI3v0wUTgUZntZVBh9lI77xXzy1@vger.kernel.org
X-Gm-Message-State: AOJu0YztHO7PCRWkE98y+bYwzRw2B5K+LveTMQe8ihq1LgFtDXCng4V+
	yoFQ4nF0hH5CTh9D/Y5z6R5ZnjvkzxGvC2A6dJMROC06F7AD3m3vpJ97OVq/+uEIWSX7z1IRiZm
	fNAxKx+ZmrRMfOWLbVIh3NqSoR9NvPNT4VxvW3yNyLg==
X-Gm-Gg: ASbGnctlMmMTebBv0Oq8C1JWWuaXsMc/SV6h+uVqnhJSJI7w4nl3ZQ0Ams9tK8FcGqT
	I2vq2OenGLNoKaRj947YV+BL+TCeJzBzudPxfsnDzHdLqtJfhymxrfxNWP6vQ+eDw8i8VTK4k7r
	Y860ODwy8zBGaOyns6vTVdh/V+TSURoBQFd41NmLmENLI=
X-Google-Smtp-Source: AGHT+IEO41Nyhls6z+tYoLHnOV+DOmxEURxkPhjx4goE9pZdzx8ZYG8pWoqgfu9hnvxH3hdYq4NmpJCLdC/k/NenFbc=
X-Received: by 2002:a05:651c:169c:b0:32b:4441:e1a6 with SMTP id
 38308e7fff4ca-32b7cece005mr6055841fa.1.1750249666214; Wed, 18 Jun 2025
 05:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org> <20250616-gpiochip-set-rv-net-v2-1-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-1-cae0b182a552@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:27:32 +0200
X-Gm-Features: AX0GCFudNOYMyXLJ7vMaeO2dSvhoaQWQJroQG17p-nXTR5Iec4T0QKmapC2D9eA
Message-ID: <CACRpkdYJ9O_y9TGTOw8mzf1=LvaxYCE463MPf12YaXUQCKaLzQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] net: dsa: vsc73xx: use new GPIO line value setter callbacks
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

On Mon, Jun 16, 2025 at 9:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
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

