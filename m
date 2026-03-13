Return-Path: <linux-gpio+bounces-33373-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHMoE0kftGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33373-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:29:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADF284FD0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD01131A5EAC
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A918339659B;
	Fri, 13 Mar 2026 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAvFT91T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67918390CAC;
	Fri, 13 Mar 2026 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410262; cv=none; b=u6zsqbidS+q7IBlOwmG0ckylFpLfTbnq6J+LXkqwhFuVA82LnM7CUc6w6JtBaDdOTHiMAOpHuRp9kmwSLTbIDGIMHKwL1iiZavaqMMrJZrXGoE7MwR1dYbOMh2KjzJbvJx28p2nga6tWIR3MgmY6nzK1OtdvQsSRIq1TwkK/JyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410262; c=relaxed/simple;
	bh=oMEuXKjEZ4NHtN9jhnX9CU7Lde3Dj86Gy/6HHl6NgGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lv831EVNcVo9QZiSXAj/FaNBav4wTqi8VN63uYh4NhtddaO1kn9Yt3JNKSv4IDra7q4x/GUASLWpU+kKij10+1DLJ1czrZcWAIhlTgeXKJETZuwMyGmFPgpo0ieLSaF2kBr7FO3LNl5QhSME+Hbnd/0RPtsf1gCWieWtdiMh3i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAvFT91T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF56BC2BC86;
	Fri, 13 Mar 2026 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773410262;
	bh=oMEuXKjEZ4NHtN9jhnX9CU7Lde3Dj86Gy/6HHl6NgGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mAvFT91TqcjApsTdR1a2RxdKn3wNM+WRbYInsw4qQ8Uh4k0DVwoGZR1OITCwcbepZ
	 t2sHQuqoMn5S6gI1Oiz8uhbPgPNg/Oa/2fj8EZyRXFuMRvbvGTJucfph9tpxH7KaV6
	 HwzKLpOmzbsV6WNo8xtPrmrf4khRnNY/ezvFN1RnMFswmskCUdQzx1mAcAp0NFBiRn
	 XRBcddyvzViBY9CMBJ3EKH8Nfk0joO+CFgqqdn5s0Zvb5toXE3Ro03NwMlrJiMglK0
	 ABFpPopPB2mosr0Hr/V2gKrvL+bIzd4ZXnE+JcetHzVlPN1cjFLJwYzYDurYWNrtmh
	 cVmK48q5007pA==
Date: Fri, 13 Mar 2026 14:57:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: x1e80100: Add deepest idle state
Message-ID: <20260313-accomplished-unnatural-rhino-59ccbe@quoll>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-4-760c8593ce50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-hamoa_pdc-v1-4-760c8593ce50@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33373-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,af00000:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 4AADF284FD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:26:38PM +0530, Maulik Shah wrote:
> Add deepest idle state along with pdc config reg to make GPIO IRQs work
> as wakeup capable interrupts in deepest idle state.
> 
> Add QMP handle to allow PDC device to place a SoC level low power mode
> restriction.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index ebecf43e0d462c431540257e299e3ace054901fd..8f560fd140661ad720fec979eabe3ca8ffb34273 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -290,6 +290,14 @@ cluster_cl5: cluster-sleep-1 {
>  				exit-latency-us = <4000>;
>  				min-residency-us = <7000>;
>  			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <2800>;
> +				exit-latency-us = <4400>;
> +				min-residency-us = <9000>;
> +			};
>  		};
>  	};
>  
> @@ -447,7 +455,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
>  
>  		system_pd: power-domain-system {
>  			#power-domain-cells = <0>;
> -			/* TODO: system-wide idle states */
> +			domain-idle-states = <&domain_ss3>;
>  		};
>  	};
>  
> @@ -6013,8 +6021,10 @@ dispcc: clock-controller@af00000 {
>  
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
> -			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> -
> +			reg = <0 0x0b220000 0 0x30000>,
> +			      <0 0x174000f0 0 0x64>,
> +			      <0 0x0b2045e8 0 0x4>;

One register is not device's address space.

Best regards,
Krzysztof


