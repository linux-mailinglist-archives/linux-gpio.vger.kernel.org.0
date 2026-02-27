Return-Path: <linux-gpio+bounces-32269-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJAoA+thoWnIsQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32269-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:20:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6C51B5351
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC05B3016D13
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274AF38B7A8;
	Fri, 27 Feb 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqs6Y0J9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC5534404B
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184026; cv=none; b=FGiE3WRWXZL2FRPh0Pz3CLNjnDYyti21zDTooPJs+JGdxR1AuHG1lWxOYmEeS1Doyqh3ET39xKUpxZLIf433s5Sd4Pbwxjq4RgXSqLxyWG1eSfemuAXxq4hyc4ALNmwVH9OvJGZ5g+6Tjt+d/Mq1uiZ7Gpytrw/J2Qbx7cgUudU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184026; c=relaxed/simple;
	bh=S1nQyU+OxaqI2tjVc/itA3ceL+9l9+iwZz8vzA2HlYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQSZfv036u36hOt4/YIhUeWktNHuG9S1fPLUQiNZPt7GTD69zET6pJuwpHdskcYKeRpq+el4LmcTDCmEqq+ZhMrLyAuJqnOqMjTgQ4urqW+t5BR8juin4unxvQd0tiUOS0D+wlNUILkoQCI/1fuwRf90ZZyEK1KFT3emVMPRZbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqs6Y0J9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948C8C19425
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772184026;
	bh=S1nQyU+OxaqI2tjVc/itA3ceL+9l9+iwZz8vzA2HlYA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fqs6Y0J99hDAK5/9IL3Jc+BV1ftykSYk2DNp4qZSZokW12vdYHifa+mDgDkNTN0+n
	 1nAVBNl/MuJHUH7TE0erioPA8+LUjzvXsXgnu9623fjE+u7uukdAZuUVVOuIdXcvAU
	 Zb7xLSCB8hdlwOuD/MvHRJK9e/9weEWYSr/vePjWTHVpAFl+ZZu6IfaJ6OfkDVw3Pb
	 +PY9qMvvQnD4Ayiuir1jjwPwRqd3cyNcOpVgR0+3b9hNJNToqdjg8Zi5yRgpI94/6U
	 +y05i577oifpw3DvWrVggvebPgYCsnz7fKxyAyNZwn999VDUngzqhyYAkqefYf8Zn5
	 SZ9NGNAmVMU7A==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79827d28fc4so17984867b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 01:20:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8bpmYcJ/oDfwqWJoFqRqJlebuBkrCBKWAYXsl6x+1QnGlL+CuFV3CB93TEpmsAX9BP0NzcdO2FP7V@vger.kernel.org
X-Gm-Message-State: AOJu0YwlMRDhtZzLekAheXElHAC2mZbo+jgdQwhMrX0H8OgtcIWhFQnZ
	NpHLqRPbLoXOtXXY/iJIFo9J1gIp6X8A9vgfojq6gqJS12wdfPwbOvESnOUgY8C+j0HZ6RJDaL3
	VslJIRywnyM5JJgPxSf5kDDUSNKbg6TY=
X-Received: by 2002:a05:690c:62c4:b0:796:3917:7291 with SMTP id
 00721157ae682-7988560f22dmr18735227b3.58.1772184025950; Fri, 27 Feb 2026
 01:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com> <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
In-Reply-To: <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 10:20:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
X-Gm-Features: AaiRm508vRiGuZWaxCw9uIk2jsJypknsSz-JUmqErGl52ejGnezFiN87PTsKfa8
Message-ID: <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-32269-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C6C51B5351
X-Rspamd-Action: no action

Hi Frank,

thanks for your patch!

On Thu, Feb 26, 2026 at 12:55=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:

> Many boards use on-board mux chips (often controlled by GPIOs from an I2C
> expander) to switch shared signals between peripherals.
>
> Add a generic pinctrl driver built on top of the mux framework to
> centralize mux handling and avoid probe ordering issues. Keep board-level
> routing out of individual drivers and supports boot-time only mux
> selection.
>
> Ensure correct probe ordering, especially when the GPIO expander is probe=
d
> later.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
(...)

> +static int
> +mux_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                         struct device_node *np_config,
> +                         struct pinctrl_map **map, unsigned int *num_map=
s)
> +{
> +       struct mux_pinctrl *mpctl =3D pinctrl_dev_get_drvdata(pctldev);
> +       struct mux_pin_function *function;
> +       struct device *dev =3D mpctl->dev;
> +       const char **pgnames;
> +       int selector;
> +       int group;
> +       int ret;
> +
> +       *map =3D devm_kcalloc(dev, 1, sizeof(**map), GFP_KERNEL);
> +       if (!*map)
> +               return -ENOMEM;
> +
> +       *num_maps =3D 0;
> +
> +       function =3D devm_kzalloc(dev, sizeof(*function), GFP_KERNEL);
> +       if (!function) {
> +               ret =3D -ENOMEM;
> +               goto err_func;
> +       }
> +
> +       pgnames =3D devm_kzalloc(dev, sizeof(*pgnames), GFP_KERNEL);
> +       if (!pgnames) {
> +               ret =3D -ENOMEM;
> +               goto err_pgnames;
> +       }
> +
> +       pgnames[0] =3D np_config->name;
> +
> +       guard(mutex)(&mpctl->lock);
> +
> +       selector =3D pinmux_generic_add_function(mpctl->pctl, np_config->=
name,
> +                                              pgnames, 1, function);
> +       if (selector < 0) {
> +               ret =3D selector;
> +               goto err_add_func;
> +       }
> +
> +       group =3D pinctrl_generic_add_group(mpctl->pctl, np_config->name,=
 NULL, 0, mpctl);
> +       if (group < 0) {
> +               ret =3D group;
> +               goto err_add_group;
> +       }
> +
> +       function->mux_state =3D devm_mux_state_get_from_np(pctldev->dev, =
NULL, np_config);
> +       if (IS_ERR(function->mux_state)) {
> +               ret =3D PTR_ERR(function->mux_state);
> +               goto err_mux_state_get;
> +       }
> +
> +       (*map)->type =3D PIN_MAP_TYPE_MUX_GROUP;
> +       (*map)->data.mux.group =3D np_config->name;
> +       (*map)->data.mux.function =3D np_config->name;
> +
> +       *num_maps =3D 1;
> +
> +       return 0;
> +
> +err_mux_state_get:
> +       pinctrl_generic_remove_group(mpctl->pctl, group);
> +err_add_group:
> +       pinmux_generic_remove_function(mpctl->pctl, selector);
> +err_add_func:
> +       devm_kfree(dev, pgnames);
> +err_pgnames:
> +       devm_kfree(dev, function);
> +err_func:
> +       devm_kfree(dev, *map);
> +
> +       return ret;
> +}

This is so close to the pinctrl-internal helpers that you better work with
those instead.

Can't you just use pinctrl_generic_pins_function_dt_node_to_map()?
It was added in the last merge window in
commit 43722575e5cdcc6c457bfe81fae9c3ad343ea031
"pinctrl: add generic functions + pins mapper"

There are problems with the above, for example this is only called
on the probe() path so you would not need any devm_*free calls,
as you can see in the generic helpers.

I think you need to look into using or extending the existing helpers for t=
his,

> +static void
> +mux_pinmux_dt_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *=
map,
> +                      unsigned int num_maps)
> +{
> +       struct mux_pinctrl *mpctl =3D pinctrl_dev_get_drvdata(pctldev);
> +
> +       devm_kfree(mpctl->dev, map);
> +}

Just use pinctrl_utils_free_map().

> +static void mux_pinmux_release_mux(struct pinctrl_dev *pctldev,
> +                                  unsigned int func_selector,
> +                                  unsigned int group_selector)
> +{
> +       struct mux_pinctrl *mpctl =3D pinctrl_dev_get_drvdata(pctldev);
> +       const struct function_desc *function;
> +       struct mux_pin_function *func;
> +
> +       guard(mutex)(&mpctl->lock);
> +
> +       function =3D pinmux_generic_get_function(pctldev, func_selector);
> +       func =3D function->data;
> +
> +       mux_state_deselect(func->mux_state);
> +
> +       mpctl->cur_select =3D -1;
> +}

As mentioned I have my doubts about this, explain why this hardware
is so different that this is needed.

Other than that I like the concept!

Yours,
Linus Walleij

