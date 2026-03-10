Return-Path: <linux-gpio+bounces-32888-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M0nGaLer2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32888-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:04:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 075FE247DD9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 668273190798
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA3D369990;
	Tue, 10 Mar 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTmlE77F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607A943636F;
	Tue, 10 Mar 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133227; cv=none; b=KHEvkn0DrmmFrM0sZSotUfACOFkEDSVJgZelf5FhBsYqK6BkeI1gf+F/jouXPc5Dx1JqWdD2NUxzra1T089V9IHoVY0/i17n/kqVsjeiuoyAotcovLRUdS9dFY2DQLNCdLF9n8gn31kr3MKM+vT5nsNg6l1TC2SzPadmQjOEZE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133227; c=relaxed/simple;
	bh=Md7BIHPAB/DfIclY8o2/BpyMLpt1rCGHzfplstHLVvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD7Uol86gEpPllcCGAkzP5p3kWyJ0RNsTT1zzEE2u17rANMsmGasLWF5SOzFGTl9KXZITqJtR2mkwSJBO4vjNkRBWmxNdZfPdNgW9DlUO5MP74a3Vsbg8egugtVsjoQ5MECRlEgRPQXPvIu/kJBCn39EG2DWoThIdy0Zu39z0Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTmlE77F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBBFC19423;
	Tue, 10 Mar 2026 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133227;
	bh=Md7BIHPAB/DfIclY8o2/BpyMLpt1rCGHzfplstHLVvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTmlE77F1z6GIbbIWrfOwGsSGVtzha8A8M8DC/YHTleP+kRbaMiLsKYqWv7SHzD7l
	 R5FBs2Mvc9LEtTt6UtCTetyfvmM5m0j0pbviM/JszZAap1QWcdMZ6V3Itn+oi5WaSV
	 nvReP/D3D9cMiHlKxEKvRKMPq41nNL9fdLPvvDNcjac026IeM8EnbD33WcVKqRUqxS
	 GzBk5IM6Kg8Q0+SrXtEy5KL5cQvYmPYILIsCDDjQxvYqWNApH3kOJldPLPOJRdfW3/
	 RHDqmqMuA/12RYbcHJX0Q0PwFhz5B2Hcyj6UDWs1TYTP48yCAssohseKih4Yb9QoCL
	 m6kh/Ouc8LAwA==
Date: Tue, 10 Mar 2026 10:00:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: qcom: lpass-lpi-common: add reserved
 GPIOs property
Message-ID: <20260310-rigorous-whimsical-pudu-5f4df6@quoll>
References: <20260310012446.32226-1-mailingradian@gmail.com>
 <20260310012446.32226-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310012446.32226-2-mailingradian@gmail.com>
X-Rspamd-Queue-Id: 075FE247DD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32888-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:24:42PM -0400, Richard Acayan wrote:
> There can be reserved GPIOs on the LPASS LPI pin controller to possibly
> control sensors. Add the property for reserved GPIOs so they can be
> avoided appropriately.
> 
> Adapted from the same entry in qcom,tlmm-common.yaml.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
> index 619341dd637c..0c3fa5d597e0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
> @@ -27,6 +27,12 @@ properties:
>    gpio-ranges:
>      maxItems: 1
>  
> +  gpio-reserved-ranges:
> +    description:
> +      Pins can be reserved for trusted applications or for LPASS, thereby
> +      inaccessible from the OS. This property can be used to mark the pins
> +      which resources should not be accessed by the OS.

minItems: 1
maxItems: 30

I guess to have somoe sort reasonable limit.

Best regards,
Krzysztof


