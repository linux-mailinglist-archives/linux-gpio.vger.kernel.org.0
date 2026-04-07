Return-Path: <linux-gpio+bounces-34836-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG/hF71P1WnA4gcAu9opvQ
	(envelope-from <linux-gpio+bounces-34836-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:41:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CACEF3B2FD8
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62C153023DBF
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E604433D4E8;
	Tue,  7 Apr 2026 18:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sI/mLUzr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C233A718;
	Tue,  7 Apr 2026 18:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587257; cv=none; b=jJmitEt4m5ejeN+cPwpjpkAfDABHHENGRj1J6AbKQEZe3LBwvyjQZhVhrhJJ2+6wLKlZMHtav0Nx/Deb39lSsS/mZoJln5UvO+qxrvO/gvF2g8+5rOMyOWiEnRgaiy7jT8KErOcX2rMiKgjAWj6/YeqXVuy37LVJQ8zwlFREjbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587257; c=relaxed/simple;
	bh=ctBJBNAL2sZVwDJhXMphkJ4Ne0SfUaEL20su6jHmPpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br8oIp4UdY+/aQw72CbwbSRMp3BoS+NOupN+AmbOPV4iXJiPi70YPRSQdWPpFP23mRJWnJv5afDOrTI+gkCYfzUtsQDzQoH+ZGtACElcbAwFDuI5yy3rz0qosDDk/tX/j99UAOQECVXeRP1rDJfHcAq4w8dUXq7l9ZDixXA2JQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sI/mLUzr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA0BC116C6;
	Tue,  7 Apr 2026 18:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775587257;
	bh=ctBJBNAL2sZVwDJhXMphkJ4Ne0SfUaEL20su6jHmPpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sI/mLUzrYB0p0h7F+qggqo+B7Iixi3QUIFCsUfYOUxnIZWiwOZgq7ZpCn339TFSkK
	 /Bh2Vxl6Ng5B8rBSa7tzwXMlVhRi7hjYXswf7R7EHaz2nIvV0fNuEvc/AbusGP/y5Z
	 9c3TZdbLIIDHjOYNTGyTt4Rx6zte92EOWG+3mssFLmsgbzu7+UhULF/innTCtcaPkX
	 OznSjTzMz2iwVcW5IICmamnUgnIMPjy87/mqyizz+/U7eoWymD5sbqpL8dMZBNbDYh
	 zFpClBRqO00vxOHRu2DZyvpCjlwNyxQWuLHoeEhS1p4r1EmCZeFwUri8Ixtmza/hrn
	 6NnjaEZ03aDRg==
Date: Tue, 7 Apr 2026 13:40:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: increase IRQ
 banks number
Message-ID: <177558725508.3367275.431498004414263153.robh@kernel.org>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327113006.3135663-3-andre.przywara@arm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34836-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: CACEF3B2FD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 11:30:05 +0000, Andre Przywara wrote:
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so we
> need to increase the maximum number of interrupts per pin controller to 11,
> to be able to assign the correct interrupt number for each bank.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


