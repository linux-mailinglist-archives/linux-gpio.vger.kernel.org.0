Return-Path: <linux-gpio+bounces-18186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB25CA79C30
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 08:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5687417149F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 06:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1831A23B9;
	Thu,  3 Apr 2025 06:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdDW3wZC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749171A0BCF;
	Thu,  3 Apr 2025 06:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662324; cv=none; b=LCE0NW2mVGBT3c5iSpcEeF96UPw8M5jlRRfCX6wo/UU2GgnTtVDrlfeiYhmiJ4xOTzj30zRv8xl3+9xdVQU/KHkrdh9TndC1iHRUHrdLSc/T1wkEm3zmhHzHbtR0RO9FbqPXmOCBBNWOEKe1azB/dh70ZKzR9/KNn67k6qKQtrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662324; c=relaxed/simple;
	bh=YxNQgOwbq/vG85PIYBP1y2DGiGETcPpm5tCt19Qss54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+PfJflEBVrFbu76Df89pnl+DZrw1WBqMwnaalN4qZLuYz34f9S6IaGC6Rc/kRD6UMbOK7aSe4ylytPYgD3fw13/uolArr7oJgKmJ3nITgmDwyXbrBMVbVgjv85UzRFq0mba/cJRi8g2rzvTMUjlkeUVB8OTkH+A9pq8OOaTk1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdDW3wZC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A111CC4CEE3;
	Thu,  3 Apr 2025 06:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743662324;
	bh=YxNQgOwbq/vG85PIYBP1y2DGiGETcPpm5tCt19Qss54=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rdDW3wZC8xXiJzAIqacq3AFyhV8SPL68kl/cC3n98UPqJaEyMqxcsIFykpUpS2qQX
	 4sdSc+FGzw9BhHakkWWvvuXP7JxZyQR0g75qSEBS4iVubpp5eBw9rX5ID/8epJy+05
	 /xo8CcQNgCzSgs5ejS7jBfvglyxNu34h6yUdFl1d22Nkd08exLRJYHBKn7HuEzZG3v
	 TDLyw3sEM8PuS3ZN48IvXVuQPVX5UxnC7AP3Pj1pjo+VpZDj3T7hba+7W6tCittmBL
	 i6zzVdOhsmwr0giUHa2HcuH5vjA22qXOpy/yzC9+QY5YF94R+796LuGY7DBleOF6y8
	 kIEdrT7oOBfbQ==
Message-ID: <4371c835-205e-4ec5-865b-ae01d87b7b70@kernel.org>
Date: Thu, 3 Apr 2025 15:38:40 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: xilinx: Remove myself from maintainership
To: Mubin Sayyed <mubin.sayyed@amd.com>, cassel@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, michal.simek@amd.com, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, radhey.shyam.pandey@amd.com
Cc: linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, git@amd.com
References: <20250403060836.2602361-1-mubin.sayyed@amd.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250403060836.2602361-1-mubin.sayyed@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/25 15:08, Mubin Sayyed wrote:
> As I am leaving AMD and will no longer be maintaining
> these platform drivers, so removing myself from maintainership.
> 
> Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
> ---
>  Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml        | 1 -
>  .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml       | 1 -
>  Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml   | 1 -
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml           | 1 -
>  Documentation/devicetree/bindings/usb/microchip,usb5744.yaml     | 1 -
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml             | 1 -
>  6 files changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
> index 6ad78429dc74..c92341888a28 100644
> --- a/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
> +++ b/Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml
> @@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Ceva AHCI SATA Controller
>  
>  maintainers:
> -  - Mubin Sayyed <mubin.sayyed@amd.com>
>    - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Fine with me.

Acked-by: Damien Le Moal <dlemoal@kernel.org>

Not sure which tree will pick this up though ? linux-arm maybe ?
If noone volunteers, I can take it.

-- 
Damien Le Moal
Western Digital Research

