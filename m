Return-Path: <linux-gpio+bounces-8839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5D957C73
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 06:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA9B11F2393F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 04:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8CC5336B;
	Tue, 20 Aug 2024 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrJgQLUX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1499028371;
	Tue, 20 Aug 2024 04:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724128513; cv=none; b=kJakmINJIx5OfO6FyDAwJ4FJwPM5nwEBEytnbwlclhLil02DrS/8cm5RtzsBnvnYJN0Vsx9pOL6p3R2yQnlXRnXpqdtZ+3HSRVn0bUpYPMJu+UDoIgZeUCvsmLq8sSXUY2XROoxgwhYTijBTO0sNPwAxUvVQXrHESr6Jdh2cN/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724128513; c=relaxed/simple;
	bh=8Srs1NF0cbEu9K1ZJepDsNyBU3M/1mOnnHqp4dTs/mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwgo21CYKpeZvUuEHJpmygUIw++qSQXZSZ7QT8qzh9AS71adzubSFqAgoU+e4EPDJlSrxT7UKfw5SU3m4GxdEQr3iBNsRNRhZ++a96KXSIk+D0G+E7Kq5uMd8WeHKazI/FP3X5M9wBURfNQ/5F3iaoH6uBisBHPKFqTYBKlepMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrJgQLUX; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-824d911b6c4so188048439f.2;
        Mon, 19 Aug 2024 21:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724128510; x=1724733310; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RWb2cOqQnTHsOkbjJVH6LqZJsj5oebESRUFajL+E9E=;
        b=GrJgQLUXVQm0R7srb4wSmZzwF3KYijD8OY2+Y3UmT9w1mTTvsNOp6x0JQEcVu6UQhy
         TRtCmzd2l+gHTTfKJZM7FOORKB8BAfCrAsmlsDXBRnEo7OtXSPVNkOYwfBfqkLSvVQYt
         An9wT3v34H7FpK/CTRC6udITnWCf1HIHCcwWSF6pAoT9XnvDp/aYLuObf3XMQPsjMw7Q
         2J2x5sPpNvncfW+4XdspfbA44jCj19m6J+1rbvuTYQCGw2W30IjziO5dH0NFjB6w0X3c
         XlbSJStdymAXSIvoddmpumM2Yu1VFEPLVgHY6144IunZfyv8MUzicxxrC0EkPAVTjtZF
         VgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724128510; x=1724733310;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RWb2cOqQnTHsOkbjJVH6LqZJsj5oebESRUFajL+E9E=;
        b=PcpklRfZSHwL1ozL4lPCBEZTfrs0gPeompZHYZWmKIzjd+UeqagPsm4Fk1ENvxrK6s
         dTj9AfUMdGr0eLh7dunZab1/F2olgebAJKln5/2iQYKkSZ8OTmyK3FTLum0gh5MuN8SS
         CkdhmgQDS0PhuY8ijyuB28LZCUb0748suZdsV2lcZ69IKgoIqgmv0oI9lIWlIoub3FhA
         Tt2l5USUvpAw4AqHNuI1OkXK5cCOt6afGfP1NVFu10q/c+SK9oAcMAPW15h8M4LjeRS2
         ZRz5TnvYtin3RrQpPIFI92gWpL9uZ1I4hm5NiiJZTGfcGevx9Y5/iO3Y85xC2B6sTMhr
         s4ow==
X-Forwarded-Encrypted: i=1; AJvYcCVExQANbuBKJAcOZ5A2PJUOXGMO7kxPavFy2lfZXLCYPf2VygHQrUvahCYYgzf3SoOJl1MAWVxVGatY@vger.kernel.org, AJvYcCVk0DMb9nzmACurqAL1NT/+rO4cpxe4dGtj8gxZDEri6lBOKuA9kg4cJoHUlRmK3D9q+Ic4TWKh4difPINK@vger.kernel.org, AJvYcCXoAGPGvDVDhco3i11bihEIi0qSktitUhlJ0YmcCxvR0v9z2F0zn9WoRFEVn5gdlLFAehV8vkpK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0yOkvJRDGlB6dcj5SDNRs+TVxKaKntn4sggI/20XTAbl0JhmG
	sc5+B1g9GJBu+x0b6San1dDML39RCKazgtcL6iibFwKKq9CtL327
X-Google-Smtp-Source: AGHT+IFgXm2jo5dhmI2RXTx2h3U0EmkRtDJU4E+HT/XrlMRq2RzGucNvBgE4VHNU+OWyzPD3IPnOIA==
X-Received: by 2002:a05:6602:6d1b:b0:81f:cad4:c6e7 with SMTP id ca18e2360f4ac-824f271f4cfmr1890735739f.15.1724128509735;
        Mon, 19 Aug 2024 21:35:09 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-824e98ed8c6sm368220539f.8.2024.08.19.21.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 21:35:08 -0700 (PDT)
Date: Tue, 20 Aug 2024 00:35:06 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Huang-Huang Bao <i@eh5.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Kojedzinszky <richard@kojedz.in>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rockchip: correct RK3328 iomux width flag for
 GPIO2-B pins
Message-ID: <20240820043506.GA17134@localhost>
References: <20240709105428.1176375-1-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709105428.1176375-1-i@eh5.me>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue 2024-07-09 @ 06:54:28 PM, Huang-Huang Bao wrote:
> The base iomux offsets for each GPIO pin line are accumulatively
> calculated based off iomux width flag in rockchip_pinctrl_get_soc_data.
> If the iomux width flag is one of IOMUX_WIDTH_4BIT, IOMUX_WIDTH_3BIT or
> IOMUX_WIDTH_2BIT, the base offset for next pin line would increase by 8
> bytes, otherwise it would increase by 4 bytes.
> 
> Despite most of GPIO2-B iomux have 2-bit data width, which can be fit
> into 4 bytes space with write mask, it actually take 8 bytes width for
> whole GPIO2-B line.
> 
> Commit e8448a6c817c ("pinctrl: rockchip: fix pinmux bits for RK3328
> GPIO2-B pins") wrongly set iomux width flag to 0, causing all base
> iomux offset for line after GPIO2-B to be calculated wrong. Fix the
> iomux width flag to IOMUX_WIDTH_2BIT so the offset after GPIO2-B is
> correctly increased by 8, matching the actual width of GPIO2-B iomux.

Thanks! My rock-pi-e stopped being able to read a mcp3002 with the last
update. Works again with this patch.

Tested-by: Trevor Woerner <twoerner@gmail.com>

> Fixes: e8448a6c817c ("pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins")
> Cc: stable@vger.kernel.org
> Reported-by: Richard Kojedzinszky <richard@kojedz.in>
> Closes: https://lore.kernel.org/linux-rockchip/4f29b743202397d60edfb3c725537415@kojedz.in/
> Tested-by: Richard Kojedzinszky <richard@kojedz.in>
> Signed-off-by: Huang-Huang Bao <i@eh5.me>
> ---
> 
> I have double checked the iomux offsets in debug message match iomux
> register definitions in "GRF Register Description" section in RK3328
> TRM[1].
> 
> [1]: https://opensource.rock-chips.com/images/9/97/Rockchip_RK3328TRM_V1.1-Part1-20170321.pdf
> 
> Kernel pinctrl debug message with dyndbg="file pinctrl-rockchip.c +p":
>   rockchip-pinctrl pinctrl: bank 0, iomux 0 has iom_offset 0x0 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 0, iomux 1 has iom_offset 0x4 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 0, iomux 2 has iom_offset 0x8 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 0, iomux 3 has iom_offset 0xc drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 1, iomux 0 has iom_offset 0x10 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 1, iomux 1 has iom_offset 0x14 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 1, iomux 2 has iom_offset 0x18 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 1, iomux 3 has iom_offset 0x1c drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 2, iomux 0 has iom_offset 0x20 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 2, iomux 1 has iom_offset 0x24 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 2, iomux 2 has iom_offset 0x2c drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 2, iomux 3 has iom_offset 0x34 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 3, iomux 0 has iom_offset 0x38 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 3, iomux 1 has iom_offset 0x40 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 3, iomux 2 has iom_offset 0x48 drv_offset 0x0
>   rockchip-pinctrl pinctrl: bank 3, iomux 3 has iom_offset 0x4c drv_offset 0x0
> 
> The "Closes" links to test report from original reporter with original
> issue contained, which was not delivered to any mailing list thus not
> available on the web.
> 
> Added CC stable as the problematic e8448a6c817c fixed by this patch was
> recently merged to stable kernels.
> 
> Sorry for the inconvenience caused,
> Huang-Huang
> 
>  drivers/pinctrl/pinctrl-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 3f56991f5b89..f6da91941fbd 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3813,7 +3813,7 @@ static struct rockchip_pin_bank rk3328_pin_banks[] = {
>  	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
>  	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
>  	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
> -			     0,
> +			     IOMUX_WIDTH_2BIT,
>  			     IOMUX_WIDTH_3BIT,
>  			     0),
>  	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
> 
> base-commit: 4376e966ecb78c520b0faf239d118ecfab42a119
> --
> 2.45.2
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

