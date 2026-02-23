Return-Path: <linux-gpio+bounces-32015-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGRVLe3xm2kI+AMAu9opvQ
	(envelope-from <linux-gpio+bounces-32015-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:21:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34E17212D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B65833026A8D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 06:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F02345CDC;
	Mon, 23 Feb 2026 06:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kE6V06Wn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86450248F6F;
	Mon, 23 Feb 2026 06:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771827682; cv=none; b=da6K/4h1xcOCsqUzCsvg15ZA72XM1FeWM1OIQBCYgB3Zvy6b/8z1pYWmSAcRzf6A60sIf+nD/ZERAjT9NTESO93GTz3Q+3tNvcMStAZtk8T87gVYRva/WGi82RD7g20uVkgH2DAY4AgEhIClSjG43BiU0SrOTte7XG8Ar0RK0Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771827682; c=relaxed/simple;
	bh=OrNVuu96RmVQDMEp/SliaNIu93b625pIszPp6BQGKow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1QufVBvbBiBup38jL+VEeo41iljMhD8bELn+YbQxdd/N7fgmsfJKSsJCU4Jovg5+I4//f1j5KD/miAuLaB2229Oz8pFJ5Z3HzXcUs+f7urYCtVS0Jc+nzu2Z+PsEryy6Zr9DaBcIyCq2WPPbcwB+O0SF9047wnYZ+Vr9El2r4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kE6V06Wn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EE4C116C6;
	Mon, 23 Feb 2026 06:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771827682;
	bh=OrNVuu96RmVQDMEp/SliaNIu93b625pIszPp6BQGKow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kE6V06Wnt34xg/OQhDrNjEHA05oz8v9a0TMe2hYWlhr8f3OaYTTqGzF/QPWMSdl9+
	 VZFPmYjfXm0OhA8KrkH9h/WRETAtlvXGK9GoWqPfgEa565RdkRy4sC9k/2H7ZSIbas
	 AW429byAN8yfZpAvXVL5gHLkvm6629ZdaQEzB0vuSEFMUzJOY2KShZfQxBMElOrBJo
	 t4awIqix+f2H4FWeM9AWA7E0OSjOAKAyKWUdYbROm97KjidR5Y8Rm94G/qmIrBCItQ
	 Rel5TpOM7qh6q9WsFmRaH3clRE/5Wu4JENn76p7Y3NJEuFRT3ktTbBXlXYVItPiQRC
	 JeNqNlY2iJQ/w==
Date: Mon, 23 Feb 2026 14:21:16 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
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
Subject: Re: [PATCH v3 00/11] gpio: Adopt revocable mechanism for UAF
 prevention
Message-ID: <aZvx3HlLReX-n5td@tzungbi-laptop>
References: <20260213092958.864411-1-tzungbi@kernel.org>
 <CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32015-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F34E17212D
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 11:26:00AM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 13, 2026 at 10:31 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > This series transitions the UAF prevention logic within the GPIO core
> > (gpiolib) to use the 'revocable' mechanism.
> >
> > The existing code aims to prevent UAF issues when the underlying GPIO
> > chip is removed.  This series replaces that custom logic with the
> > generic 'revocable' API, which is designed to handle such lifecycle
> > dependencies.  There should be no changes in behavior.
> >
> 
> Patches 1-6 look good to me, I think they should go into linux-next
> after v7.0-rc1 is tagged to lessen the burden on the subsequent
> revocable work.

Separated, rebased to v7.0-rc1, and addressed comments for the first 6
patches:
https://lore.kernel.org/all/20260223061726.82161-1-tzungbi@kernel.org

