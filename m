Return-Path: <linux-gpio+bounces-36803-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKNNBMBCBWqATwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36803-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:34:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068853D56B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 05:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E650301D592
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 03:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FD818AE2;
	Thu, 14 May 2026 03:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZn/unQy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3502E7BB6;
	Thu, 14 May 2026 03:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729658; cv=none; b=TKT2WrAVRm9D0HqVkZPzDT+oJmK5PyOjoKCk29wuXLNvgvZcLLtHVASoAdQsas9V/h3XR3+ybAFWnZ4xidbh5Z3xuvTKuiczigmGOBXdl4G8Abca3rGVNqpZ4UOi7RfxRTM9UT518vEKz2lXBjMhdelWvCuPog+Yz/WF2e6alTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729658; c=relaxed/simple;
	bh=33BcRwsUcW1XRj/svO+B7Rak+cHqxlsE+eppIApBnkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZuGOJ0YW13YYM6Di+NyIDpa1MrI6uzgTItrBnAMcYaHEk01kbOGXkrkFtVZtWBIkP9lPEu+gZX07FIkNL7fonrkE8anNEw8wbRhy2gcxBS1hCOFzhCzfXioFQ8ZpP9dgrkyA0RbFN5quPzBNKV/woI+njtz1FUihQQTw1WgHts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZn/unQy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D4CC19425;
	Thu, 14 May 2026 03:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778729657;
	bh=33BcRwsUcW1XRj/svO+B7Rak+cHqxlsE+eppIApBnkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZn/unQyJQRQn5/WzqkpLAWVOdUchDzIjPhbETty9FdTy3gCSLK23WFc4k0fuyVBj
	 ZK5v7ECbykJX7rjHFnXG8Rt+eiOfMqpzO5YgUiQ07EAwv1AXNz4Zc3dPiUFYknIXX8
	 nRkqjFg8si4ejN81P4/lWlJlo5G5Mr1SHPBFLe07jcq4tyCtZ2DDdRudXVYqGYf74S
	 GWDv/vHPEvojfG2BXho2LM3IWye5T+8yPVkWhKQIJAYJGm1AZqF4C+hSku+3//Ymrf
	 SMk0J/CtMgCVsy72oJp+ViN/rtrGpzAnlfVsuBF3Xs9jQInTdBbz4oj7bWI2NHfc/t
	 hcpcK+ZYbcm/A==
Date: Thu, 14 May 2026 03:34:12 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v11 4/5] platform/chrome: Protect cros_ec_device
 lifecycle with revocable
Message-ID: <agVCtBbqT6aZL0mx@google.com>
References: <20260513091043.6766-1-tzungbi@kernel.org>
 <20260513091043.6766-5-tzungbi@kernel.org>
 <20260513115102.GF7655@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513115102.GF7655@nvidia.com>
X-Rspamd-Queue-Id: 9068853D56B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36803-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 08:51:02AM -0300, Jason Gunthorpe wrote:
> On Wed, May 13, 2026 at 05:10:42PM +0800, Tzung-Bi Shih wrote:
> > The cros_ec_device can be unregistered when the underlying device is
> > removed.  Other kernel drivers that interact with the EC may hold a
> > pointer to the cros_ec_device, creating a risk of a use-after-free
> > error if the EC device is removed while still being referenced.
> > 
> > To prevent this, leverage the revocable and convert the underlying
> > device drivers to resource providers of cros_ec_device.
> > 
> > ---
> > v11:
> > - No changes.
> 
> Two people are opposing this and yet no changes? Why haven't you
> followed my advice to fix the bug in this driver in the obvious way?

I understand there's opposition to this approach for this specific driver.
The main goal of the series is to introduce the revocable APIs and show
potential use cases.  I used this patch to illustrate how revocable could
solve this class of problem, not necessarily as the definitive fix in this
instance.

To help me understand, could you elaborate on why the revocable mechanism
isn't suitable here?  I'm wondering because if this piece of code were to
transition to Rust in the future, would the concerns you have also apply
to using Revocable[1] in the Rust context for this driver?

[1] https://rust.docs.kernel.org/kernel/revocable/struct.Revocable.html

