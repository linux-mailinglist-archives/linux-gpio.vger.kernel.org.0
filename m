Return-Path: <linux-gpio+bounces-31826-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cArZM0hHlmmCdQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31826-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:12:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B7515AD4E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF1863007AF9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 23:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E2B33A9EA;
	Wed, 18 Feb 2026 23:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="sJiyRWvW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E8338591;
	Wed, 18 Feb 2026 23:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771456322; cv=none; b=fw7LE8MJ2q37keziU9UHFN+U8Gjsx+40NAeNaz++xOkyizoiDWvt2c2pkh4pS+FgTHvyUlAZJigKMEZaGFMXMBnRvYr3cawBObcn+5BwSFsPVfpsrLpB9H6qSpLyuiCrFs1bwH3Dm7ZzUlUb7tCV1QBlEvu8xLmgIH5yBFeiRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771456322; c=relaxed/simple;
	bh=l2mmhtwx4AGKOlNOY2RMIeEbNsMULM2tIdh7Io2lzAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnaWOinkW/fBJk3sNJdE6toIq3hLiY4hsGJHfLtHHUnZaSZK5/ptOTIxBlKOB5vJdp0t4upWCtxyqN4kRHMwEXax1AOgbG3a7a30gD+/HOvLxypJbgP2tEUrE7sz+1nm/laT5ARNKvrPFLdl5TtTW0z0a4DOse3v070LnYoG9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=sJiyRWvW; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h+hFf+woNMcuS5UpAbpJxrCSOyAlVkeAmCJ8RBioNh0=; b=sJiyRWvWWIpf9TuaKwBMz5RHqI
	GMBUpTvgzaOoT+8VHHplAocVTQrAdNNX9cA2BoDDjtgQcfWSftxizve7zVDaROyecwAIm+gpM7APD
	dGXqlurT3UGhLUM2VpSEKarJWz4CL8orrT7ciOooBGfX8753fPO1M3WIgsWIm1sNdkwE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vsqi0-007pqC-NA; Thu, 19 Feb 2026 00:11:52 +0100
Date: Thu, 19 Feb 2026 00:11:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] net: phy: qcom: qca807x: normalize return value of
 gpio_get
Message-ID: <d4044009-1a17-4533-9449-68954ac55976@lunn.ch>
References: <aZYnWZqfzKwzzF4f@google.com>
 <ba73d17a-1d7c-4e66-af6b-d8e5a37358f2@lunn.ch>
 <893C889D-3440-4DCC-904F-CA4228C48C50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893C889D-3440-4DCC-904F-CA4228C48C50@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31826-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mentor.com:email,lunn.ch:mid,lunn.ch:dkim,lunn.ch:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 18B7515AD4E
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 03:01:22PM -0800, Dmitry Torokhov wrote:
> On February 18, 2026 2:55:32 PM PST, Andrew Lunn <andrew@lunn.ch> wrote:
> >On Wed, Feb 18, 2026 at 12:57:17PM -0800, Dmitry Torokhov wrote:
> >> The GPIO get callback is expected to return 0 or 1 (or a negative error
> >> code). Ensure that the value returned by qca807x_gpio_get() is
> >> normalized to the [0, 1] range.
> >> 
> >> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >
> >This appears to be a fix. Please add a Fixes: tag.
> >
> >Also, please put net into the Subject.
> >
> >https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
> 
> Will do, however I am not sure what should be tagged as "Fixes" - original driver commit or the change in gpiolib tightening the checks? 

commit 60befd2ea1c2061775838ea7bac5cc2b1353afd0
Author: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Date:   Tue Dec 22 16:37:28 2015 +0200

suggests the check is to do with bugs when you have 32 GPIOs, and so
the top bit for the 31st GPIO turns the value negative and results in
an error code. However, this driver only has 2 GPIOs, so it is not an
issue.

So i would go for when the gpiolib tightened up the checks.

   Andrew

