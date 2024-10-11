Return-Path: <linux-gpio+bounces-11200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D6999A8F8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 18:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFEF4285C03
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 16:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225E4199941;
	Fri, 11 Oct 2024 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="FnpfjoSx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF13198840
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728664528; cv=none; b=WmmVqcdOUlSbHIZN5A6aJmSa5CwdQXOsz7N7k0mwvU+OHKBB17uOCRh2M6lkczXDm8G2YOjmpCI8BS2X8Tj4tvYY+rPLxh18PNjHA9rlbiTf42o3M+j/CMgyvS1GnnHemmx+AswI5x4K1OIP8EBNHRpyNT8C7Fegv6WRvhf/ibA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728664528; c=relaxed/simple;
	bh=b3qHa7r+6pV4lwvw748wSsm3U6bD7sQalwfrgCBv/O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qx+TFHaXuovhUlJCjWA9W4nXek7c/ecL/OIho6jDdagSmYPvlMYR6fHEJIs8yYlamsx4Vwd/1m3SrvzhWkiUpop/eRHbo328/W4WS6KzGJyyyiNjoC5w/abZSQkdVzGhLV6vrIU2cJm6N/YbTZ8GSiL9qHqh0pidqEZihTyfVLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=FnpfjoSx; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e06acff261so1544649a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 09:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728664527; x=1729269327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TmThUYkOTDaIhgghepZ/G5vDjgtJ1yvPAxuWgnKKjgg=;
        b=FnpfjoSxp8vDP5r606YLYnmCEB96q9KPPc8bi/Uldx+wLgkH7U1LB115j0oiVVmjYH
         sIkoOhCXZSLXCS+UUlwl1sSs21n/SP00yTaWS/9vNGAUYGweKxgThRyKaiZ/2spVZ7eP
         yiUwY10jqCwX0hvAhLhc8N3tPB/3tm9ZHsM01V9WGzKSftF9jhyCfKYe3tw/2fMnOWLu
         DkXwcY+zmdgqKET1ofczeWQl0G254fvmgtqMhMcOLOOMb2H4E5ETyHqizX4y+JGWXTKj
         RhWnRnsPFxpUccwxWgKAiIUB9ttIwxcjX7R5bNAGPkw91ZHhaB2FS9ct/eZd8GKCCXUX
         fUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728664527; x=1729269327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmThUYkOTDaIhgghepZ/G5vDjgtJ1yvPAxuWgnKKjgg=;
        b=vYD2XW8hLPJeF/9KdlZpy6VykNQwuQg/hiOpicAFRBpG/fx5y+UEEZswdrAaFL2GVl
         t5terkW9sdvgDVjSjRG3tjr0DtVmYgg3u9xUpLpgDKShR264Gg+e3Dm82fKtNt27GNyj
         JYXPK2KVHbdjP5DiWYuTfl1s/Glb/c+d2rt593gMAzdD7oWVDdun5VfRDsoHNJ2K9EYV
         iWijIUw6cEDd4ebkLj9AUTdvB2OKVnyriwqOPxqphixLQU4VSxUjq1EXLk8oSYgEBNMc
         g8ZB3uEJbsinAKfaSVezEx9KqT4YJRRY5VijIB4JYQD+5Ou3JoLBCQxcDjX4kkcwcEIY
         SCxg==
X-Forwarded-Encrypted: i=1; AJvYcCUEfVEOv5poGbIBKbn/J3SW3f/2jOu0VftV+3GR//Ft2pKtJ4IZtpdh2MXfKJ47zHyQNcUVnlPCTOp0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcat6wZlDK7F4BU+XF5mAcSbL5g1c02SqsQkLS+Y058xCL+OXL
	0iVvLGdbPJHyKZOTdtCJ4CHRevInDwGp1Cd/s/hwizK2+aR0kjJI3cGr5tajhw0=
X-Google-Smtp-Source: AGHT+IGLIOSThxWqsd5665YVQNbI9JkSuYl+8F50zeEjp5XfPQiX8r4yeY1njTehNjbi8gl5qYZD8A==
X-Received: by 2002:a17:90a:d815:b0:2e2:e086:f550 with SMTP id 98e67ed59e1d1-2e2f0af2ee3mr4374574a91.21.1728664526828;
        Fri, 11 Oct 2024 09:35:26 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5c99db3sm3415093a91.0.2024.10.11.09.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 09:35:26 -0700 (PDT)
Date: Fri, 11 Oct 2024 09:35:25 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH v1 3/3] pinctrl: th1520: Factor out casts
Message-ID: <ZwlTzbsiyr8994S+@x1>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
 <20241011144826.381104-4-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011144826.381104-4-emil.renner.berthing@canonical.com>

On Fri, Oct 11, 2024 at 04:48:25PM +0200, Emil Renner Berthing wrote:
> Limit the casts to get the mux data and flags from the driver data
> pointer with each pin to two inline functions as requested by Andy
> during review.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  drivers/pinctrl/pinctrl-th1520.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 8bd40cb2f013..7474d8da32f9 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -152,6 +152,16 @@ static enum th1520_muxtype th1520_muxtype_get(const char *str)
>  		(TH1520_MUX_##m0 <<  0) | (TH1520_MUX_##m1 <<  5) | (TH1520_MUX_##m2 << 10) | \
>  		(TH1520_MUX_##m3 << 15) | (TH1520_MUX_##m4 << 20) | (TH1520_MUX_##m5 << 25)) }
>  
> +static unsigned long th1520_pad_muxdata(void *drv_data)
> +{
> +	return (uintptr_t)drv_data & TH1520_PAD_MUXDATA;
> +}
> +
> +static bool th1520_pad_no_padcfg(void *drv_data)
> +{
> +	return (uintptr_t)drv_data & TH1520_PAD_NO_PADCFG;
> +}
> +
>  static const struct pinctrl_pin_desc th1520_group1_pins[] = {
>  	TH1520_PAD(0,  OSC_CLK_IN,    ____, ____, ____, ____, ____, ____, TH1520_PAD_NO_PADCFG),
>  	TH1520_PAD(1,  OSC_CLK_OUT,   ____, ____, ____, ____, ____, ____, TH1520_PAD_NO_PADCFG),
> @@ -590,7 +600,7 @@ static int th1520_pinconf_get(struct pinctrl_dev *pctldev,
>  	u32 value;
>  	u32 arg;
>  
> -	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
> +	if (th1520_pad_no_padcfg(desc->drv_data))
>  		return -ENOTSUPP;
>  
>  	value = readl_relaxed(th1520_padcfg(thp, pin));
> @@ -660,7 +670,7 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  	unsigned int i;
>  	u16 mask, value;
>  
> -	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
> +	if (th1520_pad_no_padcfg(desc->drv_data))
>  		return -ENOTSUPP;
>  
>  	mask = 0;
> @@ -793,12 +803,14 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  {
>  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>  	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
> +	enum th1520_muxtype muxtype = (uintptr_t)func->data;
>  
>  	if (!func)
>  		return -EINVAL;
> +
>  	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
> -				 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
> -				 (uintptr_t)func->data);
> +				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
> +				 muxtype);
>  }
>  
>  static int th1520_gpio_request_enable(struct pinctrl_dev *pctldev,
> @@ -809,7 +821,7 @@ static int th1520_gpio_request_enable(struct pinctrl_dev *pctldev,
>  	const struct pin_desc *desc = pin_desc_get(pctldev, offset);
>  
>  	return th1520_pinmux_set(thp, offset,
> -				 (uintptr_t)desc->drv_data & TH1520_PAD_MUXDATA,
> +				 th1520_pad_muxdata(desc->drv_data),
>  				 TH1520_MUX_GPIO);
>  }
>  
> -- 
> 2.43.0
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

Thanks for improving this. I see the feedback from Andy [1] on your v2
now that you mention it.

-Drew

[1] https://lore.kernel.org/linux-gpio/Zj8K_0zpI_IAY66R@surfacebook.localdomain/

