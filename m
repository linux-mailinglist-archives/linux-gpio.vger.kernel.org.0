Return-Path: <linux-gpio+bounces-31338-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GrvOOt98fWmGSQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31338-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jan 2026 04:54:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B10C0973
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jan 2026 04:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E27153014411
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jan 2026 03:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2952DECC5;
	Sat, 31 Jan 2026 03:54:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A177D4A01;
	Sat, 31 Jan 2026 03:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769831644; cv=none; b=GpC/6gNgrWWUZeZrsCgVQ1Bg2K+YVWupFz9vIcQMouxeRnCOQqJgpwkq5Q6XX5+ntZjJ+zJiWPv+sQrD2pgI1HgQQ7Z54bv+IsYVsSltqn3yJ9xBPVDw8eXCYMTGA6yApyaTSJbFq4BPqquxlhRbGkWJRNMAvRV5laeDGnMb9W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769831644; c=relaxed/simple;
	bh=yjiB7aezTpXpTcRaByv43fFKDZUUuhwApJbv4kk8ofM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMQV1cZ/fHie48kao8yaB+urOguRB5y6Zb5C0cX9AGSBoF4YeeXmDkAOBmqRQzxcwrAo5P+JJO032CsBPZwnrMPMBJu6xxw3L8wGmP8n4aHY+qoaRC+oicFkl9IACOcKgTPxhPk+XPG+Lj6kWgqKHnKk/iCpZDr0aLNNg09PIWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 34E413421B3;
	Sat, 31 Jan 2026 03:54:00 +0000 (UTC)
Date: Sat, 31 Jan 2026 11:53:49 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: spacemit: fix drive-strength check
 warning
Message-ID: <20260131035349-GYA104837@gentoo.org>
References: <20260130-k3-pinctrl-io-drv-fix-v1-1-077aec3ba7ae@kernel.org>
 <20260130-outsmart-ether-73a7927b4c95@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-outsmart-ether-73a7927b4c95@spud>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gentoo.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31338-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@gentoo.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E3B10C0973
X-Rspamd-Action: no action

Hi Conor,

On 17:11 Fri 30 Jan     , Conor Dooley wrote:
> On Fri, Jan 30, 2026 at 07:22:15PM +0800, Yixun Lan wrote:
> > The problem is that one value from drive-strength may match to more than
> > two different enum groups which lead to DT complaint, switch to use 'anyOf'
> > to fix this kind warning.
> > 
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> And I guess:
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
Yes, thanks for the reporting and fix suggesstion

-- 
Yixun Lan (dlan)

