Return-Path: <linux-gpio+bounces-28809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46842C70539
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 146DD388975
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69851273D81;
	Wed, 19 Nov 2025 16:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cE7Oy2z+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1924A301474
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571038; cv=none; b=BVBJzRmAMQ4EWIQJw53a8xSt8pRWcbzWUW+9MKza0W/CvmT4rPj8mXvMXIzXsruZjycb5X/QZJ4KUWkWfDzZfBgjpQjLYBLIWoQYcZLCIekC+czxenzVw0wFwVSFPNun1uObhv/5qWMpzSBz8EIpNTri3/J7erAwnFsaquE0Zg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571038; c=relaxed/simple;
	bh=Tl8OPTyok/Pm/j1FsjZB55LPrRCZ+mLncJuKqJVgVGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6iB8dz9mZF7WiHfpHrdhG6QMXClHtrCAs/uE6+1t6EEw4A76ziqt9ErFUffuRF6TxauiWsWsAdyfyMqzNFZLiGNHxEoV5Fgw1Mp3XRygmfTIJoJrMdq2egUp1gcPtuIgTVEjdKVrXu30jB1NhYUdDLuo/fBqoXBXrIU2gi9BSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cE7Oy2z+; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b736ffc531fso946527066b.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 08:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763571034; x=1764175834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrS6YwFtEaAnFlHMcuOwyXVJAy3PMUEJpVLwa5xC+HE=;
        b=cE7Oy2z+d92JAs2tmRk2EnqxttLrEx8YySqGcxBoA9x+llXloMxoXEyByav9U6ZQvi
         WqeE9Rw9Q0doGr9CoDOpCLGf22iRxTJ6IrAA5WzGxzyrOyuoViHI23Q0TVc5NldMzibR
         8TpAs+Cj1Vjf6FEmYT7Jezfr4PY3S7OSnCVMwWORy7+4zmTNTy3HjZhrFifAbq0fB/Ve
         jIG5G1EUZmvynZ4+YKZc1MpzPdlfrJSUcYPHcgzHyVijxMBDFhjO/RZO1O8QpGkSFN2M
         6kVQjQqxKX63n9q0qXEmJH8fLgwATFWkIFbyPpWPjtEwkQ4OvBh0n12k2d2oIxYQScGh
         uvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571034; x=1764175834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JrS6YwFtEaAnFlHMcuOwyXVJAy3PMUEJpVLwa5xC+HE=;
        b=DTvgtYrjmmw5Rile6QriU32lt90kBKr9lpE7g8K03FHxnHriD25qtrWD9e+rFkRyBI
         yYuHgl8uUbkINxA4Gf49AUioMSLqiWDtOA10Bt+EblVMOL1wuWvmLXDSe4jzxC/oIAy9
         QymaCFIDqhi97r9zf2it+nYzwwY/pC3w94yiXJeSTMzWPADDMfUCFnhVKQ9HWP/wicm6
         p9PtstzhmrPS4ZRgsaDojmTrtu8en72STHSMVENKXkXkoHkhPjchm6+Fcz5UU/IDLM2d
         l5g/jCDdNw09l7kvfhZI0imyJwoE2pJbbKkSUukQqdJE3Ac8/j+IlQgTSwVyGNkTDNuA
         6H7w==
X-Forwarded-Encrypted: i=1; AJvYcCWOhHMIJbV+uKquUjmgYLR4WDhcrC0tcYZ9mHNZmePsdko8I01/A3AjDlqnY5BOPx6qrVBFKP7zUKVe@vger.kernel.org
X-Gm-Message-State: AOJu0YzOu23qfPvdLPA9SbEzTU/OfzBk8hBK7ZJCzHHQ4ZVx7YSEQaP/
	MmDGf9OcF5lob42f0vDmTaTa0vjK3yQ61u2mp1bOOuTx0zVYX6gTfzwb/enHllUxiRHCRIFL05t
	NLxsYjBSnnxTgH6Txtb8cNGicMHp3rcI=
X-Gm-Gg: ASbGncsa8fZPYo8zInbzNSkWdGU6BvVnm9kEcgj3rokVCUQIXMENk7Yb9NEgMYrgi27
	klQx1raS9WKFAGNLWcM99aOq6UynIDQDqa3LCiYhYyeynO1HGpfRtqi+qJKYuFrg4sR3hVtohZI
	4hG/AnrEgzOlH0pm3NfOHasu4qKQZzLiIT8X+JK1BVfpjsKJfEzZKeVXYTKZic9pgvCSXv7woTC
	1Pv2Ecs2pG5Ng34PBqGoyWlv56RcgQUy8tya3BDlslKDTH9/se5wbTzOG3hPj2jCDOR8EXByYcN
	h/uDdf5Z8+ZKzPCDLVDnmAFRLOhWFWW5OVaUxz8kbi5ln5KE8xkfuwHl8E58kGWdzlUrsUx3s0V
	q8EeIEA==
X-Google-Smtp-Source: AGHT+IEUOfXPbkU/1ewt0uL2QNoL/C3STrEVab6axmxwbxF72bZQp8bgZC9j/UZQTSicojhHo4SVb3v9GedELJ2OtFI=
X-Received: by 2002:a17:906:794d:b0:b73:870f:fa2b with SMTP id
 a640c23a62f3a-b76378bb2a9mr377977566b.27.1763571033924; Wed, 19 Nov 2025
 08:50:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119164017.1115791-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20251119164017.1115791-1-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 18:49:57 +0200
X-Gm-Features: AWmQ_bnhhVijA8x4ESVqHxLHUlzkt2VxQD6y_AxAsPbe6CwMUUN-vIgBUh7xPes
Message-ID: <CAHp75VcjhdBXps+VmPNNUucA4LQwiZnReDMbQVpxHROcVsMurw@mail.gmail.com>
Subject: Re: [PATCH] spi: cs42l43: Use actual ACPI firmware node for chip selects
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	andy@kernel.org, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, bartosz.golaszewski@linaro.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:40=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On some systems the cs42l43 has amplifiers attached to its SPI
> controller that are not properly defined in ACPI. Currently software
> nodes are added to support this case, however, the chip selects
> for these devices are specified using a bit of a hack. A software
> node is added with the same name as the pinctrl driver, as the look
> up was name based this caused the GPIO looks to return the pinctrl
> driver even though the swnode is not associated with the pinctrl
> driver. This was necessary as the swnodes did not support directly
> linking to real firmware nodes.
>
> Since commit e5d527be7e69 ("gpio: swnode: don't use the
> swnode's name as the key for GPIO lookup") changed the lookup to
> be fwnode based this hack will no longer find the pinctrl driver,
> resulting in the driver not probing. But other patches also add support
> for linking a swnode to a real fwnode node [1]. As such switch over to
> just passing the real fwnode for the pinctrl property to avoid any
> issues.

> [1] https://lore.kernel.org/linux-gpio/20251106-reset-gpios-swnodes-v6-0-=
69aa852de9e4@linaro.org/
>

This can be

Link: ... [1]

actually.

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> Ok here is what I would propose to fix this one, IMPORTANT NOTE: this
> does depend on the first four patches of the linked chain which I don't
> think are merged yet. But I would argue if we are removing the name
> based look up, we should add support for fwnodes at the same time.

You mean it has functional dependency and not a compile-time one?

...

>  static const struct software_node_ref_args cs42l43_cs_refs[] =3D {
> -       SOFTWARE_NODE_REFERENCE(&cs42l43_gpiochip_swnode, 0, GPIO_ACTIVE_=
LOW),
> +       SOFTWARE_NODE_REFERENCE(NULL, 0, GPIO_ACTIVE_LOW),
>         SOFTWARE_NODE_REFERENCE(&swnode_gpio_undefined),
>  };

Since it's a placeholder, we don't need it at all. See below.

...

> +               args =3D devm_kmemdup(priv->dev, cs42l43_cs_refs, sizeof(=
cs42l43_cs_refs),
> +                                   GFP_KERNEL);
> +               if (!args)
> +                       return -ENOMEM;
> +

> +               args[0].fwnode =3D fwnode;

You can assign entries directly here as

  args =3D devm_kmalloc_array(...);
  ...
  args[0] =3D SOFTWARE_NODE_REFERENCE(...);
  args[1] =3D SOFTWARE_NODE_REFERENCE(&swnode_gpio_undefined),

--=20
With Best Regards,
Andy Shevchenko

