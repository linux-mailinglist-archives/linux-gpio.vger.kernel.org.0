Return-Path: <linux-gpio+bounces-24018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8795BB1BCBF
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 00:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FDEF18A4A56
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 22:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E50B26E70B;
	Tue,  5 Aug 2025 22:42:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33EA23ABBD;
	Tue,  5 Aug 2025 22:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754433721; cv=none; b=la/WZnwDf5Y2SsYOtdEhvyshBJKmLCafV9h+Yu0O0FWfpIwyXVSK3b/UXc5PkTxGXV8rwSh1ozDA3J4i2i6u6uX2CHqmVBuOZ1omV/kuRnsoasvT12t7ifwjANj3jjK0C+udYTdINGpul0puUyskeMrVSfT+OzarIzUg544IJng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754433721; c=relaxed/simple;
	bh=VXgYibGzEYTF3VEY/ezdYz25VvLo89godDcuA1QyDIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZd7MQo4qmej2WfUQa/ECsgwSXCBI9j5lNeUvHFMZ1aTEt3BEEvHlbIdUVzO5ilXpfJcRwJbwa+R9A/WljtZREdvg2CVGpp0BYPBO9zVDYDzkFAZHo4yuWF7WTkKqsLlYobCYvpsrkVysYWCldydPrRABfBZiCsd++7edIFShyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.147.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CFE16335DB1;
	Tue, 05 Aug 2025 22:41:58 +0000 (UTC)
Date: Wed, 6 Aug 2025 06:41:49 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: linus.walleij@linaro.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: spacemit: remove extra line in debug output
Message-ID: <20250805224149-GYA950625@gentoo>
References: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805150701.129113-1-hendrik.hamerlinck@hammernet.be>

Hi Hendrik, 
On 17:07 Tue 05 Aug     , Hendrik Hamerlinck wrote:
> The debug output for spacemit_pinconf_dbg_show() prints an extra newline
> at the end. This is redundant as pinconf_pins_show() in pinconf.c already
> adds a newline in its for loop.
> 
> Remove the newline to avoid the extra line in the output.
> 
> Example current output:
> $ cat /sys/kernel/debug/pinctrl/d401e000.pinctrl/pinconf-pins
> Pin config settings per pin
> Format: pin (name): configs
> pin 0 (GPIO_00): , bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)
> 
> pin 1 (GPIO_01): slew rate (0x0), bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)
> 
> pin 2 (GPIO_02): slew rate (0x0), bias pull disabled, io type (Fixed/1V8), drive strength (32 mA), register (0x1041)
> 
> ...
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 9996b1c4a07e..fb361f2acb54 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -707,7 +707,7 @@ static void spacemit_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>  			   spacemit_get_drive_strength_mA(IO_TYPE_1V8, tmp),
>  			   spacemit_get_drive_strength_mA(IO_TYPE_3V3, tmp));
>  
> -	seq_printf(seq, ", register (0x%04x)\n", value);
> +	seq_printf(seq, ", register (0x%04x)", value);
>  }
>  
>  static const struct pinconf_ops spacemit_pinconf_ops = {
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

