Return-Path: <linux-gpio+bounces-11250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C829999BBF8
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Oct 2024 23:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83C2E1F21305
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Oct 2024 21:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A311537AA;
	Sun, 13 Oct 2024 21:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imWwclgL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8031465BE
	for <linux-gpio@vger.kernel.org>; Sun, 13 Oct 2024 21:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728853941; cv=none; b=AR3ni8GP0Xc3+VC1EBe5XgoZ5EKziuID9a7M3BE9yS8FrVfEJGdZppxRDLTUhKI/kEM6DZTta/1dGUSRKNcBs8KPR70NqN3hcUOW7BExwb0GRU0uzhft7yGewKmkLJlF6Hbk/kwjfc19ij7C/WJPb/lZnFxcOq/XDs5oRm9W4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728853941; c=relaxed/simple;
	bh=JpAsQjdO8xDgz+DjNBuDcK+8eQNAm/nQvmxK2hx0Obk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aguHAKlBGPZ6eCPQrIbepOOTPLQ6lDScw9zBEkTbuJsNonR1RxKqwTJm35Gr5QhbO8TWkNX24+cfnyytl7cOIFajYkl5ZXweP7SSKZDYGNb+H4AlQXIb+V+fiPfuBRVYKqLWSfbJGAVhg8Ak+59zYXoKSGmqNqebZemeHET57hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imWwclgL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f1292a9bso599065e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 13 Oct 2024 14:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728853937; x=1729458737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwQ+0QBqpruUrAoix4rKJMBSmDvfPtsp4gDbiv475pg=;
        b=imWwclgLmB1f33vAaYTs6COSLkFQRzbULOw6bmbLGIGroYsr4RrIVw1nMMcNsL12Bj
         2bT2ae735QKR5hs8oI22iVYc3cvKcsat6IDzmmKLcl21Ev8wxM2cftrVQX3d6pBYmwdl
         5BCEzAMRylWPc1sWfi41WXg9U7mZdLZNSP316fLtguQMr4iADRdDpPHgyZwMpMcELJgR
         rra5Q5Ud8KrP4Cj8jsZy4S+zv7RafFAs1/VytOBhO+Rr3Lq+oBxzZxBDFaGPlHje6BoX
         dq3r97aZIaspDXqwemmkyuvCMU+F77MAASCPGZbtPtBTx7GH6TwWkyQDcQg2rTndTLbD
         +KxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728853937; x=1729458737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwQ+0QBqpruUrAoix4rKJMBSmDvfPtsp4gDbiv475pg=;
        b=wWgFrwz7uF6mBg/n9BkSTCBrxX822uKS4u9+ujuy981+g+9Yxjn55vIZMELTP/dTAH
         qLqR9sd8PswJ/Lt3T0dlQhTj1RF1R3aaNkteK5NVO+GpnvylHaL0M669SbZStEHSAyyN
         V+w9kkMBkxkhjES4eFiTSMl1YxXLZlJ1d5AODI3TR3fU5QRRmYdTFBjG8g+bnVuU0ANW
         PtOL3ycax1PCRq2BOaNMu04vKBUNmZIWeUJSUZTF4XTynskbEQUQVLhtsyoUCDW2n/eb
         TDH6Wppbdt+jx9qKWA+Pl1XHAOIvvNDkoYKgPWHjUBOXrmiDQtLkr3YK3WfNImMiATy2
         LBpg==
X-Forwarded-Encrypted: i=1; AJvYcCVhX4wh+wNwLa1GmQsDrNH8Tb6UGGwswpQ6Emkf0d5LZsDs5RFaYvVYolHuynkJN28dlSptFgKwN1Xh@vger.kernel.org
X-Gm-Message-State: AOJu0YzCxqu/zWov/q3qOff7cdtROfVV1x4naqsK1cvKOuPz0pBlScK2
	PPwljjG1tsgk1OUqJOpPMAS0uz2432hZNuXb1xyzJhiQdi4twwdi71iZJNU/AER5LPaL/1hzEUv
	0lZddS0kZnFI+78lT8lACDXqS/vD9SsYzL0w1Kg==
X-Google-Smtp-Source: AGHT+IG22JRYupZ1fLsDed6hOclviXUZ6gkDKTz/1J3tmXWEWFDaDkSBlGmH4CesWUEdr/RrovlO1A4TEXMMoyRsCbs=
X-Received: by 2002:ac2:4e16:0:b0:536:554a:24c2 with SMTP id
 2adb3069b0e04-539da3c5ee1mr4707787e87.13.1728853937291; Sun, 13 Oct 2024
 14:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org> <20241013-en7581-pinctrl-v6-5-2048e2d099c2@kernel.org>
In-Reply-To: <20241013-en7581-pinctrl-v6-5-2048e2d099c2@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 13 Oct 2024 23:12:06 +0200
Message-ID: <CACRpkdZKkv=CKkA1WS4ZwSj8vXzzZFM-uv6eiMeij+fL_cvTzQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] pinctrl: airoha: Add support for EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2024 at 12:08=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.o=
rg> wrote:

> Introduce pinctrl driver for EN7581 SoC. Current EN7581 pinctrl driver
> supports the following functionalities:
> - pin multiplexing
> - pin pull-up, pull-down, open-drain, current strength,
>   {input,output}_enable, output_{low,high}
> - gpio controller
> - irq controller
>
> Tested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Co-developed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Nitpicks follow:

I would have changed the below:

+       pinctrl->gpiochip.data =3D gpio_data_regs;
+       pinctrl->gpiochip.dir =3D gpio_dir_regs;
+       pinctrl->gpiochip.out =3D gpio_out_regs;
+       pinctrl->gpiochip.status =3D irq_status_regs;
+       pinctrl->gpiochip.level =3D irq_level_regs;
+       pinctrl->gpiochip.edge =3D irq_edge_regs;

Can't you just use e.g.

chip->data =3D ... etc in the top section?

+       chip->parent =3D dev;
+       chip->label =3D dev_name(dev);
+       chip->request =3D gpiochip_generic_request;
+       chip->free =3D gpiochip_generic_free;
+       chip->direction_input =3D pinctrl_gpio_direction_input;
+       chip->direction_output =3D airoha_gpio_direction_output;
+       chip->set =3D airoha_gpio_set;
+       chip->get =3D airoha_gpio_get;
+       chip->base =3D -1;
+       chip->ngpio =3D AIROHA_NUM_PINS;

I always call that varible "gc" rather than chip, but no big deal.

+       chip->irq.default_type =3D IRQ_TYPE_NONE;
+       chip->irq.handler =3D handle_simple_irq;
+       gpio_irq_chip_set_chip(&chip->irq, &airoha_gpio_irq_chip);

I usually declare a local variable
struct gpio_irq_chip *girq;

girq =3D &chip->irq;
girq->default_type =3D...

Yours,
Linus Walleij

