Return-Path: <linux-gpio+bounces-2844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AC98448ED
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EF18B287AA
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F043FE5B;
	Wed, 31 Jan 2024 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQMzKF8n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101EA3FE37
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706732976; cv=none; b=dJMkOBxz/Oo64YtRZDnm1vrDZQIzPiRBp0X5P5fsiF4fpCYZha0x3+K7295ymC4iUwzXOn+/2XB7Os5gY9e4/BEfz39PzJzB78VTtvN4pzNcif/rgjoveBDRVsc27VUjAGdSWVDFVBodkuhiQHsmLtPZQxcekx0B9wjDZZT+f5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706732976; c=relaxed/simple;
	bh=vXMGrp/FQqOSxGCHd4cBcVgOaMZOyiPxnaIDfniJcFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uU+xn42R2lP1iK0qahIzNTLNn2Mofo+nQnXzy68oDsO/FOgPoAobZHMx+OCA8WxChWyQSvN2BvxmzQSVaVs901tBYvfBe6egxGBUkQ48v2R7C/fHDqL4FiZ1FljGZNXoFedJGWop4VQopzTVjffPvvDszb7jPT57X7koAa1ZDFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQMzKF8n; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6c367f29fso132703276.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706732974; x=1707337774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DAPucK5dhach6L0eLI+iOwT6ZlBNhOh/iA3XI32BL8=;
        b=tQMzKF8nsDdAtHcnyBLMnq1TUlXVP2LLk44HUWsQrhWpIzBffHuiMWcUVzovZKXH/K
         sqRAJlpSDZ4LfXa5icmEBdk3671IoCOVTcX2iYxQFdyPqFBJ/aH5X6CIXbMcOIvVGz+N
         a1AQGEwgQZxySt7qIHRzoiMMIh3Z6lRcMOPqXz+galaHfN7uybijHI+BMki2zMhF9+yd
         dwta52s9/btZlV+HLeciFOFJOXCyBEU2AojgaRZVVtaOGHGON0w88gtWt30sZcAxFdfO
         an/r1yV15kCzWoSEGso9MW2ZIRCgXuK3CgN0VgDIO/sQDPFit9wEP75hSMIy3249Cqd/
         TB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706732974; x=1707337774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DAPucK5dhach6L0eLI+iOwT6ZlBNhOh/iA3XI32BL8=;
        b=ZV+JRG2V8Z1zQzHt/4BPqz02fjmLkx7oVT3QZyuh8S2Ej4JwJv8nRVuLQx/OMeJWyx
         lCpacopyok2FYhen4JFpLBcU9bpjSweQVul1Sr8PwJguCNxc/3hygdwKO/qzzxqFMXW+
         0KPVQXy2uODbqRMhwbFVIIjwkzY9tSaX/FrNYcsy37XSLedXhdJeEk20Oy6liJhOO/HC
         CEq2XTJU3CYNhjd36JyRU6yeBEbxkSMY60aJROSa/jkKlaCMuacHkV/IZPejunokc2yi
         ujleQtYz28oMbERjxaYQbXB5VJmbMBMzydmG1DnIOKeOl2+k7h5M+hfa2g+0FlSioAKA
         P8HQ==
X-Gm-Message-State: AOJu0YzhESqWZZ7+mXA9ZQTTbTv/WRXX2he2agiiUfAAb7+ApyXtoOFg
	JttbpQr2wz7zJrm15BkV49vWdG0PrLswcD+qo+40YeYwCsAXGwVeyzhFRRDu4v15aJ/wPOLyDGE
	U8UK+Ir0rdCdAjddbF897GHyUtIb275O4/Be/Bg==
X-Google-Smtp-Source: AGHT+IGMlMN26GycoVeIRbWVy4GG0c/JDvUUdHAz1HriqyxlsJLob+6WyuGKCzMVWpzkISTlSeK0bIGYNoVS1BxZwlI=
X-Received: by 2002:a25:ada1:0:b0:dc2:2d59:512c with SMTP id
 z33-20020a25ada1000000b00dc22d59512cmr3099744ybi.22.1706732973968; Wed, 31
 Jan 2024 12:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-23-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-23-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:29:23 +0100
Message-ID: <CACRpkdaZBMZX5=ygwG0pxbZHJ80w4Z=9-zJ6zV0P2rWXajxP+g@mail.gmail.com>
Subject: Re: [PATCH 22/22] gpio: mark unsafe gpio_chip manipulators as deprecated
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:49=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We still have some functions that return the address of the GPIO chip
> associated with the GPIO device. This is dangerous and the users should
> find a better solution. Let's add appropriate comments to the kernel
> docs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm not sure it's very easy to find a better solution for gpiod_to_chip(),
but perhaps also add this as a work item to the TODO file? We can certainly
try to get rid of <linux/gpio.h> before we need to look into fixing this...

gpiod_device_get_label() should be easy to fix:
linus@lino:~/linux$ git grep gpio_device_get_label
drivers/gpio/gpiolib.c: * gpio_device_get_label() - Get the label of
this GPIO device
drivers/gpio/gpiolib.c:const char *gpio_device_get_label(struct
gpio_device *gdev)
drivers/gpio/gpiolib.c:EXPORT_SYMBOL(gpio_device_get_label);
drivers/pinctrl/core.c:                            gpio_device_get_label(gd=
ev));
include/linux/gpio/driver.h:const char *gpio_device_get_label(struct
gpio_device *gdev);

We only created that problem for ourselves... It should be removed
from <linux/gpio/driver.h>.

Anyway:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

