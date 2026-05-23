Return-Path: <linux-gpio+bounces-37398-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHqUHVVtEWpLlwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37398-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:03:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E025A5BE16D
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84BC43019470
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 09:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9847382F3C;
	Sat, 23 May 2026 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pv+bdJyb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B7382F26
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526992; cv=none; b=NK47Vf1BPhil7SAXkGlRpcXDYXAfRprEcdrybDp3uh4OBffhZvblCk0hFUBkpq1tfVVtdoPtkuXTE1qw+EaFyS1cu2hjQoxJwgj9OoXKE06oJ4OO2HnTOS+GWVKuEo/I1+pZIFGLnscx/uzB/hgwEWuoz7ckkM5PsfQIYCGYoBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526992; c=relaxed/simple;
	bh=xfwHzHA2XUsT+8TtCjyDwFEfJ3aVEcB4nEfq8icciTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2G9hL/vf5iyt3enypE2rRwc7F6y918YLtAZ/ThaRQPMMvMKdquFjVgmmbA7ZiCu2oxTYA6/RHkQCmDpIFqzGgW3ZYthqHg07bkCX+JMxBB9dTREU5lP8FgGSnllgMd2RImZQqCHFhCc7AVVX9ifkkYWnFD1o/EbG2m3Xc80tlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pv+bdJyb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3101F00A3F
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779526991;
	bh=xfwHzHA2XUsT+8TtCjyDwFEfJ3aVEcB4nEfq8icciTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Pv+bdJyb2SZbYXqyk/FDdWCjJKz164AAxhBCDv3Ht1A+I2C5JfpTXXYRZ5NCRMqtS
	 GYRzCBM4e4KhUZtkli3dknFjJdnLJYk017aofGIwyyi7N7gLHPUUnuhOSHzeZOyuYi
	 db4GXBIQGlSzm/OMbAKMniy1tIBM3XILWl4+52Ps/gljOOjtOP540WIziC7rtkS+pp
	 IWzkPv4pFCoBO/xVRpTdzcIz4/pEJsc0IzIWH3z8Z9pIS0PcI/QaHqszaXoC17Ya98
	 DdxZehH+xtO/lu+6pie4M26ds7Wi95yCmxUM+38kdg4yMVrYVXUxlmby46YidNtqSz
	 A9k7HJXRkrZrQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so8697534e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 02:03:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+E6xodQ0a7ljm621IPS73xVlEaTFt5ZVnFnU3c9jFq7Kqqie4CZyWoPcMVbYtrvj7gTw6UR0+S9JFY@vger.kernel.org
X-Gm-Message-State: AOJu0YzgGJFcZkN9CJ67Z5VakPD2Hd3r38S3Ixe3wegYsQiI9gOwI1Oy
	KVzq3i3rPn4Daj3OuAr5dEMrq6NpncZOGwgWyDq2ldDfb7/kkOCv8MZnEZX9qbqwSxoLkTy/HdP
	4Ys4+YfMEQRoLSikcEXFSiwehNzoIc2s=
X-Received: by 2002:a05:6512:2303:b0:5a1:b83:c7cf with SMTP id
 2adb3069b0e04-5aa323713f1mr2715311e87.25.1779526989899; Sat, 23 May 2026
 02:03:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
 <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com>
 <agIwOYrKXlnKbpII@lizhi-Precision-Tower-5810> <CAD++jL=eqEaTcG7P=++Md7fqosmrGbRRPDb90+=Q4q8oQ=xqRA@mail.gmail.com>
 <agNFaXbd_sMq5eAo@lizhi-Precision-Tower-5810>
In-Reply-To: <agNFaXbd_sMq5eAo@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:02:56 +0200
X-Gmail-Original-Message-ID: <CAD++jL=q2+ygUxPPAL7xgivFtMDWF+_0hfYYcXSdqLw65rZd0A@mail.gmail.com>
X-Gm-Features: AVHnY4IVbnMCkexpYe7Hj6Yl5u62bH3gkmReeN1Qdk5zM4QytaZR9MQNjK9gv8A
Message-ID: <CAD++jL=q2+ygUxPPAL7xgivFtMDWF+_0hfYYcXSdqLw65rZd0A@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37398-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,microchip.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E025A5BE16D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 12, 2026 at 5:21=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
> On Mon, May 11, 2026 at 10:34:35PM +0200, Linus Walleij wrote:
> > On Mon, May 11, 2026 at 9:38=E2=80=AFPM Frank Li <Frank.li@nxp.com> wro=
te:
> >
> > > I fixed a build warning by missing doc 'np',
> > > https://lore.kernel.org/imx/20260507152117.240612-1-Frank.Li@nxp.com/
> > >
> > > Anything need me to do futher?
> >
> > Sorry was busy!
> >
> > Applied this fixup on top of the branch and merged it into my
> > devel branch for v7.2!
>
> Sorry, I missed picked up fix patch during rebase.
>
> https://lore.kernel.org/imx/20260512144806.22447-1-Frank.Li@nxp.com/T/#u

Ooops I should have seen it.

Applied it now!

Yours,
Linus Walleij

