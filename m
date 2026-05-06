Return-Path: <linux-gpio+bounces-36248-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOXaOsOc+mkKQQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36248-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 03:43:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A404D560A
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 03:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1185D300620C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 01:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E824726ED3D;
	Wed,  6 May 2026 01:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIWF5+nQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACEE258EF9;
	Wed,  6 May 2026 01:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778031804; cv=none; b=eGDgXTeK0k/fagyTjxKau96VQy2KZ4aLinIS5NLSD9fYL3+CTDRZmtv4OrcZ+/zkL8uO3eONmwa4/UC+vCB1hLRBwpsR5Ftk0ZmqnRfgGP2WJLo8kzyEs2legNFdY0C17bvcXAzt2TfNPN4LxsXoOtsUVPr8lu5/Kzk+cskGpnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778031804; c=relaxed/simple;
	bh=vSPiDgJ0IkynnZonv8Pb+B5VUe/T3NmI2G4+fg17vlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/X4W0lwS8XgE/5lOWci1yhW5gz4C8Nf+zpZvv8SAH1zBBjg0syHpH8JVo9erxFS4fpA+fZrTLq+iCVYpjjnDJ1519NFgX++AANInE9Z7N/rHRWLz7/ES47wEw8a03ipULTRxrPq2efjelgw72YyHd2VvS8G3phzAASpAKLk9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIWF5+nQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11332C2BCB4;
	Wed,  6 May 2026 01:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778031804;
	bh=vSPiDgJ0IkynnZonv8Pb+B5VUe/T3NmI2G4+fg17vlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YIWF5+nQEZRPqEYYEOo13NiSq/4G3uObvMlisFqsvSk4sg+Z7wZ+Vhlj0cf9eviBZ
	 H/aV1zvXqD6NDraiftci1LHUasqpW8hzynBgRP0x6eKvV7alJz1oJfm+LRPxHcR5pZ
	 MTawc7sRQIFFfbZOlUU8PIpG0TEdSgNCqYsngbHH+7Hp1HgUtWcwx1ZAr3cZPXR+2H
	 +AQUDEbcqMcJsU8VYWHlPKh4AAus7Nc8U2X01yFwjdKtLIMR+RODA3lfebIDD3d1yi
	 1INYC5M8AbCOHv/2+b2PjR1zxjlt2xe+JNin3piGraOgKYkAC4PLmfiZINe4zg37EH
	 6P+QjfgasM5vA==
Date: Tue, 5 May 2026 20:43:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chanhong Jung <happycpu@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: fairchild,74hc595: add
 lines-initial-states property
Message-ID: <177803180135.280005.13996377729144610896.robh@kernel.org>
References: <cover.1776872453.git.happycpu@gmail.com>
 <20260429035134.1023330-2-happycpu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429035134.1023330-2-happycpu@gmail.com>
X-Rspamd-Queue-Id: 02A404D560A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36248-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]


On Wed, 29 Apr 2026 12:51:33 +0900, Chanhong Jung wrote:
> The 74HC595 and 74LVC594 shift registers latch their outputs until the
> first serial write, so boards that depend on a specific power-on pattern
> (for example active-low indicators, reset lines, or other signals that
> must come up non-zero) have no way to express that today: the Linux
> driver always writes zeros from its zero-initialised buffer during
> probe.
> 
> Document support for the existing lines-initial-states bitmask, already
> defined for nxp,pcf8575, so the same convention covers this output-only
> device. Bit N corresponds to GPIO line N. Because the 74HC595/74LVC594
> family is push-pull output only (no input mode, no high-impedance state
> under software control), bit=0 drives the line low and bit=1 drives it
> high; this differs from nxp,pcf8575, where the 0/1 polarity reflects the
> quasi-bidirectional nature of that part.
> 
> The bitmask covers up to 32 lines, which fits the typical 1-4 chip
> cascades that appear in tree. Should longer chains require seeding in
> the future, the property can be extended to a uint32-array without
> breaking the bit-N-equals-line-N convention.
> 
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Chanhong Jung <happycpu@gmail.com>
> ---
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


