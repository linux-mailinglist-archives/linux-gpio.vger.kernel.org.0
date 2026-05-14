Return-Path: <linux-gpio+bounces-36863-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Gy0A/MXBmrGegIAu9opvQ
	(envelope-from <linux-gpio+bounces-36863-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:44:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF4545FB5
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E07CA3055834
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF32C3A48C2;
	Thu, 14 May 2026 18:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaS0hNdJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8794E3A1689;
	Thu, 14 May 2026 18:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784151; cv=none; b=PzuF15+mZe6Ba3KdIfh9tYw31jGc/hZqdZet00tccAPnwQjF+ipUjYZtx/Wji1kV/3ORsRvRZ9sWj5Mi3E2oYnI8CoM0SaEXzGjLnpg4pDQDycvZr2LYozO/LzPPxBHJ7cqGesgnnFAdifVeP5KpRNGJHZ0uPqQ7G4fYLncBWv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784151; c=relaxed/simple;
	bh=1wWm/PCkLcrcrXBO8q31VLvgXwZnf/NvvUr5rhg6BEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3SpQQoXNQ/63wpyxEDb5h2xiSAPsTHmx/Sgtv1oFgLZYd0j0Rpox8+x3AbyrU7l/egmT2cFBIIqBI2hYPFzJ8a2T7GcyONnAjBIl6esN3dDe02rijYilT0jgm0/a5lVMfYl1kUuWSkiIfW/F4Q/IGAPZzXGHuBYybUryxeSuVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaS0hNdJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62A9C2BCB3;
	Thu, 14 May 2026 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778784150;
	bh=1wWm/PCkLcrcrXBO8q31VLvgXwZnf/NvvUr5rhg6BEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aaS0hNdJYUgjq+fa4BNZJ5qB54d4fEZVhug5m3mkVxASwOnpyeEitdRETR1KlR/UV
	 snmb54+gVAXgsGMuDWRWCtnLQhKPhqkqTEDZJUWv2oUuBtSk4IulMScStvJhb98LWo
	 Frr+P3uhsFnf0nxMCfQbdr3ZCt/vmoLgTdim3lf7uSAthAPOg4sD8E+Z5mJVR4mo3d
	 CdxlgJRyYPodk7a9giw1sQzh5RmRvZIXEoDA/7zEuovSLa//CF0qSWMbZ4hN3yRoE9
	 m3mjOg+E9jIvwEuOMGfSAPa6YfPJ0/pLGq4j2HwdPXLnHNOJ5TZYPHiQOXVVh90283
	 WYRjhQY5mZHCQ==
Date: Thu, 14 May 2026 19:42:25 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Alex Tran <alex.tran@oss.qualcomm.com>,
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
Message-ID: <20260514-generous-psychedelic-skunk-a56a02@sudeepholla>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
 <20260514164422.0eba9a61@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514164422.0eba9a61@jic23-huawei>
X-Rspamd-Queue-Id: A6AF4545FB5
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
	TAGGED_FROM(0.00)[bounces-36863-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 04:44:22PM +0100, Jonathan Cameron wrote:
> On Wed, 13 May 2026 10:16:53 -0700
> Alex Tran <alex.tran@oss.qualcomm.com> wrote:
> 
> > SCMI client drivers do not consistently log the number of supported
> > entities discovered from firmware. This information is useful during
> > debugging because it shows which domains or resources were exposed by
> > firmware during probe.
> > 
> > Add logging of the number of supported entities to the SCMI cpufreq,
> > pinctrl, reset, hwmon, and powercap client drivers after a successful
> > probe. This aligns these drivers with the existing logging in the SCMI
> > power and performance domain drivers.
> > 
> > Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> Hi Alex,
> 
> Just curious but why +CC linux-iio and IIO folk?
> 
> May be you had a false suggestion to add them from get maintainers.
> If so be sure to check it's suggestions make sense!
>

My guess, the intention was to add similar logging in scmi_iio_dev_probe()
as well, may have got dropped {un/}intentionally, but the list remained
in place. The author of the driver is also cc-ed.

-- 
Regards,
Sudeep

