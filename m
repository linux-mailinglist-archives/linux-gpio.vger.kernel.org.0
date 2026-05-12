Return-Path: <linux-gpio+bounces-36654-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACkHFnnhAmpEyQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36654-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 10:14:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F337351C8A2
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 10:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F9DC3025A79
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA5C48C3FB;
	Tue, 12 May 2026 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cf5rQQz2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FC447D956;
	Tue, 12 May 2026 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573623; cv=none; b=RDFD6fQQNpBiV0XvvqcPDIYk33qaoRdLCOJ5p3RRu2rTu+Szn3Qk3nQyH3OZvSXB4X2jzysGQ0JYpBhw1JJOaMKM16CXEFbcujjKeC7u7sNGVgd9jAOvOzUqLGItREk02JjJ9Asy0Nd27lTFB002foKeQs1WU/XwZK1bMAyTIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573623; c=relaxed/simple;
	bh=LhqCYVgT3yV0S7qR971FbwcbD5l8XuZu5owCnX0sS5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Att2MOE4jXAkd1qnggX9ebEEVWDS2NlkvrTyCFEbWvuY77QqVl58uIEN9qjXLS/C7SeUsVrJ/hM2eVRxJqjnpwGyqKGr3vUO3akRAuggngbwAIXoyADs/OvZzbtdxuWYSwk5CvnjNLhUsKfDmiE1VhvQfjQSIl/ZN2K3T1/ZrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cf5rQQz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A8EC2BCB0;
	Tue, 12 May 2026 08:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778573622;
	bh=LhqCYVgT3yV0S7qR971FbwcbD5l8XuZu5owCnX0sS5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cf5rQQz2qHO9WgzbP2R69BVDbXWkoDO4OKaSIeTSh5mYkfJtVp0JIWDUPJZrzbSMt
	 bmmE8KmQuQa3FFIOnQjFB/2vT55Gbai2BGUG3xyYfZDSirRlyEWNhluxTOla4223jw
	 ITzDZuV9ESvKNSXEG2aYU2OuLdBbKebsPDxOlObGLPO87nFGVWy/YNecRi3mBZZ9lI
	 n+TxIu7CfZyjvf20lth2RjmPxSVQM9HJURcdEVaKQ5GT+HEdXN75N+xzJZVtXCxZT4
	 OtRpDa+kfdU48cIGYfBWNLRGImUwi9MKw9EbIt3D+A2gVGZcthvAV08CV4kMWEeVV2
	 DddQIsiD3/7Iw==
Date: Tue, 12 May 2026 08:13:37 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v10 7/9] gpio: Remove unused `chip` and `srcu` in struct
 gpio_device
Message-ID: <agLhMUtdCPqLb736@google.com>
References: <20260508105448.31799-1-tzungbi@kernel.org>
 <20260508105448.31799-8-tzungbi@kernel.org>
 <CAMRc=MfZL2ZEmNEdVd6NeZJDjTzh_MbDy2kU+AYi-CmgRnWZmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfZL2ZEmNEdVd6NeZJDjTzh_MbDy2kU+AYi-CmgRnWZmw@mail.gmail.com>
X-Rspamd-Queue-Id: F337351C8A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36654-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 06:18:21AM -0700, Bartosz Golaszewski wrote:
> On Fri, 8 May 2026 12:54:46 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> > `chip` and `srcu` in struct gpio_device are unused as their usages are
> > replaced to use revocable.  Remove them.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> 
> I'm thinking that all the GPIO patches could actually be squashed into one. Is
> there any technical reason for the split or is it just for easier review?

Correct, they are separated only for easier review.  Would you prefer I
squash the 5 patches into a single patch?

