Return-Path: <linux-gpio+bounces-16973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99896A4CC5C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 21:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EC087A8663
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 20:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675F5232386;
	Mon,  3 Mar 2025 20:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgesB6zs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFB12010F6
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 20:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032054; cv=none; b=JbSjJaYQXvnTwXzYPVJyczhznlTe7EHKXtu09b2x9+NJv2pznxK2q9jXhGYIK5lWKX3PX0GxxKjnV9Y9X3qtBR5ArWt6U8BODX9V+wxH6LQ97TNPymKFEyIrqWHifDNwa8lxK9rculDRxkORgZAmh0H1L7j074TT1t/4ZZTntz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032054; c=relaxed/simple;
	bh=XbbJ8meiSGyYH6OwHoQ3kYQ9Z6S5UvDDWGLBxmPvAmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idjooaA/7onc3yKyOffIt+09zSabOByv6zeMGWEHXGZ4G3tcHgeLpDicjXHh0qfesog28hqjuNYq8EzHUBOiEVYiB8pLzkR1vev8mLIPAc81rnXZyXlCT1lO6q0tUIshXokGNfPqP3fBeqf9mysn1G3RuQhRxM+eTOhlsHBp2Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgesB6zs; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54957f0c657so3259923e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 12:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741032050; x=1741636850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIobnHJoMiJmgICmS6BIagkd52MyMq9ZRNlSypEhZx0=;
        b=wgesB6zsl2c/nwp8YgLBRW5EjpfK/i+/RPYBkc+A+ql8EZ5Ey60K3jXEUFjSGRB6Ly
         E3rbk4Ge7WK+ZPWogj2I1uaZMQyLPMhY5rukyPNsq/k3Cq7skj9fuBSCok2sxNLTpBg/
         gqPN7FvyK6oB74ac/Ve/iyerB69btpnLFgaLE0DwXMC45DlmuazcljMwukgd/Ungqd5O
         gTms5km3lurkHibIQjsEaVIyIN5QCxGJgfEHpzB2NiqJfUElYXoDH0ctpytY8Vm4UYqj
         iWbsZhdhuuW2LSvkuftVKTKtrWL4arKr1eVIt8Jy+ueeCnfPDLv6D4/NzHSMtAbs2ii6
         hPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032050; x=1741636850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIobnHJoMiJmgICmS6BIagkd52MyMq9ZRNlSypEhZx0=;
        b=jKwArdQZUa1r40iT4Ox8mcZ/J3MBpXRNdWTEuWxj4SoZNK1TqZ3z5xW0m7E48omyVs
         /xnAAN17e2a43EebT7ZBLa+Z0HLOZzV0YZo6caPNu3460vDTZKWllQJ4bumRFGzmNyQA
         1U16A4vIsPJYqo+Ja2uTVYaTVUqaqCQdGiaeztCpv5CeL686r/h1E5FU/0saH33RORyc
         nwScbr2u26O2CXxPpEly2qtiYdVzNq9yaY8i4+CyXtBETbpa8b88+8YAyfSBzw337IkQ
         yVMCjDHb2miQSdoeob9PusA4Fe/MhExfyVBK9wd26Mz6lKChXYaCWLsYw36kShAOsdNe
         /rFw==
X-Forwarded-Encrypted: i=1; AJvYcCU5XWl/CfWcaxNep9udR5ah21NqdDhkd7K2zFmcF0tStmsyx8y9m77mWUOQ7c3p0wtgoJ3QLKIs/vvZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxlR32kzbqJJV+Xqg6aatwZqs+oGhKJG9Vy4YxaVPrJyphUbzDm
	dRIyQ58bTwjTR8bRGenjg/PL9B7whhFlMJzIRw+geEmRt1kaoLcp+nZ0CYegUgr75vZW8/7m4DJ
	JvyvnhCKGXdaMHY06pHEJzrNUvOahzZ5CL1AhIw==
X-Gm-Gg: ASbGncs96/HbkLSYBmcVbZUiVpU/ngiu5khGXIw729E84hcPYnIpGlcTZHZWOSCr9fS
	lOL2V929FVXY2wHcrJ6OaN9pe3+w/Ze3Rii8lqpO/RxCP+BPe7u0wO7Jv7bptgsQiyxA2uAwYRM
	GsOLS/p+p/oMYNeCj0jtDkw8V//A==
X-Google-Smtp-Source: AGHT+IEHC8551GBjOPpUxphatF0L4EWvTZV1kdNfG9x3/0VKhOjGpHpEdRbBRyV3NGrevE8NCqhrlfkAk7EBNemkkKU=
X-Received: by 2002:a05:6512:31c6:b0:549:39d8:51e1 with SMTP id
 2adb3069b0e04-549756e259cmr181874e87.16.1741032050322; Mon, 03 Mar 2025
 12:00:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com> <20250303164928.1466246-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250303164928.1466246-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Mar 2025 21:00:39 +0100
X-Gm-Features: AQ5f1JqhI495QPwjnNSA_U0-FZLtnDrmj_TbAAs84iyjJp_ZDYFgar6ptgKX_Fk
Message-ID: <CACRpkdbCfhqRGOGrCgP-e3AnK_tmHX+eUpZKjitbfemzAXCcWg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] ieee802154: ca8210: Switch to using gpiod API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 5:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This updates the driver to gpiod API, and removes yet another use of
> of_get_named_gpio().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

But note:

> @@ -632,10 +630,10 @@ static void ca8210_reset_send(struct spi_device *sp=
i, unsigned int ms)
>         struct ca8210_priv *priv =3D spi_get_drvdata(spi);
>         long status;
>
> -       gpio_set_value(pdata->gpio_reset, 0);
> +       gpiod_set_value(pdata->reset_gpio, 0);
>         reinit_completion(&priv->ca8210_is_awake);
>         msleep(ms);
> -       gpio_set_value(pdata->gpio_reset, 1);
> +       gpiod_set_value(pdata->reset_gpio, 1);

This drives the GPIO low to assert reset, meaning it is something
that should have GPIO_ACTIVE_LOW set in the device tree,
and it might even have, so let's check what we can check:

git grep cascoda,ca8210
Documentation/devicetree/bindings/net/ieee802154/ca8210.txt:    -
compatible:           Should be "cascoda,ca8210"
Documentation/devicetree/bindings/net/ieee802154/ca8210.txt:
 compatible =3D "cascoda,ca8210";
drivers/net/ieee802154/ca8210.c:        {.compatible =3D "cascoda,ca8210", =
},

well ain't that typical, all users are out of tree. The example
in the bindings file is wrong, setting ACTIVE_HIGH. Sigh, let's
assume all those DTS files somewhere are wrong and they
didn't set GPIO_ACTIVE_LOW in them...

Maybe add a comment in the code that this is wrong and the
driver and DTS files should be fixed.

Alternatively patch Documentation/devicetree/bindings/net/ieee802154/ca8210=
.txt
to set GPIO_ACTIVE_LOW and fix the code to invert it both
here and when getting the GPIO, but it could cause problems
for outoftree users.

Either way, this is good progress:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

