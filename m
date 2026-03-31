Return-Path: <linux-gpio+bounces-34489-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI0VMcvky2l7MQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34489-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 17:14:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7936B837
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 17:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF04D303F72B
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E036840242E;
	Tue, 31 Mar 2026 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMWY71RA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2CD21E091;
	Tue, 31 Mar 2026 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969988; cv=none; b=mscOuyA6TH+Bh1gFhln28UeKMGrHUGMJj5T3/4GxNE6z7RvLDx7C5pJ2oPtcfj5dSj7VqKH9dX7Ax9j717bfG8SGpyTcqZkEzq970UWk3pNM8UMqZAijL2+yOFJeUCEaSctTf0NIYLMyrpx5pJPC5tL/TZ06Vyh5n5AKGPVy6MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969988; c=relaxed/simple;
	bh=ZpDZtBSDgtUGrlNSHGwf/tgBtVz86+YC4LivAnSFw4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6VFCS/dK38YKqqujeKd+d1fLpHIKRoI6siJ7+NbKS//664DiVcvOqqsCzJ9PVIG2mpNRPiSKlkKeNr2dlOWFY2i7P6zB1RDcvtLM8XIW+zQdYxubkWkVkV4CBON4Yc8WOyxXnTgnHSnRWn8NNHLEUK6iSiy1Zb8z4PoNSDj/AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMWY71RA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EF7C19423;
	Tue, 31 Mar 2026 15:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774969988;
	bh=ZpDZtBSDgtUGrlNSHGwf/tgBtVz86+YC4LivAnSFw4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMWY71RA3zXNIfMP7aKST+0DX2cnAj72G6kNbSgCMQbie83KyWhO8i23shN5E+uAL
	 Ubn/STrTVj79ovm++nHfSYOur8xnqbjFbVG3kDP6ELtTLX9YZEnyQQrvm412ySvrHo
	 PV6Ht+ZGpWg7uJhXy7s8e9HADU55lDOrD0p3mFJIFRee2N/VMeY+kzCpLG4uqnNNhv
	 QypR3nOuz9ogiwsdpkvlKfB1oC5Uci5EzmN381boQqay6V/sJBRhNhaO7i1RND0gwS
	 /Xe1OrQtTX2PRiYg4e/TEp406Tm85nYrRRV16V5nzxrvkOSl8M/Qd3rn+Ew7q15hSq
	 fuGMqVKY/O+WA==
Date: Tue, 31 Mar 2026 10:13:05 -0500
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v8 0/6] mfd: Add support for NXP MC33978/MC34978 MSDI
Message-ID: <20260331151305.GA1211848-robh@kernel.org>
References: <20260329090601.532477-1-o.rempel@pengutronix.de>
 <8291919d-c5ea-42ab-b2e5-2dfa16c23698@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8291919d-c5ea-42ab-b2e5-2dfa16c23698@roeck-us.net>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34489-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Queue-Id: 66F7936B837
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 08:34:31AM -0700, Guenter Roeck wrote:
> Hi Oleksij,
> 
> On 3/29/26 02:05, Oleksij Rempel wrote:
> > changes v7:
> > - drop gpiolib irq fix and make pinctrl more robust against NULL point
> >    dereference.
> > 
> > This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
> > Interface (MSDI) via the MFD framework.
> > 
> > Architecture overview:
> > * mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
> >    linear irq_domain. Harvests status bits from SPI MISO MSB.
> > * pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
> >    the MFD domain.
> > * hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
> >    fault alarms.
> > * mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
> >    temperature, VBATP) to an external ADC.
> > 
> > Initial pinctrl implementation by David Jander, reworked into this MFD
> > architecture.
> > 
> 
> I Acked the hwmon driver, but Sashiko is still not happy with several of the other
> patches in the series:
> 
> https://sashiko.dev/#/patchset/20260329090601.532477-1-o.rempel%40pengutronix.de
> 
> If the remaining issues are false positives, please let Roman and/or me know.

The binding issue is valid. However, it's an issue with many GPIO 
controller bindings that's been on my todo to address. Generally, there 
is only a reference to the provider schema when there's child nodes. 
Originally, there wheren't child nodes for GPIO, but then we added hog 
nodes. Changing things probably entails changes to gpio.yaml, so there's 
really nothing to do on this binding yet.

I really hope this sashiko stuff gains support soon in a form I can 
review first and email out rather than dropping links into threads. It 
is not a great workflow as-is.

Rob

