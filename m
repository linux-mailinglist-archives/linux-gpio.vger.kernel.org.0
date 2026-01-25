Return-Path: <linux-gpio+bounces-31040-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOcPDUkadmnXLgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31040-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 14:27:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8474080B8B
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 14:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D11B3014947
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Jan 2026 13:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EAB31BC84;
	Sun, 25 Jan 2026 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="GiRoqnVc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8460C31A545;
	Sun, 25 Jan 2026 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347422; cv=none; b=OwWvvLtk5SDpouVXOZEwJ3FnKDzA9k0Idnsh/NNholkw/wP5WUd8hu6CxAtIOk0J8qfTKAqsYTAaFXjQ4x6DAf0oQ835Yve7wwzJb9h1m+gPc9QWcKAg+Uqgnnr7xK8loEtlI8I/OCJFXkrvOzbucQAknUAA02cy2O5ADMVJ87E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347422; c=relaxed/simple;
	bh=TBRhY9AF5qu6OZu3tvbqRi82R9C7eHmixGvNmoBOnZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fiRW//I05ZVvqJO7kYecjsVfbEx0Pv6/sDUK/FaI/2vWuMqoVy1i9WFSHBOaI7ab2IcHF8f0CZ6JhSF9oJjXuQeRKhidAUxhiSDbnSyzSqXdW6VbgQhkYijqJxSjMDL80g329sDJFOLwcQiUF7B7hE9gHYIODwL4+wfN6Md8wrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=GiRoqnVc; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=P8vete4FbKroUDiRsh85INSljLEWw5LQXDMx6H8GOzY=; b=GiRoqnVctapf8D73oIl+VcQoSK
	6CiTaCejwRnjct4AodOKsGYEZJdeNllg4S7XvXd65TIIJukiJBfwvb0INXLJOKoxVUIQOwA7iix8s
	bwiNySsDdPrQ5BW21njQnYa/jipQU1tpjTbqTB1lZRpePn7BVkQNNAf10olIK/KrbFCewYl+ga94o
	G8opkJnPo7K44QbZpMCJvHpO1W3QYrlcdsRScz0ZPvG4AAsKzCpaWT4OVaCLu2vUEQfoVvWWAxmIL
	UZKikeeEm5oxRzVE3fMcArnFqYN69ZeTdqq+fA+BEOx45JOlzH93BwlVMrXbsGEziERIkPZAImjrf
	RI80mr8g==;
Received: from i53875a33.versanet.de ([83.135.90.51] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vk05L-004Jy1-0F; Sun, 25 Jan 2026 14:23:23 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Robin Murphy <robin.murphy@arm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
Date: Sun, 25 Jan 2026 14:23:20 +0100
Message-ID: <3204984.tdWV9SEqCh@diego>
In-Reply-To:
 <CAMRc=MfUawHpDgxj=fP2OF_-qg1O+P3oM_cSvGsbvAdLRB=+hw@mail.gmail.com>
References:
 <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <cb13c3df-be09-4cf3-b679-4431862d7264@arm.com>
 <CAMRc=MfUawHpDgxj=fP2OF_-qg1O+P3oM_cSvGsbvAdLRB=+hw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,none];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31040-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sntech.de:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sntech.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8474080B8B
X-Rspamd-Action: no action

Am Samstag, 24. Januar 2026, 22:07:12 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Bartosz Golaszewski:
> On Sat, 24 Jan 2026 00:45:25 +0100, Robin Murphy <robin.murphy@arm.com> s=
aid:
> > On 2026-01-23 9:52 pm, Heiko St=C3=BCbner wrote:

[ snip to get to the core question at the bottom ]

> > diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinct=
rl-rockchip.c
> > index e44ef262beec..2fc67aeafdb3 100644
> > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > +++ b/drivers/pinctrl/pinctrl-rockchip.c
> > @@ -3545,10 +3545,9 @@ static int rockchip_pmx_set(struct pinctrl_dev *=
pctldev, unsigned selector,
> >   	return 0;
> >   }
> >
> > -static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
> > -					   struct pinctrl_gpio_range *range,
> > -					   unsigned offset,
> > -					   bool input)
> > +static int rockchip_pmx_gpio_request_enable(struct pinctrl_dev *pctlde=
v,
> > +					    struct pinctrl_gpio_range *range,
> > +					    unsigned int offset)
> >   {
> >   	struct rockchip_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
> >   	struct rockchip_pin_bank *bank;
> > @@ -3562,7 +3561,7 @@ static const struct pinmux_ops rockchip_pmx_ops =
=3D {
> >   	.get_function_name	=3D rockchip_pmx_get_func_name,
> >   	.get_function_groups	=3D rockchip_pmx_get_groups,
> >   	.set_mux		=3D rockchip_pmx_set,
> > -	.gpio_set_direction	=3D rockchip_pmx_gpio_set_direction,
> > +	.gpio_request_enable	=3D rockchip_pmx_gpio_request_enable,
> >   };
> >
> >   /*
> >
>=20
> I'm not sure what's going on here. You don't really need to call
> pinctrl_gpio_direction_input/output()?

No we actually don't.

The current _set_direction function:

static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
					   struct pinctrl_gpio_range *range,
					   unsigned offset,
					   bool input)
{
	struct rockchip_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
	struct rockchip_pin_bank *bank;

	bank =3D pin_to_bank(info, offset);
	return rockchip_set_mux(bank, offset - bank->pin_base, RK_FUNC_GPIO);
}

really only ever touches the pinmux and has nothing to do with setting
the direction, which is solely the task of the gpio-controller/-driver.

So moving that to the request callback would likely solve all our current
problems?

Heiko



