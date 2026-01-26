Return-Path: <linux-gpio+bounces-31081-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMNoDz17d2n7ggEAu9opvQ
	(envelope-from <linux-gpio+bounces-31081-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:33:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9204F89892
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19A2230727D2
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 14:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A9922B8A6;
	Mon, 26 Jan 2026 14:30:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B51225413
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437811; cv=none; b=ndS6L9yjUaFC1THxuKdUXRXJ95zZmLKBh59mqhQHxUdiYYPW5lTiiMO2NDACTBrqaotZkzbs420f5Vo5MpRNaTDiDKrfqDC1xqzz4Y9W33wyTIPspT0QZsISwHDYwPawNWUNHPKDzQoRW7GX5u93SkrWgkPeMrzTY/Q1BB57bdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437811; c=relaxed/simple;
	bh=S2k5gvAtMwl2KYHwXi9TdrPLNiWEXMdnVmiWNv9JLak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1WZO7+pSC/QwdlY8NaOK1jlIXpxKbNxgHXJ+UGdy3XRJ9vah5N3d3K27MM1tBFTn0qdnOPvh1ZbIZ/Wh4ONHFAJsSb+yRbjuQL5pl6vzsF08sv+3/Ay/jt/3hOtvmDnY1G4YBWAdEZ5NqQHFwXOCYwNq/QJpcYKI88JFAxhwlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vkNbP-0000AK-KA; Mon, 26 Jan 2026 15:30:03 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vkNbQ-002b71-0D;
	Mon, 26 Jan 2026 15:30:03 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vkNbP-00GZSr-0x;
	Mon, 26 Jan 2026 15:30:03 +0100
Date: Mon, 26 Jan 2026 15:30:03 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	kernel@pengutronix.de, Stefan Kerkmann <s.kerkmann@pengutronix.de>
Subject: Re: [PATCH 0/2] gpiolib: introduce devm_fwnode_gpiod_get_optional
Message-ID: <aXd6ayOa4d4mi61h@pengutronix.de>
References: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
 <CAMRc=MebQF3P=Tp+65A6o4TDz2txYH0c832mbTV+250-6JRi=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MebQF3P=Tp+65A6o4TDz2txYH0c832mbTV+250-6JRi=g@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,pengutronix.de];
	TAGGED_FROM(0.00)[bounces-31081-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: 9204F89892
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 14:50:27 +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 23, 2026 at 10:51 AM Michael Tretter
> <m.tretter@pengutronix.de> wrote:
> >
> > There are various helpers to simplify the handling of optional gpios.
> > The devm_fwnode_gpiod_get() lacks the _optional variant, and drivers
> > have to explicitly handle the error for optional gpios.
> >
> > Introduce a devm_fwnode_gpiod_get_optional helper and simplify the
> > BD71815 voltage regulator driver by using this helper.
> >
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > Michael Tretter (1):
> >       regulator: bd71815: switch to devm_fwnode_gpiod_get_optional
> >
> > Stefan Kerkmann (1):
> >       gpiolib: introduce devm_fwnode_gpiod_get_optional() wrapper
> >
> >  drivers/regulator/bd71815-regulator.c | 15 ++++++---------
> >  include/linux/gpio/consumer.h         | 17 +++++++++++++++++
> >  2 files changed, 23 insertions(+), 9 deletions(-)
> > ---
> > base-commit: c072629f05d7bca1148ab17690d7922a31423984
> > change-id: 20260123-gpio-devm_fwnode_gpiod_get_optional-e96227cd393b
> >
> > Best regards,
> > --
> > Michael Tretter <m.tretter@pengutronix.de>
> >
> 
> If you can send a v2 with added kerneldoc, I can queue this up for
> v7.0 and Mark can then queue patch 2 in the next cycle. Unless it's
> urgent, let me know if it is.

The patch isn't urgent. I just sent v2 with added kerneldoc, anyway.

Thanks!

Michael

