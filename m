Return-Path: <linux-gpio+bounces-31012-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNLVADR+c2mQwwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31012-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:57:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 525F076872
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11BDC3021E6F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 13:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F120B2ECD32;
	Fri, 23 Jan 2026 13:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NDoyF67b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C841266565
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176584; cv=pass; b=HNrJ7mAYVOczEMXv4AW+5N9xFUcO3yLyQtwvVLzY94sm53JVT2by80n5/Qmk+SLJWHej64eQymodEMmRfJFgUOs4NV26HZdYKOrNikUIuNsm35CMeTvlw6B0BQuQxpCHb1L0nna9zbiVK0kvghbVr37J4CdzAC1IeLhCzlPlHhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176584; c=relaxed/simple;
	bh=aR8CpMb+s+EUHAjDGHaj1AO5m1hEQkCbg+lElZIdMAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFkXOFFyJ5Wpiahlwylxoxf7dUGT07pLYHRrk8Zkx+YJFFJtw2HuFN0TgOi8ecEF67ykgjjCh85yVDYWjjaqFfB6Y+jbcCCoxVhaNVSVbYyKGkbQN86mYFVKC3h6TFJGgBboyMdrVJR000qxbUkvf9e0qpH9so63tG1pI9MNlu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NDoyF67b; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6582e8831aeso3482510a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 05:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769176581; cv=none;
        d=google.com; s=arc-20240605;
        b=HrHnWl7KZso1M7iMO2+XL4qWsHv9AyP9qel0hSg93er04gO7DbflSDQ7ZuXKrWQOyJ
         jABpaGHV/IR7XP+4+Hge9vW5cYI+mtAxfcxrdPvNRXBgMJOcw0sXAsyGreyMEPdZtDub
         bAduLHPnYPKFFTParMc49Es7qdtMzmIFKXKVjQT1iBPDoCzuRRCPZsEGLNTYQiNKx1OM
         Vf/HmbJFEJiPYi2aJjMsR6OhDR/OWnaISTCWNBChNrHk8DK6aNJayyQoXDlQHH6NdEKU
         3O+kCJ+j6H581ACa835LQWhwMmC1gKP+4Ck5SxPcVuRtMOg2XFs/QnbTJMXfs0b1U1sm
         h1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MV9DSpmK7zSE3yOlg4auKxgIt8uc1vwlHVSaE0w/qMY=;
        fh=PaWM3Ayn2uma0X8oEbgt2Pj1ASk9U/FgFWjkZidKsIU=;
        b=DVIKPmEoym6nhML5mck/r1R24WfgLeCxqfGoJ0S/6H/LyDj5ww19IIjorYQ4YGcnfG
         pl1yOQP/EppCz9t/DoLS9xdsSGsSxad6FvWsjQ7MFegX2bs0AzQdKpN5hHhhkWevX7qr
         DaQoftBN7yQj6M6zaCJFpLOfarBnbjk0kYS27ulRuOcY2zmAVIg7QGqTC84UJ5BKfcNp
         HcZWmySCSYNmRlOdEc12HgdhVHqzD85P1ImWSeWNeNc2HN+GaO6x0bAHh/3Pf0b808JC
         55SExMOZRSqxjx71Eu9h8vCaBeKcJEl/sIzOHRfizo8VNbQ/qWw6rQ6sEnukpT0+ZJ9F
         6Ccg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769176581; x=1769781381; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MV9DSpmK7zSE3yOlg4auKxgIt8uc1vwlHVSaE0w/qMY=;
        b=NDoyF67by7Agxo+AVkjXz78IlrNMhHcZ1stCF5T5tV/fyo0TIOvNc8XQh76+Aw4BER
         TRAI6rg0WysR+HxDkyR68Lnz9Zpud4jSR5y9fAg0C6OL6BotTeYPMb4jNf8EBh1GQVo+
         68yq0PQOWe+l1ut+QBImDkjP/s0Fse+J4WJ0yfisANHN0qp15qe4hPMbwcmxyVsE06zy
         Lv1V/tEhwW/X9Q2fRMSxOnnIESRiBVWePF4kI/U6qU0X5SK1Qhl9lUuMCzU6FALUHXBd
         Te1WihjXU6HLIslfa+eWnR6+L8pypW34E1MFP1ibnlbUdTZz8LM7pf2N7UQwoDXseRVk
         rwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769176581; x=1769781381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV9DSpmK7zSE3yOlg4auKxgIt8uc1vwlHVSaE0w/qMY=;
        b=A/Dbjnz+JkoR2UTE7vfKJ6sngRgpzMD73N+Uq67S96Y0GQYyol84yJEYMxjoE1bwi5
         VI4oceGVLPJ/nzTIw6R+B30z7LEzZ3FA/jZ9bIvUXP0gJVCg/8rU+wVsX3Wf5ZZNRspk
         x+mcIrZ+4WTMzfpEJX/QsWgBp4iu9S4VLs9HoX3p5QzaJLJ09lK38pZ17tg/UVkc5umf
         D4H0nxprC9WkwVVqc/yI9SISyhPHm57MOT96Ry/y9Vnf2uqrJSXJJJLN1g634p+1qw2A
         82tDxQ91PvGF+C8nU5TRU5ScBnu0U4u68IJO1BHZ3arnb3nOEpFdoHoX59H7UjzrAU4i
         PzvA==
X-Forwarded-Encrypted: i=1; AJvYcCUNBe9NRH0R0fKUuBkrHN4kzAFRoqjE5tSN6MIdzUpAU85MW/H7ikd3DVy39F2hJx3C9bJwyKQi9CMP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzff5+pqorBrDQFx5RDsCnqdWrwwEArYXUCMdLdoxZ7AufHjmp+
	a0MOSJUEyJFm4jiaqWfJ2Icjw42uKsaQCNZGNFYUFAEQ9TfYrdH/3fOETtfpRwuQzPX8a/eJWKp
	nYwOMg8rD9Ms2a1m3F0WmpCct6aEmEJXdqm0TiUhOng==
X-Gm-Gg: AZuq6aKaJPx0YU3ZbhLkQpfB2fwfcVYpDKrkbup0N13bepg4vkYLtIPal2UcD9el4Ki
	x7li/GwHK5bzkjsd+C8Obz28HR23YXWYs7lN75WKVsYHt1x8beV51Baot3+nLqlclkH5NBjoBzy
	PZmhRlsVPeAdM5A5TxR7Zrb7EyxtH4UjBv/TKpl9WZupv7y2vgLOFCPjbeaZt3BGpR/A5bFzug9
	QV3+yf151AlSCzZTkQ6PREbuN2cRgMk07T4H3AwYtHL8T+DvBRTSmrmKNLOy7pOkN3JT5vJpv+s
	L/ZFld+7KFlDkhDVDeeDSowB
X-Received: by 2002:a05:6402:35cb:b0:64d:e1c:4c0a with SMTP id
 4fb4d7f45d1cf-6584868efb4mr2064138a12.0.1769176581281; Fri, 23 Jan 2026
 05:56:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-9-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-9-khristineandreea.barbulescu@oss.nxp.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 23 Jan 2026 14:56:09 +0100
X-Gm-Features: AZwV_QitT_JBj7lN6X8pXiBMkI1LXoq3ivXbG1n_-sBl-TpYf_jVZTRwjJZibTg
Message-ID: <CAKfTPtBCmwL3fpQuWp12HST9Nud583+QUs_BNBA48z9xRbcf9g@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31012-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincent.guittot@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 525F076872
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 at 12:59, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Add basic GPIO functionality (request, free, get, set) for the existing
> pinctrl SIUL2 driver since the hardware for pinctrl&GPIO is tightly
> coupled.
>
> Also, remove pinmux_ops which are no longer needed.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

[..]

> @@ -1068,5 +1318,42 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>
>         dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
>
> +
> +       /* Legacy bindings only cover pinctrl functionality. */
> +       if (soc_data->legacy)
> +               return 0;
> +
> +       mfd = dev_get_drvdata(pdev->dev.parent);
> +       if (!mfd)
> +               return dev_err_probe(&pdev->dev, -EINVAL, "Invalid parent!\n");
> +
> +       gc = &ipctl->gc;
> +       gc->parent = &pdev->dev;
> +       gc->label = dev_name(&pdev->dev);
> +       gc->base = -1;
> +       /* In some cases, there is a gap between the SIUL GPIOs. */
> +       gc->ngpio = mfd->siul2[mfd->num_siul2 - 1].gpio_base +
> +                   mfd->siul2[mfd->num_siul2 - 1].gpio_num;
> +       ret = s32_gpio_populate_names(&pdev->dev, ipctl);
> +       if (ret)
> +               return ret;
> +
> +       gc->set = s32_gpio_set;
> +       gc->get = s32_gpio_get;
> +       gc->set_config = gpiochip_generic_config;
> +       gc->request = s32_gpio_request;
> +       gc->free = s32_gpio_free;
> +       gc->direction_output = s32_gpio_dir_out;
> +       gc->direction_input = s32_gpio_dir_in;
> +       gc->get_direction = s32_gpio_get_dir;
> +       gc->init_valid_mask = s32_init_valid_mask;
> +
> +       ret = devm_gpiochip_add_data(&pdev->dev, gc, ipctl);

Your mfd child device doesn't have a DT node, only its parent has one.
How do you point to the gpio controller in DT with a phandle ?

You probably need to create a child DT node


> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Unable to add gpiochip\n");
> +
> +       dev_info(&pdev->dev, "Initialized s32 GPIO functionality\n");
> +
>         return 0;
>  }
> --
> 2.50.1
>

