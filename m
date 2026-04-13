Return-Path: <linux-gpio+bounces-35120-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGVbBoAm3WlpaQkAu9opvQ
	(envelope-from <linux-gpio+bounces-35120-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 19:23:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D43F14BF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 19:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6CC5306B518
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 17:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CD534751D;
	Mon, 13 Apr 2026 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gt0wjp5U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FA433D6D5;
	Mon, 13 Apr 2026 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776100667; cv=none; b=luZT/z2nMPceb5KFFXHv28FeWe+DE8FSohrtGxoIyda9lzJ4KvdVrtkst0J9u1HymXQIdhby79XzOHrdOsOmp4yFV844W5v9ZSWornOrLcAMJJkzriCtcfiCFq4TJvM8p5LSJzQKYzBBeKOkg3NPO5EBaYiqHNkbZBdagmHLUfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776100667; c=relaxed/simple;
	bh=zqGratdcxgapw7SS8IffSRfnik8afWXdzTd3mosfEz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrFEYqEXha3Qz/hLINZlf90HdjN6cFZ0JtKX2d25MoDJS/gBHfPumI1+OUUJohD8OJuA0zvye5m/AE6g1jDY9TJaORJjTDpOLOM6wwz3TPzSxvUQBdkj4GrrT4FZV4G9TDMMlWHZtgsMVrVkBMbVPX1lshVBvMQT+5ZCTlrk52o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gt0wjp5U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15227C2BCAF;
	Mon, 13 Apr 2026 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776100667;
	bh=zqGratdcxgapw7SS8IffSRfnik8afWXdzTd3mosfEz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gt0wjp5UmjoF0q/M3rWOvt5FXzhrk2ihwExKAyOfdmCYgTmLMTpV8A00feWej9kdo
	 H7DlSOm25KI8Ft1/Jm0i3DX416gtJ90hr5Kq6O3f4Iftu6GrF3pv86mVl6aj3knlwT
	 gLrFu+JzmsjpyoauaBFpmmfWy969Enci3nAB+e0wqCuuZ9Bh+3KxMg7FXxEJoxP4YY
	 Cl9sM5b6sPktIYswt/USmcsa4VDab5J54PeciRRq19cJmWYZnp/o5Zt77KGoj0UQu1
	 EJUhmpI1G44xuEjOUsFcM2AZ/GzU9t4CivR6vQBQ0/juu5ofov+eft994V5IUyA9LJ
	 Bk8KOtcoo/RBw==
Date: Mon, 13 Apr 2026 12:17:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org,
	Prathamesh Shete <pshete@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: nvidia,tegra234: Add missing
 required block
Message-ID: <177610066469.3066647.8560667150226878953.robh@kernel.org>
References: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35120-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 881D43F14BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 10 Apr 2026 13:10:48 +0200, Krzysztof Kozlowski wrote:
> Binding should require 'reg' property, because address space cannot be
> missing in the hardware and is already needed by the Linux drivers.
> Require also 'compatible' by convention, although it is not strictly
> necessary.
> 
> Fixes: 857982138b79 ("dt-bindings: pinctrl: Document Tegra234 pin controllers")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml          | 4 ++++
>  .../devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml   | 4 ++++
>  2 files changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


