Return-Path: <linux-gpio+bounces-32745-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMRUKGk/rWmN0AEAu9opvQ
	(envelope-from <linux-gpio+bounces-32745-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 10:20:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1903922F25C
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 10:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E1C23010242
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 09:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F333603D7;
	Sun,  8 Mar 2026 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY+9Mjn5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC2035BDBE
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772961634; cv=none; b=XiYtztLZF7tDd6+sFXZfVBIzTTxGtkeDWtOo+Z5x/KQ0xSk933ijzC3Lno02OiSVUKnfaH3kt1scQ8R7/ry1O978vuwWCSxJfnnFd/rQ4+Orqv+omM+rC3DW7gQMMvOI8B/oAAdEeXaC926nNxtcPIdI7FaKXm6iL26sBM2HKXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772961634; c=relaxed/simple;
	bh=0LZDtn8JtPRJMlCx1W8pvuWB7H8Xp1Sg7TEx3GBZpOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAgfApL4M6lbGsMwNEIjkOxzdaKQSAV0YZKPrCBcmIhZF9a9ldy1fU5fY/8MSmGl5l1Bmea5suF+jyCjq9LTMv7iMM3pSnK/Z8LIGwEMly5t8b+Cc5EHIZl7WSZDuihs+TJ9EtoVEh4hecqdRkdxeA8OZx00m/rtxs75XlskhvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HY+9Mjn5; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb38e6d164so1397582285a.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2026 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772961631; x=1773566431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCfP2n03UmP2Gyi/wszYkFcZJsFegmS+/KM+muaSkU8=;
        b=HY+9Mjn51AMEBiuvEjnuREtBGbYhdIqGj8zX7oXx62JGzm0EpxGAzqljmhZN49TvJ+
         nDhRHA0MzMaG7IbbUKaNITJ/ngqEC+C3Q9Rjx4Zn+jDImaHTWDlRPxWMD0Rx1s9Xc1FN
         +UNzMqomthkCpcgUByj+cSUcacII9iCw0UYIMvUdZ9c4wQRrQuvdIOJS2Z1ZG6daUuXx
         quF2jcLlViFP4jkwWMYy/jgbB0WiTFGHcQvqLvQ9r0albrCjeA0mngGDFYovzX4lUUlw
         zO2ju9+LVo0qnMRvJizqf3uF9dLq7a2UoY47E0zdjSU4HWRK+Zf2wca/HqXKceHo5xGD
         pl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772961631; x=1773566431;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCfP2n03UmP2Gyi/wszYkFcZJsFegmS+/KM+muaSkU8=;
        b=gqAZ4P0uCdiaFCsgzyw5pH+8KpV8yvHU5jGf9Q02Z54LdvL/jO/WhvhOzCENLUMJQ5
         uzsLduV8y5YKWQj8EzmRMEgo99vcY5YZpiAWBRajG8+Gw9+xrcL+jIda/Q9+utUqQJ7l
         ZRCa6XWqtCoXfulsviJeBdmgQqRrZm0pRRWUdSi4YRtSBEL6Ky86+GHxKHqj96f2A4Sd
         PqW40R56ZPi05c7k/By42XzdtgyTmZtYxBAccnWRzo3GuxR9lJZLgPrPjKg5/gxrsi3x
         NqhrPqGfd3l1t8lkkIEa3XUHx97FgFUP77XlQjOdGspczKMi3vv0SMi2QR6M5ZUaoNx9
         gu4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeflhCPV+A+NaWE3Xb37/glW42pnng/1CTCgoNRVSVeLYB1hJ9QUJlv5zb7kCIKBvzBnlCdD2UhcNo@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBrW5y2AeMqRSz/F799BRhw2QFQUa2A3k/LREl0TKo7y1GJSM
	AF4V3J+H9Pnj53H6lawsINRr069hVNYOwPt0LHVgXql58U+41uPq4wcF
X-Gm-Gg: ATEYQzwzQGkFIdHlUP/1993NalLOuRc3BP22QwDKqM06sTCLlwQjyZx8G/qU69+0YED
	INQYbNTQ0WuglwXDRiHhviIQihwxfvCTiMIP0W+UjD2ZjqYlc81p3sn7HyW9J4DliLf/OKAO6be
	f1e+pnwVmKZvU8z6xZPhgEBspHQctlArEJIZNVHAYT538I+4Jsms+EIFk/wB/VrZnRcPhUyt/6j
	TWBEfnCEZExIMK2kqeDS+VXp75sNDwxIxvBHMB1OfD+6z5phNJy4XtMLoJdf5kCvWS06hVZGUtl
	nLNf351T9tD+zzXOkRHh906r7SPzQi9Cp4EoFLXzwT/7bJVjtL2FtBom69gk7yNAIvHHNAMDO8w
	1d2p4cIBCoYIg2SGlfTT66xcdMPKQ+vrnFv4V75NUFjbnY4AFexZmhBBFydIDh130IeA5tFSoGD
	Vp5ECAesirOTuQrVziQbIxpKELB1+q
X-Received: by 2002:a05:6214:248b:b0:89a:929:9e4e with SMTP id 6a1803df08f44-89a30a174cbmr113884606d6.14.1772961630635;
        Sun, 08 Mar 2026 01:20:30 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a316da67esm51697736d6.25.2026.03.08.01.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 01:20:30 -0800 (PST)
Date: Sun, 8 Mar 2026 12:20:28 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
Message-ID: <aa0_XDMMtReKQ0Vh@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260224092419.1275016-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224092419.1275016-1-wens@kernel.org>
X-Rspamd-Queue-Id: 1903922F25C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32745-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,sholland.org,gmail.com,wens.tw,vger.kernel.org,lists.infradead.org,lists.linux.dev,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrejskvortzov@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,skv.local:mid]
X-Rspamd-Action: no action

On 26-02-24 17:24, Chen-Yu Tsai wrote:
> After commit 471e998c0e31 ("gpiolib: remove redundant callback check"),
> a warning will be printed if the gpio driver does not implement this
> callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> sanitize the return value of gpio_chip::get_direction()"), but was
> masked by the "redundant" check.
> 
> The warning can be triggered by any action that calls the callback,
> such as dumping the GPIO state from /sys/kernel/debug/gpio.
> 
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Please merge for fixes.
> 
> Changes since v1:
> - Corrected commit attribution for the warning
> - Add example scenario that triggers the warning
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 51 +++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 0fb057a07dcc..27b2a3e9d78d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -204,6 +204,32 @@ sunxi_pinctrl_desc_find_function_by_pin(struct sunxi_pinctrl *pctl,
>  	return NULL;
>  }
>  
> +static struct sunxi_desc_function *
> +sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
> +						const u16 pin_num,
> +						const u8 muxval)
> +{
> +	for (unsigned int i = 0; i < pctl->desc->npins; i++) {
> +		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
> +		struct sunxi_desc_function *func = pin->functions;
> +
> +		if (pin->pin.number != pin_num)
> +			continue;
> +
> +		if (pin->variant && !(pctl->variant & pin->variant))
> +			continue;
> +
> +		while (func->name) {
> +			if (func->muxval == muxval)
> +				return func;
> +
> +			func++;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
>  static int sunxi_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>  	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> @@ -930,6 +956,30 @@ static const struct pinmux_ops sunxi_pmx_ops = {
>  	.strict			= true,
>  };
>  
> +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> +					    unsigned int offset)
> +{
> +	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> +	const struct sunxi_desc_function *func;
> +	u32 pin = offset + chip->base;
> +	u32 reg, shift, mask;
> +	u8 muxval;
> +
> +	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> +
> +	muxval = (readl(pctl->membase + reg) & mask) >> shift;
> +
> +	func = sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pin, muxval);
> +	if (!func)
> +		return -ENODEV;


This change introduces regression in linux-next. Several drivers on
Allwinner A64 fail to probe. For example,

 gpio gpiochip1: (1c20800.pinctrl): gpiochip_lock_as_irq: cannot get GPIO direction
 sun50i-a64-pinctrl 1c20800.pinctrl: unable to lock HW IRQ 69 for IRQ
 genirq: Failed to request resources for inv_mpu (irq 163) on irqchip sunxi_pio_edge

inv_mpu6050_i2c tries to get interrupt without initializing gpio before.

muxval in the case of uninitialized gpio is 0x7 (IO Disable) and
returned func value is NULL.


Some pinctrl return error for alternate configuration. For example,
pinctrl-stm32 returns -EINVAL [1].


But other drivers return one of non-error values.

pinctrl-axp209 defaults to GPIO_LINE_DIRECTION_OUT [2] 
        /*
	 * This shouldn't really happen if the pin is in use already,
	 * or if it's not in use yet, it doesn't matter since we're
	 * going to change the value soon anyway. Default to output.
	 */
	if ((val & AXP20X_GPIO_FUNCTIONS) > 2)
		return GPIO_LINE_DIRECTION_OUT;

pinctrl-upboard defaults to GPIO_LINE_DIRECTION_IN [3].
       /* If the pin is in function mode or high-z, input direction is
       returned */


pinctrl-rza2 defaults to GPIO_LINE_DIRECTION_IN as well [4].
        /*
	 * This GPIO controller has a default Hi-Z state that is not input or
	 * output, so force the pin to input now.
	 */


Should default be here GPIO_LINE_DIRECTION_IN here as well instead of -ENODEV?

> +	if (!strcmp(func->name, "gpio_out"))
> +		return GPIO_LINE_DIRECTION_OUT;
> +	if (!strcmp(func->name, "gpio_in") || !strcmp(func->name, "irq"))
> +		return GPIO_LINE_DIRECTION_IN;
> +	return -EINVAL;



Alternative solution would be converting handling of return value in
gpiochip_lock_as_irq to warning level. Since the value dir isn't
used. The call flushes the direction setting if something changed
behind our back. [5]

--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4107,11 +4107,9 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
        if (!gc->can_sleep && gc->get_direction) {
                int dir = gpiod_get_direction(desc);
 
-               if (dir < 0) {
-                       gpiochip_err(gc, "%s: cannot get GPIO direction\n",
+               if (dir < 0)
+                       gpiochip_warn(gc, "%s: cannot get GPIO direction\n",
                                     __func__);
-                       return dir;
-               }
        }


1. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/stm32/pinctrl-stm32.c#L437
2. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/pinctrl-axp209.c#L175
3. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/pinctrl-upboard.c#L840
4. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/pinctrl/renesas/pinctrl-rza2.c#L148
5. https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/gpio/gpiolib.c#L4084

-- 
Best regards,
Andrey Skvortsov

