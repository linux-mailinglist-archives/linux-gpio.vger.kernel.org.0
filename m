Return-Path: <linux-gpio+bounces-34355-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN41A0W/yGmDqAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34355-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 07:57:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A78F9350DD6
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 07:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 761993026587
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 05:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FAC28B7DB;
	Sun, 29 Mar 2026 05:56:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883AA29B78D
	for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 05:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774763815; cv=none; b=e5p4iS3BzpXcEOSKtCqk32tFLsED0FE2zphJ1IMI7z0v3IJF295IQ+x/JgqTc+b5MIZ3d9elNLFdo8fKYWMQSv1yBMN2vO5mL8UTobLTiyFy6c1S15zWKg6BvpFCvoK3c2t2m+x8ehuTy95992jsgsGsqpVtIwpu/1QKi5PHgP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774763815; c=relaxed/simple;
	bh=qBV3ETz4r9ysc3UuOuguCm3fT6bSo21r4UODatXRPCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1Flfi/C9n0dkAHz94gbUDI87Jy6C48TiqHNYdIAhAHpGZY3z9kscHdX7RfV3PEQg3wUK64VHcsNXTC5Ny7sidKBWBZQYWSRPv5xAwJffOGr0p58TSFKv+OkCHp3YzuGgksKqZHhvN3YHwQEGkdumxyEytn9QDrYiezHmCTjOuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w6j8G-0007tM-9S; Sun, 29 Mar 2026 07:56:20 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w6j8F-002fH8-1i;
	Sun, 29 Mar 2026 07:56:19 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w6j8F-0000000CR4n-1joR;
	Sun, 29 Mar 2026 07:56:19 +0200
Date: Sun, 29 Mar 2026 07:56:19 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v7 0/6] mfd: Add support for NXP MC33978/MC34978 MSDI
Message-ID: <aci_A1ye2N3g0IIQ@pengutronix.de>
References: <20260327163450.3287313-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327163450.3287313-1-o.rempel@pengutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-34355-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Queue-Id: A78F9350DD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

There are some valid review points related to the MFD core:
https://sashiko.dev/#/patchset/20260327163450.3287313-1-o.rempel%40pengutronix.de

i'll send a new version.

On Fri, Mar 27, 2026 at 05:34:44PM +0100, Oleksij Rempel wrote:
> changes v7:
> - drop gpiolib irq fix and make pinctrl more robust against NULL point
>   dereference.
> 
> This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) via the MFD framework.
> 
> Architecture overview:
> * mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
>   linear irq_domain. Harvests status bits from SPI MISO MSB.
> * pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
>   the MFD domain.
> * hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
>   fault alarms.
> * mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
>   temperature, VBATP) to an external ADC.
> 
> Initial pinctrl implementation by David Jander, reworked into this MFD
> architecture.
> 
> Best regards,
> Oleksij
> 
> David Jander (1):
>   pinctrl: add NXP MC33978/MC34978 pinctrl driver
> 
> Oleksij Rempel (5):
>   dt-bindings: pinctrl: add NXP MC33978/MC34978 MSDI
>   mfd: add NXP MC33978/MC34978 core driver
>   pinctrl: core: Make pin group callbacks optional for pin-only drivers
>   hwmon: add NXP MC33978/MC34978 driver
>   mux: add NXP MC33978/MC34978 AMUX driver
> 
>  .../bindings/pinctrl/nxp,mc33978.yaml         | 153 +++
>  drivers/hwmon/Kconfig                         |  10 +
>  drivers/hwmon/Makefile                        |   1 +
>  drivers/hwmon/mc33978-hwmon.c                 | 548 ++++++++++
>  drivers/mfd/Kconfig                           |  15 +
>  drivers/mfd/Makefile                          |   2 +
>  drivers/mfd/mc33978.c                         | 933 ++++++++++++++++++
>  drivers/mux/Kconfig                           |  14 +
>  drivers/mux/Makefile                          |   2 +
>  drivers/mux/mc33978-mux.c                     | 136 +++
>  drivers/pinctrl/Kconfig                       |  14 +
>  drivers/pinctrl/Makefile                      |   1 +
>  drivers/pinctrl/core.c                        |  41 +-
>  drivers/pinctrl/pinconf.c                     |   9 +-
>  drivers/pinctrl/pinctrl-mc33978.c             | 836 ++++++++++++++++
>  include/linux/mfd/mc33978.h                   |  92 ++
>  16 files changed, 2800 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
>  create mode 100644 drivers/hwmon/mc33978-hwmon.c
>  create mode 100644 drivers/mfd/mc33978.c
>  create mode 100644 drivers/mux/mc33978-mux.c
>  create mode 100644 drivers/pinctrl/pinctrl-mc33978.c
>  create mode 100644 include/linux/mfd/mc33978.h
> 
> --
> 2.47.3
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

