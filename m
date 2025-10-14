Return-Path: <linux-gpio+bounces-27064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7E9BD8362
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 10:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 084C04E4BEA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 08:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F2030F95D;
	Tue, 14 Oct 2025 08:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jc40JBjZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E341189F43
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431048; cv=none; b=bPEBONpv5DwNtC8GUcaFmw+Q0IvYqlBQAJC78/MjmqO36JbsYX4fwJeO/PyLTd5w0P9jZyGrSoU8/1Xa9QseXlhW8pAQ/A0qTRhSXbnT1+1MThq4ThyWovDwq68euVYXZnP645VyYuc/UV/1T5un9gD3GbEI46Gte7hc10iC2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431048; c=relaxed/simple;
	bh=YDFEfrGJRIl/si0UuJt8TjY5k4mRyPv0QSQBT7wHajk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFCjlfAg0H5CQbwuVv0VVlVTer9B3ZH/Ayuxh8vH8ZQmq6vHP1q378Dmc+Xgc8vfyViKnJeNPpyAJ5sTGybLYpoQeChGaYFE2WqhOFce/ebCvKGaB4cC9pXj4/raxPYGeo4WjKGtpE5ZZ3vrtK14k9vRGL7HYL34Xuz5hhMg24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jc40JBjZ; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-635401a8f5aso5772382d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760431046; x=1761035846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mB4qV/168U7fLfDDqZVPDjG7BTgjigqZ4ZKms2t42lE=;
        b=jc40JBjZtEHV8PZQr3tuqvwEhcuE3cnMuVnsApsgOVj2npmxkwoN2jyGbSfTBDiUxx
         DowBBWWeUn08U5qBd6d/oBFICSW3gHPMwOrpr4/0UZ8r2VucSGhjk6kExp2n40BT4y7e
         lV5w/dujKvaDL1viuuVfokP/oqQ8HaVwVhVLYcjRWnGlIzZfjZmGH1eC/dGvv9HzHdRi
         sJ3dnv6R0ueJkpjBahWNHHG6U1pvlgstoMWD3grJsl1P7v+LuQ6v6XuTzVByX5/mGEWq
         43o1sE8mrnJtGqPhMtgo2aWFlZHxCjHL03qy8zyoNbs3cFhACU+SoyQrX7jOigs+aa2g
         dnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760431046; x=1761035846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mB4qV/168U7fLfDDqZVPDjG7BTgjigqZ4ZKms2t42lE=;
        b=XoXL1PWTQYJHAl9+DIwbXQmd5VDJY0kM4LsfrZESkTgVc+rR06N1UCHHPmhRG/l4ty
         xAC1y6fpjUk6PeLEdKBYShGH9NjOMduj0WjYRpLpDFOiZjJCnLmoBwcriLpEICyk/3Rn
         /9ubBg/9CDTCLC1kC1RF1Ve9PfNlXaZmdXUb8lBASgqNj7kACvgpHP7vtn4cq7BtgJqj
         vqaSqBALkdOJSro8zFEOJJ1cG6I5FhGhWGmGm6iO5J7iNDjrJiDZ63CWShTirhqHjuuk
         xMrAPuwt4mDW+CynmspyO+W9XL6CaPxVWHFrnLN5Zuw1zhfME6B+8g/+R/Z06poeNP2c
         oKOA==
X-Forwarded-Encrypted: i=1; AJvYcCX+nK9stDWxm3KE+FbY6kPjEm8tOlrxvRBIRpASUFifWnQ+jk+SFHY3md/FyxMARKaghuIYMlHYuYFG@vger.kernel.org
X-Gm-Message-State: AOJu0YxpJ1PncqyNx11Q+CDrq5IDxcjTUTxpqKJSPYXiVXJ945/Xq81n
	FJjV4TlLJyLDb4/jh96lnVI29LxUUW4GCuQO2g6W1iql8YQKMh/lVdI9gwwIrw76myCJ4YlD0AY
	pNEewdjochM68fp7UMwgCfebjrhv+kvzJJgNUx4jf9g==
X-Gm-Gg: ASbGncuIG6BVCz7Gq71lOLm3tTw9muWC8Xmnc8zUfpyaN15Imz/xpBoOdxkB0B2pPvg
	IeagzPc6YCNZFr6rUG3u22UEOMs2ux7WYOKxyYWyAmQJ3LBv31jNDE76vbjyQLT7GsG8Unn8Ha6
	7n0SR0t4vX1GPLX1UOjogBZggKaKEreCXISs6Y7ibOvy5zXB5zuK9xv2k2VfM+Cjy970rBmgbGu
	ouaMZOkk46vg8NlRwjOAQw71gcXjQ==
X-Google-Smtp-Source: AGHT+IG+8mwf4OKlBn3bot7TGE30F1MEjsH7uhQxMIRdy8a3JAvRH98VqQB1DV6PJ+zZ+6RTxRH4cDuvVp1uxAB4hMQ=
X-Received: by 2002:a05:690e:d53:b0:63c:f5a6:f2df with SMTP id
 956f58d0204a3-63cf5a7084bmr9159568d50.65.1760431045879; Tue, 14 Oct 2025
 01:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009223501.570949-1-jelonek.jonas@gmail.com> <20251009223501.570949-3-jelonek.jonas@gmail.com>
In-Reply-To: <20251009223501.570949-3-jelonek.jonas@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 10:37:10 +0200
X-Gm-Features: AS18NWB-ELwnK9aucNPJedRVrl-QBK4yCisLJagx64N2Yi5AbtMlX8tcPZYUnlA
Message-ID: <CACRpkdbCw1Agnsy-aYPs+2PhQDFjj+=VjmGQBmxuCUfwRuWkfw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] gpio: add gpio-split driver
To: Jonas Jelonek <jelonek.jonas@gmail.com>, Peter Rosin <peda@axentia.se>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

thanks for your patch!

overall I like the idea and I think we definitely need
something like this.

On Fri, Oct 10, 2025 at 12:35=E2=80=AFAM Jonas Jelonek <jelonek.jonas@gmail=
.com> wrote:

> Add a new driver which allows to split a physical GPIO into multiple
> virtual GPIOs by using a multiplexer.
>
> For now, this doesn't support advanced features like IRQs, just normal
> IN and OUT functionality of GPIOs.
>
> This can help in various usecases. One practical case is the special
> hardware design of the Realtek-based XS1930-10 switch from Zyxel. It
> features two SFP+ ports/cages whose signals are wired to directly to the
> switch SoC. Although Realtek SoCs are short on GPIOs, there are usually
> enough the fit the SFP signals without any hacks.
>
> However, Zyxel did some weird design and connected RX_LOS, MOD_ABS and
> TX_FAULT of one SFP cage onto a single GPIO line controlled by a
> multiplexer (the same for the other SFP cage). The single multiplexer
> controls the lines for both SFP and depending on the state, the
> designated 'signal GPIO lines' are connected to one of the three SFP
> signals.
>
> Because the SFP core/driver doesn't support multiplexer but needs single
> GPIOs for each of the signals, this driver fills the gap between both.
> It registers a gpio_chip, provides multiple virtual GPIOs and sets the
> backing multiplexer accordingly.
>
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>

This can be made easier these days, reusing the
forwarder library. I think! Check if I'm right.
Make sure you use kernel v6.18-rc1 as a
baseline for your next patch iteration.

select GPIO_AGGREGATOR

#include <linux/gpio/forwarder.h>

Look into this driver for an example of forwarding
GPIO lines:
drivers/pinctrl/pinctrl-upboard.c

See
commit dca2f73cf19fedd7bc38fa6a0eb50fea63cd0214

Now that is a pin controller so it contains a lot of
irrelevant stuff. Focus on the forwarding part.

This part is maybe the most interesting:

        fwd =3D devm_gpiochip_fwd_alloc(dev, pctrl->pctrl_data->ngpio);

Here ngpio will be 1 for your usecase.

        if (IS_ERR(fwd))
                return dev_err_probe(dev, PTR_ERR(fwd), "Failed to
allocate the gpiochip forwarder\n");

        chip =3D gpiochip_fwd_get_gpiochip(fwd);
        chip->request =3D upboard_gpio_request;
        chip->free =3D upboard_gpio_free;
        chip->get_direction =3D upboard_gpio_get_direction;
        chip->direction_output =3D upboard_gpio_direction_output;
        chip->direction_input =3D upboard_gpio_direction_input;

        ret =3D gpiochip_fwd_register(fwd, pctrl);
        if (ret)
                return dev_err_probe(dev, ret, "Failed to register the
gpiochip forwarder\n");

As you can see you can override request/free/get_direction etc.

In this case you probably don't want to override these functions,
but instead override chip->get and chip->set so that these set
the mux (and delay a bit?) before reading/writing the line.

->get_multiple and ->set_multiple seems hard to implement
and should probably be overridden with functions returning
an error.

> +++ b/drivers/gpio/gpio-split.c

As mentioned I would call this gpio-line-mux.c

Yours,
Linus Walleij

