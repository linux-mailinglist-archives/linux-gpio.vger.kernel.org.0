Return-Path: <linux-gpio+bounces-33453-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBrGBZu/t2n5UwEAu9opvQ
	(envelope-from <linux-gpio+bounces-33453-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:30:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E422296291
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9F4630131D4
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3012374725;
	Mon, 16 Mar 2026 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lu8RzEfg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92352374188
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649771; cv=none; b=u7E5fvqjDOEzkz2NLavNKNSBsM/lH6Otbnl5AtCTmrlqIVUzHGD1nnJ/6UfKpxsleuyuNfc2mdyNvPPqt0f9vEj2ncJthWybjn3hsr0AcoPi+QFU/jubEBJ3PVl0SU+dq28W6gbL2QNGCVuNPnFkgyTNI7j5RMWd6ysw4aaGIhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649771; c=relaxed/simple;
	bh=hwzxlHqOQjGJQ+Mize8M6nnnmbTo9unPGCkFg7bS8CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tr6yzR9c6FJ6qU6YO/tYBvOoHFBPvLF39Y5fDt+IjmoHsxZjpoDFa3SLvvT4BjS4G5FSpUrRNMXGW4lZPxLYzmvwGkDdY25WgVWlS3CJdSupxpnEwPpEsXHAJ4+v1gzrJDWrpeg9kyyjmw6aCRf8loVV5ncyjgTYxcIBCT8+WuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lu8RzEfg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A909C2BCAF
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773649771;
	bh=hwzxlHqOQjGJQ+Mize8M6nnnmbTo9unPGCkFg7bS8CQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lu8RzEfgkdIW+kC4uHxiWhzeJyXhwjT8dhDxwAG6nvx/U0bYg5KRVmyT2b8bYkjAs
	 niCJU1YBwLIsyRPVx/Y0ERfbabTB2AXp0+Z78DZLHt9bYOGjdE/RPHL9cTbcCWcQe0
	 9FpDi3rk5O7gDQGsVommTC7YvocZM7yJT6MatoE1cw6utILxwDbP59IcVHQz+FlSNK
	 AHf61EDyzQhCVsFYlGGDYtKae+yolBKUk7Ex44GsNPCGZpZzXBkj+7Q8YEdh4nnEwW
	 KojJWUNhhUgDEUtdkz61aLM2rNmvpF1VuB8LqqWVye7ds92sSb0HP7omho6DWn9LM9
	 Vj7jmbNQm+Qgg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a3990e87fso28231331fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 01:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGMwtXwLoHcieawCDC6Wr8UPBU31Fze5sazSGaJbcDDYq/v7YCMHGjLQRXJ32blQGIEAcOPRmTsRdB@vger.kernel.org
X-Gm-Message-State: AOJu0YwDoMjuxAFezLgRlM8vKGzA9l6P3Jb0muWUrO0bkJxLPHD7Kfsu
	mXTDu+6Ug5UbZvx1FINgBFhg7D1kWZmShFeAeYFe9jU4TQCOh6EBX02LMjYPagNb8ebmnBq79MT
	Y5nLMhKtCFy6Fj1oYfBwC3Ol1wXofscHexizEZt0A/A==
X-Received: by 2002:a2e:be12:0:b0:38a:4dd9:23f7 with SMTP id
 38308e7fff4ca-38a8979b203mr37145211fa.20.1773649769930; Mon, 16 Mar 2026
 01:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de> <abPqGvy5FqJ0a0ug@tom-desktop>
 <abQMQAbbvV60bV2j@pengutronix.de> <7b1e12b2-f55d-4e70-9cb7-ecfa9d82ebdf@bp.renesas.com>
 <CAMRc=Mc4x0SOfoxB9Fv4VUmNjJLjdBnMSmFG=Y1JvLih6cODww@mail.gmail.com> <abUJfy4aqJhwhKcl@pengutronix.de>
In-Reply-To: <abUJfy4aqJhwhKcl@pengutronix.de>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Mar 2026 09:29:18 +0100
X-Gmail-Original-Message-ID: <CAMRc=McPr66uPnipVsZ7mcfpQJTH0-7ne4sn2+tJ7LvXr8-FkA@mail.gmail.com>
X-Gm-Features: AaiRm52StXRrY5yCU4vp3OkaZjcp8gZE9QVzxM0p8xkW2HTlYlB-vYzvYdvUbhI
Message-ID: <CAMRc=McPr66uPnipVsZ7mcfpQJTH0-7ne4sn2+tJ7LvXr8-FkA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, biju.das.jz@bp.renesas.com, 
	tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33453-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,roeck-us.net,kernel.org,axentia.se,pengutronix.de,vger.kernel.org,protonic.nl,gmail.com];
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
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: 9E422296291
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 8:08=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:
>
> On Fri, Mar 13, 2026 at 03:35:34PM +0100, Bartosz Golaszewski wrote:
> > > With this fix all is working fine on my side.
> > > I'm not more seeing the seeing the RCU stall.
> > >
> >
> > Ah, I sent this patch upstream for v7.0. I will tell Linus to not pull
> > it. How do we want to handle it then? Should this patch go together
> > with the rest of the series?
>
> Yes, better let's go the slow way. I can't guarantee it will avoid other
> regressions.
>
> Should I include updated version it the next patch series?
>

Yes, I dropped this from my queue.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

