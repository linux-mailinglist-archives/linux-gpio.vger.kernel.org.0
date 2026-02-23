Return-Path: <linux-gpio+bounces-32014-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLbJManxm2kI+AMAu9opvQ
	(envelope-from <linux-gpio+bounces-32014-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:20:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A49B1720EF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BD2F3048118
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 06:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C5334404E;
	Mon, 23 Feb 2026 06:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDh2y0+1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA95343D8F;
	Mon, 23 Feb 2026 06:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771827483; cv=none; b=kv6XXXZu2ZqD2qrMnXxZkfRZGqZvWecwtq7hupbhupvUS/pWEy9wuq1aFWmtUNKCQ34daK4um4B5G+3IQh+nvcgyvvhAssBLVjYW0DzsiRBPFqfT6BEfmhvXTo5xHMbvoG8aRjF+I6WAq622fCGzQBpsKiOkaT4rX4MMHgWcyOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771827483; c=relaxed/simple;
	bh=ItlWS5Z4cW4csf7ZfnlXYDv2AI0QknQHNEWwCRfKYIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGf5Rv6bNVdzcSeu1Gh2R9mxJ7Ca7ZmCH4YM2MjNjEfsFZlgOS4OIV301YZ6QFtR3gbDgni8uqniqpokbnOjqNrsguXqXqMDNl0Dr4PRiL+GZ4HX5mSlPmjXX8A1WugkB3AMWXiRuRUz3pFRig93QHXeqUKloG2U0SgW2yuMx/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDh2y0+1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BBCC116C6;
	Mon, 23 Feb 2026 06:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771827483;
	bh=ItlWS5Z4cW4csf7ZfnlXYDv2AI0QknQHNEWwCRfKYIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDh2y0+1LNw4WW772osUysSJi1SsnXuAj/rPhLVZd2cb6lXer0W1iotHJU3DBfqxR
	 PzsfYFXU1ISMGH/kcQzDD9g7ZE8eTuSpalaV2gwQFHsuXdaF/KKweg+LeVxpCpAs5y
	 au1BakmbJfWEC/NfxHcGkV2bRcx2wmlkozxA6N4bECFI3x+k39Kb9JIZqjK3g4rOMH
	 HYesOUdDtXIoXrgNngZs4QJ+Z4b4jkVOCo5hbq7cafygLAuF9kk88lfn6v5RTuLia3
	 i+Yb48zuoBPlwYTLW2FgqROR9yTWC5f8GSVOGrF4x7J5Nc/VxZmfUEE7noB8PlItEs
	 A8KwmpwWuotrQ==
Date: Mon, 23 Feb 2026 14:17:58 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/11] gpio: sysfs: Remove redundant check for struct
 gpio_chip
Message-ID: <aZvxFqTLaGa-gHmA@tzungbi-laptop>
References: <20260213092958.864411-1-tzungbi@kernel.org>
 <20260213092958.864411-4-tzungbi@kernel.org>
 <CAD++jLn6XxLp7hdBOHbvAJ2bxY4dnfiWDV_UVT+EAyaKmV3Naw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLn6XxLp7hdBOHbvAJ2bxY4dnfiWDV_UVT+EAyaKmV3Naw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32014-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A49B1720EF
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 08:51:29AM +0100, Linus Walleij wrote:
> On Fri, Feb 13, 2026 at 10:31 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > -void gpiochip_sysfs_unregister(struct gpio_device *gdev)
> > +void gpiochip_sysfs_unregister(struct gpio_chip *chip)
> 
> Here it is chip
> 
> > -static inline void gpiochip_sysfs_unregister(struct gpio_device *gdev)
> > +static inline void gpiochip_sysfs_unregister(struct gpio_chip *chip)
> 
> And here.
> 
> > @@ -1286,7 +1286,7 @@ void gpiochip_remove(struct gpio_chip *gc)
> >         struct gpio_device *gdev = gc->gpiodev;
> 
> But you can see that we call it "gc" (gpiochip).
> 
> Chip is more ambiguous I think, can you use "gc" everywhere?

Ack, will fix in v4.

