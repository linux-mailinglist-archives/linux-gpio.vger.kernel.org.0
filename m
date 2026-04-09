Return-Path: <linux-gpio+bounces-34918-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOu6E1hc12kCNAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34918-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:59:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E623C75E7
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 321A23002E35
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 07:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEC13876B3;
	Thu,  9 Apr 2026 07:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGNKpipl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD38387570;
	Thu,  9 Apr 2026 07:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721548; cv=none; b=Dj5ourAKv/DDYJxR4iCRa0lpr/Ac5g7mUnmcxswM+1LZ7prDT1LE9ES3aQNzmLa6Dzmx/Dj9GColiiF4XctJwyj4ajLe38TbiUMf/zcSQ/JBFWo1THQA/qngRE2NfNUFVgEueQKT5OG6+9a/LIRqP0vsYs+MKyb8NCYMKXMn1Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721548; c=relaxed/simple;
	bh=lyYa3ZJGQgq8Q3QDyNzOV51gGsmJW6sCHeX/R+e44DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPtmoN4Q6XE4GumW53toguGdv2Xidv5W5jeGvLiAK6GFEJmvN9/iiNLgDxuVMarMcFEvRExZXXH9myJIgTRchtlJrzyFJ403jMVU3j0o8jsYdAjF/Vess1Bqsc6oTAc8j5IS1HauAxW3ENhmeQoydGfeCr0Qm+3As6S7AUf23wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGNKpipl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940CBC2BC9E;
	Thu,  9 Apr 2026 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775721548;
	bh=lyYa3ZJGQgq8Q3QDyNzOV51gGsmJW6sCHeX/R+e44DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gGNKpipl5Y9/kBiMe+OC/5TgF0fPsUwSyDX1bPFIhvbQQNAfKknu7dStYqoLEP5ml
	 8+QMjxbKvjhtD/wXtm+mBE1yTcvDvdVIuGcsqop1BMILWfkRxcMM7xEAaLhfn3att7
	 ejnImrCBv5gfuYPpmip2P9X6sw2NTr9525mqWi1OPOhLdIh/LJA6L/LUbU/czdLWGq
	 UtY8YtN1alpCKq3tIRq/qooUmHtwdlZ37qlg/FCQ2K8UAkvYGtWD1F2Cbc7e6pM8Io
	 8IFrhKYViaGiCAtALlwATcEnLBTafiyDNj1c51ZLbLM+jBobhDRvMd4F+lZia7sBoe
	 MZkhpwFUgRs1g==
Date: Thu, 9 Apr 2026 09:59:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Describe Hawi TLMM
 block
Message-ID: <20260409-chestnut-mink-of-election-9e8a9d@quoll>
References: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
 <20260408-hawi-pinctrl-v2-1-fd7f681f5e05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-hawi-pinctrl-v2-1-fd7f681f5e05@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34918-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C6E623C75E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 07:45:47PM +0530, Mukesh Ojha wrote:
> The Top Level Mode Multiplexer (TLMM) in the Qualcomm Hawi SoC
> provides GPIO and pinctrl functionality for UFS, SDC and 226
> GPIO pins.
> 
> Add a DeviceTree binding to describe the TLMM block on Qualcomm's
> Hawi SoC.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,hawi-tlmm.yaml           | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


