Return-Path: <linux-gpio+bounces-33715-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePDGOf1eumnFUgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33715-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:14:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA412B7A89
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6195A30288E6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8421B36CE0E;
	Wed, 18 Mar 2026 08:13:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33029377022
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821628; cv=none; b=qRp4gGB6wQ4uL2WJDOscz2jdivUZJesTcB03RboeQ8y87tW7Wjs4P9y1sVC3WYEjYp+ZsE64KNn8vg1bXKRi7TSh4wxM8EPrV8bCsCgOGJHgTschxkLWH/eWXUS6U06+sGaD7yEtCAtDsAXtqzWth5Ve02W6kPlxZSRwEU0+2/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821628; c=relaxed/simple;
	bh=MmkOXjYBLk3W+cn5pndelBU7hiWffECq0yY9Pl0anTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pz/HC2FjFHyTty9DQL86AR8SQUdyqrM/HWRj2gmpUndkNOI+7sbuKpmemH1i30lw2wJS7g8KzkGQoA9Pt/B0pEjd6S0gotjJUd57Ag5Lauf3UCRbugGJeqC7Dxm7bM3kYUrsOT+7hShvzrthdgHNlq7fT1vkBiJ2927ovHwGnnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w2m1f-0001D1-MD; Wed, 18 Mar 2026 09:13:11 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w2m1e-000sRb-3C;
	Wed, 18 Mar 2026 09:13:11 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w2m1e-000000097Ag-3gyK;
	Wed, 18 Mar 2026 09:13:10 +0100
Date: Wed, 18 Mar 2026 09:13:10 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v5 0/7] mfd: Add support for NXP MC33978/MC34978 MSDI
Message-ID: <abpelu6kqbvOb2mx@pengutronix.de>
References: <20260316140514.1406588-1-o.rempel@pengutronix.de>
 <e2466bab-4147-4fb3-99ba-68d36c0f18c1@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2466bab-4147-4fb3-99ba-68d36c0f18c1@roeck-us.net>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33715-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.933];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:url,sashiko.dev:url]
X-Rspamd-Queue-Id: EAA412B7A89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 03:12:11PM -0700, Guenter Roeck wrote:
> Hi,
> 
> On 3/16/26 07:05, Oleksij Rempel wrote:
> > This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
> > Interface (MSDI) via the MFD framework.
> > 
> > Architecture overview:
> > * mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
> >    linear irq_domain. Harvests status bits from SPI MISO MSB.
> > * pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
> >    the MFD domain.
> > * hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
> >    fault alarms.
> > * mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
> >    temperature, VBATP) to an external ADC.
> > 
> > Initial pinctrl implementation by David Jander, reworked into this MFD
> > architecture.
> > 
> 
> Please have a look at the AI review feedback at
> https://sashiko.dev/#/patchset/20260316140514.1406588-1-o.rempel%40pengutronix.de
> 
> It didn't run on all patches of the series, and I don't know how accurate
> the feedback for the non-hwmon patches is, but at least for the hwmon
> patch I agree with its findings.


There are valid findings. I'll address them. Thx!

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

