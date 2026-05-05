Return-Path: <linux-gpio+bounces-36140-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBuzKozA+WlADAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36140-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:03:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 570644CA629
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 585BA3059794
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8422346E71;
	Tue,  5 May 2026 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuImLdnw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94F3344DBB;
	Tue,  5 May 2026 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974784; cv=none; b=lloitaKEGI/QxFcOD0+39kVb5I3lEswXDS0pEbjxWVvgdbOZuCEV3XlYFWcwAT9h10um90VvGF1FLPYFS2+ZgBGkEbXR7mseTVzavyZ+cCnqYlrs62vcpHBekfuvbqBcBqO687mhVJ+9AWbRyNl7yAJbXfQDjy05S2mLJqvzzzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974784; c=relaxed/simple;
	bh=9fK66r5thpouwljLCsKcI4ksPMgvlUevMokjVISMOp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBH/y1U+EgYNydh5pfv665HGLjBqYcrMxzmXY1bg9Tz1eNc7guE4lGIsJpAPFMBchkct73wmeDedUkeejCxxSNMXo9xiQzIpUYRkj/1JppodZwNWEL0/KBsw5MgFHpBDdc83SSaQGH1P1+vrtIaxVChBI84KZZ7pKd1odBg5d1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuImLdnw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BB8C2BCC7;
	Tue,  5 May 2026 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974784;
	bh=9fK66r5thpouwljLCsKcI4ksPMgvlUevMokjVISMOp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JuImLdnwi6vVebYFR2nORs63lsn6NX9lYhCLcCVSqb/hDGSCtrc9PxmOCkX0u2wqT
	 kSVbmu/knqL+kn5fEYrvsLCu4nkxkIAshUTAf2t8vEI2zhRuFq2AZ9RlipTCvEApw+
	 SuP9orG7z0pKte/GicYwNBCxTjJ6Ff3gHpQKn5M/WDn7MfvdIkEPwuL38Bh53GGfsP
	 Q/ug0IFR6vBec/bRwpC52xjC9W+KYQnRpV3MMhG+6hyCzLiOWbXCdwiJ8wuChh6AHZ
	 LZB1GmhbiXUIBpWj0MkYmTnyt3g3M3+ltSuH1lMmv2D0NFyjat4Qqg52Oz7O3YUDEH
	 RcP14vKHH+K0w==
Date: Tue, 5 May 2026 11:53:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Document Shikra Top
 Level Mode Multiplexer
Message-ID: <20260505-chirpy-cautious-pigeon-e3abbe@quoll>
References: <20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com>
 <20260504-shikra-pinctrl-v2-1-14e9dcc2d685@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-shikra-pinctrl-v2-1-14e9dcc2d685@oss.qualcomm.com>
X-Rspamd-Queue-Id: 570644CA629
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36140-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, May 04, 2026 at 04:18:42PM +0530, Komal Bajaj wrote:
> Add a DeviceTree binding to describe the TLMM block on Qualcomm's
> Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,shikra-tlmm.yaml         | 123 +++++++++++++++++++++
>  1 file changed, 123 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


