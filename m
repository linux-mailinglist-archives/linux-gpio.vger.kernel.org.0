Return-Path: <linux-gpio+bounces-34551-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJoYAxHQzGlFWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34551-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:58:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE1376629
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A2C330D0948
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4162C390211;
	Wed,  1 Apr 2026 07:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7UfUj32"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C0438C2A3;
	Wed,  1 Apr 2026 07:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029745; cv=none; b=gT2e76QpxLMuf6UFDe03AQHCXtjATDpVp07U2+t9xaIz5fgToICXV2tz61sL4KEszF4tZ4GhpiO5E2X/cLXNqzcB952vwI+veEyPksSmzSWSjx8Reg2DXQEVnYFSGg7DarINThEMDvOkRX0ZblT836dPeUpPrhsHBo+94olbB98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029745; c=relaxed/simple;
	bh=IFfbJFEeD3AotwA8EHCQkhq/zOGdI61UowKl+UIaIIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IX/TX/i8oGXNQqBlKaqwZehOzBRsov8bdlDF9JJqES8Z9VhcEDJM3KpuKOf+ShPL17GwaTpVgVJaPH7I1/VFSeEw+jUVU7yOqxFLa70GoeKwXKaFOiOnG/KSp35kISV2t6LtgZbobTQ2lvi++D7yOLWSdfE0JAOqjhyK0cu7cRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7UfUj32; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B48EC4CEF7;
	Wed,  1 Apr 2026 07:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775029745;
	bh=IFfbJFEeD3AotwA8EHCQkhq/zOGdI61UowKl+UIaIIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7UfUj32DCJfSaWHJRsBDqWK1VEw+a+7E1K1ywqU+MeH+eI8n/Jhc4f4cjYWpLjPC
	 Lv2aH7eA/OE2IqsJLFjwOTIXSdHTPYEztTqVdjMdPbUtpiEnrlkhgijLcNUDK2/FiW
	 mr2DawQAFwVomLK7EAyVr51kLsnD9AlwFCQL/82DJF7ANWODmL4nJi2UzcWQR+9KGE
	 NdKW9MygfDb+BekyXv3wQ5nJSN10pHIo1V+sSsnRPG+tUaq0XWrY0mFKRTL5zPpU6i
	 rgt3Pv1OJjMwxIjKTO5keiZSu5n9Y6vL7RzO3Kseh0sk7aApcCBUeZbgY71GH7QUN5
	 algPMSgWJNtXA==
Date: Wed, 1 Apr 2026 09:49:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, afaerber@suse.com, tychang@realtek.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: [PATCH 2/3] arm64: dts: realtek: Add GPIO support for RTD1625
Message-ID: <20260401-liberal-nondescript-muskrat-0ebe93@quoll>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
 <20260331113835.3510341-3-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331113835.3510341-3-eleanor.lin@realtek.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34551-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.30.120:email,0.1.92.32:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,realtek.com:email,0.0.121.124:email,0.2.59.24:email]
X-Rspamd-Queue-Id: 9DAE1376629
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 07:38:34PM +0800, Yu-Chun Lin wrote:
> Add the GPIO node for the Realtek RTD1625 SoC.
> 
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  arch/arm64/boot/dts/realtek/kent.dtsi    | 43 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/realtek/rtd1501.dtsi |  8 +++++
>  arch/arm64/boot/dts/realtek/rtd1861.dtsi |  8 +++++
>  arch/arm64/boot/dts/realtek/rtd1920.dtsi |  8 +++++
>  4 files changed, 67 insertions(+)
> 

Why the DTS is in the middle? Drivers cannot depend on it. Please read
submitting patches (both documents).

> diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
> index 8d4293cd4c03..746932c26724 100644
> --- a/arch/arm64/boot/dts/realtek/kent.dtsi
> +++ b/arch/arm64/boot/dts/realtek/kent.dtsi
> @@ -151,6 +151,39 @@ uart0: serial@7800 {
>  				status = "disabled";
>  			};
>  
> +			gpio: gpio@31100 {
> +				compatible = "realtek,rtd1625-iso-gpio";
> +				reg = <0x31100 0x398>,
> +				      <0x31000 0x100>;
> +				gpio-controller;
> +				gpio-ranges = <&isom_pinctrl 0 0 2>,
> +					      <&ve4_pinctrl 2 0 6>,
> +					      <&iso_pinctrl 8 0 4>,
> +					      <&ve4_pinctrl 12 6 2>,
> +					      <&main2_pinctrl 14 0 2>,
> +					      <&ve4_pinctrl 16 8 4>,
> +					      <&main2_pinctrl 20 2 3>,
> +					      <&ve4_pinctrl 23 12 3>,
> +					      <&iso_pinctrl 26 4 2>,
> +					      <&isom_pinctrl 28 2 2>,
> +					      <&ve4_pinctrl 30 15 6>,
> +					      <&main2_pinctrl 36 5 6>,
> +					      <&ve4_pinctrl 42 21 3>,
> +					      <&iso_pinctrl 45 6 6>,
> +					      <&ve4_pinctrl 51 24 1>,
> +					      <&iso_pinctrl 52 12 1>,
> +					      <&ve4_pinctrl 53 25 11>,
> +					      <&main2_pinctrl 64 11 28>,
> +					      <&ve4_pinctrl 92 36 2>,
> +					      <&iso_pinctrl 94 13 19>,
> +					      <&iso_pinctrl 128 32 4>,
> +					      <&ve4_pinctrl 132 38 13>,
> +					      <&iso_pinctrl 145 36 19>,
> +					      <&ve4_pinctrl 164 51 2>;
> +				#gpio-cells = <2>;
> +				status = "disabled";

Why is it disabled? What is missing in the SoC? Which resources are
missing?

> +			};
> +
>  			iso_pinctrl: pinctrl@4e000 {
>  				compatible = "realtek,rtd1625-iso-pinctrl";
>  				reg = <0x4e000 0x1a4>;
> @@ -161,6 +194,16 @@ main2_pinctrl: pinctrl@4f200 {
>  				reg = <0x4f200 0x50>;
>  			};
>  
> +			iso_m_gpio: gpio@89120 {
> +				compatible = "realtek,rtd1625-isom-gpio";
> +				reg = <0x89120 0x10>,
> +				      <0x89100 0x20>;
> +				gpio-controller;
> +				gpio-ranges = <&isom_pinctrl 0 0 4>;
> +				#gpio-cells = <2>;
> +				status = "disabled";
> +			};
> +
>  			isom_pinctrl: pinctrl@146200 {
>  				compatible = "realtek,rtd1625-isom-pinctrl";
>  				reg = <0x146200 0x34>;
> diff --git a/arch/arm64/boot/dts/realtek/rtd1501.dtsi b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
> index 65f7ede3df73..ae246a01f126 100644
> --- a/arch/arm64/boot/dts/realtek/rtd1501.dtsi
> +++ b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
> @@ -10,3 +10,11 @@
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&gpio {

Why aren't you following DTS coding style? What style is applicable for
Realtek?

Best regards,
Krzysztof


