Return-Path: <linux-gpio+bounces-37942-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3QkGMsSHIWrkIAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37942-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 16:12:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F803640B82
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 16:12:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TgxsEfmZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37942-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37942-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DE4E3118D72
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 13:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D070647ECFF;
	Thu,  4 Jun 2026 13:51:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA24219EA;
	Thu,  4 Jun 2026 13:51:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581115; cv=none; b=UUKlEX45iP1J5AmOv/ngxapgiKnmM4hmt6sMyZGQ8b9d2bOGsoG9ZgYnCGvSgsd+mPNoIj3exWud1owllW+y75srlpjnfv65mDiSlkH/Q36jamTSKDKhATCvOHIBJ6K9KtOl+N/YGSn5lKIMPtMGA/67TjRZByASGLlFpuOAVWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581115; c=relaxed/simple;
	bh=cTdmqpJieRKHGaZXowXNPlqGx2BALwhboDTiLWTpksw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7ELi01t1SqZslR9NW7zpLHRfwpoOj9eAzhxYpKyoInG1n+YO8baQov3td8ZMqvaxmw60qT8+v82kbyELDeCy9M2v5rW6OI2eMz0d2o9GmLMV3KPCH9uisRO5i34WScMHQ8eIg+TieulT4I/hUozH2K1wHx5c2tyBhnOUDHu4UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgxsEfmZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326F11F00893;
	Thu,  4 Jun 2026 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780581114;
	bh=lRF+QmqB9DlPbjnMDVrl0P136gkTPbDYComnEEWDIUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TgxsEfmZ4NYxI2WgZWB6KZAEe45x4gh3wuEIFdH86ADbvWvROezwVQcLo/c4zJpDP
	 RYYwgBC2erYIPLQ95A2xrcXOrgaR9YqSVa40fHOKMUm6d44ReBCKtXJAppkNbwXrl2
	 yCqEWiLUe/EU/ITFsuFEvmLMoWpGTjfFgYGPLLZ1OJslAf6UjBJEoylwlfdOeKsocu
	 8D4BpKYb8VWaQOhT/xyRtgc2ewSZxKqxiU4zFF6glWtQWrdqVGR9XRbbd7NOipTlyg
	 WnEOTmePNhOrrtGXK5G8w18rfuXNUPByAQvcu7l6AG4zG7L0wUk/lXIOHUtRLx4Hyb
	 3Xh7npHfrAAcQ==
Date: Thu, 4 Jun 2026 14:51:48 +0100
From: Lee Jones <lee@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v12 2/6] mfd: add NXP MC33978/MC34978 core driver
Message-ID: <20260604135148.GB4151951@google.com>
References: <20260515160537.115808-1-o.rempel@pengutronix.de>
 <20260515160537.115808-3-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515160537.115808-3-o.rempel@pengutronix.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37942-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:o.rempel@pengutronix.de,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peda@axentia.se,m:linusw@kernel.org,m:kernel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:david@protonic.nl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F803640B82

On Fri, 15 May 2026, Oleksij Rempel wrote:

> Add core Multi-Function Device (MFD) driver for the NXP MC33978 and
> MC34978 Multiple Switch Detection Interfaces (MSDI).
> 
> The MC33978/MC34978 devices provide 22 switch detection inputs, analog
> multiplexing (AMUX), and comprehensive hardware fault detection.
> 
> This core driver handles:
> - SPI communications via a custom regmap bus to support the device's
>   pipelined two-frame MISO response requirement.
> - Power sequencing for the VDDQ (logic) and VBATP (battery) regulators.
> - Interrupt demultiplexing, utilizing an irq_domain to provide 22 virtual
>   IRQs for switch state changes and 1 virtual IRQ for hardware faults.
> - Inline status harvesting from the SPI MSB to detect and trigger events
>   without requiring dedicated status register polling.
> 
> Child devices (pinctrl, hwmon, mux) are instantiated by the core driver
> from match data.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v12:
> - Split monolithic MFD driver into two modules per maintainer feedback:
>   * drivers/mfd/mc33978.c: Thin wrapper for SPI binding, power sequencing,
>     and child device registration
>   * drivers/platform/misc/mc33978-core.c: Complex core functionality
>     including custom regmap bus, IRQ domain, and event handling
> - Add mc33978_core_init() API exported by core module for MFD initialization
> - Introduce CONFIG_MC33978_CORE in drivers/platform/misc/Kconfig
> - Update CONFIG_MFD_MC33978 to select CONFIG_MC33978_CORE
> - Add MODULE_SOFTDEP("pre: mc33978-core") to ensure correct module load order
> - Rename struct mc33978_mfd_priv to context-specific names:
>   * mc33978_ddata in MFD driver
>   * mc33978_core_data in core module
> - Rename local variables from 'mc' to 'ddata'/'cdata' for clarity
> - Replace MC33978_DRV_NAME macro with string literal "mc33978"
> - Convert kerneldoc (/** */) on static functions to regular comments (/* */)
> - Adopt 100-character line limit throughout
> - Fix misleading cacheline alignment comment ("must be at end" -> "prevent
>   DMA corruption from adjacent fields")
> - Document IRQ locking strategy explicitly (irq_lock mutex for regmap/SPI,
>   irq_state_lock raw spinlock for atomic state access)
> - Reformat header file comments from inline style to preceding style for
>   improved readability
> - Enhance interrupt behavior documentation with detailed datasheet references
>   explaining INT_flg clear timing and FAULT_STAT latching behavior
> - add .suppress_bind_attrs = true
> changes v11:
> - Introduce synthetic wakeup bit to prevent hardware bit overloading and
>   avoid phantom transient faults.
> - Add smp_mb__before_atomic() to ensure memory visibility before
>   updating harvested_flags.
> - Update event processing to mask synthetic bits before evaluating
>   hardware fault conditions.
> - Introduce fault_lock spinlock to protect fault state members.
> - Replace manual memory barriers and READ_ONCE/WRITE_ONCE with
>   spinlock-protected access.
> - Introduce irq_state_lock raw spinlock to protect IRQ state fields.
> - Replace irq_lock mutex with raw spinlock in IRQ callbacks and event
>   handling paths.
> - Include MC33978_REG_ENTER_LPM in volatile and precious ranges.
> - Mark MC33978_REG_ENTER_LPM as readable to avoid regcache sync writes.
> changes v10:
> - Refactor IRQ setup into a common helper to unify the .map and .alloc
>   code paths.
> - Enable hierarchical IRQ support to allow integration with the
>   pinctrl/GPIO child domain.
> - Simplify event handling by removing redundant boolean return values
>   from internal handlers.
> - Fix IRQ cleanup by disposing of all active mappings before removing
>   the IRQ domain.
> - Standardize IRQ constants using MC33978_NUM_IRQS for consistent domain
>   sizing and bounds checks.
> changes v9:
> - Fix null irq_domain dereference from debugfs race by initializing IRQ domain
>   early before regmap initialization.
> - Refactor mc33978_handle_fault_condition() to improve readability by keeping
>   variable declarations at the top and adding inline comments.
> - Fix spurious transient fault events caused by redundant STAT_FAULT flags
>   during event loop.
> - Fix spurious interrupt loops by explicitly returning -ENODATA in
>   mc33978_rx_decode() for registers without status bits.
> - Validate hwirq bounds in mc33978_irq_domain_alloc() to prevent corruption
>   of irq_rise/irq_fall bitmasks by malformed device tree inputs.
> - set DOMAIN_BUS_NEXUS
> - Protect work on teardown
> - remove IRQF_SHARED
> changes v8:
> - Fix TOCTOU race condition in SPI event harvesting loop by grabbing
>   harvested_flags before hardware reads.
> - Fix broken hierarchical IRQ allocation by replacing
>   irq_domain_set_hwirq_and_chip() with irq_domain_set_info() and passing
>   the handle_simple_irq flow handler.
> - Fix out-of-bounds stack read and endianness bug in for_each_set_bit() by
>   typing fired_pins as unsigned long instead of casting u32.
> - Prevent DMA cacheline corruption by explicitly aligning rx_frame with
>   ____cacheline_aligned to separate it from tx_frame.
> - Prevent spurious IRQs by verifying irq_find_mapping() returns non-zero
>   before calling handle_nested_irq().
> - Prevent missed transient hardware faults by explicitly evaluating
>   hw_flags in mc33978_handle_fault_condition().
> - Fix missing memory barrier in mc33978_harvest_status() with
>   smp_mb__after_atomic() to ensure harvested_flags visibility.
> - Fix devres use-after-free teardown race by using INIT_WORK and a custom
>   cancel action after the IRQ domain is destroyed, instead of
>   devm_work_autocancel.
> - Prevent spurious pin interrupts on boot by priming cached_pin_state via
>   a regmap_read() during probe before enabling IRQs.
> - Implement .irq_set_wake callback to support system wake from
>   hardware faults and switch state changes.
> changes v7:
> - Fix event handling race condition with smp_mb()
> - Replace INIT_WORK() with devm_work_autocancel()
> changes v6:
> - Remove the hardcoded bypass in irq_set_type to allow child drivers to
>   configure the FAULT line for edge-triggering.
> - Implement software edge-detection for FAULT interrupt.
> - Add MC33978_FAULT_ALARM_MASK to the shared header for child devices
> - Use READ_ONCE() and WRITE_ONCE() for lockless shared state variables
>   (cached_pin_mask, irq_rise, irq_fall, bus_fault_active,
>   cached_fault_active) accessed across the SPI harvesting context and
>   the event worker.
> - Add an if (hwirq < MC33978_NUM_PINS) guard in irq_mask() and
>   irq_unmask() to prevent the FAULT hwirq (22) from altering the
>   physical pin mask registers.
> - Lowercase the error strings in dev_err_probe()
> - Add inline comments explaining the irq_map fallback behavior
> changes v5:
> - no changes
> changes v4:
> - Removed .of_compatible strings from the mfd_cell arrays
> changes v3:
> - Select IRQ_DOMAIN_HIERARCHY in Kconfig
> - Add .alloc and .free callbacks to irq_domain_ops to support hierarchical
>   IRQ domains
> - Set IRQ_DOMAIN_FLAG_HIERARCHY flag on the core MFD irq_domain
> - replace manual lock/unlock with guard()
> changes v2:
> - Rewrite the driver header comment
> - Explicitly reject IRQ_TYPE_LEVEL_HIGH and IRQ_TYPE_LEVEL_LOW in
>   mc33978_irq_set_type() to correctly reflect the hardware's edge-only
>   interrupt capabilities.
> - Pass the hardware fault IRQ to the hwmon child driver via mfd_cell
>   resources, rather than requiring the child to parse the parent's irq_domain.
> - Ensure the Kconfig strictly depends on OF and SPI
> ---
>  drivers/mfd/Kconfig                  |   15 +
>  drivers/mfd/Makefile                 |    2 +
>  drivers/mfd/mc33978.c                |  187 +++++
>  include/linux/mfd/mc33978.h          |  160 ++++

This is one patch.

>  drivers/platform/Kconfig             |    2 +
>  drivers/platform/Makefile            |    1 +
>  drivers/platform/misc/Kconfig        |   10 +
>  drivers/platform/misc/Makefile       |    6 +
>  drivers/platform/misc/mc33978-core.c | 1106 ++++++++++++++++++++++++++

This should be in another.

>  9 files changed, 1489 insertions(+)
>  create mode 100644 drivers/mfd/mc33978.c
>  create mode 100644 drivers/platform/misc/Kconfig
>  create mode 100644 drivers/platform/misc/Makefile
>  create mode 100644 drivers/platform/misc/mc33978-core.c
>  create mode 100644 include/linux/mfd/mc33978.h

-- 
Lee Jones

