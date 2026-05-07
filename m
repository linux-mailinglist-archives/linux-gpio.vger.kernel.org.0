Return-Path: <linux-gpio+bounces-36370-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHzPE3OC/GkcQwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36370-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 14:15:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 041304E813B
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 14:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68F34302DE3A
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 12:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2B63E8C65;
	Thu,  7 May 2026 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThcaNvn7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DB33ACF10
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778156120; cv=none; b=DBODWryd9TxgMFihXbEa8WQQbDoVY5PO0Hw67HkC3Ct5+JBkp1a+8gmahlJe+DZXeoTmW3SZQoVagNH6NoBicOhXJC+9Gq7An/AtAMWbh/VXLKuwbdQXxWv4y42mnGPsuwYv9AVMfmRmNqjTQutNIgFGSw5S0cvRntkfhxYlrYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778156120; c=relaxed/simple;
	bh=v9MtChy7yFcwVd1STYPJTObu0yj8sS2efOx3W51ciBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdRRm/RLbNSWlzW+7Z2pY4KKMRuUIPuIPxSXqEPc/RwuraQsqPXolwocirtPpkbDoMgUv+4J+gmEy+ccZp/x/Dp/f1xTwpuKHuz9zpK1QOZjnjhJIP4QY1IdOpVH1B0Z5+ANRZNTniMTBSpgb0otfOBRwNKP+sJGqHtnkltotwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThcaNvn7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8412C2BCF5
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 12:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778156118;
	bh=v9MtChy7yFcwVd1STYPJTObu0yj8sS2efOx3W51ciBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ThcaNvn7yGtvgZtYUemCO053kbbLfR49WBK9wgThOlxdbsuMWEWP/WL64wTLdBk5v
	 SS5aBGM4a1LaCC72EIq4Ml1jPRxv4Gu4Jkq32cK4p3n45tEcpdLAljIoSOTWIo9pjG
	 KK6iaL9uxQNZqB1tW3a3r8GVs3utkL9JJg9RtKMiBom2qx8LEmfI5mkSDz7Tg6EJ8k
	 LM8BynVy6w8qj+Miqd8T9+1VbrsDE4WZuEbCMMBUFz5QsFoKnad8mtZ891D8KLAwhn
	 vOTsSPQ8SjGY37rYvboLjHFsP6Ekowc50ZNsMI8SIBuB5OwrYV5C/cTMMECdV3jR4s
	 5uCvTMsh1NkxQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a40502e63bso666372e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 05:15:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9JQpdVEbQZiWfnyP53vumXY8WSIjGXZRt22oT10GqrUO6dfByVWqXIt7ngMPzZU9UIVQEJSL2ANeFM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Hx38Hqyo6Kr3iRvYzprrnYarfa9iwtVuPN3zLOj4Cmpq9odb
	Xx19Xae7rVnETtRndhLpzmO54XFAkjwdv24WNCm69Yh7T7PgJTHjgRnYq4aBWiflvOQpajoNTva
	6IDJ7CJJxYhLzh+OGDgwQkscdefye6T4=
X-Received: by 2002:ac2:48b8:0:b0:5a7:4a60:1454 with SMTP id
 2adb3069b0e04-5a887ce6447mr2054591e87.33.1778156117576; Thu, 07 May 2026
 05:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501155421.3329862-1-elder@riscstar.com> <20260501155421.3329862-10-elder@riscstar.com>
In-Reply-To: <20260501155421.3329862-10-elder@riscstar.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 7 May 2026 14:15:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkm4qn9hxQ9HjjnTWjvAiS+A+x1ATy7wamnm_YSP_qPEg@mail.gmail.com>
X-Gm-Features: AVHnY4JVKfyZ1eZonYoPYtYcjqSl_ExL5rvF4dr4feVkyENggSODeF5VZKTXJe0
Message-ID: <CAD++jLkm4qn9hxQ9HjjnTWjvAiS+A+x1ATy7wamnm_YSP_qPEg@mail.gmail.com>
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, brgl@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, daniel@riscstar.com, wens@kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 041304E813B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36370-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,riscstar.com:email]
X-Rspamd-Action: no action

Hi Alex,

thanks for your patch!

On Fri, May 1, 2026 at 5:55=E2=80=AFPM Alex Elder <elder@riscstar.com> wrot=
e:

> Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially
> a small and highly-specialized SoC.  TC956x includes a GPIO block that
> can be accessed, alongside several other peripherals, via two PCIe
> endpoint functions.  The PCIe function driver creates an auxiliary
> device for the GPIO block, and that device gets bound to this auxiliary
> device driver.
>
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
(...)

> +config GPIO_TC956X
> +       tristate "Toshiba TC956X GPIO support"
> +       depends on TOSHIBA_TC956X_PCI
> +       default m if TOSHIBA_TC956X_PCI

I think this driver can

select GPIO_REGMAP

> +#include <linux/auxiliary_bus.h>
> +#include <linux/dev_printk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

#include <linux/gpio/regmap.h>

> +#define TC956X_GPIO_COUNT      37      /* Number of GPIOs (20-21 reserve=
d) */

I would just do 64 and flag > 37 as invalid.

> +/*
> + * struct tc956x_gpio - Information related to the embedded GPIO control=
ler
> + * @chip:              GPIO chip structure
> + * @regmap:            MMIO register map for SFR GPIO region access
> + * @input_only:                Bitmap indicating which GPIOs are input-o=
nly
> + */
> +struct tc956x_gpio {
> +       struct gpio_chip chip;
> +       struct regmap *regmap;
> +       DECLARE_BITMAP(input_only, TC956X_GPIO_COUNT);

> +static int tc956x_gpio_get_direction(struct gpio_chip *gc, unsigned int =
offset)
> +static int tc956x_gpio_direction_input(struct gpio_chip *gc,
> +                                      unsigned int offset)
> +static int tc956x_gpio_direction_output(struct gpio_chip *gc,
> +                                       unsigned int offset, int value)
> +static int tc956x_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +static int tc956x_gpio_set(struct gpio_chip *gc, unsigned int offset, in=
t value)

REGMAP_GPIO can handle all of this for you with the right
parameterization, study the drivers using this already such as
those that appear when you type
git grep 'gpio\/regmap\.h'


> +static int tc956x_gpio_init_valid_mask(struct gpio_chip *gc,
> +                                      unsigned long *valid_mask,
> +                                      unsigned int ngpios)
> +{
> +       /*
> +        * GPIOs 2 and 3 are used by the PCI power control driver, and
> +        * we don't allow them to be used.  GPIOs 20 and 21 are reserved
> +        * (and not usable).
> +        */
> +       bitmap_fill(valid_mask, ngpios);
> +       bitmap_clear(valid_mask, 2, 2);
> +       bitmap_clear(valid_mask, 20, 2);
> +
> +       return 0;
> +}

That's good use of this facility.

I would say the chip has 64 lines and just
bitmap_clear(valid_mask, 37, 64 - 37);
but that's your pick. This probably works too.

> +       /* Mark GPIOs 22, 23, 24, 27, 28, 31, and 34 as input only */
> +       bitmap_set(gpio->input_only, 22, 3);
> +       bitmap_set(gpio->input_only, 27, 2);
> +       set_bit(31, gpio->input_only);
> +       set_bit(34, gpio->input_only);

regmap-gpio can't currently handle selective input-only or
output-only lines, but we can
very easily make it.

So I sent a patch for that (now in your inbox).

Check if this fixed_direction_sparse bitmap will do the trick
for you and provide Tested-by if it does, thanks!

Yours,
Linus Walleij

