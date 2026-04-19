Return-Path: <linux-gpio+bounces-35238-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nO7lL0NI5WnvgQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35238-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 23:25:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 173744258DD
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 23:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A70A63019809
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 21:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AA72F39C2;
	Sun, 19 Apr 2026 21:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdSRI7Oe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7636B26E706
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 21:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776633918; cv=none; b=ieqq3iqOyL1IMoHhd8A7ykI2e1tw0RNUfiw+inceBCFwVQa1eWTNo4hq0Os6RCmS+zvHfPyoEoDjAu0SMSPpG9k4J5XI6vdxU6B4esWHFwVO8MExzqJWW9rp/9im3GrvZj8PEPgxq/gIebbgJ3Ui5eBXY5j6Ap6h/+Y0/XPZpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776633918; c=relaxed/simple;
	bh=VPpvhZnHqPvZTTZSZHq8wzi2fJSBw8ozWgwB8TOn5OM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wsn4V2QAJK6p/Ujdue+Mc/IBRQI5d/3Qc4cHNp+xbkVROCabHwTNXw3aZLciQg36iiPRhS1T39q8tZellZigjQc7CqCRHwLXxwv7asy7E3zCImV5YDgx1xKVy7FaJRaYkgCVo91YWTeZEJYreASpuYOfxO+bCrV+MLEzH/m17tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdSRI7Oe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D8AC2BCB4
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776633918;
	bh=VPpvhZnHqPvZTTZSZHq8wzi2fJSBw8ozWgwB8TOn5OM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OdSRI7Oe618HTNH8NyqZtcPnjws0bE+m/Y64W+7TLgbCMU+mF8IrK6RSl9I4JMXsq
	 Wrqmot9z2fahVxINLzh1FM6nuf+cRrKSJhgcIh9+BNEZKXHTcYRngsgf6TCqAcoHl1
	 xodsa4xGw9ztkJgqFMr33YkRTDOTt988CHDhQbDyX3ehUEkFjeCCJFIb06ns/1ZXLU
	 5Ys/8zB5wLJrab56YnDJed6AcFnI+aq5FYqQmesfKwdgaRytYM+FLvO0YCoDXlCPi6
	 QlCOJ/tg7KSyHpOhU2OhHrhw7QSR1BVZ/L+9sEtpT26kRn/Ef5Y4KHpsND/wbGYx9T
	 8bLssOUly6mdw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so2331757e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 14:25:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9raUhgSSfRDPjydsPMtNfuHrGlTA6wev9voFY3ME9Ax4DihWoWlltS8M4dFRih4W4Pa0/IcC5ZdDOF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyck61HfPzl4yirZNNgQXmd5gsFjLUfjaW138DVRwa1lAkcQyIw
	9HCJPTY2Z6SP6AMbcxoC70YTQyJSlJCbZQqUj0IAvsp/n989EppSfRJ4d4/xNQyPlxs+2o3/oYy
	SaAMKCRkl5/1PgGXBcpgOs3IMibsC0+8=
X-Received: by 2002:a05:6512:2396:b0:5a1:15bd:b057 with SMTP id
 2adb3069b0e04-5a417183cf5mr2919080e87.0.1776633916921; Sun, 19 Apr 2026
 14:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
 <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
 <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com> <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev>
In-Reply-To: <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 23:25:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
X-Gm-Features: AQROBzD6GJfiRfmGUvsT5MRDRhLkl5NtG5OqsqcwlWbZ18Vb-NT9p92nuBlzqpo
Message-ID: <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Frank Wunderlich <frank.wunderlich@linux.dev>
Cc: Frank Wunderlich <frank-w@public-files.de>, bartosz.golaszewski@oss.qualcomm.com, 
	linux@fw-web.de, sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, brgl@kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35238-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[public-files.de,oss.qualcomm.com,fw-web.de,kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,public-files.de:email,collabora.com:email]
X-Rspamd-Queue-Id: 173744258DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 6:59=E2=80=AFPM Frank Wunderlich
<frank.wunderlich@linux.dev> wrote:
> Am 13. April 2026 um 10:01 schrieb "Linus Walleij" <linusw@kernel.org mai=
lto:linusw@kernel.org?to=3D%22Linus%20Walleij%22%20%3Clinusw%40kernel.org%3=
E >:
> >
> > On Fri, Apr 10, 2026 at 11:24 AM Frank Wunderlich
> > <frank-w@public-files.de> wrote:
> >
> > >
> > > Gesendet: Freitag, 10. April 2026 um 09:09
> > >  Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > >  An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@ker=
nel.org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthias=
.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@co=
llabora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> > >  CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, =
linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bartos=
z Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > >  Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_=
direction()
> > >
> > >  If the gpio_chip::get_direction() callback is not implemented by the=
 GPIO
> > >  controller driver, GPIOLIB emits a warning.
> > >
> > >  Implement get_direction() for the GPIO part of pinctrl-moore.
> > >
> > >  Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> > >  Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chi=
p::get_direction()")
> > >  Reported-by: Frank Wunderlich <linux@fw-web.de>
> > >
> > >  please use the email i used for SoB in my linked patch (closes link =
below), the other email i use only for sending patches due to mail provider=
 limitation.
> > >
> > I can't fix this up because the closes link isn't working right now.
> > Is it the same
> > as the one this mail came from frank-w@public-files.de?
>
> yes, closes-link works for me

Fixed up and applied. Will be going in as fix for v7.1.

Yours,
Linus Walleij

