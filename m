Return-Path: <linux-gpio+bounces-31898-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDm/Dvtel2m2xQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31898-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 20:05:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1FE161DA6
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 20:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2389D3021E81
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527BB2DA768;
	Thu, 19 Feb 2026 19:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5zvrvDd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C015A29BDAD
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 19:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771527926; cv=pass; b=JrONhEfUvGAPEFmqgpPZgbEgxisPTpY8IDGEUv2sYLyIGZ9b9ThUk4CmsyKtsxoLARptVZJSiWc92Y7LI+p4RKPAEzBiwmz8pABMHL+WJAH8KZ9dNOIFxJcD9iNVwjXs3JUwabRHxlXMY70BbEz2w6Ah0l9biRySlt0aAyK5UPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771527926; c=relaxed/simple;
	bh=81m1P0GdGdANBBeAFNk/Jpcw9H/E01UVyMrvu0GY/0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hiOr/vxbn06hugDRwp03pGyWwKygiPOt5UtZ4mqDzx4FVbfz7X/AJZgt6JGH7uM37CLAlED/z7n5z4btSvvXKhCzG22+cWe9YUxFw4JtDumlLBy8nHDbYD4y/Nsm0izsd74sZgbx8YpTXcbRQ1/3E81UB968alNcjEBXeM7Xmjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5zvrvDd; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso11218255e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 11:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771527922; cv=none;
        d=google.com; s=arc-20240605;
        b=YHWO6QwZnJNBNutYlHwEBtf2BBdVOJqIF34J9QyXVFsLsOvYTV46OocBPcezmnyD6X
         xJYu9MYT28l9KAyr03sdTzBIPai9j5Xy3H3uxXHbAVJUmDcl4WzJdd3KeF5HfopbRbNq
         VFcQSeKPtx/Dge2ajpZvsKe4SWNt5CRsoLabrHkifIJoU/KH6w5ep0TdL6cvtp4gMgQJ
         LjvXG7/1Qbi7t8yh73jQSUnpzGiX48ejV1TVqvXv/jgRmbqUe8IRMZcorrL9jK3xI1Nx
         vVgxOSYX9V0+GmvhJDbMzdXJSWcLAHOe1LclTbS3wFcPrZKZq2aJAZtgITDV3Lfmb5Mf
         7ZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/T6p5K6ot9ZjuFcR36HvVc1irK+6UWOmwWMYSNdg9U8=;
        fh=+UV36+fDpbrv5FXJcTH3Omd0Pxboqe9eC+EDlsEx4b8=;
        b=hswGRyrmN+aUnMErbXftRUTS0+SRMwohskCGyg07cmDLJfNMLpqJGByVV1DBOeDXL8
         9BbenZ77UbVvNQVreNypjwvn+kXvm1xzE56/GZhnoyuRwtozs7eDkbB3O/NG08fs2h8+
         OQ6rvYsZFKLQuftL43N4RCRgLhE6hlm9rMw7zdy+myoDjThyKn3OjOqqlzNupDtjogI2
         1yReaL/pmKgLOpbOYkJEwkNAKfvMduvF2HCApmuZSvHs547AL1voHIXSg281LHEaXtFE
         cJ291uvdhKKs1oHBGLW/gIgq5edBcKYjhtjdP2jIuQtP/dOPA2UxHsfw4OWYtDh+MyV6
         LOwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771527922; x=1772132722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/T6p5K6ot9ZjuFcR36HvVc1irK+6UWOmwWMYSNdg9U8=;
        b=a5zvrvDd6UPZJMkGCxLugvTkn/USbnaM0vWfktqLPTWyAZpAFOVBXHwPcID2QsJTeT
         FDTJn79EOWZsl6NemVg2/5bv4IM3mui8TxmZTUVTJAMbu7pp0HgihmhCISoOhHIoIJiQ
         6MVbp0MuLYvBMTWjCHIiFjArqiNmuPsSUbQW5/CXz7YvDEXrF2F74RE5U1wYBN0ujFBi
         Z+v04HPAT+/qF3p+kFB1+mve31aX5cTEKehC7zCbbymShEizSbex0McUtW4vXVo6MeaU
         P3v9SL2bpFevMGs0vg7JNLyJHLicGp5sIvzZjxusqGIZsqRAAbubjMrOgRItIpZiIOGx
         Widg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771527922; x=1772132722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/T6p5K6ot9ZjuFcR36HvVc1irK+6UWOmwWMYSNdg9U8=;
        b=oenKv1xYfDOhcBvWrpzf8fcPhUs3q0qnf+1jZH8bZ0xKiO77IOXKc4n+7nd9kHH9vL
         N/2iR6hvxQ8Iq50fWHolIJ8mHxZExzUYXYD/oMaXsiDfWJ99/ehzc7pF0zY1OGz7BgF3
         QRlBDVurZd0PQlUaokSDaNcB9Z+eCnrdSNT0aPlMHmFYfMcetm7XFeYQpoP0mueL9mw6
         +AJ31pnedAnCem3kCMyN+Is3IVboDNETXfe7TMRWMMcABJjV9Tsj/FN3wGFpKQKcCc+3
         OIUBW23JmiZyQzXptaoG8KKrDq4mx30anfGosrwfC+TLg05CEopt1b/ZJfE+iHtrJIhL
         COkA==
X-Forwarded-Encrypted: i=1; AJvYcCUEQS33/hyN1rJzMuhFv8v2cYeZNL5zZ0KROA7qcRZaS+0KGSJf7OsvlOKwavn19Oyc8SrCHnNbgMjE@vger.kernel.org
X-Gm-Message-State: AOJu0YwjmmLibYg35WbpL9nop2QLhncJW6GISSSJaR490PbLLVVQ46Zw
	DbLBsgnkKAPuUPhWke+U8qDU3di0d3jIKmrZ3qzZUO5+Qb0GT5yZVCEqxLUyp2oKoAG5Wgyq7dW
	SbaYOw5O/hjzuzjkJyUAaJKeOOLvdkhRVSXoopFdkVQ==
X-Gm-Gg: AZuq6aKAHlBNzfykf7HAorjQH7/hxQl4k334Z7HKTY7GnxJlWWcQyedqYmNYbKgcSD3
	n8Z6gXr41DuPkdN6mHCR+8sdvP+oHoMIXUshw0T2J0knfFZYEawgoQfeYtKb/9y/gy+00MgQTlG
	YCUbWZTNGIjv+wi56ZZtSDegECFMJbzNTvGmiZJDF+AgR/lAIb64TDhmgBEG4w5tD8GP15e6q0I
	/hZGQIE1gM15dTpXe/CyK4AlSV2jYbu/DU/giASJeyNztDIG+MOmwaPQ0C6I4LnkrURDpcAGYmD
	98A+5DoM+poWCE7/SpAO1U87Kl3FRGvBXw8XeqFOu2MXrERM91MvGBOum2HEwb1hpaz+vaTcOtf
	LAQ==
X-Received: by 2002:a05:600c:871b:b0:483:8e43:6def with SMTP id
 5b1f17b1804b1-48398ae5461mr92319025e9.28.1771527921877; Thu, 19 Feb 2026
 11:05:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Feb 2026 19:04:55 +0000
X-Gm-Features: AaiRm52iOuUsNkdftZ2dd-0NmouiNLVBadcGt_80jzF4MyMYCcuWjg899DEzzW8
Message-ID: <CA+V-a8uU+md7QPtf9KoZs4hMu8Xfo6Rm9X-U8MZJBYPmz8qAXA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, brgl@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31898-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,tuxon.dev:email]
X-Rspamd-Queue-Id: 8F1FE161DA6
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 3:19=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add GPIO set_config to allow setting GPIO specific functionalities.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index 863e779dda02..641ae1adfd4a 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *chip=
, unsigned int offset)
>         rzg2l_gpio_direction_input(chip, offset);
>  }
>
> +static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int of=
fset,
> +                                unsigned long config)
> +{
> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_BIAS_DISABLE:
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +       case PIN_CONFIG_SLEW_RATE:
> +       case PIN_CONFIG_DRIVE_STRENGTH:
> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +       case PIN_CONFIG_POWER_SOURCE:
> +               return pinctrl_gpio_set_config(chip, offset, config);
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +}
> +
>  static const char * const rzg2l_gpio_names[] =3D {
>         "P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
>         "P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",
> @@ -2819,6 +2838,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl=
 *pctrl)
>         chip->direction_output =3D rzg2l_gpio_direction_output;
>         chip->get =3D rzg2l_gpio_get;
>         chip->set =3D rzg2l_gpio_set;
> +       chip->set_config =3D rzg2l_gpio_set_config;
>         chip->label =3D name;
>         chip->parent =3D pctrl->dev;
>         chip->owner =3D THIS_MODULE;
> --
> 2.43.0
>
>

