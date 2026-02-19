Return-Path: <linux-gpio+bounces-31868-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE5RJ3Yrl2nmvQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31868-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:25:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D81D1601AE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BF613024473
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 15:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BB2343D64;
	Thu, 19 Feb 2026 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="iIEEhClb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460F3033FD;
	Thu, 19 Feb 2026 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514717; cv=none; b=N8BmcjSNzRr09qCgCmQOZCF8EL3E37wHQmReStFs6+PpxG617NoMNKaiWtFlcFe+hA9XY8vmcnOrl/um5p+snNlARnITChSSx/f3kMs4k+/RJfch1JYlIIgGw2TKaG8h1lRO2YoTZ8gHFBhHOGdXqTy2+PN7BXuRulekDoLCIZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514717; c=relaxed/simple;
	bh=gi8Twbxo+Bi4tBD2h8CtYYswZk1dZz9KjAqpID7UBqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbM+g0k9+pPw5x8dGLGrfhEmUODztUx++h7nS+s74HuyiKTczL+xfJgzGuCaVFYvUo9cQaYwli7JNehAIwFi+ch+i95Fa9Tqgii50p5TXyHuTn0Bm5nilvL/EIw/lfn4gBcMBexw7QwmyhyhM3EyR0WJxvOyBLIF5nNoiyKxDwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=iIEEhClb; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Fidi+2ln7umxrDQrxUrSCVpfHVT2QnpMsuI3rE07J/w=; b=iIEEhClbtSqJowi0yjw0/pFAb7
	R/9wjkxlPiTsX1rNPko4Azu4BG4gERyauQmLJFpDyX0BItUmhIbdcMjj+rGH8i350WZ46AOMirRtj
	uF81P4gGItjk4fbR574O15VhXOCkClBoh7HVleQB0O550D3Z5ANdl6ABcHpxdRgqrXTg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vt5to-007vz6-SH; Thu, 19 Feb 2026 16:25:04 +0100
Date: Thu, 19 Feb 2026 16:25:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <5e227857-7e33-43ad-8330-5304fa3616d5@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <44804825-5e61-4c3c-96bf-e5a3f3eacec1@lunn.ch>
 <PAXPR04MB9185EFFB8C73462E215EF486896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185EFFB8C73462E215EF486896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31868-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D81D1601AE
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 02:17:26PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Thursday, February 19, 2026 7:27 AM
> > To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> > Cc: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> > 
> > > > +   if (sync) {
> > > > +           err = wait_for_completion_timeout(&info->cmd_complete,
> > > > +                                             msecs_to_jiffies(RPMSG_TIMEOUT));
> > > > +           if (err == 0) {
> > > > +                   dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> > > > +                   return -ETIMEDOUT;
> > >
> > > strange condition you return an error if err == 0, for redability use 'ret'
> > > variable or simply:
> > >
> > >               if(!wait_for_completion_timeout(&info->cmd_complete,
> > >                                 msecs_to_jiffies(RPMSG_TIMEOUT)) {
> > >                       dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> > >                       return -ETIMEDOUT;
> > >               }
> > 
> > This will be from a comment i made. It appears that
> > do_wait_for_common() can return -ERESTARTSYS. I assume that should be
> > returned to user space?
> > 
> 
> It looks like there might be a bit of confusion around what wait_for_completion_timeout() 
> actually returns. That function never returns -ERESTARTSYS. Instead, its behavior is pretty 
> simple:
> 
> - 0 means the wait timed out
> - A positive value means the completion happened (the value is just the remaining jiffies)
> 
> So the driver returns the timeout error, and the upper application can decide how it wants
> to handle that situation, for example restart or ignore.

wait_for_completion_timeout():
	return wait_for_common(x, timeout, TASK_UNINTERRUPTIBLE);

wait_for_common():
	return __wait_for_common(x, io_schedule_timeout, timeout, state);

__wait_for_common():
	timeout = do_wait_for_common(x, action, timeout, state);
	...
	return timeout;

do_wait_for_common():

		do {
			if (signal_pending_state(state, current)) {
				timeout = -ERESTARTSYS;
				break;
			}
...		
		} while (!x->done && timeout);
...
		if (!x->done)
			return timeout;
...
	return timeout ?: 1;

This last line is interesting, and i had to go look at the
documentation:

https://gcc.gnu.org/onlinedocs/gcc/Conditionals.html

So this is equivalent to

        return timeout ? timeout : 1;

Hence, it does appear wait_for_completion_timeout() can return
-ERESTARTSYS

There is however a comment in include/linux/errno.h

/*
 * These should never be seen by user programs.  To return one of ERESTART*
 * codes, signal_pending() MUST be set.  Note that ptrace can observe these
 * at syscall exit tracing, but they will never be left for the debugged user
 * process to see.
 */
#define ERESTARTSYS	512

So we do seem to be talking about a corner case, allowing gdb(1) to
know about it, but not user space.

	Andrew

