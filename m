Return-Path: <linux-gpio+bounces-34616-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBVGHEbNzmk6qQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34616-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 22:10:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A35138DDF1
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 22:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 215B43028888
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 20:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6410A38B7B0;
	Thu,  2 Apr 2026 20:10:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F4E207A20
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 20:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775160626; cv=none; b=VYqzw+ZIvWCQquN822ahVaVkplHu5sYMf6mERw23RW8k/1NT2SVHrIFf4AG8pX6Bs+2MpXPfX0rxZeSSkFrk82bj8FaqzxFiHTrANLlVLPwZzKUxtRxo0TXChEaxh46selp2XntvdLmVhXo+mR7WLWDTIfZkLMd9CYIB9lj3SK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775160626; c=relaxed/simple;
	bh=yHELw4qGLIe3pkJSjVa3khr2kUsuHzRA9KBiP2pxPiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0xBTCcd2KGmlaCQX5sBIAEDcVzqsa9tlHO8gKE0+XOvLtNQt+KgIyiWYVRKpqYZFtI8G2h9mZ1XG0YB7gOmlO6ycgA78q3D52iGdz3KEXITE4jd+dRPntQ9zC9YQR7hXZHhyi5IQGEY5CtGxqfQeAkKLPz2aw3iXIp1QPGgwZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w8OMY-0006PG-Fh; Thu, 02 Apr 2026 22:09:58 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w8OMX-003Qb3-2a;
	Thu, 02 Apr 2026 22:09:57 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w8OMX-00000003GJH-2slL;
	Thu, 02 Apr 2026 22:09:57 +0200
Date: Thu, 2 Apr 2026 22:09:57 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v10 0/6] mfd: Add support for NXP MC33978/MC34978 MSDI
Message-ID: <ac7NFT818QvR9EWK@pengutronix.de>
References: <20260402174349.3220518-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402174349.3220518-1-o.rempel@pengutronix.de>
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34616-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	NEURAL_SPAM(0.00)[0.036];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Queue-Id: 8A35138DDF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://sashiko.dev/#/patchset/20260402174349.3220518-1-o.rempel%40pengutronix.de

TL;DR: Sashiko's analysis of the phantom transient fault interrupt is
correct, but the behavior is an acceptable compromise given the hardware
limitations. I would be glad if this driver could be accepted without
additional modifications, as it has already passed human review and
addressed 99% of bot comments.

---

The MC33978/MC34978 hardware's interrupt architecture is problematic:
1. INT_B is clear-on-read for *any* SPI transaction.
2. For persistent faults, INT_B immediately re-asserts if the fault remains.
3. Fault flags are latched and only cleared when the hwmon child reads
   the FAULT register.

If the core driver passed the raw hardware state, the system would hang
in an interrupt storm (INT_B low -> SPI read clears it -> hardware
re-asserts -> repeat).

To prevent this storm, the core implements a software edge-detection
cache. When the hwmon child finally clears the fault latch, the core's
cache gets out of sync. Re-syncing it requires the synthetic wake bit
mentioned in the report, which causes the spurious interrupt edge.

The result is just one extra hwmon wakeup/SPI read when a fault clears.
Working around this would require more complexity. Trading one spurious
interrupt to prevent a hardware interrupt storm is an acceptable cost
for this silicon.

On Thu, Apr 02, 2026 at 07:43:43PM +0200, Oleksij Rempel wrote:
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
>  .../bindings/pinctrl/nxp,mc33978.yaml         |  158 +++
>  drivers/hwmon/Kconfig                         |   10 +
>  drivers/hwmon/Makefile                        |    1 +
>  drivers/hwmon/mc33978-hwmon.c                 |  549 +++++++++
>  drivers/mfd/Kconfig                           |   15 +
>  drivers/mfd/Makefile                          |    2 +
>  drivers/mfd/mc33978.c                         | 1088 +++++++++++++++++
>  drivers/mux/Kconfig                           |   14 +
>  drivers/mux/Makefile                          |    2 +
>  drivers/mux/mc33978-mux.c                     |  141 +++
>  drivers/pinctrl/Kconfig                       |   16 +
>  drivers/pinctrl/Makefile                      |    1 +
>  drivers/pinctrl/core.c                        |   41 +-
>  drivers/pinctrl/pinconf.c                     |    9 +-
>  drivers/pinctrl/pinctrl-mc33978.c             | 1008 +++++++++++++++
>  include/linux/mfd/mc33978.h                   |   95 ++
>  16 files changed, 3143 insertions(+), 7 deletions(-)
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

