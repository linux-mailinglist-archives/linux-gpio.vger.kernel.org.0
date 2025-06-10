Return-Path: <linux-gpio+bounces-21293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1EEAD45A2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 00:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF5943A17EB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 22:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3954D2853FA;
	Tue, 10 Jun 2025 22:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBJYrun6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D7B242D7D
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 22:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593208; cv=none; b=W7FN31N7cQjGmJsdHpBkhxfHEcYCrg8gNUDyBQFZqujVBY7YsLOu2QFKbLPW0JzVWuyETHhXdtCUOX6xehbVu4RpkGKeMCEXr2MyujUS/VslAxPrraAMZbYTjY2ADH5r3OXcOZPopQIKgzxmYBnqeaSy0yKPj04r92Nq2YPW24U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593208; c=relaxed/simple;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOqg/nk5e0SJSiNMO4hO4JfR6RMPA6C0kmsK2lzUnrl89QNRnMG/7WKPhCzI94G1YkiTAi9ZC0uZUHkLNvcUA2/vq5HP6VUveJJ9AgZyqalkqW04g4jT/HWlKXC+8VgSLlYs/I7hpSRfviDX2YrYmUSC1JjONzZRNBONiQ3lHdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBJYrun6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5533c562608so5824930e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593204; x=1750198004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=JBJYrun6Y8qBLpH9PeR9sxX/5z4fhsjOpHAkFqgY0n2+M6LRu3j4vZiLPDo+BfITjb
         Oa9OiHV6c2aIF8gRcMZtA8BdO0qGfwjvCCnFAPTjF+5ODhsxXVyIWWTQFP/oMQH0bO+y
         BslMRlE/h2JaJl4K0u1Z54N15+GJSs/nex480LPcBIEZtTWNUvMV4H+MDCyGVjXj1O0O
         2JouZ2smwpnISJy3oXIlUy8shjX00CXFA2iiS7ZJzTjsiOe9O5hQF84Y8YCFdVZGn5TW
         iIJA7+dXQwCW35mgrBlQWbGKdJWrQD2QR3uI/Z9S4gxp4O75uxJ68M/6XhNV6iGLN6uU
         cxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593204; x=1750198004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=Zt6Q+Me69KxzrbM3GGDctFuUvlhRW8ViT4vOCs7yItzcM4a21svwiVqkd4guiEggpJ
         WVwQUbFyjeFdWyEPLPKwk20iCL5rQ6kKfXFkdYYsSpM3a6PQww0iubM/ekVd15ZLweva
         qanRrzRF4brR/KEyPzJdh574SLq2DV2lHV4qFB4wJBm0sTsCwskmvJjxEw5kYY/cyqnL
         30COgTwvQYs/FByhqiY8G1bz+XWAHXP7Xpl1cLkSVAHmkhVQxVbKbwb2zRt6/kpyPsvR
         GkZIycW2RFPlJ4b+dwPmmIjr59fZUqi8y90Aa/ppihWOXPAnHlnW3FYRms3Mdr9RVh5y
         Koww==
X-Forwarded-Encrypted: i=1; AJvYcCW7R1iSOJLfgqno5dYEy2b3pUAaHAD41qfqVuoLNBEOrKgdKDT2GcnJdTHMtFcz5xW9ZYkg3PoblpW/@vger.kernel.org
X-Gm-Message-State: AOJu0YxiIIn8fnJ7J0AS+3caLOC2L7LC7uMt0xut+2Rrq4YFeE94g2ub
	/Dwb+O/ewm9hTF2A7TfrPnC8ITsw46+390O8GNJEnIcx3007kdf4omjYazij9OMPih7SYdQn22+
	igqdIqiz2bKBQkUQrXPMeJsi12AvrQeGH8GAEMDkn3KmUuqt3302/hWk=
X-Gm-Gg: ASbGncsJyIFKhWmrZMH19xZPzlip8nnn4ZdX4biz+epT/fV5ljrkjfsic4ebUET/m/2
	bkYzwuk/vWNZpnb5W8oDP6bVQBsCtA6NsTysTLV4Jwklio22AbyqjZQkePI96d4t5IH8Ne1EWz6
	/rxDeIu4USLpCSqvEa7TJ7CVPaxkp/4HgKbsEinItJICw=
X-Google-Smtp-Source: AGHT+IGlqZqOxo94Fq1AxRXbuSE8IQ4NwQa1mjzmaOgaM7Du8n0a08UJH2Mj9vvFcKeYpn253k3S/NXDYuSRYxggVL8=
X-Received: by 2002:ac2:4c4f:0:b0:553:659c:53fa with SMTP id
 2adb3069b0e04-5539d4be3f5mr111095e87.5.1749593203962; Tue, 10 Jun 2025
 15:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:06:32 +0200
X-Gm-Features: AX0GCFsQuNMrR1lnqoFxpoWnn4BCOjfc6g0nU8IoyS3i9wf_s_1MzLLDkyq5jQE
Message-ID: <CACRpkdb8GBwtOGQYrVkxiv8ZCjEE6pkQ_kSEutY2jYG0bUbFVg@mail.gmail.com>
Subject: Re: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
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

