Return-Path: <linux-gpio+bounces-31699-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FB9OUbNkmnxyAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31699-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 08:54:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DE14163F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 08:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D5C3300138D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 07:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E872D5A19;
	Mon, 16 Feb 2026 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PADWuTug"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B667022D792;
	Mon, 16 Feb 2026 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771228480; cv=none; b=LSgRjQuJdvm8Nr9legorC+NsydPaEhUPIo6RjhljEKoTsBAHUyruXNpggjqQawKSvsxf+e4ZOyXAb8cYhWueg04n414DI+5iL/F/MALkqLFu1Pvh4vIJGmU1/mzczSbYGe5OwIqZrx+Nn1YGZN22dMTT0CIe6Y1gdeFrslx7KiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771228480; c=relaxed/simple;
	bh=XeF+58jMPV7rbzYLcofkZ2ZERolCjjHDECcyxEkot+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1RmjW9HiyuOZlI/fafWBX1q1UzKgNvZAsGuL8NeJIKNzTDq/RXPR1aMr+DzlB1HybtXJ3W2CAZ9Cy+AY+ontp6p3P3rlaY6K6mFcbiHoyil+QDf6jNRTLlGeu/L/UgDXWP0XjD2dZmVAn4L+TcpktGShl+sNjiyzim6sYMNp20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PADWuTug; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F478C116C6;
	Mon, 16 Feb 2026 07:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771228480;
	bh=XeF+58jMPV7rbzYLcofkZ2ZERolCjjHDECcyxEkot+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PADWuTugiNH14cIPsDO2zFzrWZcT9pYit4dFg3N2ZIGTkI9N2UmNAHTvucWyiHhT9
	 d+VBuQuIfTwg2vLICme5LMjisU6anCviHYw0B3qBiO5vYkfIi6CkLU516dAA7nVDCB
	 vSYTx9iIVKXhF5Fn03R/EE0Q9r1Ufewn9ClfVO3M5s2Ef2vL0xDHSrM/MFkzEx1W2F
	 D2+HXC25ViAgTB0Bw366neH14gnrvZnDzLa1YRarmXLq4m3nsCYklpJiedeqUzDCh1
	 Yd2bi90n5g9hV765k7dhG+mdLtRFcFQe93mmhyFZfWM/WUbqYmGSG2kioKqqLI4gsp
	 EUWEn60BDAYuA==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vrtRD-000000002qh-3Btc;
	Mon, 16 Feb 2026 08:54:35 +0100
Date: Mon, 16 Feb 2026 08:54:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: fix chip removal with GPIOs exported over
 sysfs
Message-ID: <aZLNOwUO9_IgRekt@hovoldconsulting.com>
References: <20260212133505.81516-1-bartosz.golaszewski@oss.qualcomm.com>
 <aY7hr2NGmZ3gBd5Y@hovoldconsulting.com>
 <CAMRc=MeN+LDWhP=X_weTL8vzX3chL7Kp282WNVSgB2HJWm_OGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeN+LDWhP=X_weTL8vzX3chL7Kp282WNVSgB2HJWm_OGA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31699-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 204DE14163F
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:11:47AM -0800, Bartosz Golaszewski wrote:
> On Fri, 13 Feb 2026 09:32:47 +0100, Johan Hovold <johan@kernel.org> said:
> > On Thu, Feb 12, 2026 at 02:35:05PM +0100, Bartosz Golaszewski wrote:
> >> Currently if we export a GPIO over sysfs and unbind the parent GPIO
> >> controller, the exported attribute will remain under /sys/class/gpio
> >> because once we remove the parent device, we can no longer associate the
> >> descriptor with it in gpiod_unexport() and never drop the final
> >> reference.
> >
> > Is this a recent regression? I'm quite sure fixed this once back in
> > 2015.
> 
> Yes, that sometimes happens. There have been close to 100 commits between your
> fix and now, including two major reworks.

It sure does. I was just pointing out that this is a regression, which
wasn't apparent from your commit message.

> >> Rework the teardown code: provide an unlocked variant of
> >> gpiod_unexport() and remove all exported GPIOs with the sysfs_lock taken
> >> before unregistering the parent device itself. This is done to prevent
> >> any new exports happening before we unregister the device completely.
> >
> > So please add a Fixes tag here to document this.
> >
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> It bisects to this commit, though it's possible it's a mix of several changes.
> 
> Fixes: 1cd53df733c2 ("gpio: sysfs: don't look up exported lines as
> class devices")

That's the commit from last summer that I suspected as well after a
quick glance at the code (hence the word "recent" above).

We don't want anyone trying to backport this further back than needed.

Johan

