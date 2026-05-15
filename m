Return-Path: <linux-gpio+bounces-36893-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILBmD97bBmoxogIAu9opvQ
	(envelope-from <linux-gpio+bounces-36893-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:39:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA20D54B86C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FB133099B4C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 08:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1B9401A02;
	Fri, 15 May 2026 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOClplrI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A458F3F23A2;
	Fri, 15 May 2026 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833805; cv=none; b=YGzbG4RDf6QiCj7Fzh8ZybdqnNmR7XZ8gD5td0uOs9a3aTIGOke10XFOh0JYqMwqkJEDyylmIVxQK9HpsTKQEGTyiZtdHfWdd/E7fErXJpf8mn9BFuTvYVhQhXUYje0Uf4TxkYPEPg3e6zSy7vavfw3lgny0RIyHCi6Je9TguQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833805; c=relaxed/simple;
	bh=r3ORmfQtv0ARyDCdOtTrhzGqeEBmEtb8whCU51Psl5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WI5qc5OTs/93zj3t41UFHblH8ABP9KvFpGNV1GQ4zC3EDj91DUVZOaBvuwJYWLog7jpiKrHpv92U+rC6Ve8hb7aewSUyGdcoqB2+4yJu0OSPJEtcKFGIOTQZom+P9TTzdFO+F7CPpicj600ynqHWn+0eWMV0mSdJkLE0MjjsUQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOClplrI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0F9C2BCB0;
	Fri, 15 May 2026 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778833805;
	bh=r3ORmfQtv0ARyDCdOtTrhzGqeEBmEtb8whCU51Psl5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOClplrI7Z9cMk2Ye158aa3KtxSL/WY4mugEmIah5XzG3K6l9HQbH8/rqWKXDNzan
	 REtixeYLgQwcYYyIeaATuhSzZPf8lm+jKrwDuFOKRBoxeCzYdYuaYA7bjmCB3Pol46
	 NV1IzTFodqBLb8pmkZUatmtYIQBHusS1USe4dVbFyDB+oRO4+eW6WHq83AeCpgDBSX
	 W3BM/EmfjWgaF5eyMi3HLpfW5Sr6j/4wM1Ja/8Zil4fJ7sxJ+SshxC/A2ACfAk8sZE
	 ou9NQbXcEnGjRG5OPWRgHGSGHnoq89trl2sdH60swzI7CAoZsesMIwLAGLk43hctNY
	 NTXFKRzVU/qLA==
Date: Fri, 15 May 2026 09:29:59 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jyoti Bhayana <jbhayana@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 0/5] scmi: Log client subsystem entity counts
Message-ID: <20260515-strong-lionfish-of-effort-f74c7a@sudeepholla>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
 <20260514164422.0eba9a61@jic23-huawei>
 <8857fc71-aec6-4682-b4f4-0bd463f367c4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8857fc71-aec6-4682-b4f4-0bd463f367c4@oss.qualcomm.com>
X-Rspamd-Queue-Id: DA20D54B86C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36893-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 02:23:56PM -0700, Alex Tran wrote:
> On 5/14/2026 8:44 AM, Jonathan Cameron wrote:
> 
> > On Wed, 13 May 2026 10:16:53 -0700
> > Alex Tran <alex.tran@oss.qualcomm.com> wrote:
> >
> >> SCMI client drivers do not consistently log the number of supported
> >> entities discovered from firmware. This information is useful during
> >> debugging because it shows which domains or resources were exposed by
> >> firmware during probe.
> >>
> >> Add logging of the number of supported entities to the SCMI cpufreq,
> >> pinctrl, reset, hwmon, and powercap client drivers after a successful
> >> probe. This aligns these drivers with the existing logging in the SCMI
> >> power and performance domain drivers.
> >>
> >> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> > Hi Alex,
> >
> > Just curious but why +CC linux-iio and IIO folk?
> >
> > May be you had a false suggestion to add them from get maintainers.
> > If so be sure to check it's suggestions make sense!
> >
> > Not to worry - we can all hit the delete button ;)
> >
> > Jonathan
> Hi Jonathan,
> 
> Originally, there was another patch in this series to add the same
> functionality to scmi_iio probe but it was dropped. Apparently running b4
> prep --auto-to-cc does not prune stale entries from the cover letter. Will
> manually remove all entries and rerun the command in the future.
> 

I guessed so, but why was it dropped ? I don't agree to adding them elsewhere
just curious about why it was dropped in this case.

-- 
Regards,
Sudeep

