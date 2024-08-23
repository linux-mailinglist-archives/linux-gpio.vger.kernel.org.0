Return-Path: <linux-gpio+bounces-9058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D0995CF94
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CDE32825C9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 14:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49BA1AD3FB;
	Fri, 23 Aug 2024 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXfJQIlH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093101917DB;
	Fri, 23 Aug 2024 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421975; cv=none; b=t6YW/zKDcwEXGomlunKHblJgSlR9WRvxQDfsQ/mE/F724tfo9dap817BV0uqjtG9FLfuA1UNlpPSsC/CPMDJdl3rXL8o5gxGOK3D1iJC+9SZWVRGHNj0mbB+9N4MKihB9e3z0wtoCxiZ7X4XDUal1MzPEYKe5yRlzswdt5IPBEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421975; c=relaxed/simple;
	bh=+ZiMBXzO2Qnkx4P3z6BE0MLKmZndlbkPBcBXSumtrsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LvEM25WsNF+Ai4jPVPilj98DfHVVPp833cKb7fQWP5oxyzq3BaXiT+DQzAwMzKambOcGskkKH/26tDR+DTc/PD09cF7f2TLV+RHwnAyQAkJLLG/0uM6vrOS4cFXWFYnKMTZzuOf75Uz+kkb3rUUBrlUiB6jQjYK5WHowtB+Tz5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXfJQIlH; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4fce2c0707bso654856e0c.2;
        Fri, 23 Aug 2024 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724421973; x=1725026773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYTTxKQGNaBBwgbRWUpxwLKWCThHX0EOM71weT9u2Ys=;
        b=aXfJQIlHGr9znEKuHCm3JjnmLUDayn9XNtVQA1BkQSQRvYTwVpqhjtkdQVbuNnR/nb
         RQemvU9JShyYvN0FLUOpXcBlVMlIV0sgm9UF7XwrgQko/b6pjUCT46BnNqNi/lpGqo3g
         9ATUPSCORc18MdCMuumzDvUc3en4zQPH7hhLZeXMUfSh6kngS4S+qPDy2RSVEq4WvmRk
         gGprrWiRkjM2HPmWMCv2w2LpgRRQTjaKbFNSg5yCv+sb9WDfwjHsd5YiT8VZJB9fG57O
         OUJ23aJ2vg7uq/jYdhKiA/Gz5Bh2RhL9cG7GLw2ni8pAB28crIaKWEfgxADHpCTt9FTQ
         xW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724421973; x=1725026773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYTTxKQGNaBBwgbRWUpxwLKWCThHX0EOM71weT9u2Ys=;
        b=RRksNn/Lup+8klPKYLQgIBei40b8HIpkLMJotP9sdLOvb4KnJq1Wg0/TLuZ6AeepCZ
         RfM73mnnuv9lVYr4kvWkSk19dFdYLTiMZOkN+DYXFAqWlEX7CT2ddG3C5XGEzF1AxIAc
         Z1lfl3idRPVTAg+7Qo7313BTsgj+mRpcHWtI8VT2tliJmRZeoiAd8yiqtDoV/Kxjw3TZ
         UYZKv/7+pF2ti3vZdY/xYZrpjAxaHgaFmu8StB5PCz1cVnpUac5jYEBtoY2UAFHfuyhQ
         oDh8azInejp8K8zIXwURStCJvRyTTi/AKfF7mdqbQbD79dhYLgCXENbJdsyiz3P+DVV3
         Ck1A==
X-Forwarded-Encrypted: i=1; AJvYcCU1Lc6iOQOj04fLXJY5GcfFfhtQL8VMmOJWIDfDsVzftGr4yaGvQMdsD2iymcnK53F8Q5MXOc5B2VAr@vger.kernel.org, AJvYcCU5tmAwSN2SDLSSn6h5ivl4JJY6zh/TLMjSRY/jtK33ui/Q/1zsmYiBq2IfbxqItXpxQIAZCEgbVu31nDaA@vger.kernel.org, AJvYcCWmGGXVC5MucqEP5HlFBgY8JW4lim17jFTfgdiIxz6j1+jtGsGyq90UvlBiO0QfYJ3bybTGDDPCBnTQQVAMjoL+bLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxawubEXO7ziXyawkDc2IHdlJxhy1Iz0gzfS8Zbcq8TNRnrjLhW
	PYy7z6q8oJPeLTe6rj0hDLcCX2GkoXc8dMlJqLemFZiEI7Zr/M98WyKDXw9mCgMepDZgstrscgv
	ofWvtSy0CYGlHBwfAFADLNJnyyiE=
X-Google-Smtp-Source: AGHT+IEw8NSACQTt79yaANCMagkmS9EW93UoRdofnZRrQ2gS1Np9VXCynWo7/EzOW+D4kXESy9FONeDOeJCe+tzKzGI=
X-Received: by 2002:a05:6122:1d4b:b0:4ef:65b6:f3b5 with SMTP id
 71dfb90a1353d-4fd1acd19f8mr2710149e0c.10.1724421972312; Fri, 23 Aug 2024
 07:06:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822230104.707812-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240822230104.707812-1-andy.shevchenko@gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 23 Aug 2024 15:05:46 +0100
Message-ID: <CA+V-a8v6saYEP-WUA4mT2vBsiqw6aH0xKSyFzchvHZJNwmMqnA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: renesas: rzg2l: Replace
 of_node_to_fwnode() with more suitable API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 12:42=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> of_node_to_fwnode() is a IRQ domain specific implementation of
> of_fwnode_handle(). Replace the former with more suitable API.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index 5e3d735a8570..73b55e096106 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>
> @@ -2624,7 +2625,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl=
 *pctrl)
>
>         girq =3D &chip->irq;
>         gpio_irq_chip_set_chip(girq, &rzg2l_gpio_irqchip);
> -       girq->fwnode =3D of_node_to_fwnode(np);
> +       girq->fwnode =3D dev_fwnode(pctrl->dev);
>         girq->parent_domain =3D parent_domain;
>         girq->child_to_parent_hwirq =3D rzg2l_gpio_child_to_parent_hwirq;
>         girq->populate_parent_alloc_arg =3D rzg2l_gpio_populate_parent_fw=
spec;
> --
> 2.46.0
>
>

