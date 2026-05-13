Return-Path: <linux-gpio+bounces-36753-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFPzItWOBGoVLgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36753-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:46:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14C53562A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 16:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F10DA31D9155
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED5B3F410B;
	Wed, 13 May 2026 13:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxiHd7KF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A73F4108;
	Wed, 13 May 2026 13:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679595; cv=none; b=RHA250tBcJqpJMDpgrGgNeWei5QL5bvhggrqacTACvmyW5IqBt34m1NNGMe8TnAeGZx4gnfyfrQkXtTjZZEdbMjpdJeqEdLyvHjTM4vRqMrQUSUCFA9dxZwK3+8F9UdnqT6CgNShPQM+F3+roCy9eqvgwTqsRlUsXxY8bKdyAMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679595; c=relaxed/simple;
	bh=7xe2ROXdnzaf18JAshtvmNuSp26svnoq6kfctwKKQTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zfx92ORoJIKO/iMuoG3MDsfIMYlFGDrCxUODBKGMIzgvOqx6BepCME9bOpNoNA1TLHws3c8JV10VVwwiYluKUsEU91bwAhXl1e5qRnDY2GFYz3is7HDMae5kD25hkyVOM9/VhiWFIjWod/aZOiOROHViXODjRpDQSqoM2xzOu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxiHd7KF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766CFC2BCF5;
	Wed, 13 May 2026 13:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778679594;
	bh=7xe2ROXdnzaf18JAshtvmNuSp26svnoq6kfctwKKQTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxiHd7KFbWqJr5iNmgZw5amIpuA68f++ejKwV3dxMvyr8z+QgeVwvKX6/HFBbqs8S
	 HxXDp/k5ORrQRNPRAzZz1GbTp5lMQlKNwSJLybCpevsIoerEk07dydmFwt8iB9aUbI
	 a5zFR0KRxZAhwrefJFbic5cxChGeJ2V5JIi8mX7HF5HS1lTOG4jedCtZ2DfjN4ZeoE
	 ylu5nJWFbl4SXPBjQ5b5o2wtHhrJoLOw5mXfh/vNdk4gPqzozEE1mVr8ErjO51mmAz
	 4dC5iEIYf/I/WYtklcKCT0g5QqZw0sJR0T61UKZqeKpjUuT3rVrBNOWc48oxsaNBHv
	 CbRSUWsqcL/kw==
Date: Wed, 13 May 2026 14:39:50 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/4] gpio: timberdale: remove platform data header
Message-ID: <20260513133950.GX305027@google.com>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
 <177754249703.2432539.15541841890441225607.b4-ty@b4>
 <20260430095235.GG1806155@google.com>
 <CAMRc=Md=eMGA4iSTJmd4_wBBDXEJRcbGyUQd5kjcFC6MGiy_fQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md=eMGA4iSTJmd4_wBBDXEJRcbGyUQd5kjcFC6MGiy_fQ@mail.gmail.com>
X-Rspamd-Queue-Id: EC14C53562A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36753-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 11 May 2026, Bartosz Golaszewski wrote:

> On Thu, Apr 30, 2026 at 11:52 AM Lee Jones <lee@kernel.org> wrote:
> >
> > On Thu, 30 Apr 2026, Lee Jones wrote:
> >
> > > On Fri, 27 Mar 2026 11:49:06 +0100, Bartosz Golaszewski wrote:
> > > > There are several GPIO driver header scattered directly under
> > > > include/linux/. I'd like to either remove them or move then under
> > > > include/linux/gpio/. In case of gpio-timberdale, the platform data
> > > > struct can be replaced with generic device properties. This series does
> > > > that. It can go either though the MFD tree or GPIO with an Ack from Lee.
> > > >
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
> > >       commit: c44d171a52513bfd06b5d847b42b0c1013ddd46e
> > > [2/4] mfd: timberdale: set up a software node for the GPIO cell
> > >       commit: 2012c0d1b91767b68dedac127c3575cf816313e1
> > > [3/4] gpio: timberdale: use device properties
> > >       commit: 065d211f9ef7e60c510cbb3663ffdb7ca14efae2
> > > [4/4] gpio: timberdale: remove platform data header
> > >       commit: 0cb4edca4ed1325ddeb368f80807403cc37edc00
> >
> > Note to self: ib-mfd-gpio-7.2
> >
> > --
> > Lee Jones
> 
> Hi Lee!
> 
> I received this notification from b4 but this series never made its
> way into linux-next. Is there anything else I should do?

This was sent 4 days before you asked:

https://lore.kernel.org/r/20260507152835.GR305027@google.com

Something not working?

-- 
Lee Jones

