Return-Path: <linux-gpio+bounces-36119-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGzLC425+WmNBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36119-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:34:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5324C9CE5
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E492303A6C9
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2533264CF;
	Tue,  5 May 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCq/onDP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24D426C385;
	Tue,  5 May 2026 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973179; cv=none; b=BsTzYDp1pYRgC2jQL+gQpCd1TiUTVZZ5gtKlS9yEE5PiFju7jxwPEfSlG0d3Y9SkwAhOxVoERlCFSnJ/DcnafALJptmEDOEfpE+q24amR39KXbe4M7SBP/MabkcEHo0KLa5NKR0NGGHG80pfH7cJ5jt1vdJttKtU/GQ2049Cju4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973179; c=relaxed/simple;
	bh=r0EVyhB+ym9Cio/m+tbNiV5f+nRJz1MZ392ksgnWqqE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAh1b7aHie8GlpgbVkzvKfKURrSY78xLuHziV/G66jnuHuUyAowk93HCOj/FA5HoEZbKWZNHQmZ+hxOVbedt9/txK7nKPPTHCXY96yK7MkYL36nUFEODBh9ki/7SGIJxJUhJHRkBVOhaJIopQZign8dN/asBsvkeWTYXCTXHONs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCq/onDP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7521BC2BCB9;
	Tue,  5 May 2026 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973179;
	bh=r0EVyhB+ym9Cio/m+tbNiV5f+nRJz1MZ392ksgnWqqE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nCq/onDPWaMxtOkPlu1Ft9odCo/suw9YkLYsfxrKRS1vGSygkQ3RtGCbt/OvtdQdV
	 8O9NuPwTp/DjhzMtCKtEZZ8n4XKvmGM+RYSgtJHeQR7hyjSO8oc4d0E/CUvgB/5K57
	 U2PSM3utCb3DbmE42Q82twnJIA7aqVlgQL6J7t99IRghoJM+KVgS7yT2ERaabPPYl4
	 yk1ybaEg4jSR23q1TgujDZice8iVB5wwJNTonh9etznMajK/yGGjNwwJHch4ru+rKR
	 aHVgXDId9/959eGRpDqFf1qGGvKFSg7Ykp56TDMNPO/SKafcQKUm2eaaK4CMMUzgQb
	 wVER3tVR09iBw==
Date: Tue, 5 May 2026 10:26:09 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/4] ti-ads7950: fix gpio handling and facelift
Message-ID: <20260505102609.4001b20f@jic23-huawei>
In-Reply-To: <afk48YT55Y89Gq0J@google.com>
References: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
	<20260412193856.1300770b@jic23-huawei>
	<afk48YT55Y89Gq0J@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2F5324C9CE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36119-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Mon, 4 May 2026 17:25:58 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Sun, Apr 12, 2026 at 07:38:56PM +0100, Jonathan Cameron wrote:
> > On Sun, 05 Apr 2026 21:39:22 -0700
> > Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >   
> > > The original reason for this series is to make sure ti_ads7950_get()
> > > returns result in range [0, 1] or a negative error code to comply with
> > > gpiolib requirement.
> > > 
> > > During review David noticed the fact that the function also clobbers
> > > gpio state. Fixing that lead to adding cleanups using guard() and devm.
> > >   
> > Applied to the testing branch of iio.git. I'll rebase that on rc1 once available.
> > 
> > Thanks for persisting with this. Indeed a nice facelift ;)  
> 
> Jonathan, is there anything else you need me to do?

Don't think so.  All queued up now and I don't think we have anything
else outstanding for this one.

Thanks,

Jonathan

> 
> Thanks.
> 


