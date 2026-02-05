Return-Path: <linux-gpio+bounces-31466-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F/9G7ZkhGkh2wMAu9opvQ
	(envelope-from <linux-gpio+bounces-31466-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 10:36:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1CFF0E25
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 10:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AEB8302F24A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 09:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CB8399013;
	Thu,  5 Feb 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhkUj6i/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21533D6FC;
	Thu,  5 Feb 2026 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770284101; cv=none; b=Or4vqCpRc1011GPlOMtf/o4eUGydFSoFJkZPDoBwAG7eRoyEhCEAaMC6wAZkzfVj/vMHXz++Y8U1AINgu6v7h+S/BWTO1wq7v7GJa7Utoqy1Wl0+8+mlYLDHsqbJSxvxpItCSi30sIE7wmViyviv3MbdXXbcs/1tnDgjyJukPS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770284101; c=relaxed/simple;
	bh=jlmqytgVOxo7655OVR15ZmDGd72aKZKYciXOIvc9e1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHCoeQEUSmRNdqdjR535AI0lrw4PGCKgpm3OVVHGxya1mlZ0YdqnpYFbietY2f5a5ckFZXiEy3ddr3uDUpNiYToJNJAdNjW30xmh8/EfrJklaO3oZ3EAjetJR1VMPkd6wLk4qrQRIx0M1DxxGGrXD1fqlR7LBD0BlnCrlwd+0PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhkUj6i/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06F4C16AAE;
	Thu,  5 Feb 2026 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770284100;
	bh=jlmqytgVOxo7655OVR15ZmDGd72aKZKYciXOIvc9e1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VhkUj6i/BipV4MWCnFWoMBh+7WnUYGt1fOZwWU8sshQXlUpwOTszDpGefVpM/KYAK
	 M3+KquRWkdXYCVTZ3eWyAERgj2+vD7W3kAezOvvGXGxp+a/jJYRrmn/yzvCX8pZB2P
	 /Ef4jFznjGhbh4GGGc+hNn8eceSyZqEMlgyJcFJXF20Nu4jaitJhK+4gNLKg5OYIQd
	 bXOsvOF4UYs9tKS1KJFVdWIiy9IirxpIF5FPKA6fIP6JkmFM/xkkJ/qAaV+SR8oa2R
	 7eYYY/4XY4Ei+YROj3gfg3KmBWm41Q3bvAEvkxUpfFyxCRpCRpqFkWot3sMgzwbT4c
	 Q/dER/UudLxRA==
Date: Thu, 5 Feb 2026 09:34:57 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: Fix resource leaks on errors in
 gpiochip_add_data_with_key()
Message-ID: <aYRkQRqmJZ-CMEhU@google.com>
References: <20260203060210.972243-1-tzungbi@kernel.org>
 <CAD++jL=vkMYQSKxq+5LsEW7aQAkbvVf00gv64hYRjWwsqzSHZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=vkMYQSKxq+5LsEW7aQAkbvVf00gv64hYRjWwsqzSHZg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31466-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: BE1CFF0E25
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:35:14AM +0100, Linus Walleij wrote:
> On Tue, Feb 3, 2026 at 7:02 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > Also reorder the instructions to make the error handling simpler.
> > Now gpiochip_add_data_with_key() roughly looks like:
> >
> >    >>> Some memory allocation.  Go to ERR ZONE 1 on errors.
> >    >>> device_initialize().
> >
> >    (gpiodev_release() takes over the responsibility for freeing the
> >     resources of `gdev->dev`.  The subsequent error handling paths
> >     shouldn't go through ERR ZONE 1 again which leads to double free.)
> 
> This doesn't need to be parenthesized, it should be pointed out
> so people can follow it, also:
> 
[...]
> > +       device_initialize(&gdev->dev);
> > +       gdev->dev.type = &gpio_dev_type;
> 
> 
> This is the point where, from this point on, gpiodev_release() will
> get called from the type.
> 
> This is worth a comment in the code don't you think?
> 
> Something like:
> 
> /*
>  * After this point any allocated resources will be free():d by
>  * gpiodev_release(), if you add new resources then make sure
>  * they get free():ed there.
>  */
> gdev->dev.type = &gpio_dev_type;
> 
> This helps developers to do the right thing.
> 
> With that added comment:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks for your review.  Fix both of them in v3
https://lore.kernel.org/all/20260205092840.2574840-1-tzungbi@kernel.org/.

