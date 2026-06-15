Return-Path: <linux-gpio+bounces-38481-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HarrIWLdL2ppIAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38481-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 13:09:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5998685986
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 13:09:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Z45vdnCP;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38481-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38481-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A94E73039F4F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 11:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8A43E3156;
	Mon, 15 Jun 2026 11:07:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462843E2AD7;
	Mon, 15 Jun 2026 11:07:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781521667; cv=none; b=iU/VL6zw2htzT0hBNJ0juWMyUIosxNUinY8886UdEkXNQDXN4GufVzGKDUykUgA3Fg0NPwGylqu7slvziSGXe+jIzuXMMgV5hNGdYsws+JYwSEtz+LB3ChInZGmcxDJ3ZH4dIN7SfHZIVxUWrchtPrWb1Ta9otlpGs30pG8LuY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781521667; c=relaxed/simple;
	bh=5IsDVMKoPJvLpvptuX1lpJHY6wn9dp8hACNCowdF2AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1NvIeB5eb1e8B/BQ/QqYJH3pze4hTh/t2vLKGr8ZyERa6G9v3d+twHTsxds64k8tdagrvUbSEmLVad1gOquHGFkePaSF1s6/iyTeAoKtG0dbhVAaE/v06WeYnmroNAlGmf1xmef78qMLbccpFssSsK2t67e/pVkRRxT4a2fc/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z45vdnCP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168C21F000E9;
	Mon, 15 Jun 2026 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781521666;
	bh=UO3rpfvYBBfuE5Ibo3k4HDGQ/cgjzFJy9qYSUkcP7I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z45vdnCP/DIFOtMyTiQHaC/jwY7RguxR3orCHgTJj7TjBJmOai+rw+wMalmWzYFLx
	 iWF7txnOF962LrHydjZH6GEaEFbOJEqFmbFdBhJZmj1fk2czHvsX2wMD0+GQ25DPa9
	 hauKuHV7W91vADi22vqSYS/vfXtnnyfEMWqneDypF+xe2bD5F6Xl8ud44l/8QjB/9r
	 RloRpAuitmV/+psivHebPD8SvKrblMbMKSvCA1wOkZv3/zdTcNpU2BmvICCfQ+c6n7
	 eUWR/qDQdLQKKlZY1gKIHmC34WH87uIjrjFV16TQpVxpng/bTkgMUMNiIxIWa9wBET
	 Z0gJYbhPY17aA==
Date: Mon, 15 Jun 2026 13:07:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, linusw@kernel.org, 
	nathan@kernel.org, chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH] Revert "i2c: designware: defer probe if child GpioInt
 controllers are not bound"
Message-ID: <ai_cAd41W3iX1ic-@zenone.zhora.eu>
References: <20260610083701.18663-1-hardikprakash.official@gmail.com>
 <ai8jhK9hUGHpojB5@zenone.zhora.eu>
 <ai_PwNWnMZB01AYU@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_PwNWnMZB01AYU@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38481-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andi.shyti@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,amd.com,bgdev.pl,intel.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zenone.zhora.eu:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5998685986

Hi Andy,

> > > This reverts commit ef76a3a28c79b628890431aa344af633e892035b.
> > 
> > Is this in your branch?
> 
> $ git tag --contains ef76a3a28c79b6288
> next-20260601
> next-20260602
> next-20260603
> next-20260604
> next-20260605
> next-20260608
> next-20260609
> next-20260610
> next-20260611

Yes, but I'm not finding out how it got there. I only see it in
one of Wolfram's branches, but I don't think it came in that way.

I can merge this revert as well, but only after the original
patch hits mainline.

Andi

