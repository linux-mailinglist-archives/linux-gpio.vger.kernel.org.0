Return-Path: <linux-gpio+bounces-30965-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPs4OrY6c2kztgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30965-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:09:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D34B7302B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4472C301494D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5FB32FA38;
	Fri, 23 Jan 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlKO0GuA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA362E401;
	Fri, 23 Jan 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769159066; cv=none; b=YrT3ardde/e18OLkoXw+azQ0Z5rVYAqy3mpIYBAJ0rYXcInVikM3NSzN/aDhVUIbIFTmwGyvK3VbRzxE8i5sHGJxUg7CR6b7oHHMLo/p03HnOxtZnbL57yJpnYAcUaYOqxtMi5suyLE8+HB8LsAQb7wfNF1rp9PCxqEHMNoJat0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769159066; c=relaxed/simple;
	bh=XCFl2REXVO6EuffUy52nWk8JGTDRVPijstsX6bLq2i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+9CpWjVpLjRrOrdn++/eEeL73bOX5cNTRmeGetJY+I3BrFdsq0Q370g1hrBzuEc2JJXtaFNU6ecFu4z93NooN6sl1xLpyXikDU0u+mVTnMvJZI6SI6xbn2l9aHGANUY9Danud30baSWtiU75s8aRBXg0Lj/SMOc9m+vpHICqOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlKO0GuA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9029C4CEF1;
	Fri, 23 Jan 2026 09:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769159066;
	bh=XCFl2REXVO6EuffUy52nWk8JGTDRVPijstsX6bLq2i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlKO0GuAhbcAOFDeuH+OguoUC5C87tY/AcYuWt2ZGfHsZCCyoiS9J08eAvthk7zGS
	 nvQ/OAJl3rwR0oSSq01lVqGJE5Mg0qW+XRwSucsFb7xuwgXRzuhDxTxqvtMFRKlaQ7
	 gUuFgAqUJGEWd1vDupBFmiOXVllTIYsGv3YQSIcygkffgPve3BvEPHjgkE4plLjdAR
	 iARhkqTPKhVdNYWW/V6h+X+hPWT41JgZfkecIinUxCMhJn+MTQYjhXc8G9SPygo3KB
	 5evH+Lu1dMKNQhl6aphQRQEZnHM5MO/P1tHgwr8OLX4hsiKi60my0vmQ/Kj7+hbdIg
	 hCn3xyO5zStLg==
Date: Fri, 23 Jan 2026 10:04:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, robh@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: Add Tegra264 support
Message-ID: <20260123-bizarre-impartial-mamba-f36ac4@quoll>
References: <20260123064140.1095946-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123064140.1095946-1-pshete@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30965-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D34B7302B
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 06:41:38AM +0000, Prathamesh Shete wrote:
>  required:
>    - compatible
>    - reg
> diff --git a/include/dt-bindings/gpio/nvidia,tegra264-gpio.h b/include/dt-bindings/gpio/nvidia,tegra264-gpio.h
> new file mode 100644
> index 000000000000..689cf5c67c0c
> --- /dev/null
> +++ b/include/dt-bindings/gpio/nvidia,tegra264-gpio.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Wrong license. Checkpatch tells you this. I did not run checkpatch that
time, but run it now... but anyway, it is your task to run checkpatch,
not mine.

Best regards,
Krzysztof


