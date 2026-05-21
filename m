Return-Path: <linux-gpio+bounces-37255-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF9rFJXSDmr2CQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37255-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:38:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B935A279E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 378EC316CC6C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 09:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA523537E5;
	Thu, 21 May 2026 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcFpV4QA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D203624BC
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354561; cv=none; b=mmI3w0jPqDxIqilE8COKTwQcw54JYsY+PJP5bVHjpjqidGrfpnlQkcJsvhFtdv1lMUf7k+Sqew27y7gcI4CAD/isQ14t9Fsbpbm+0crOzBV7+/ofP+D2XLL49es+1jnW4WIOCFEQSynYt9FHAf/PnXDpP50USwNoqn9ZdYcpp30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354561; c=relaxed/simple;
	bh=HpvRBY8lbmiyzUWTmQ6mLlMu3Ab39ZXALE9sv15k+3w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WffN5qZU7icL0ZPMG2LO+EHeHyqt3ZiljX9nbmFhx1dWSi//33Cyaht7mZPqG8xpPiGdLfCvLr0nTS+KX+ynd7JDm0d5aebPfBzZWDrNDtaIPZ7jugnRVdCF3AwvGif36F6YR8DPNF+wYAEAQibbtPmZyD1ooILVpZ8DKr7yFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcFpV4QA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3B61F00A3F
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354560;
	bh=tZQ+ChGAmDE+uIHx0cmmqJIG4xuBBt/oi0plyigfTmc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mcFpV4QASf5he7XkX9GMiYvVKUp7RMFoHYMX1oX2w7udhqLGXIjgE2qxJxVNG7pv5
	 xJdiPnCpGwdY+yvMGJo4gySH2yPII7slIDmMg9TmTkhPQs5YqoejSJeh/Jn4/XUMna
	 aaIpzq0QNfdEXLLKb2if34+5+NodrnF48pUBoUfiNOqkb60hY3hNs/mOq0Q7+8Gevm
	 2rLvdQG1kGdXntl9Iv+21S1jWEmz+msIW6rpYfFkUJhTxwXNFynxRJMieD/cj19Ih+
	 uzD1zWxQGpx3S26EGx3d+8044Nt2hOEsQ1fngvfhRIP6rLMDfr31xodUK/DsjvJcjh
	 xuH+iaoUY13fQ==
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13621cca8f5so1723566c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 02:09:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+DX+r75Yb4Lg9SC3rVObtJXZvPqMgo769denREbJVGnxDoZUNaQf81cxNMEdVc0170QIxPqZ9g40a4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr0wfKUE5NJvCvFofpHfq11nk79WrPGDHFxnaesCNv5S7X3KXM
	KqYdAv8aRyQ9sn5MnZx6bbkPEdcCZ9USpo88nl/IywpKDDspDuhvnCcQqjUelIBLTdYnaKR2Som
	8kv+TcVHJ/DMbfleqlU5knzDuITOxsmx/BSW4NNFIGw==
X-Received: by 2002:a05:7022:2392:b0:130:ca3d:fa74 with SMTP id
 a92af1059eb24-13632f5e0f3mr1015599c88.42.1779354559846; Thu, 21 May 2026
 02:09:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:09:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:09:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520-rsk7203-properties-v2-1-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com> <20260520-rsk7203-properties-v2-1-465f3308021b@gmail.com>
Date: Thu, 21 May 2026 02:09:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcu+UTGz5keKgHqo4BdWMtK87CLiVU1jWBoLHNABJc2sA@mail.gmail.com>
X-Gm-Features: AVHnY4Jr7rGL-1AgbjdFR6Z5eqHof0x8iAqjMz8AFfw842n9_b1NuawDkEv0zms
Message-ID: <CAMRc=Mcu+UTGz5keKgHqo4BdWMtK87CLiVU1jWBoLHNABJc2sA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: renesas: gpio: isolate function gpiochip
 from parent fwnode
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email];
	TAGGED_FROM(0.00)[bounces-37255-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6B935A279E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 07:13:17 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> The sh-pfc driver registers two separate gpiochip instances: one for
> real GPIOs and another for function GPIOs. Since both share the same
> parent platform device, gpiolib's fallback logic causes both chips to
> share the same firmware node (fwnode).
>
> This causes ambiguity when using software nodes to describe GPIOs, as
> gpiolib may apply hogs meant for one chip to the other if they share the
> same node.
>
> Explicitly set gc->fwnode to ERR_PTR(-ENODEV) for the function GPIO
> chip. This satisfies gpiolib's check for an existing fwnode and prevents
> it from falling back to the parent device's node, while ensuring that no
> actual properties or hogs are found on the function chip unless
> explicitly assigned later.
>
> Assisted-by: Gemini:gemini-3.1-pro
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/pinctrl/renesas/gpio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
> index 2293af642849..4e59dadb7364 100644
> --- a/drivers/pinctrl/renesas/gpio.c
> +++ b/drivers/pinctrl/renesas/gpio.c
> @@ -278,6 +278,12 @@ static int gpio_function_setup(struct sh_pfc_chip *chip)
>
>  	gc->request = gpio_function_request;
>
> +	/*
> +	 * Explicitly mask the parent's fwnode to prevent gpiolib from
> +	 * reusing it for function GPIOs.
> +	 */
> +	gc->fwnode = ERR_PTR(-ENODEV);
> +
>  	gc->label = pfc->info->name;
>  	gc->owner = THIS_MODULE;
>  	gc->base = pfc->nr_gpio_pins;
>
> --
> 2.54.0.669.g59709faab0-goog
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Should we document this behavior in struct gpio_chip's kerneldoc?

Bartosz

