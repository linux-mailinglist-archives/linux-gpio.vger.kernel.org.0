Return-Path: <linux-gpio+bounces-38129-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BhAQEOxAJ2oGuAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38129-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:23:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0F465AF2E
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:23:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VTqO4AHh;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38129-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38129-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B083F301D322
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 22:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B133B1ECC;
	Mon,  8 Jun 2026 22:23:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7098430C157
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:23:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780957417; cv=none; b=I3JNLanVp16E0m7po6SIUX/l0DxD1pueG7bc115WCvSWeDaWO6HGSJWpGZePJQN6kZFmYIpJqIW8hZfMkBAwbOa5Q3Dc+REbysoui+MJWKehmHfeEGG/3GJk5XhmZOQKSjMxvg+hbnNY8o6kWiK/XIVIZSroyYM/rIIfEOh0fMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780957417; c=relaxed/simple;
	bh=hy+HlBNSZiEKnuNuXPa4BiVC956qTqH4cLlDTQJcemQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdkqdwgHtP4EpekIHEBD9MoDGbtMMDDGNb+Z2s09/AqZxANHCu8rSLJk/kvJEGwsM19HwzyEnl04edDv5ADWKOIYMyHBPVjl8GArwurUg8CrWu3z/yfJ2lI2QaI1h5yCZ/AcwXskvTLPKeC7vy7qdOpp1OkUHGtE8884104GidU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTqO4AHh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2632D1F00899
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780957416;
	bh=lwtoOolM3FDi8mNdzENQgx8uPlzNN+S37OgdHxXFN+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VTqO4AHhtruP8yo/k8LulM7k4xt1jGI7tU7tiwwMoOvxjLcd2DtBJ6zXwVU4OGk14
	 +NJ4Z4PpkfW6X4w/5TkB+3g9ax9ogmUMEeIQGKMr9uxgTi1qXaatRewxz/KFooxmuP
	 PdhWgRCjpfw5JXrrFdVvqK2PnwMggAQVQxfQH66bARwOgD61zL0nMyc6iEVlwPMdyj
	 qS9HZM5fynwlRzuv8ZMaDp58qKrDmdOXMH9II1mk4zQWh2v78QzrYSCU1xKQjCZjqa
	 mjXC+JVdCVNifs2Bu4AYhvX8u00oTHkaTstYe7YYj/Oua1my5Ajsb5zdCmo/65NsLe
	 V0EcmKsp5/0Cw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-397e391cb2aso12816621fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 15:23:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/jj5fdDaIqWNNU8Dn07QoK0pUtqHk2cizz5n3qQjjvtHTSowiZC6X5UE2kAxYrIm06twvc06iy1sTD@vger.kernel.org
X-Gm-Message-State: AOJu0YwdPfkgumntY2RClkVK4tPLnJqe5akd7lwmDgt1mrqKzwZsdKMU
	WLPspFqpsx2X8C+DZELIDR7MoYwBAEzbO4BP8Mpgik5Qu33R6baxJi5F8HVxNtxRpHxeN4EJ8iB
	OWKwtttY+GveJBwIMoxz1QE6r4zEAXdM=
X-Received: by 2002:a05:6512:39cd:b0:5aa:6dff:cf1f with SMTP id
 2adb3069b0e04-5aa87c2c276mr5013222e87.45.1780957414930; Mon, 08 Jun 2026
 15:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-ultrarisc-pinctrl-v3-0-30a09ed74275@ultrarisc.com> <20260608-ultrarisc-pinctrl-v3-2-30a09ed74275@ultrarisc.com>
In-Reply-To: <20260608-ultrarisc-pinctrl-v3-2-30a09ed74275@ultrarisc.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:23:22 +0200
X-Gmail-Original-Message-ID: <CAD++jL=LFZYUFyAt9eUMPw02yCXC3cD6h4wvHQ529OS-o-WtSQ@mail.gmail.com>
X-Gm-Features: AVVi8CfQIbfvq-lTPCFBuhiZvgR_pTnUnbNcKUXJkelGVuuyYmtFLHMt29N80v8
Message-ID: <CAD++jL=LFZYUFyAt9eUMPw02yCXC3cD6h4wvHQ529OS-o-WtSQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38129-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:wangjia@ultrarisc.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ultrarisc.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA0F465AF2E

Hi Jia,

thanks for your patch!

On Mon, Jun 8, 2026 at 9:50=E2=80=AFAM Jia Wang via B4 Relay
<devnull+wangjia.ultrarisc.com@kernel.org> wrote:

> From: Jia Wang <wangjia@ultrarisc.com>
>
> Add support for the pin controller on the UltraRISC DP1000 SoC.
>
> The controller provides mux selection for pins in ports A, B, C, D, and
> LPC. Ports A-D default to GPIO and support peripheral muxing. LPC pins
> can be switched to eSPI, but are not available as GPIOs. Basic pin
> configuration controls such as drive strength, pull-up, and pull-down
> are also supported.
>
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Overall this looks very good, some things to fix up below but nothing
major!

(...)
> +config PINCTRL_ULTRARISC
> +       tristate
> +       depends on OF
> +       depends on ARCH_ULTRARISC || COMPILE_TEST
> +       select GENERIC_PINCTRL
> +       select PINMUX
> +       select GPIOLIB

Why GPIOLIB? You don't implement any GPIO chips...

> +       raw_spin_lock_irqsave(&pctrl->lock, flags);
> +       val =3D readl_relaxed(reg);
> +       val =3D (val & ~mask) | field_prep(mask, conf);
> +       writel_relaxed(val, reg);
> +       raw_spin_unlock_irqrestore(&pctrl->lock, flags);

Have you thought about using a scoped guard for this lock?
It will make the code easier to read.
(Applies everywhere.)

> +static int ur_find_group_route(struct ur_pinctrl *pctrl,
> +                              const char *function,
> +                              u64 group_mask,
> +                              const struct ur_func_route **route_out)
> +{
> +       const struct ur_func_route *match =3D NULL;
> +
> +       for (u32 i =3D 0; i < pctrl->data->num_routes; i++) {
> +               const struct ur_func_route *route =3D &pctrl->data->route=
s[i];
> +
> +               if (strcmp(route->function, function))
> +                       continue;
> +
> +               if ((route->valid_pins & group_mask) !=3D group_mask)
> +                       continue;
> +
> +               if (match) {
> +                       dev_err(pctrl->dev,
> +                               "ambiguous route for function %s group_ma=
sk=3D%#llx\n",
> +                               function, (unsigned long long)group_mask)=
;
> +                       return -EINVAL;
> +               }
> +
> +               match =3D route;
> +       }
> +
> +       if (match) {
> +               *route_out =3D match;
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}

This routing function needs some kind of comment before it explaining
what is going on and what constraints you are trying to resolve with this.

> +static bool ur_function_is_gpio(struct pinctrl_dev *pctldev,
> +                               unsigned int selector)

Neat that you implement this!

> +static const struct pinctrl_ops ur_pinctrl_ops =3D {
> +       .get_groups_count =3D pinctrl_generic_get_group_count,
> +       .get_group_name =3D pinctrl_generic_get_group_name,
> +       .get_group_pins =3D pinctrl_generic_get_group_pins,
> +       .dt_node_to_map =3D pinctrl_generic_pins_function_dt_node_to_map,
> +       .dt_free_map =3D pinconf_generic_dt_free_map,
> +};

Good use of generic helpers!

> +static const struct pinmux_ops ur_pinmux_ops =3D {
> +       .get_functions_count =3D pinmux_generic_get_function_count,
> +       .get_function_name =3D pinmux_generic_get_function_name,
> +       .get_function_groups =3D pinmux_generic_get_function_groups,
> +       .function_is_gpio =3D ur_function_is_gpio,
> +       .set_mux =3D ur_set_mux,
> +       .gpio_request_enable =3D ur_gpio_request_enable,
> +       .strict =3D true,
> +};

Here too.

> +static const struct pinconf_ops ur_pinconf_ops =3D {
> +       .pin_config_get =3D ur_pin_config_get,
> +       .pin_config_set =3D ur_pin_config_set,
> +       .pin_config_group_get =3D ur_pin_config_group_get,
> +       .pin_config_group_set =3D ur_pin_config_group_set,
> +#ifdef CONFIG_GENERIC_PINCONF
> +       .is_generic =3D true,
> +       .pin_config_config_dbg_show =3D pinconf_generic_dump_config,
> +#endif

Why ifdef:ed? Just select it in your Kconfig and rely on it?

Yours,
Linus Walleij

