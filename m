Return-Path: <linux-gpio+bounces-36581-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEegLpXuAWpHmQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36581-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 16:58:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19096510B45
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 16:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 587E23021F4B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C693401494;
	Mon, 11 May 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV6FuVWC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE13FE67E;
	Mon, 11 May 2026 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511447; cv=none; b=nK6qDfAs575YjXZFA/LE22N1vlK7BQAsIv33QT2dqck1oKekFycgysNFtZHDVHF29lHLhj3eILk3m8pX8Gri4jjeTS/tqNFKozhwJDSfK6MrIt1/FELXxpg2HmMFYanwDKgMcP38H9m/EgX7GNPliEpi9Uu6KAY2i1bAi+IfMro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511447; c=relaxed/simple;
	bh=nNUfo11efGl/MFYIWaja0C+rX50U97WOabQI7mfyOII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6eeTsIe61rUr4phw1WrUhdnZcyiXU92lndmbtnqscEUISa4P4V0Kk9lF2tKLVM1PYlCxFTIIsI0ttWBjlkIxs7MiW/WFqFx+BCmzX2yjhpDuT7JK2thJ506/SwGA65t849P7wEKxxsD9B3eBSDa33gbsmGi3kAxLd+1q5l4u7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV6FuVWC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778511446; x=1810047446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nNUfo11efGl/MFYIWaja0C+rX50U97WOabQI7mfyOII=;
  b=lV6FuVWCRW0pC9OO1/GQkVgEntWne5PiTA3fNwwLoMcfoxnVPUA55TLr
   b87Wm/fpovHG9n5qmIaZxvV7SJ5YQKLM8cAsuos4H+tKjcHHL3UwCWAUe
   C8orYNapHB3N5uDKAke7tRJm79OFadlYZ99A792CEpECuZjgCOFSUPq72
   c2Wy/nySBRKa8wWQGZI3q51IkbX8jagztjz9o0yg4f9wDP0L66Oay0Vig
   IMX05q4kOxjC7PzL+Wsj8WxR6mwtjyG/xY77yfv5ou9S9uagJ/RweYINB
   iIoyWcK/N4CMK5Ds+PW/z1e9ycQt8awB8+tnNQqJoXSRuzZCmzswCPwwy
   Q==;
X-CSE-ConnectionGUID: Yk0Te78ASY6L2kTW72Ouww==
X-CSE-MsgGUID: mHszQ2HfR9ak+TgVgLe8Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90866654"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="90866654"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:57:25 -0700
X-CSE-ConnectionGUID: bXEgldawSreuGb/hXVx2rA==
X-CSE-MsgGUID: 4eej0KSaSeWgxRJM8Z56uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="237569835"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 11 May 2026 07:57:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id A5BDF95; Mon, 11 May 2026 16:57:20 +0200 (CEST)
Date: Mon, 11 May 2026 17:57:18 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: azkali.limited@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	CTCaer <ctcaer@gmail.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: bm92txx: add Rohm BM92TXX support
Message-ID: <agHuTtvwnpcjWHEA@kuha>
References: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com>
 <20260511-bm92t-v2-1-2145e4f4386b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-bm92t-v2-1-2145e4f4386b@gmail.com>
X-Rspamd-Queue-Id: 19096510B45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36581-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Alexandre,

On Mon, May 11, 2026 at 01:32:09AM +0700, Alexandre Hamamdjian via B4 Relay wrote:
> From: CTCaer <ctcaer@gmail.com>
> 
> Add a driver for the Rohm Semiconductor BM92TXX family of USB Type-C
> and Power Delivery controllers. The IC integrates an MCU that runs the
> PD state machine; the host configures it and observes status over I2C
> and reacts to a level-triggered ALERT interrupt.
> 
> The driver exposes the controller through extcon and a USB role switch,
> manages the VBUS sink, optional VBUS source and battery-charger
> regulators along with the VCONN-enable GPIO, and applies per-PDO
> charging current limits (5 V, 9 V, 12 V, 15 V) sourced from device
> tree. DisplayPort alternate-mode handling and dock LED behaviour are
> configurable through rohm,* properties so the same driver can serve
> boards that wire the part up differently. A debugfs interface under
> bm92txx/ is provided for register dumps and low-level command access
> when CONFIG_DEBUG_FS is enabled.

You need to use the USB Type-C framework for everything, not just for
the switches. The port, the partner when connected, the cable and
plugs, and all the alternate modes (the port alt modes, the plug
alt modes, and partner alt modes) need to be registered.

All that needs to be exposed properly inside kernel as well in user
space.

<snip>

> +/* VDM/VDO */
> +#define VDM_CMD_RESERVED    0x00
> +#define VDM_CMD_DISC_ID     0x01
> +#define VDM_CMD_DISC_SVID   0x02
> +#define VDM_CMD_DISC_MODE   0x03
> +#define VDM_CMD_ENTER_MODE  0x04
> +#define VDM_CMD_EXIT_MODE   0x05
> +#define VDM_CMD_ATTENTION   0x06
> +#define VDM_CMD_DP_STATUS   0x10
> +#define VDM_CMD_DP_CONFIG   0x11

Already defined in include/linux/usb/pd_vdo.h

> +#define VDM_ACK   0x40
> +#define VDM_NAK   0x80
> +#define VDM_BUSY  0xC0
> +#define VDM_UNSTRUCTURED   0x00
> +#define VDM_STRUCTURED     0x80

Ditto.

> +/* VDM Discover ID */
> +#define VDO_ID_TYPE_NONE        0
> +#define VDO_ID_TYPE_PD_HUB      1
> +#define VDO_ID_TYPE_PD_PERIPH   2
> +#define VDO_ID_TYPE_PASS_CBL    3
> +#define VDO_ID_TYPE_ACTI_CBL    4
> +#define VDO_ID_TYPE_ALTERNATE   5
> +
> +/* VDM Discover Mode Caps [From device (UFP_U) to host (DFP_U)] */
> +#define VDO_DP_UFP_D       BIT(0) /* DisplayPort Sink */
> +#define VDO_DP_DFP_D       BIT(1) /* DisplayPort Source */
> +#define VDO_DP_SUPPORT     BIT(2)
> +#define VDO_DP_RECEPTACLE  BIT(6)

include/linux/usb/typec_dp.h

> +/* VDM DP Configuration [From host (DFP_U) to device (UFP_U)] */
> +#define VDO_DP_U_DFP_D     BIT(0) /* UFP_U as DisplayPort Source */
> +#define VDO_DP_U_UFP_D     BIT(1) /* UFP_U as DisplayPort Sink */
> +#define VDO_DP_SUPPORT     BIT(2)
> +#define VDO_DP_RECEPTACLE  BIT(6)

Ditto.

> +/* VDM Mode Caps and DP Configuration pins */
> +#define VDO_DP_PIN_A   BIT(0)
> +#define VDO_DP_PIN_B   BIT(1)
> +#define VDO_DP_PIN_C   BIT(2)
> +#define VDO_DP_PIN_D   BIT(3)
> +#define VDO_DP_PIN_E   BIT(4)
> +#define VDO_DP_PIN_F   BIT(5)

Ditto.

> +/* Known VID/SVID */
> +#define VID_NINTENDO      0x057E
> +#define PID_NIN_DOCK      0x2003
> +#define PID_NIN_CHARGER   0x2004
> +
> +#define SVID_NINTENDO     VID_NINTENDO
> +#define SVID_DP           0xFF01
> 
> +/* Nintendo dock VDM Commands */
> +#define VDM_NCMD_LED_CONTROL         0x01 /* Reply size 12 */
> +#define VDM_NCMD_DEVICE_STATE        0x16 /* Reply size 12 */
> +#define VDM_NCMD_DP_SIGNAL_DISABLE   0x1C /* Reply size 8 */
> +#define VDM_NCMD_HUB_RESET           0x1E /* Reply size 8 */
> +#define VDM_NCMD_HUB_CONTROL         0x20 /* Reply size 8 */

You need a dedicated alternate mode driver for this mode.

It looks like you have a lot of duplication in this code. You really
have to refactor this whole driver. It probable does not make sense to
review this any further before that.

Please register all the Type-C (inclide/linux/usb/typec.h) and power
delivery (include/linux/usb/pd.h) components, and at least try to
handle the alternate mode VDM communication in the alt mode drivers
dedicated for each alt mode.

I also really think that that the battery charging information needs
to be exposed to user space with the power supply device class
(include/linux/power_supply.h).

Because there is a lot of stuff to be done here, please consider
splitting this into clear steps. For example, you could start by
simply registering the port and the partner, and so on.

thanks,

-- 
heikki

