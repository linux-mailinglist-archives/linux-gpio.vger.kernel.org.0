Return-Path: <linux-gpio+bounces-18754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7844FA87119
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 10:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5628A189BE32
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 08:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A251624DE;
	Sun, 13 Apr 2025 08:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFCE3lUP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56970522F;
	Sun, 13 Apr 2025 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744534297; cv=none; b=pwm8JXdq9SZsSQT4F7S2dRUSMYv1We8IJCFTud+luczbqf2Qq4cBvz3dLhiyeBpvgeL58KcCDR8TU8gd0+14aHhy0gadm9ufOK0jbZlWkVuEzUzATtzFPmbQa0in8bzNQl24KDJvB42At7VwXwvWNQH/VJ0ZZ8iBCXDCwscMNyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744534297; c=relaxed/simple;
	bh=pRoX/q/2coolHB4VZB3apk1N36kf7Ussilqd2NFA/EY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=j4a+BaTI5WJNNn82xRtnninFhpMqbZrtEsP25NIIvNnUWTAAYDtfYYt4Ju3q8nDw83DxfW8Qw6Xtyj6HsK5PYr1k+8Q0SoXA3fdQCgqw+fczF6o3dSRYEaoOsb7qrtCMEOwfxkyCg/Rxwp03HeY9HHf6CVV0ofbMW/4TSQc7LHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFCE3lUP; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549946c5346so3899920e87.2;
        Sun, 13 Apr 2025 01:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744534293; x=1745139093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=USePj4B7uL7LPaJT6+OAA1zkCrFisy790/xbpttRgmk=;
        b=kFCE3lUP8h9/2ay4CKW/AYfds9HTbZymufnUc2yUECm5RUc5pTDlkMNrd3MywwSpVR
         FtHP89ZgFKRKNMYWcB8mtbRMeIlBGBWFqCc7SrH32jfClEl/l1fhvffDjbaBdELFDHlu
         wgJgJZQW2Efy+TFin0ck2iClCHpg3VzpbWPVMYAYIjSm97wujNWed+0sUeWoCc2y67D8
         Pxj+ehmZADdzlaWJ+wH7v/qOER31vdKwATuUNcRUtDWFlQsCQoSB3ZLrt7P6gJLF6OKg
         EHtFEwBdkVQ7mM8eJMHCqKY2c6koHCLNswoLzoSn34ukBaU5oQV3FJd9aHh92pINNWwg
         6UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744534293; x=1745139093;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=USePj4B7uL7LPaJT6+OAA1zkCrFisy790/xbpttRgmk=;
        b=de09mRmBIkbcN0dXsRng0RFGGu9/SCh5aY5HInOzb/FN+4Zq8/Ehjl5xXaiW1unEtL
         sc8ZqcvstqVRNlu+/Bxnu3Y6ebAimHxobVcLAdvG8iUoG3sc+JQWYVfuIBhIcTZCAbY9
         Lu04ND3uQW4TxM6w9nZkLcFf/s3MWuVYriBabJWkPfFOMZ9RJRLAGsHQP717aPiWbmdn
         lgZ9mUqhSUc3QR1UYvc9AgC1wzRpVKOBlnCgptuG6Y4E2BMTKTZJXtb9Yn4O9IKA2PA3
         8MlTzcvy3l1/XQoAAn50I5+ku8o57SWt5kti66RUpy18ldnkqaAnj4nCMUzaO5zFopQ7
         zXRg==
X-Forwarded-Encrypted: i=1; AJvYcCUwEBql3t5of6l1gUVlqMnTiDh1eBn2N99L1ZmhYfadgsRFGxFOS248wq/WtzHcCyI5rhlm2eZsA0pD8K53@vger.kernel.org, AJvYcCVbrnbtQ4T462mJzjLXXcHhsKMUIg6KMKivkQXMlggb/e10RZA5om1nNxbsTfwD+gcXsp+8Y6Olf77mRg==@vger.kernel.org, AJvYcCWg9JRslTHkf5IZ4+b5mx8i3k89q/5SmYdsFuqgWXPAxYWCQXdZk7SwZB//ycnhd8Ffd0fDDgI/LK2wq+4g@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhqgbx32ulD7KHeSz6xEMdpPC9fYzGGYm2z+01CSM/Yvyc67z4
	Pi1cex2AfYO6NGp34gnhRfWa3LI4tHgm5ElA47IkzhGruD/VWBb26Y0rXg==
X-Gm-Gg: ASbGncsNiy4+dgY9O+sxT5c5NwJwRtfFDd5LZkizdzzkuW32pGDjIV3LzBytRDsDkJM
	06iSAKyMD7pjotXNnRqGExeAw5v7YOrMjCfB+zCBtYq1TQuvxVcL3VD+T1hO2r5AJP9on/YLk7i
	LtPxMl4vC9kPKAzL1qULoqd6eltprnoVf3NIpdJyMR//qVl1dwLV6RsZdW6cbkxXi88gF5vFwBi
	O4nLXJvZR5HnARgZTWKklfSg7BxFH8pZkYH5PZ8ZJf1NvFYZhCatXM4EPMyAQc8qniTlRIkm2se
	n3zls06GjmODYFcZu3Sb6/20hvzzYCbRXpzr/apE5h3/cx/S6rVN3scrQrjz/W1LscZcNK/D6JE
	m9m04l/mnn4RFRrrqBCm8CQ==
X-Google-Smtp-Source: AGHT+IHaLIn3GH+7L7gi+hPunoOc0U5DZgK9/Dld4YIkNihB+Z2UKF7msgarMGvN+tJxIosx+3yONw==
X-Received: by 2002:a05:6512:1316:b0:544:11cf:10c1 with SMTP id 2adb3069b0e04-54d4529dc2bmr2340782e87.30.1744534293009;
        Sun, 13 Apr 2025 01:51:33 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123168sm809476e87.3.2025.04.13.01.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 01:51:31 -0700 (PDT)
Message-ID: <5add8ddd-fcc8-445d-9699-42c27df0e1c7@gmail.com>
Date: Sun, 13 Apr 2025 11:51:29 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] gpio: Hide valid_mask from direct assignments
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <cover.1741180097.git.mazziesaccount@gmail.com>
 <4547ca90d910d60cab3d56d864d59ddde47a5e93.1741180097.git.mazziesaccount@gmail.com>
 <CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com>
 <944dab74-f431-41e1-b4d7-fddf25ffa147@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
In-Reply-To: <944dab74-f431-41e1-b4d7-fddf25ffa147@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/04/2025 11:08, Matti Vaittinen wrote:
> Hi Doug,
> 
> On 13/04/2025 02:00, Doug Anderson wrote:
>> Hi,
>>
>> On Wed, Mar 5, 2025 at 5:23 AM Matti Vaittinen 
>> <mazziesaccount@gmail.com> wrote:
>>>
>>> The valid_mask member of the struct gpio_chip is unconditionally written
>>> by the GPIO core at driver registration. Current documentation does not
>>> mention this but just says the valid_mask is used if it's not NULL. This
>>> lured me to try populating it directly in the GPIO driver probe instead
>>> of using the init_valid_mask() callback. It took some retries with
>>> different bitmaps and eventually a bit of code-reading to understand why
>>> the valid_mask was not obeyed. I could've avoided this trial and 
>>> error if
>>> the valid_mask was hidden in the struct gpio_device instead of being a
>>> visible member of the struct gpio_chip.
>>>
>>> Help the next developer who decides to directly populate the valid_mask
>>> in struct gpio_chip by hiding the valid_mask in struct gpio_device and
>>> keep it internal to the GPIO core.
>>>
>>> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>> ---
>>> Revision history:
>>> v2 => v3:
>>>   - Rebase to gpio/for-next
>>> v1 => v2:
>>>   - Hide the valid_mask instead of documenting it as internal to GPIO
>>>     core as suggested by Linus W.
>>> https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/
>>> ---
>>>   drivers/gpio/gpiolib.c      | 16 ++++++++--------
>>>   drivers/gpio/gpiolib.h      |  3 +++
>>>   include/linux/gpio/driver.h |  8 --------
>>>   3 files changed, 11 insertions(+), 16 deletions(-)
>>
>> FWIW, I've found that this patch is crashing me at bootup on my
>> sc7180-trogdor board. The problem is pretty obvious in gdb.
>> "gc->gpiodev" is NULL in gpiochip_line_is_valid().
> 
> Thanks for debugging this! I find this odd. It seems to me the pinctrl- 
> msm.c is calling the gpiochip_add_data() for the chip, in the 
> msm_gpio_init() - which is called from the msm_pinctrl_probe().
> 
> The gpiochip_add_data() should go to the gpiochip_add_data_with_key() - 
> where the gpiodev should be allocated and set.
> 
> I don't spot any successful code path where the gpiodev was not allocated.
> 
>>
>> 0xffff80008066c760 in gpiochip_line_is_valid (gc=0xffff000083223890,
>> offset=offset@entry=66) at drivers/gpio/gpiolib.c:746
>> 746             if (likely(!gc->gpiodev->valid_mask))
>> (gdb) bt
>> #0  0xffff80008066c760 in gpiochip_line_is_valid
>> (gc=0xffff000083223890, offset=offset@entry=66) at
>> drivers/gpio/gpiolib.c:746
>> #1  0xffff800080666338 in msm_pinmux_request (pctldev=<optimized out>,
> 
> Ah, but now I see the call comes from the pinmux. Looking at the 
> msm_pinctrl_probe() - the pincontroller is registered before the gpio. 
> Maybe, with unlucky timing, the request happens right after registering 
> the pinctrl - but before registering the gpios.
> 
> This, I think, can be a bug even before this change (because the 
> valid_mask is not initialized prior the gpio registration) - but this 
> change now made it obvious.
> 
> I see the probe is actually an exported function, and there are mentions 
> about ACPI support etc. I don't really know if there are valid cases 
> where the pincontroller should be usable without the gpiochip. If this 
> is the case, the unconditional call to the gpiochip_line_is_valid() from 
> the msm_pinmux_request() smells wrong.
> 
> I am not sure about the right fix. One could try:
> 
> @@ -1568,6 +1568,10 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>          if (pctrl->irq < 0)
>                  return pctrl->irq;
> 
> +       ret = msm_gpio_init(pctrl);
> +       if (ret)
> +               return ret;
> +
>          pctrl->desc.owner = THIS_MODULE;
>          pctrl->desc.pctlops = &msm_pinctrl_ops;
>          pctrl->desc.pmxops = &msm_pinmux_ops;
> @@ -1582,10 +1586,6 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>                  return PTR_ERR(pctrl->pctrl);
>          }
> 
> -       ret = msm_gpio_init(pctrl);
> -       if (ret)
> -               return ret;
> -
>          platform_set_drvdata(pdev, pctrl);
> 
>          dev_dbg(&pdev->dev, "Probed Qualcomm pinctrl driver\n")
> 
> but I am not at all this is the fix we're looking after. I wonder if 
> Krzysztof has any suggestions? (Seeing he has been authoring some 
> changes here :] )
> 

+Björn

> Yours,
>      -- Matti
> 
> 
>> offset=66) at drivers/pinctrl/qcom/pinctrl-msm.c:152
>> #2  0xffff800080662314 in pin_request (pctldev=0xffff000082686ac0,
>> pin=66, owner=0xffff000082c02790 "3500000.pinctrl", gpio_range=0x0)
>>      at drivers/pinctrl/pinmux.c:176
>> #3  0xffff800080662900 in pinmux_enable_setting
>> (setting=0xffff000082684b40) at drivers/pinctrl/pinmux.c:445
>> #4  0xffff80008065fd54 in pinctrl_commit_state (p=0xffff000083a07520,
>> state=0xffff000082684a40) at drivers/pinctrl/core.c:1300
>> #5  0xffff8000806605bc in pinctrl_select_state (p=0xffff000083223890,
>> p@entry=0xffff000082686ac0, state=0x42) at drivers/pinctrl/core.c:1381
>> #6  pinctrl_claim_hogs (pctldev=0xffff000082686ac0) at
>> drivers/pinctrl/core.c:2136
>> #7  pinctrl_enable (pctldev=0xffff000082686ac0) at drivers/pinctrl/ 
>> core.c:2156
>> #8  0xffff800080660814 in pinctrl_register
>> (pctldesc=0xffff000083223a90, dev=0xffff000081406410,
>> driver_data=0xffff000083223880) at drivers/pinctrl/core.c:2193
>> #9  0xffff800080660df4 in devm_pinctrl_register
>> (dev=0xffff000081406410, pctldesc=0xffff000083223a90,
>> driver_data=0xffff000083223880) at drivers/pinctrl/core.c:2313
>> #10 0xffff8000806657b4 in msm_pinctrl_probe (pdev=0xffff000081406400,
>> soc_data=<optimized out>) at drivers/pinctrl/qcom/pinctrl-msm.c:1579
>> #11 0xffff80008066afcc in sc7180_pinctrl_probe
>> (pdev=0xffff000083223890) at
>> drivers/pinctrl/qcom/pinctrl-sc7180.c:1147
>> #12 0xffff80008089583c in platform_probe (_dev=0xffff000081406410) at
>> drivers/base/platform.c:1404
>>
>> (gdb) print gc->gpiodev
>> $1 = (struct gpio_device *) 0x0
>>
>> -Doug
> 


