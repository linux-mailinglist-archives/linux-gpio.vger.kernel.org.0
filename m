Return-Path: <linux-gpio+bounces-32383-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFxOI51jpWmJ/QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32383-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:17:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CFA1D6432
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23F78301A502
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 10:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F3E395DB7;
	Mon,  2 Mar 2026 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utn49JxZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAB233A70A
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446272; cv=none; b=QsCTzX9e+v1GkjDnIN+GEq9hugeViA074UzF2ZfzmOL/uVEXjQW9YyZH8CoRQeNFFmbKA8n9/J1jWbyuQf+ua7PL9k+v6MHuQ5Bswd9yC7YNe7U+M+T8aeIu8rxMUaBifKmUi55by9U++f5Wi6xh8Gr4vrYyRnl3btAsHW9KoVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446272; c=relaxed/simple;
	bh=5rGx+CQxlmdX0QBjsQC9nBGMb/T8RhLBrNveef/NwRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gp9zsXJs3MHMdcl8zYnaIGJ3t3iTH8GgQ3ssoQpkavgi+kmD4ImIELuuToScVF1XIXVQpM1U3gxJfACd4p1XiV8/vPmsoW5gvlB7uxCycTu3CXc7OJLSRlzrNNVIUfLK7k6vB36VrOz318Gsy+JlI0JALUIENI1oACfTMgAP2JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utn49JxZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1882AC2BCB2
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772446272;
	bh=5rGx+CQxlmdX0QBjsQC9nBGMb/T8RhLBrNveef/NwRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=utn49JxZm3uPD9TuLu1lY4whf2lgHQXpnN/5s4NwISLN4GnfGxTf40s5qVGHwpwzI
	 EY1B1NPNrE1Szflo+Byk18yuFnfP9oHdoCxCbYqqx1vPu2Ite0EQlWI+gOJxuX3xhT
	 l7orLlXC0GliBqKt7oLpsds9ACl6bDWw61yf1wmhBhn1eGKufZUYLanHsDbqJd+Nfw
	 iYSMUULBuHCoqK0uW3yKl/wR7SngDqu+yEmySUQDgH+1c6PtwGV0E3olM20CBfmTL2
	 FmENHzE1SCmgtFhNZQHlz02nZDCK55s0nPpCKw0YE3MUJ4hfAJL5lEwkuhLCDDVEUd
	 BZRMryGbnqBxg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79800183233so55875647b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 02:11:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX85JcWqLc8oFC4keV1yD8HbbMJyMyNAgHJiAAPEJQaJomOjflnWtLuy47DahdFMfCdYQKrYG0XOiON@vger.kernel.org
X-Gm-Message-State: AOJu0YxiLiovx1E32M3Xh9YdUyykRjtpRnVHnFoOILGghbi/m7og201K
	mRLU7GcRtwKhcncyBS5ynJBvJmUDmYWJRmzOgLrUQFB6YdVZ/JhGGAWkdUD+CoN0V5Hdk71+PCR
	jvo7YlWxmP5I4bWqWz8qBx7yqaa7Fgis=
X-Received: by 2002:a05:690c:3686:b0:797:d46b:e86e with SMTP id
 00721157ae682-79874be88demr139170977b3.14.1772446271443; Mon, 02 Mar 2026
 02:11:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-4-1436a25fa454@nxp.com> <CAD++jLkT83xz+PSzZZv_Mv+Mqx_+W30d_xk68EDG-sdmFF3x3A@mail.gmail.com>
 <aaG2xQDnMVGGAOJE@lizhi-Precision-Tower-5810>
In-Reply-To: <aaG2xQDnMVGGAOJE@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 11:11:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLm=6pTh7N5UAXFaaYWCs5DhfQdb+8TnM5XLcYC886=kLw@mail.gmail.com>
X-Gm-Features: AaiRm52VNn0UFirxG2TzpKTirdRC2cHuoSLXvPJ-P8L7Wd2YNQMbqv19Df0g77c
Message-ID: <CAD++jLm=6pTh7N5UAXFaaYWCs5DhfQdb+8TnM5XLcYC886=kLw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: add generic board-level pinctrl driver
 using mux framework
To: Frank Li <Frank.li@nxp.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32383-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 06CFA1D6432
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 4:23=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
> On Fri, Feb 27, 2026 at 10:20:14AM +0100, Linus Walleij wrote:
> > On Thu, Feb 26, 2026 at 12:55=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wr=
ote:

> > > +static void mux_pinmux_release_mux(struct pinctrl_dev *pctldev,
> > > +                                  unsigned int func_selector,
> > > +                                  unsigned int group_selector)
> > > +{
> > > +       struct mux_pinctrl *mpctl =3D pinctrl_dev_get_drvdata(pctldev=
);
> > > +       const struct function_desc *function;
> > > +       struct mux_pin_function *func;
> > > +
> > > +       guard(mutex)(&mpctl->lock);
> > > +
> > > +       function =3D pinmux_generic_get_function(pctldev, func_select=
or);
> > > +       func =3D function->data;
> > > +
> > > +       mux_state_deselect(func->mux_state);
> > > +
> > > +       mpctl->cur_select =3D -1;
> > > +}
> >
> > As mentioned I have my doubts about this, explain why this hardware
> > is so different that this is needed.
>
> As board mux (uart and flexcan) exist, for example, only one of UART and
> FlexCAN work.
>
> when modprobe uart.ko,  mux_state_select called.
>
> So flexcan driver can't get such mux as expected.
>
> when remmod uart.ko, we need release mux_state, so flexcan driver can
> get such resource.
>
> Genernally, DT may only enouble one of UART or flexcan.
>
> but insmod uart.ko
>     rmmod uart.ko
>
>     insmod uart.ko (here also need release previous's state at prevous rm=
mod).

Can't you just enter the state "init"? This can be used
explicitly on the uart .remove() path using pinctrl_pm_select_init_state().

Sure the device core does not do it automatically but this is a
special case.

If you want a generic solution without having to change any drivers,
Add pinctrl_unbind_pins() to drivers/base/pinctrl.c and call on the
generic .remove path for all drivers to put the device into "init"
state during rmmod.

This gives us better control of the actual hardware states I think?

Yours,
Linus Walleij

