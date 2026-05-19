Return-Path: <linux-gpio+bounces-37145-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOo5AlhHDGoMdAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37145-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:19:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0F57D69D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C6CE3051EF0
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCDD494A18;
	Tue, 19 May 2026 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PWwMGAML";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HWMkZjrI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F8E49218B
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189177; cv=pass; b=umhCZLjabwld/9DutjHaIMKfbTquHLIHT8IqPtHuJ0Oy+gkHLRX/EnZTEJPgbyT5i4OsQ2ps4/xGJX2MvGY+O9v7XAGKTLJJ6x3iE1mDXHDevepTAZlNXUiI3Y0r3ArPE5vXSt3BT8g/NDQ69eaBJMsZBy0h0hz7VqiFATCHg8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189177; c=relaxed/simple;
	bh=G0ThN/1d1oEYjKqmxKgM7/icL/xC1s/HQwJfFfdz33k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0+XO2wI0ZeT8olYfUb9PuVHUpAQb4N8Ugr28BvZn2TqVjOoIef5Kg2GKto0Jcu1vweTCDT1uwgz4at5UE/eOlpxPu8Xy60x2+0P5zcMuqPsA9euWtH/Y0pwJeXSfxSjAVVxDnqnIXTppLbr0KyE4birOdlygROj6fYbNIKUwhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PWwMGAML; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HWMkZjrI; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779189171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXsqNQngsEDaEw4yQ657tilzkdXWVYHvbpp2A/ZUbBk=;
	b=PWwMGAMLHUIlLTk6dYx/URA/ZmtB5UH5Pnv+7N6za9jAnAVfqR5+WVpoBrddddAZV+b9Tm
	VZ6xld7Si9gJ6xZ+xq73tWMLuUz5760veqJMap0zcoTyIJ4vOsJNmKRkPYaS9VtgeEsHSo
	A9T0gR6VFfK7rlK7eSH2bgYhpSYjFqs=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-rp6Wki3CMKOaSuN9fFcoaw-1; Tue, 19 May 2026 07:12:50 -0400
X-MC-Unique: rp6Wki3CMKOaSuN9fFcoaw-1
X-Mimecast-MFC-AGG-ID: rp6Wki3CMKOaSuN9fFcoaw_1779189168
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5a86ef3c097so80797e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 04:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779189168; cv=none;
        d=google.com; s=arc-20240605;
        b=Hy66QM3s6AfZReIg0jVBJ0WRSNzvUFW2qKHApvUtcwZ6PiS09Tnni5YpEk+sMM7kvW
         BJnBGeiiuY+gMVrGws85iUMfN+xFS+d2mRM5mcsK7qr7ZgyUam2XLfP4HNXevFrhwupb
         xKWdBzr9iINZlcUNSOb9Dn8ip1X3YbHCJG6GZiWbN8UdyvlFDyILJ+fnWg17cYVnklyW
         kMPEbDoDG3wbnMP9V/8UCN9INZLXBsA0NVwHo3ow3bQre56U0E8L6UGI0Q2Y1L8A8/Gs
         g8Z30XPu/hwKwrhTma3j26OQ9NuigyvbKPWY46wGpGvBt8WUCN94jMwcRgBjOP0t7gZM
         u2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oXsqNQngsEDaEw4yQ657tilzkdXWVYHvbpp2A/ZUbBk=;
        fh=TImliSwfyOES4xDdMT9BIz/Km8e9sHyzy9E0pKnb8Bo=;
        b=B9l59FMP41HLdT63M1sGzBHjpZ3Foy1uUCvFiG7rTx+6OYka7tzlIwRrnmnPQvVLna
         e/MTUX2qrJU7wMtu4gUQgA4ehjOO1j73HjdWr/W7MSfjOpQ64JEroW38aE3rPoiBAdRM
         ntqRLi8wKXmRK0jKplEh/GgFM4Y4IVaLsZ9qAyzTT3tZQmK8GYMJFt1bEuUgq3/v1Snf
         h1JVI1SWDmYqtSD9Mw8dHaUTujBaetQMyFTgwKNwXJL/fl7YCEjY2yka8Uhv3wpRvGjJ
         6XzN/G8Y+j4bWc5Let47NV6P8MDVExaIEEEAg3P0d8v0qMCzOg5aI/oD5XiP/AXXy53m
         kMrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779189168; x=1779793968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXsqNQngsEDaEw4yQ657tilzkdXWVYHvbpp2A/ZUbBk=;
        b=HWMkZjrIQ+RTQ5eKH1BX1z+t/5W31yN3NBzsYBH2hHVKR0AIXlsZWG8vU+/5xkMOQu
         bAkUkZeesFcvMeojqjGg/f6P8INPyYaoqWOma3Z7prB/GxUJvD4jGQWZFL3SVCYPf9MI
         zx94xAQlXyzyyUrZjRnkUvP6taxqZeM2UavrfF5MpFVrNmGCt+RuIKsrZPu5LMfSBtLf
         esMVZ6P2+seaA+hPmT1NyJtA504SbLjhbSE8cQpO4KK/KbM9SBQaOxloTQnfYSDm9177
         aW873QXzYPgeSMsjgdxrC7McrHw+xQwZ5fglCZKBej77+4HYmF4JuQBS0S2GdgY76DTP
         2Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189168; x=1779793968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXsqNQngsEDaEw4yQ657tilzkdXWVYHvbpp2A/ZUbBk=;
        b=ArNKdVorQ/LpKLs2yhUxZAoZ06ZFxhqmRnfF4qSP/RFG3SKHsmNRuD+6Xn/juE2qMj
         NvZGzyEUUplYQKfXQvt45hND1mP8wXIxtGSDCLxMhauaE+P8Q8fFt1RXeTSvO8wctWWz
         +cuOLX4AWEjahgly00QfRqk1nM2xkTFMu0V3AqAGDEJtqOLWu/9kRAf1YX3Aghc5YaYY
         cXlCtIv0Z9nlW1NieeTR+Wlc9sebUabZhYx3VYS4len8xj/hS6imiyHppt4reyjCa2hr
         cz9qVWdvlIQ/BwfJcMR8Ufw59j1FQPw3Ege+sNQ8T5znSavOsQLGzfIHbrEevtuR6Meh
         mJJw==
X-Forwarded-Encrypted: i=1; AFNElJ8GhjFTQOohkFxVjycvQQM/2lDpwvzVBnHFFTLYp1LxCMVl8TYprs5jtQuxURyJH/4SEkF27xpgFXEN@vger.kernel.org
X-Gm-Message-State: AOJu0YxHCvEPm4M5YIpl1lwZX1wJvevd4TKRAl70NDI5j3U/mYxXlStA
	8dU7Qrb2muC+qFmBcAr9CAv1DH0FzMThUTBsKK9sO+Fq/13HxGgZNwLAFK4zzSk76pQfcoqTk+0
	+d8r2AstkOlUJ64Gby1xkaEUUGjB+FagKsxKVp+8Ygg9FxEQKqS57UId9jgfBqqJEAJV3sf+YBR
	0OWTXRQHpiGL4DicqeC/lSAaABVmYzpu21MWJtYg==
X-Gm-Gg: Acq92OH1N8JsbyrpPn60mDlV66aPlnBwKe/4Jx0NLKigBXwK+XFXy09Rw1ALiVA9g/c
	Et7a3R7iBtRbr+vgrEmza1cuR7SegNZUoh3YSE1PVNGeMgkCNhfgoN/w2ReQb4u9VvM8J1mEaiT
	5eBvu5N5MlSFvBORpHGofQYWKHzJ3BZ22XSl3YmPnje+4vEITi/DFDDwXFmnuoIXj7fUsRV5RVY
	16y4Q==
X-Received: by 2002:a05:651c:4119:b0:390:f0e8:a0a6 with SMTP id 38308e7fff4ca-39561eca6a3mr18209491fa.7.1779189168281;
        Tue, 19 May 2026 04:12:48 -0700 (PDT)
X-Received: by 2002:a05:651c:4119:b0:390:f0e8:a0a6 with SMTP id
 38308e7fff4ca-39561eca6a3mr18209371fa.7.1779189167744; Tue, 19 May 2026
 04:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 13:12:35 +0200
X-Gm-Features: AVHnY4IysE9Si0e6LCWrqXrdQ4CUJp9E0s70DE65f5jtBnVk_MehFj_WtyF0KyM
Message-ID: <CALE0LRs5XwjwVXkc+WGtkucs5WGjoHu-Dcd8fLBmqQjz16XdDw@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] pinctrl: s32cc: use dev_err_probe() and improve
 error messages
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37145-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eballetb@redhat.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E4C0F57D69D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Mon, May 4, 2026 at 3:12=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Change dev_err&return statements into dev_err_probe throughout the driver
> on the probing path.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 64 ++++++++++++++---------------
>  1 file changed, 30 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pi=
nctrl-s32cc.c
> index fe7cd641fddd..56be6e8d624e 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -2,7 +2,7 @@
>  /*
>   * Core driver for the S32 CC (Common Chassis) pin controller
>   *
> - * Copyright 2017-2022,2024 NXP
> + * Copyright 2017-2022,2024-2025 NXP
>   * Copyright (C) 2022 SUSE LLC
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>   */
> @@ -236,10 +236,10 @@ static int s32_dt_group_node_to_map(struct pinctrl_=
dev *pctldev,
>         }
>
>         ret =3D pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cf=
gs);
> -       if (ret) {
> -               dev_err(dev, "%pOF: could not parse node property\n", np)=
;
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "%pOF: could not parse node property=
\n",
> +                                    np);
>

Nitpick: I think this is not part of the probe path but is called when
a consumer requests a pin group, so using dev_err_probe is slightly
misleading here, although I think it's harmless.

In any case, with or without that change it looks good to me, so

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

>         if (n_cfgs)
>                 reserve++;
> @@ -763,15 +763,15 @@ static int s32_pinctrl_parse_groups(struct device_n=
ode *np,
>         grp->data.name =3D np->name;
>
>         npins =3D of_property_count_elems_of_size(np, "pinmux", sizeof(u3=
2));
> -       if (npins < 0) {
> -               dev_err(dev, "Failed to read 'pinmux' property in node %s=
.\n",
> -                       grp->data.name);
> -               return -EINVAL;
> -       }
> -       if (!npins) {
> -               dev_err(dev, "The group %s has no pins.\n", grp->data.nam=
e);
> -               return -EINVAL;
> -       }
> +       if (npins < 0)
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "Failed to read 'pinmux' in node %s\=
n",
> +                                    grp->data.name);
> +
> +       if (!npins)
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "The group %s has no pins\n",
> +                                    grp->data.name);
>
>         grp->data.npins =3D npins;
>
> @@ -812,10 +812,9 @@ static int s32_pinctrl_parse_functions(struct device=
_node *np,
>         /* Initialise function */
>         func->name =3D np->name;
>         func->ngroups =3D of_get_child_count(np);
> -       if (func->ngroups =3D=3D 0) {
> -               dev_err(info->dev, "no groups defined in %pOF\n", np);
> -               return -EINVAL;
> -       }
> +       if (func->ngroups =3D=3D 0)
> +               return dev_err_probe(info->dev, -EINVAL,
> +                                    "No groups defined in %pOF\n", np);
>
>         groups =3D devm_kcalloc(info->dev, func->ngroups,
>                                     sizeof(*func->groups), GFP_KERNEL);
> @@ -886,10 +885,9 @@ static int s32_pinctrl_probe_dt(struct platform_devi=
ce *pdev,
>         }
>
>         nfuncs =3D of_get_child_count(np);
> -       if (nfuncs <=3D 0) {
> -               dev_err(&pdev->dev, "no functions defined\n");
> -               return -EINVAL;
> -       }
> +       if (nfuncs <=3D 0)
> +               return dev_err_probe(&pdev->dev, -EINVAL,
> +                                    "No functions defined\n");
>
>         info->nfunctions =3D nfuncs;
>         info->functions =3D devm_kcalloc(&pdev->dev, nfuncs,
> @@ -919,18 +917,17 @@ static int s32_pinctrl_probe_dt(struct platform_dev=
ice *pdev,
>  int s32_pinctrl_probe(struct platform_device *pdev,
>                       const struct s32_pinctrl_soc_data *soc_data)
>  {
> -       struct s32_pinctrl *ipctl;
> -       int ret;
> -       struct pinctrl_desc *s32_pinctrl_desc;
> -       struct s32_pinctrl_soc_info *info;
>  #ifdef CONFIG_PM_SLEEP
>         struct s32_pinctrl_context *saved_context;
>  #endif
> +       struct pinctrl_desc *s32_pinctrl_desc;
> +       struct s32_pinctrl_soc_info *info;
> +       struct s32_pinctrl *ipctl;
> +       int ret;
>
> -       if (!soc_data || !soc_data->pins || !soc_data->npins) {
> -               dev_err(&pdev->dev, "wrong pinctrl info\n");
> -               return -EINVAL;
> -       }
> +       if (!soc_data || !soc_data->pins || !soc_data->npins)
> +               return dev_err_probe(&pdev->dev, -EINVAL,
> +                                    "Wrong pinctrl info\n");
>
>         info =3D devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>         if (!info)
> @@ -965,10 +962,9 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>         s32_pinctrl_desc->owner =3D THIS_MODULE;
>
>         ret =3D s32_pinctrl_probe_dt(pdev, ipctl);
> -       if (ret) {
> -               dev_err(&pdev->dev, "fail to probe dt properties\n");
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Fail to probe dt properties\n");
>
>         ipctl->pctl =3D devm_pinctrl_register(&pdev->dev, s32_pinctrl_des=
c,
>                                             ipctl);
> --
> 2.34.1
>


