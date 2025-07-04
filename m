Return-Path: <linux-gpio+bounces-22812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 888CFAF9C9C
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 00:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7585568160
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 22:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7652A28C86D;
	Fri,  4 Jul 2025 22:47:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C928A262A6;
	Fri,  4 Jul 2025 22:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751669220; cv=none; b=Hu5x5Zpce+voI4udPAH0WO8nZdyyPW+7teIgeSj3meCUfhf3SP55IslRGpTX5UHdIAZOgY4tZJghbwaGFTmexZrLcJohIRHgNhFPOLzen+QHX9zHVUkla4BuKZbbjr8EI99WfvaKxUVjyIcRrJ6TclEG7ivvx2NP1nS3UPc34go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751669220; c=relaxed/simple;
	bh=WY5tM4XqDysre5wQoyvPEvF7BiLnwxlb/IRaY8GroME=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BKq1eU7jcgYOEtiK7ex+q4JQDFRVvCH/CX28xuYhddxNjtvzfMC4EBSSmdY0vJXLIfQIUPzYlH0qcB2KYe6osMU+IUXf1Xlbt8C4qu5hPRMq4QN+SCn7AZx94RcuaxmrahPZxuog7FoV85cTschwle/nB2GX0xenLL/1B/wO4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89F50153B;
	Fri,  4 Jul 2025 15:46:44 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C72793F63F;
	Fri,  4 Jul 2025 15:46:55 -0700 (PDT)
Date: Fri, 4 Jul 2025 23:45:28 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] arm64: dts: allwinner: a100: Add pin definitions
 for RGMII/RMII
Message-ID: <20250704234528.4936fa72@minigeek.lan>
In-Reply-To: <20250626080923.632789-3-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
	<20250626080923.632789-3-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Jun 2025 10:09:20 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi,

> The Allwinner A100/A133 supports both RGMII and RMII for its Ethernet
> MAC (EMAC) controller. Add corresponding pin definitions.

Apart from suffixing everything with "0" ("rgmii0_pins: rgmii0-pins"),
this matches exactly what I gathered from manual and tested in my own
version of this patch a few weeks ago, so with the 0 suffix attached:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index bd366389b238..1c4e71b32911 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -236,6 +236,21 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
>  
> +			rgmii_pins: rgmii-pins {
> +				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
> +				       "PH5", "PH6", "PH7", "PH9", "PH10",
> +				       "PH14", "PH15", "PH16", "PH17", "PH18";
> +				function = "emac";
> +				drive-strength = <40>;
> +			};
> +
> +			rmii_pins: rmii-pins {
> +				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
> +				       "PH5", "PH6", "PH7", "PH9", "PH10";
> +				function = "emac";
> +				drive-strength = <40>;
> +			};
> +
>  			uart0_pb_pins: uart0-pb-pins {
>  				pins = "PB9", "PB10";
>  				function = "uart0";


