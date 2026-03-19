Return-Path: <linux-gpio+bounces-33828-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHVxC1sNvGkirwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33828-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:51:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 830102CD2DE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F16C305C2BA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0C63D646B;
	Thu, 19 Mar 2026 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="Jm0/FHE/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4280640DFD2;
	Thu, 19 Mar 2026 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931796; cv=none; b=JIvFGrrvpA+nqFqatnrhrSal8gwL5DW6rsoy4D+LySguSc/NDNaYMIb277B22KKqTU2+hISurifP/WVhyooQi/XlYBFnwws5OV2zearH17YZVLBhzX7jRU83m57hg2O4UeS+rvfPn7CwUqcKIJG2lUAZFBxF03g8YdF2mWWUn1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931796; c=relaxed/simple;
	bh=/2XRbyW3W01C6iukmeHHuMQEU4277Y9VuGbGfRGnB20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4U0mWeKjVCoSTYhrOyeBdzeyHbWnCGZraXZP7G2v9rkGMrxNPqbflyQctEVx7btLsQEhxEpQJBdciH/845grTLRxKqDXgLxb0NNY38uKOdh1imkdURrPlleU2AFE++tXpxe6XD+7oglu+9C+d3kySD5xreWFsmt0wKbAo3eTVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=Jm0/FHE/; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ru2Fyw9/wRTww9l5W2YBJiByY7OAMHrkrliQY5bMwTk=; b=Jm0/FHE/zFlgYXS0GpQ8TukPNC
	/cFa9KtIQd8ejz/Ee4OLlojS5tymeUzPnljiBtojyKM3tqk7cx2B0anJwRWxJ1YK72ZzntK/XgoG5
	qx8WZfdwMaO/ZD+cB8RUtuRE3TJn1kr+bBEQD5et6NKD4xk9JGPNOZC0lhvlNI7R5yiCbQg8+WV7z
	y7lOqSismtweLaAGKi5vhkSMDSmmWtJPnho9yskezdLmjQpkBg3VXsTCwo031pJI7a8HoDGUQXEUN
	kH9nBtvgkUVDHTfXfhT38t4oxjgpKXSvsGVj2PvicBHc+u6pb8K87AdUudhpiFMsgoG5oqo/bOz7P
	eNNSC7Vw==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3Eh4-0000000DaB3-2Xp5;
	Thu, 19 Mar 2026 15:49:50 +0100
Date: Thu, 19 Mar 2026 15:49:48 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Andre Przywara <andre.przywara@arm.com>
Cc: wens@kernel.org, Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
Message-ID: <n3e6sot6hdpdj5fnjbltnjkiqfoa2oicm5t5scqppdftfvbqox@niblalzqvirr>
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
 <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
 <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
 <dd275884-665b-46ca-a72a-c32aa189fc25@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd275884-665b-46ca-a72a-c32aa189fc25@arm.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33828-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	NEURAL_SPAM(0.00)[0.846];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mmpsystems.pl:email]
X-Rspamd-Queue-Id: 830102CD2DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 03:16:33PM +0100, Andre Przywara wrote:
> Hi,
> 
> On 3/19/26 15:06, Chen-Yu Tsai wrote:
> > On Thu, Mar 19, 2026 at 9:46 PM Linus Walleij <linusw@kernel.org> wrote:
> > > 
> > > On Sat, Mar 14, 2026 at 9:10 AM Michal Piekos
> > > <michal.piekos@mmpsystems.pl> wrote:
> > > 
> > > > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> > > > 
> > > > The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> > > > is in unitialized state.
> > > > 
> > > > Solution is to set pinmux to GPIO INPUT in
> > > > sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> > > > earlier.
> > > > 
> > > > Tested on Orange Pi Zero 3.
> > > > 
> > > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > > Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> > > 
> > > Should this have a Fixes: tag and should it be applied as an urgent fix?
> > 
> > Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
> > 
> > > Tag for stable?
> > 
> > The original patch wasn't tagged for stable. And it doesn't seem like it
> > was auto picked.
> > 
> > > Also: is there consensus with Andre that this is the way to proceed?
> > 
> > As Andre mentioned, the mux value for "disabled" is different between
> > generations. So we likely need to make the value part of
> > |struct sunxi_pinctrl_desc|.
> 
> There is already the SUNXI_PINCTRL_NEW_REG_LAYOUT flag, which describes
> exactly that: the new layout increased the bit field to 4 bits, moving the
> HiZ value to 0xf.
> But it's just a flag passed to sunxi_pinctrl_init_with_flags(), not stored
> in desc, and not available during runtime. Which is what I tried to fix for
> my A733 series:
> https://lore.kernel.org/linux-arm-kernel/20250821004232.8134-3-andre.przywara@arm.com/
> 
> So maybe we can cherry-pick just this patch, then check for that flag?

I'll prepare v4 with your suggestion.

> 
> Cheers,
> Andre
> 
> > 
> > Michal, can you respin a version so that we can get this fixed in the
> > same release?
> > 
> > 
> > ChenYu
> > 
> 

