Return-Path: <linux-gpio+bounces-32746-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ3CNsJCrWkM0QEAu9opvQ
	(envelope-from <linux-gpio+bounces-32746-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 10:34:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 745F422F364
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 10:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 802FD3008327
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 09:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD81258CD7;
	Sun,  8 Mar 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="JShlkZ3W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF51CAA78;
	Sun,  8 Mar 2026 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772962493; cv=none; b=aDiwCWUoXdC4vJULW0cTJFm+Sf3TFLTSvU7ODUfK1LP/tZU2LbQSR/LupUIDwe2Tm53Db+mKIi+QXvhVi8S8xDF1WvF2TmZNh+zi2orobKfBVQUSMbnrLldwfawhWHyvHiVsXpBKv0F/YK8oTdfXirVQbtoSnKfavr8dH+L9Mto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772962493; c=relaxed/simple;
	bh=ZW58FDu6WMyiiKB9MmDSvyoF4Bb+UyyeH7xQ1ja50Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWIrWsVCDcZ6q+BUaDM8nN8ty7XS5zsDw4PuSKlHVKlGrfv1rTBr3Wy1n1F+tiDlzR3sv5GgCtFvTGfFQjwLjw3AkPAzukD8t3hblM35xZO5qKmtfsDYbREmCC5dQDZGiIao0SK/asG00J4S8+MGSXjgXS8rDrVmFmDZ9SAPNzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=JShlkZ3W; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nWY0RhWYxBeweq9ZFjqm2zYDGXfcdNn569zDXOr+GZM=; b=JShlkZ3WLUaKolnrYBZ4rCSwHa
	qgdPYjX3PkQ+TczOyLuXO0qDXUn4IjSuTWUsZsR+Y5/6gxXA3d0O/1X8NXT2vEYuQwJtlsxo6/z/b
	LtFZ77iQ0nwln898csXoan08KaHGYmQeNYPBEaLp0lR6v4uYWNhVc5X1T3eX2ek0ut4UrYp5eGd8v
	YRWzUnvvBH/kpyG8zCdQsiUNfcklDivFx55E2Prj2h7GomJXpcBdHujV0FCdWpe1o0v7uMmrnX6AH
	uuCE96AcfgevpLWcFJkh6dq+ChRA4iFh+wnRDh6k/c8RK9Jt0kSCcNWJJ2noARZSVZT4a1QPTx5l0
	ojkT5hOQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vzAXA-0000000DFw8-3cn8;
	Sun, 08 Mar 2026 10:34:49 +0100
Date: Sun, 8 Mar 2026 10:34:38 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
Message-ID: <3x55nsighrqdo7al2n5imlov5yoti6z7jxrj7yieeghyqkllvb@akbuob4n37pq>
References: <20260224092419.1275016-1-wens@kernel.org>
 <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Rspamd-Queue-Id: 745F422F364
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32746-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	NEURAL_HAM(-0.00)[-0.173];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,sholland.org,gmail.com,wens.tw,vger.kernel.org,lists.infradead.org,lists.linux.dev,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:52:23AM +0100, Linus Walleij wrote:
> On Tue, Feb 24, 2026 at 10:24 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> 
> > After commit 471e998c0e31 ("gpiolib: remove redundant callback check"),
> > a warning will be printed if the gpio driver does not implement this
> > callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> > sanitize the return value of gpio_chip::get_direction()"), but was
> > masked by the "redundant" check.
> >
> > The warning can be triggered by any action that calls the callback,
> > such as dumping the GPIO state from /sys/kernel/debug/gpio.
> >
> > Implement it for the sunxi driver. This is simply a matter of reading
> > out the mux value from the registers, then checking if it is one of
> > the GPIO functions and which direction it is.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Pulled out v1 of my tree and put in this one instead!
>

Please do not merge the correction yet. As I was pointed out by Jernej
Skrabec the solution is faulty and just cover the issue. I will provide
proper solution as soon as I find it.

Michal Piekos

> Yours,
> Linus Walleij
> 

