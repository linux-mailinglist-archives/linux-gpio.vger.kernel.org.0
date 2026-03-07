Return-Path: <linux-gpio+bounces-32722-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDVkA88frGlXlQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32722-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 13:53:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 153FF22BCA8
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 13:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B97F300F2BC
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 12:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5957139C64B;
	Sat,  7 Mar 2026 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJa2mXuj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A86639527F;
	Sat,  7 Mar 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772888007; cv=none; b=P/c//MFy5FdwyyQhwNuz3VRspxcVcdHQAuglO913IkiXn1DxhctosVUsmw5hjWKnGg0Ht/Fapn4IBWDMPjIbTY87AKieFyx9XVkmm7FiIPmKcemw5NzHcDYMuaNSlPTQOIHITef7M8whTRH+DX2LQU7ysnL3KIeZj5499OzpYtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772888007; c=relaxed/simple;
	bh=NkU8Z7BJW6IMqFyOQfV2xg9wnLMdZ94S1srnXoDa+2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnsZ2kZzSUtJpB8JvSWA75uTI/meqyivjj+t4jEj24VmfzxQPa4Wzk+TxaneL3+BHXCKKAInJB+eRqxcJdmh8OBDoIqOeoY41Axvp4HyZ2Mr86v5ASTNNoBz/tCiuXZtMOQ9t0cmVIsdqYvoudlx6+3xsMeiTHo9BJkVt2S1Khk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJa2mXuj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8A6C19422;
	Sat,  7 Mar 2026 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772888006;
	bh=NkU8Z7BJW6IMqFyOQfV2xg9wnLMdZ94S1srnXoDa+2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJa2mXujjMivItr7He25l3aRJMra5ArgA9ylye2kejRpGXXoaG+EdtHG44jdXLZ2U
	 xfnayY6gdJePSrCV1+FdCv5yMvUIvbOQ1sT0YyebUV/FbYYdtaAwdi5U3tQwdTRoAd
	 aAWZxrW11TKXeqlHb69RT/jIbDFeFEHJgD3DNBeHcT8XTkE/q2te3kXMox25ni8Sh2
	 BHm2/bBx5NiMzFzeiMPtsYUpkCo0En+uOY+MG/2penhTVFMVBzuXp6PGQ9kC2jJD+1
	 LtIWHuBthAlQoaHLa7QNLn8YI0p7mBXPbfzwNX7GSmcMPhvsLREa4B5NmSfFX2z19N
	 RXqCoJj+hOaOw==
Date: Sat, 7 Mar 2026 13:53:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bartosz.golaszewski@oss.qualcomm.com, afaerber@suse.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
Message-ID: <20260307-purring-kind-binturong-1fcb37@quoll>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-10-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306075244.1170399-10-eleanor.lin@realtek.com>
X-Rspamd-Queue-Id: 153FF22BCA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32722-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:52:39PM +0800, Yu-Chun Lin wrote:
> From: Tzuyi Chang <tychang@realtek.com>
> 
> Rename 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'.
> 
> The previous name was misleading because this hardware block is not a PWM
> generator. It does not generate a signal with a specific frequency and
> duty ratio.
> 
> Instead, it provides a fixed nanosecond-level adjustment to the rising/
> falling edges of an existing signal.
> 
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml       | 9 ++++++---
>  .../bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml       | 9 ++++++---
>  .../bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml       | 9 ++++++---
>  3 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
> index 90bd49d87d2e..7b3888b2cea8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
> @@ -133,10 +133,13 @@ patternProperties:
>          minimum: 0
>          maximum: 7
>  
> -      realtek,duty-cycle:
> +      realtek,pulse-width-adjust:

No, that's ABI break without explanation. "misleading" is not the
sufficient argument for breaking ABI.
You are stuck with the ABI you added back in 2023.

Best regards,
Krzysztof


