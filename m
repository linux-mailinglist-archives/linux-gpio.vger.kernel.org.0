Return-Path: <linux-gpio+bounces-32200-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEoPBAoBoGlrfQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32200-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 09:15:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C53601A25FE
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 09:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2024E302B800
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 08:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9A51F3B87;
	Thu, 26 Feb 2026 08:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVAZ0PST"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AC7393DD0;
	Thu, 26 Feb 2026 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772093664; cv=none; b=P7OzBXziatzPdG3qxxzsn7LHSNZwksSRufX/VJiY7tQmq2BcBNPdXg9exRx73fyyfIZe7ZHP96uwwPjw47hY8qV9GIuoyydS31/tmckedGZLcZjzbrhYgUljgFIjDKQHgZFqQX2XJy4NedauA4KDaDuID6EVJTGzwuptzBVIJ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772093664; c=relaxed/simple;
	bh=cBpqaklPgQ6xybJT3rEGKeqVJUEAUPVKjiNELQPOr+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufETlpBjdH5IBwT9SSY2HGmzScileH/g2ihkxppsPec2XGE1VRePtnzmTmR0+COWnZGiTypM2xcObUL5jFrbtsJkETCvRr9Mr4x/rji0tsRoyTt0hmtXGit8oIaoT7ydW8a3MwANl5xerKyS0++Ao1KBVL+b2TxPjjFG7/ALJfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVAZ0PST; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165C7C19422;
	Thu, 26 Feb 2026 08:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772093663;
	bh=cBpqaklPgQ6xybJT3rEGKeqVJUEAUPVKjiNELQPOr+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVAZ0PST4028/rspSSSNjNZIiiOUJUqm00AokSR28g2JF/46tL3BpzN5y7u8h+hCr
	 neeiiqeUG93ugaSXW9uyFNGEkm3BJortAgXw0mdX5F3hJYTyuAVKsOhyw+tf+3XsxV
	 fvWPMKU5cfCslslUBVOnVqIGGOLcTGbK0hTJpHy7evN7MkCw483FQZ1T+T6pZsu/2J
	 +D0Z8paj/OXFb8ICWMKVLEiCc0KFRNWIgD0hY03HDyBd/BlAYENzQE+r9Nk1fQfgjj
	 BoBYTaAg5T1EWChnfoGcVwIjyuz4P2PwILlvvg6lezn96Lt3K2az5oztNk4kSa1N+E
	 1TxaUuS9IjhKw==
Date: Thu, 26 Feb 2026 09:14:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v1 7/8] dt-bindings: mux: add NXP MC33978/MC34978 AMUX
Message-ID: <20260226-clever-rustling-dolphin-871aff@quoll>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-8-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225171545.1980385-8-o.rempel@pengutronix.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32200-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C53601A25FE
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:15:40PM +0100, Oleksij Rempel wrote:
> +description: |
> +  The MC33978 and MC34978 include a 24-to-1 analog multiplexer (AMUX) that
> +  routes one of the following signals to an external AMUX pin for measurement
> +  by an external ADC:
> +
> +  - Channels 0-13: SG0-SG13 switch input voltages
> +  - Channels 14-21: SP0-SP7 switch input voltages
> +  - Channel 22: Internal temperature diode
> +  - Channel 23: Battery voltage (VBATP)
> +
> +  The AMUX requires a settling time of up to 200 us for full-scale voltage
> +  steps. Consumers (e.g., io-channel-mux) must configure this delay.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,mc33978-mux
> +      - nxp,mc34978-mux
> +
> +  '#mux-control-cells':
> +    const: 0

No resources here, so this should not be separate device node but folded
into the parent.

Best regards,
Krzysztof


