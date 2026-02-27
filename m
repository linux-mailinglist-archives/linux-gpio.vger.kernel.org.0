Return-Path: <linux-gpio+bounces-32272-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHh3EHF1oWkPtQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32272-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 11:44:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 945811B61F9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 11:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 914343004C41
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DF23A1A3C;
	Fri, 27 Feb 2026 10:41:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2DA3D410C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772188890; cv=none; b=g2ge9LIKFuuFatHjcyHNpNEH1jCfkwNryk9KJT614jdwepmWJGEEsNEgGFRTuwPuwjxDGP8+gXxjTlPRBa4ZZ/7YQqOFqnOAOA+hfpI4vxTM6KzeeCRjykJ5iX5Dq2DD2G5FjafKSTPHK0r+tZg/m7ODOs+eqk2hphQmhKXuFHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772188890; c=relaxed/simple;
	bh=+5TjKl8kKwZaifml2Ywv/XFpEld7c02pnD+PheIwsOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=on2opj/l0ZraHo5MjKi4apR/RVGTE0jotDmkkN14qgHNAVl84CzgV0SqpAr9qcNfkPyW9inRDYgey8xQKTYB71D5p29M56rGBTnrBiC59ECK4kGta5OkbHO9SpklXGFwcAuUfz7GIIKzINa/+KKuzf/1wNfY5KO2BcBHP95lVO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vvvHQ-0003rU-Lm; Fri, 27 Feb 2026 11:41:08 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vvvHO-002sf0-36;
	Fri, 27 Feb 2026 11:41:08 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vvvHQ-00000008dD4-0mEk;
	Fri, 27 Feb 2026 11:41:08 +0100
Date: Fri, 27 Feb 2026 11:41:08 +0100
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
Message-ID: <aaF0xNKzz74h0gBA@pengutronix.de>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-4-o.rempel@pengutronix.de>
 <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
 <CAD++jL=PKnAa6CrzGOwPoS_kJJjiHEvztgAFdEoYpHDPj6WT9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=PKnAa6CrzGOwPoS_kJJjiHEvztgAFdEoYpHDPj6WT9Q@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-32272-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.990];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:url,pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 945811B61F9
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 12:02:53AM +0100, Linus Walleij wrote:
> On Fri, Feb 27, 2026 at 12:00 AM Linus Walleij <linusw@kernel.org> wrote:
> > On Wed, Feb 25, 2026 at 6:16 PM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> 
> > > +  - Pins 14-21: SP0-SP7 (Programmable inputs, can be SG or SB)
> >
> > What is SB now? Please explain :)

> Oh I see in the driver that this is Switch-to-battery. So document that here
> in the bindings too.
> 
> Also it seems that something configured as switch-to-batter must be
> flagged GPIO_ACTIVE_HIGH.

Actually, the active polarity depends entirely on the external circuit,
especially since these pins can also be used as controllable current
outputs.

For example, we attach LEDs directly to the pins. If an LED is
attached to an SG pin (or an SP pin operating in SG mode), the pin sinks
current to ground to turn the LED on, making it GPIO_ACTIVE_HIGH from
the LED consumer's perspective. 
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

