Return-Path: <linux-gpio+bounces-33827-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE/8KFwIvGkArgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33827-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:29:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 441412CCD4A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D83BF302FB23
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D0F362127;
	Thu, 19 Mar 2026 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="AR2NNjLl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E9F35E951;
	Thu, 19 Mar 2026 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930400; cv=none; b=kC/6fdF4+0P5C0jN2erWJbjtus8TMMm6Yfh47uXkopakbIrupsDt1KmM+JrLqii7PQ7zisVCmGUCXldfoLoTCpT3gkhuKcmqFcfBDC1nIcz96WtQmY1wtdMu4fwfYqFPNR3Wow1c6Otqs6gTtLF698PJHWnxZberkp7JNBFlBM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930400; c=relaxed/simple;
	bh=+RCbB2xihvcCntNqKIZ6v/6IIcL28iOEgj6iHAPZv58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JV/KKpLF7X9Dfkjpz1/vB11RMGVpdtdx+rkpVZ7bul5h8zgF7WYgILCksX3afWh3hn5Z6WVOAN1eRKiwPDUZIMRjfbcUPC1OyZCZHtVhFSms9Yd1EQ81UEgCtDnkL9snlA2bqEhQf9bWSPXVKYbMUW2liHs3x0Lpem7HbhRy9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=AR2NNjLl; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k6ZSSOI4yJhl+4f0AE9nL59GXw0oE7fpDku5quh/0/w=; b=AR2NNjLlxGSAC+wMCQn7l/NZRX
	jRA0p8Ncb/v1mkoW7rOY/I0kUYncbtWBbM3Ky7kXXHBt0SCsnbI0m1VsZ+ldINQryziZcmyhvypTU
	9Mjdpd3zb8JwipnN9wJg5sMV//ILZPU14JQLXR23cg38WTl6xwzuilVhdDtcNiHVIBf840NVF0yE1
	BG4XhM3oWt4+uc+z1F9z05QRHi3h9AJgGNC3XCp5evSEXoMVt0mfRnRw2VZqB0iw1yXQNncYLy+KD
	8dttjSX4MywxPY7A4qUu65NmsLmNC1bsViycoCEl0b5/EPhoINfjGkBFZQZqlLTmK5p8SsUyDUOui
	0OYPUUWg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3EKZ-0000000Cy3l-1Cux;
	Thu, 19 Mar 2026 15:26:35 +0100
Date: Thu, 19 Mar 2026 15:26:01 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
Message-ID: <dkbfvbfislhlh6ft4gctqt5c5tcquof657ons2qkvnclm3eppf@m5krax66ov2n>
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
 <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
 <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33827-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	NEURAL_SPAM(0.00)[0.670];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mmpsystems.pl:email]
X-Rspamd-Queue-Id: 441412CCD4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 10:06:55PM +0800, Chen-Yu Tsai wrote:
> On Thu, Mar 19, 2026 at 9:46 PM Linus Walleij <linusw@kernel.org> wrote:
> >
> > On Sat, Mar 14, 2026 at 9:10 AM Michal Piekos
> > <michal.piekos@mmpsystems.pl> wrote:
> >
> > > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> > >
> > > The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> > > is in unitialized state.
> > >
> > > Solution is to set pinmux to GPIO INPUT in
> > > sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> > > earlier.
> > >
> > > Tested on Orange Pi Zero 3.
> > >
> > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > Should this have a Fixes: tag and should it be applied as an urgent fix?
> 
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
> 
> > Tag for stable?
> 
> The original patch wasn't tagged for stable. And it doesn't seem like it
> was auto picked.
> 
> > Also: is there consensus with Andre that this is the way to proceed?
> 
> As Andre mentioned, the mux value for "disabled" is different between
> generations. So we likely need to make the value part of
> |struct sunxi_pinctrl_desc|.
> 
> Michal, can you respin a version so that we can get this fixed in the
> same release?
> 

Yes but I am quite new to this so it might take me few hours to
understand the proposed solution and implement it.

> 
> ChenYu

