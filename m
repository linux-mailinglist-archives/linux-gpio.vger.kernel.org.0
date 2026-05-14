Return-Path: <linux-gpio+bounces-36811-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bnUBM2NwBWo5XAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36811-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 08:49:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4818853E811
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 08:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A71D30347D4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 06:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3103ABDA4;
	Thu, 14 May 2026 06:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rjqpkp0W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC7C38F929;
	Thu, 14 May 2026 06:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741344; cv=none; b=A3mHQJdkq8suXr7XcmKiXpLmiz7fWx+tZsqRdaCov2NFv4r7rUntzUnq+RNuh1bPc6l1HWLuvYsFXl485IdR9bFx1q8lAfK9M3dmCbv7uV2TLGZU1WTU9GQ5Kq59LU8A6Xsd2tWVqFz1KoqyW4Ecb8xCwHdaaRhmWycIFOW5Ue0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741344; c=relaxed/simple;
	bh=ScTbkdHtQwGqkowBWsSjhjRkE6Kb+/LGJ07lyfcr+U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lriehd02FvMoQ0uufXh/IgrQ2aNo6FiYjIFeira28vPGzCrbwfV0Y6gCFF7yUC3EJjeBBTuQyOOOzxs0OzzuqzeDcO5TzX2E9DmhWNE3dRpov8Pv7EF0NQjkN1o4OVZ1pdk1zpT+IOOHXdoK6wEVlT70N1lJxl5s08IG4m5/YoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rjqpkp0W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1CAC2BCB7;
	Thu, 14 May 2026 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778741344;
	bh=ScTbkdHtQwGqkowBWsSjhjRkE6Kb+/LGJ07lyfcr+U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjqpkp0WQIRm9dgM5y5Y/4JTN1V+PEHl5Ifbr7UWYeHD6WROSNpbjXEPZ6bQ0eU+J
	 mMzx0UqRapFU76U0xsAY/BdR116hHq1mwy2ifivXLXaGs2M0EuycoDjpS8D4ri4iIA
	 P53bjzBKT4DGAm9h7MnhuPT51SAqMLnjpTYe6Ngk=
Date: Thu, 14 May 2026 08:48:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Alex Tran <alex.tran@oss.qualcomm.com>,
	Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/5] scmi: Log client subsystem entity counts
Message-ID: <2026051441-agreed-suffice-bbe1@gregkh>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <agS8udcvqgQmiqB4@ashevche-desk.local>
 <1f2fb1de-ebc8-40ef-ac53-3348499295e3@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f2fb1de-ebc8-40ef-ac53-3348499295e3@roeck-us.net>
X-Rspamd-Queue-Id: 4818853E811
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36811-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 11:27:21AM -0700, Guenter Roeck wrote:
> On 5/13/26 11:02, Andy Shevchenko wrote:
> > +Greg (I believe the trend is to drop such messages and not add them [back]?)
> > 
> 
> Is there some common guidance on this ? I'd be all for dropping messages
> instead of adding them, but there seems to be a perpetual battle between
> people who want to log everything and people concerned about logging noise.
> As maintainer I always seem to be stuck between those two camps.

When drivers work properly, they should be quiet.  This patch series
adds a bunch of dev_info() calls, which is not ok.  If a developer wants
to see extra messages, use the dev_dbg() infrastructure, or the tracing
infrastructure, both of which are there for this very reason.

So yes, I agree with Andy, this series is not ok, don't make more noise
please.

thanks,

greg k-h

