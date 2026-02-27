Return-Path: <linux-gpio+bounces-32271-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHbiHsNtoWkltAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32271-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 11:11:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FBE1B5DB1
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 11:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9EB831AA116
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444F036EAAA;
	Fri, 27 Feb 2026 10:05:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945923D3484
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186729; cv=none; b=ekxz7DPNs2JgxQfGiCxVTH7nNl6mkUdCZeqfjMKD8656FzAEWjXd+Do8uJqPg755VpVn6nT+hHrx7XhZ3lkG8vc+CJYfmvEPnoCe0fBuW2eSdF3jySwHMs5DU96FwgADdTRVu3OQA6DgAe0aPX9u0wdDZ0O7eeoyYtERguVp9EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186729; c=relaxed/simple;
	bh=byKhIKAZjGddb3Nt3Z0anMMrJfpi4EDJyAA3QvmxmWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBUccMF2gorq/UdJ5hMgdOMlS9aKm+ml6bzavJmgNag2eolK1fJhyzoN4YeXvtKF3x3hc+i2Zyx+kh70VQlgWphJagSJhJttm0/+fYwpp1Vj3b54RS+BVlIXyUevnMa2zyk5xa54Ky7OHrorFX2LwooLCTg09h7LbJxNVRsXfZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vvuiO-0002IP-Il; Fri, 27 Feb 2026 11:04:56 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vvuiM-002sKB-1S;
	Fri, 27 Feb 2026 11:04:55 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vvuiN-00000008csb-2p2A;
	Fri, 27 Feb 2026 11:04:55 +0100
Date: Fri, 27 Feb 2026 11:04:55 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v1 3/8] dt-bindings: pinctrl: add NXP MC33978/MC34978
 pinctrl
Message-ID: <aaFsR67vLeapQZ_U@pengutronix.de>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-4-o.rempel@pengutronix.de>
 <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-32271-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.989];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:url,pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7FBE1B5DB1
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 12:00:43AM +0100, Linus Walleij wrote:
> Hi Oleksij,
> 
> thanks for your patch for this very interesting hardware!
> 
> On Wed, Feb 25, 2026 at 6:16 PM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> 
> > Add device tree binding documentation for the pin control and GPIO block
> > of the NXP MC33978/MC34978 Multiple Switch Detection Interface (MSDI).
> >
> > This block manages 22 switch detection inputs (14 Switch-to-Ground,
> > 8 Programmable) and acts as a GPIO controller.
> >
> > Additionally, it supports pin configuration for hardware-specific features
> > required for long-term contact maintenance in harsh environments, such as
> > adjusting the continuous/pulsed wetting current to penetrate oxide layers
> > on mechanical switches.
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> Are the hardware-specific pin configurations for oxide layer
> penetration (!) and stuff excluded from these bindings? (It looks
> like.)

Yes, they are excluded for now. The target board is general-purpose, so
the attached switches or LEDs will vary. I'd prefer to gather more
concrete use cases before designing a generic interface for the
wetting currents.

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

