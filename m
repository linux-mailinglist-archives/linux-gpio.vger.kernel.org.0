Return-Path: <linux-gpio+bounces-32202-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id w3W/LKUBoGl/fQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32202-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 09:17:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF71A2640
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 09:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C63A300E246
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 08:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1003A312831;
	Thu, 26 Feb 2026 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkkyDG4q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C549B296BD5;
	Thu, 26 Feb 2026 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772093858; cv=none; b=TjVK4sXmMuDWfvHWpi0GnR+qUaPL5zW8CUS7f89i9ek4+60uEb4v/bJ5gULjRsnCdfzAZuEVkJtYcJJT8BYVJwOQEbPT/VtxWihN3T/97sl8IeBbdQRX9/T2gweFIud+79qIN38M7F2tCTTttqIR3euh6DAN9sv4GZJOIAdALC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772093858; c=relaxed/simple;
	bh=JTkxhBQNd4NP6Dkrc/k7HwOtTkffw+vUL0VDN0SYoi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYAdMDNmEE7A1tLR23SjjD0X3rMV7q4IN/4Z9DzgMtM0g1lkhgjnE14Uhw1qHva3ypn37ajy7IS4cFDIhmHPz4Zw+x6erGsLDG0vm61jc+Qy9OdtXp8favAuHSURUhbNvxN6kXD4tvckv0gwUiQMZ+xhYpc2cUPdaKnGsY8CwB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkkyDG4q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9BDC19422;
	Thu, 26 Feb 2026 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772093858;
	bh=JTkxhBQNd4NP6Dkrc/k7HwOtTkffw+vUL0VDN0SYoi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkkyDG4qQLbqUmDaz+5Pe7+a8Cei6G08UXf5MsPgrxQIeBPQWViS3D3ODBLTWmlLg
	 psAJqOtg92huTc7G84jSVXXGJaGDEIC8W78WozE+jH1goSECy+Eq70/AbkdCZdQda6
	 FkGVEM9XSFFcZNnzMCkg2ProBxNsFqTkEmhQYwh6NbCC4PT5kprTtudjE3iVqHt591
	 dTTEne1ZYOce+xzcIRlgu5/K14DPeOYtDj8IVCUj+89AGvzi8WHSTjOe7vNOJrOJ2Q
	 EnB8tW5Y3TgsL6f2dl0edwgGWZzG9HYPohLcgIKxA2silccfF7Q1c93w4L7jGo7EF7
	 T1QhoI1rHEttQ==
Date: Thu, 26 Feb 2026 09:17:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v1 5/8] dt-bindings: hwmon: add NXP MC33978/MC34978 hwmon
Message-ID: <20260226-deft-inquisitive-bandicoot-7fbbfb@quoll>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-6-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225171545.1980385-6-o.rempel@pengutronix.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32202-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,devicetree.org:url,protonic.nl:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CAF71A2640
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:15:38PM +0100, Oleksij Rempel wrote:
> Add device tree binding documentation for the hardware monitoring block
> of the NXP MC33978/MC34978 Multiple Switch Detection Interface (MSDI).
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../bindings/hwmon/nxp,mc33978-hwmon.yaml     | 34 +++++++++++++++++++
>  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 10 ++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nxp,mc33978-hwmon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nxp,mc33978-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/nxp,mc33978-hwmon.yaml
> new file mode 100644
> index 000000000000..b7e2aaa51a33
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nxp,mc33978-hwmon.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/nxp,mc33978-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP MC33978/MC34978 Hardware Monitor
> +
> +maintainers:
> +  - David Jander <david@protonic.nl>
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description: |
> +  Hardware monitoring driver for the MC33978/MC34978 MSDI device.
> +  Provides fault detection and monitoring for:
> +  - Battery voltage (VBATP) faults: undervoltage, overvoltage
> +  - Temperature faults: over-temperature, warning threshold
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,mc33978-hwmon
> +      - nxp,mc34978-hwmon
> +
> +required:
> +  - compatible

This is completely empty thus pointless. Do not create nodes which has 0
properties (compatible does not count since it is used to tell what the
device is).

Best regards,
Krzysztof


