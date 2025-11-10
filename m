Return-Path: <linux-gpio+bounces-28330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 02348C49A6E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 23:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 990FE4E19B2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 22:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569452FB094;
	Mon, 10 Nov 2025 22:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBbJc/F3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9B92D8DD0
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 22:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762815165; cv=none; b=NHx99lLm7afvtkaJDJkRTcdYURo0zlLDiJVLlKmXqvctLmdiA3a16z0rraBi4J4qCym1Es8vUh70GzZ1BQS0UEtEWI+Hx+Y4Hl/OpoFzqQjfi7C6u5cNQ3wbdf1Rp34pBy/82KxPxkBMCIWfhbIolUCmxLVDs2L1JMQ42duHJ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762815165; c=relaxed/simple;
	bh=e1py0u0utYWHo7/l1W7Je5JBWA2HdEgA99GWQqp1Jxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8IfHhRTou2Tf3Jwn44LED9/ZTAuMCzi44Nny8Jtdd5POpqBbS3Orjxs3PJNgj92ptAZ5rxJhO6SeimWq4LDJhB4DbamMwTcOgLMA8nTPt6E06Azlhram4AFGTKoak2AhI60ypj8X7MEq0PeDcGY3SlXP5vITjcy176MV7OltTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qBbJc/F3; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63f74b43db8so3354053d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 14:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762815162; x=1763419962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e69bzKGqU+9xaMHquTs0eaIXXjQzWHdQrkisPshqz9o=;
        b=qBbJc/F3buGOF/kqHDhz3VQ3kX2VhTHpeyYs8sR3jEQX3JONZhYUIEf0pY10Iy7e2S
         LP4fT7e8h6B3EHDJGAyaDFCpXwvPGYTGQu5X1s2Uvcl9SPQSVjGnOpF2FVK8XDCFP5Vi
         7mkPoESH3a9XyUMJh5+XqaTTOfkdKfPIOsB+QowCeRA6wQXCBA5XeFcLk0k3RXyxOTnU
         OwDBBNckErBocVZrCcO8i3fqyuuOchJWVCw/8Rj5rn7GmKi3xSJG9FTJM6e93FF4O1pD
         3bLH6XaPJAt63vCIoFpVQNYelWrjSQFVgF/BeG2I/ZatxxWe8A39Rof1jPIbvr4Wq32p
         gJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762815162; x=1763419962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e69bzKGqU+9xaMHquTs0eaIXXjQzWHdQrkisPshqz9o=;
        b=leqLutTHsqMHcdmQ/SzKC2tm3hKV90b2OnZAVxN7gO1hD1IwcdZmNiLn3Ga9tiH8Vl
         J58w02QwHt2L2mBCr7n/aRbj4Eqvzz22cBUtDAdKL0NrPMx5kN1SAQjeaZ8MmGa4KUhA
         e36mS/A6CkYmqhNXQaXhRHIJcd0iVZvGvDZZkO0803yjh6DhelurqsozzFIAjL2vrlvN
         jenblY5ywAIXEx0V0X6ZXjNISY/5WgPGyxmn/M7hsffW79QwnRvyn/lpXLIJ2QjdvUHS
         zdkhcxaZrLKIFr5hxobXuF4mL6lM2prwmHOPXt7Kmbz7XHG8kQnkidki0esxhe/0MvLv
         rqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw3e1WnvadM/jofynpONed1VbfQDXJgoj8XVCbqJMoE1f6tALR9ZbSYp7yIji79IOUCmQqvr3Zhk6P@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5BIkykRLfRfmMv9jp0hZ6WIsTL9bYPuDeHp63PMZPhJoDli0O
	BugSpzH1J540AN6tAWELlKZP/cORq/qnTuHyRFcvN5iWyisgjOe9vNaCdVxrg335yrN7bWZJiIY
	IwuUx8kBipkODjQG0wKAXx2pR7lzNZvJjGtiqzzYA66XoioTfCFf+fmc=
X-Gm-Gg: ASbGncsB3CASGF2Ljm4sA3v1rE9dl7+Nt0ak32K+tndMMZdZickgSGf/UxI1zReINzl
	tVloRoZOoyM15neDosHzktun54JZRqx4xzxQ2nJH+ZPEfi28fPhXqoR4TuUrzEpYG43GnLCMjh0
	Oj90kXOxtV4yIhr6EVBhTaK3L/Zm9EkIKIHinhh5t0Jc0+gDHbU33lFSVg286WVjzzRh/WHJ+70
	8IfyIlQxgcYIIRg6atIN5JiVIz7WdNOm7/H/PtIVx6CD+je991dgs1OE11M
X-Google-Smtp-Source: AGHT+IHBmRt3S1iPiXw2thNDNCdZasn+AuQ/RS/ehj83SprtweqPp18ZkHRLWpz/3jwXQRhojABpABGJjki8F1WXwFM=
X-Received: by 2002:a05:690e:15d5:b0:63f:ad02:8d8 with SMTP id
 956f58d0204a3-640d45b7539mr6601936d50.31.1762815162228; Mon, 10 Nov 2025
 14:52:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105163610.610793-1-jelonek.jonas@gmail.com> <20251105163610.610793-3-jelonek.jonas@gmail.com>
In-Reply-To: <20251105163610.610793-3-jelonek.jonas@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 23:52:26 +0100
X-Gm-Features: AWmQ_bmtS8b8Vht8lnhMRbctSoyy40cmfZtuyTPFxm5FtvZFqQQEfuMzy_HkNpM
Message-ID: <CACRpkdabTaVsqXOhy_QOdi3WNM3TPfEodt1miQkdcSrYWyYGxQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: add gpio-line-mux driver
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Richard <thomas.richard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

overall I'm really happy of how this has turned out!
Sorry for not reviewing very intensely the last two weeks :(

One review comment left:

On Wed, Nov 5, 2025 at 5:36=E2=80=AFPM Jonas Jelonek <jelonek.jonas@gmail.c=
om> wrote:

> +struct gpio_lmux {
> +       struct gpio_chip gc;
> +       struct mux_control *mux;
> +
> +       struct gpio_desc *muxed_gpio;
> +       /* dynamically sized, must be last */
> +       unsigned int gpio_mux_states[];
> +};

Dynamic arrays at the end of struct is a bit of a security pain
and we probably want to avoid them if we can.

The typical idiom should be:
...
    u32 num_gpio_mux_states;
    unsigned int gpio_mux_states[] __counted_by(num_gpio_mux_states);
};

> +static int gpio_lmux_probe(struct platform_device *pdev)
> +{
(...)
> +       ngpio =3D device_property_count_u32(dev, "gpio-line-mux-states");
> +       if (!ngpio)
> +               return -EINVAL;
> +
> +       size =3D struct_size(glm, gpio_mux_states, ngpio);
> +       glm =3D devm_kzalloc(dev, size, GFP_KERNEL);
> +       if (!glm)
> +               return -ENOMEM;

(...)

glm->num_gpio_mux_states =3D ngpio;

> +       ret =3D device_property_read_u32_array(dev, "gpio-line-mux-states=
",
> +                                            &glm->gpio_mux_states[0], ng=
pio);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "could not get mux states\=
n");

We use this pattern in the core gpiolib for example.

With this addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

