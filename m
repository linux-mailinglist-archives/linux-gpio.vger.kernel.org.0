Return-Path: <linux-gpio+bounces-36816-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH4KD5imBWrGZQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36816-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 12:40:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0615407DD
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 12:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D738F3080672
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 10:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94013859FC;
	Thu, 14 May 2026 10:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CP2+Q6k+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930AC3845AA;
	Thu, 14 May 2026 10:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755092; cv=none; b=Ricecf8eZFeQRIuxFhfpwZblrjsr2HD4gOeCld/Sb1t9ep6Fj0r8jYSVnzVoxdwxsinzXjrv0iwzo8qqOkxAfvraEkJYCHRkqwpluwHaPHPhHyAaQJE6OW8saLBoZacSo3rsKOq2YedEZZBff02EoGinFyhaswSJeijAXYs0waU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755092; c=relaxed/simple;
	bh=6KuqpnKj9sobxjDeqvX+sSPZ/QSHETFRdP4dGEBM9Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IK1YD+gIhASAc6Sy4egXO+hOn3OpmObEJdQCKHqdD6VPvs0+T8LDH9e0nj85vKiv+ft7xSdpzxDmorICJEUHMkIgjsogLLYuoe0cdTA6LWSML2IOerOBkkkCtZD3L3WfF8o3aRccG/PWUqXgta07Qzg6IdaM5Tq/NfOk2TvNrWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CP2+Q6k+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05ABC2BCB3;
	Thu, 14 May 2026 10:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755092;
	bh=6KuqpnKj9sobxjDeqvX+sSPZ/QSHETFRdP4dGEBM9Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CP2+Q6k+vOdNmZMCBg/czK3/XTzKq0VLFIDXnQfI8q1f+VEZYn5dEFbuxpbhMVrKZ
	 LcDgW9pgW31NqQNAkn7M4q9P5MWsdEG75eNTJNuHXQu3VLIt8HrPHm/up/QrlZ3mY0
	 fzPYe8svCetFMPVLD/SM0Yi3iVTZb0iVGk8XokfoS+fbK6L+SHkBqDT/iorLvpG0GL
	 PQ5KaPxmJRTwQgTrA9hbLpPyHj25xksmDOIASEbpj14sISdX9+X/KOJo2yX7u0wUjc
	 feFwDC2Dyev2jez7STICOVKK3blTa65kRGL11nWgCmZE1UFBSxg9fUCpd+b1OWCmNb
	 jxpZVrv2QQt9w==
Date: Thu, 14 May 2026 11:38:06 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Alex Tran <alex.tran@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/5] scmi: Log client subsystem entity counts
Message-ID: <20260514-finicky-acoustic-flounder-2dd405@sudeepholla>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <agS8udcvqgQmiqB4@ashevche-desk.local>
 <1f2fb1de-ebc8-40ef-ac53-3348499295e3@roeck-us.net>
 <2026051441-agreed-suffice-bbe1@gregkh>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051441-agreed-suffice-bbe1@gregkh>
X-Rspamd-Queue-Id: CE0615407DD
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
	TAGGED_FROM(0.00)[bounces-36816-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 08:48:19AM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 13, 2026 at 11:27:21AM -0700, Guenter Roeck wrote:
> > On 5/13/26 11:02, Andy Shevchenko wrote:
> > > +Greg (I believe the trend is to drop such messages and not add them [back]?)
> > > 
> > 
> > Is there some common guidance on this ? I'd be all for dropping messages
> > instead of adding them, but there seems to be a perpetual battle between
> > people who want to log everything and people concerned about logging noise.
> > As maintainer I always seem to be stuck between those two camps.
> 
> When drivers work properly, they should be quiet.  This patch series
> adds a bunch of dev_info() calls, which is not ok.  If a developer wants
> to see extra messages, use the dev_dbg() infrastructure, or the tracing
> infrastructure, both of which are there for this very reason.
> 

I completely agree and tend to follow that. But I always assumed it was
left to maintainers taste.

> So yes, I agree with Andy, this series is not ok, don't make more noise
> please.
> 

I am now thinking if [1] was the one setting example for this series. I did
ack it as I left it to the subsystem maintainer's choice(in this case author
as well).

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260304101457.7470-1-ulf.hansson@linaro.org/

