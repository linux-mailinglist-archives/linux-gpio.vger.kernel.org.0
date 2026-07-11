Return-Path: <linux-gpio+bounces-39897-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VYIOHmyGUmqGQgMAu9opvQ
	(envelope-from <linux-gpio+bounces-39897-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 20:07:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19196742746
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 20:07:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="LD3Zd/km";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39897-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39897-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF28F301D30B
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 18:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533263CF670;
	Sat, 11 Jul 2026 18:07:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DBE270545;
	Sat, 11 Jul 2026 18:07:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783793239; cv=none; b=FOQ7fSn/9gI1Ga91grg0p3fKnGywpuKxs5/x2jxQrGfIJqJ7Ibk/q1y5fsxGWeN9nZBPf3tfqDP6oN0nzaZXO7d+ceSpR4vkQtEsXBf2NJ8OxOtYlTh0XWHTPHzRmEPKdwzgYtD9/XyYkDH5mrGMRDN2G+P+hdE5vJn+9ZsD8Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783793239; c=relaxed/simple;
	bh=xIuTnUtLhw6lM6OFhkQay1V7xU9qDRZauTQNVJpn7b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYnXmnAFTd2Iw+7MBznhNu0dduIYTi7a+QpY8hkTQihhdn7LpRpzjvSl3leZtBLz1hIqiTUuiAyg2t4uE7ZHkIUvvYvyw372+HnIyQSVt7TlsJaA7OoAlYHyFfVFX4qCqcKSOS4JfmP6D4QsDmHFrequn/A0h5i7jP4PsGhYfwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LD3Zd/km; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86F01F000E9;
	Sat, 11 Jul 2026 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783793237;
	bh=3yQYE3I1VWOsP0zi5++Mo0sGNVCEsyBpnoRXKY7lCJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LD3Zd/kmLN1zN1WLP+kF6xRypUpBQgpvhgE4rJAYoNOYDw5i45U+7H9t3y65vmid+
	 KPNfFp+TIo3z1k7K6q9KWGlo2RCdMtQLibZUeN2gk4r1x+A9pNLX8SSm3O6kzAnabo
	 XyCpBCJ6I1gJ7ViBmal+/1GpeCCxWc0aeUujFEW5atHw8Gu7qUOonUH4aEw+oxHpYk
	 QuknZv74ixQ880MvW+4P4yT1+XGaIvCZL1KKXHNujJhdT9fmqpVZIpLn3+GRWw+P+c
	 lWBx0nA94nkrmhOTFyRTeqwmhYiUvfOpdVVn4A30zem+KiIGsWA8FApvfHQ+7IXbiO
	 24/266JxITXlw==
Date: Sat, 11 Jul 2026 13:07:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: x1e80100: Add deepest idle state
Message-ID: <alKEUhRgyoPs0q0c@baldur>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
 <20260707-hamoa_pdc_v3-v4-7-dfd1f4a3ae89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-hamoa_pdc_v3-v4-7-dfd1f4a3ae89@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39897-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baldur:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19196742746

On Tue, Jul 07, 2026 at 02:51:39PM +0530, Maulik Shah wrote:
> Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
> in deepest idle state.
> 

There's a lot of implied background in this sentence. When you write
commit messages, please intend for them to be read by someone who don't
have your background insight to the problem. In fact, if someone asks
you about this sentence in 5 years would you be able to retell exactly
why we ended up with this patch?

Please rewrite this to start with a problem description, then describe
the user-visible change.

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> Update entry/exit-latency-us to follow DSDT for cluster_cl5 idle state.

I don't have strong opinions about bundling this part of the change - it
could be argued that it's a separate change, but I won't force it.

But as written I think any reasonable language parser would consider
this to be related to the addition of the deepest idle state, not "While
we're adding the new state, also adjust the cluster_cl5 latencies with
values from production configuration."

Regards,
Bjorn

> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 054f9c4ad192..933d81fe7841 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -299,10 +299,18 @@ cluster_cl4: cluster-sleep-0 {
>  			cluster_cl5: cluster-sleep-1 {
>  				compatible = "domain-idle-state";
>  				arm,psci-suspend-param = <0x01000054>;
> -				entry-latency-us = <2200>;
> -				exit-latency-us = <4000>;
> +				entry-latency-us = <2000>;
> +				exit-latency-us = <2000>;
>  				min-residency-us = <7000>;
>  			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <2500>;
> +				exit-latency-us = <2500>;
> +				min-residency-us = <9000>;
> +			};
>  		};
>  	};
>  
> @@ -461,7 +469,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
>  
>  		system_pd: power-domain-system {
>  			#power-domain-cells = <0>;
> -			/* TODO: system-wide idle states */
> +			domain-idle-states = <&domain_ss3>;
>  		};
>  	};
>  
> 
> -- 
> 2.43.0
> 

