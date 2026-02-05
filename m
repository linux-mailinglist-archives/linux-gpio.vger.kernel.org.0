Return-Path: <linux-gpio+bounces-31462-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EenE0lahGl92gMAu9opvQ
	(envelope-from <linux-gpio+bounces-31462-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 09:52:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085EF010E
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 09:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 041C73005999
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 08:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E023B36F415;
	Thu,  5 Feb 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyJY4PJ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A037536EAB5;
	Thu,  5 Feb 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281531; cv=none; b=m2X2Dy5lO/JTugA4XlvAzKLnBwkKmfE8kloX4ctRDZwceE2h7RomlR/0eE/F29v8mOuLCpogjg3gyo82BYXT1yY+2axab712ELufGuYKBgbz5qibwhKTcAnTF+/rxobMxOCufiMigoAa3AygExwyzgltYWd1CoOCkW+a8NxH+r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281531; c=relaxed/simple;
	bh=HKHTRwxsMIzOsKV/NtcOdgtnJloRAma03Z7jnFBny04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kamALlLV+YGlpcpJmMV8AcIfS+lsZEMcA5y2Lljh0hjdhlcIs1bmTKVDH1laWezgWzhF23lC2BSH3Fc3ONmFBVNCOVEcQs4LoYETwdlimXaIndYaBFz4uuBZAtoOgd6frVT0HEp2jOG2hw3ZvJuYPHeTUwXeX0T5WIDcpsW+dBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyJY4PJ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA76C4CEF7;
	Thu,  5 Feb 2026 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770281531;
	bh=HKHTRwxsMIzOsKV/NtcOdgtnJloRAma03Z7jnFBny04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XyJY4PJ6UbopCkGK2exqdJM8tVN7QjtJVFCyr7Zvs8aikpVDCfl8ju5f3N+/Kab6G
	 Hu+8HbeJ2x3jK7cDMsCVpEWqSmOUnOw9+sSeluOh5/LTxuka9TT8PsL8OU5zVdSsIo
	 IR30I+IRpW+Fwvjy0nnTNpCI+W/u5GAAZVYLterlrk0jqJASY3B4DxVG9+g6OLDnlC
	 ci7sdzaqGYcjNrRgqdkcwnzLamG9/EInDLP5FDTo1TN4aafeWwv/aJBXUDdCG0I2ZV
	 zPR0+ds1x/0/H1kST6H/jS+zyNqYYBydXzXyAJTMDpvmx0IeOMcFZTGaA/30hsYXp/
	 SXYHyK11GdRyQ==
Date: Thu, 5 Feb 2026 08:52:06 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 07/11] gpio: Add revocable provider handle for struct
 gpio_chip
Message-ID: <aYRaNu-ZistKBPN-@google.com>
References: <20260203061059.975605-1-tzungbi@kernel.org>
 <20260203061059.975605-8-tzungbi@kernel.org>
 <CAMRc=MdYeoMxNFYeX_9S-M286aUjnsxLyy9_apmfPR4NeqVouw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdYeoMxNFYeX_9S-M286aUjnsxLyy9_apmfPR4NeqVouw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31462-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3085EF010E
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 07:58:44AM -0500, Bartosz Golaszewski wrote:
> On Tue, 3 Feb 2026 07:10:54 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> > index 3abb90385829..cd136d5b52e9 100644
> > --- a/drivers/gpio/gpiolib.h
> > +++ b/drivers/gpio/gpiolib.h
> > @@ -52,6 +52,7 @@
> >   * @device_notifier: used to notify character device wait queues about the GPIO
> >   *                   device being unregistered
> >   * @srcu: protects the pointer to the underlying GPIO chip
> > + * @chip_rp: revocable provider handle for the corresponding struct gpio_chip.
> >   * @pin_ranges: range of pins served by the GPIO driver
> >   *
> >   * This state container holds most of the runtime variable data
> > @@ -79,6 +80,7 @@ struct gpio_device {
> >  	struct workqueue_struct	*line_state_wq;
> >  	struct blocking_notifier_head device_notifier;
> >  	struct srcu_struct	srcu;
> > +	struct revocable_provider __rcu *chip_rp;
> >
> 
> Why __rcu? This doesn't live in a different address space, only the internal
> resource it protects does. If anything - this could be __attribute__((noderef))
> but even that is questionable as this is an opaque structure.

For fixing a race on the pointer itself.  See also [1].

[1] https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org

