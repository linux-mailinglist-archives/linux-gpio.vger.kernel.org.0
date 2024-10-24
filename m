Return-Path: <linux-gpio+bounces-11943-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EEC9AE402
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 13:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1B401C22BDB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 11:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5850714BF87;
	Thu, 24 Oct 2024 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW04rVu0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217541C75F9;
	Thu, 24 Oct 2024 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769661; cv=none; b=r+v9tpds1wdcXt6eocxIU5KRxQh94pQRzXSUU+LwLqI4Q6L8C04xfh9hTqQWHyuJhF2UjeWgA1qYc9PiswJ1sLPOgwzpR8SkCcwpJE08SGannbbBqE2giUCiLhol6ABDZTr8Zkx/IhBrrXB3I4QypwJl+5r1oAZFX6Y/DIaELgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769661; c=relaxed/simple;
	bh=OceuGGVx4uXNnbnqyzie2luTcuVRMezUeltbXxdeqEE=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=TC1e3UtT7DbuDZKfs+k93NE5WK2M74lWBOWuu8Cz0eEVjiYcWy/eUhPAIclaqnLDwp6GMlFQ9kl7uhEFcCUa7ccgNPFBXZUdx9rsKbK3rSktsytby5FyVn/QlOFItilwlw+ofeqCadOy20m/wKnA7uGnNkbPi3xH78VK4B1swNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW04rVu0; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb49510250so8388441fa.0;
        Thu, 24 Oct 2024 04:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729769656; x=1730374456; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsQncd25owpjfdXoXU9F5apeEFv3sXjB5NJfFafQVzM=;
        b=iW04rVu0D2LfZu3rFfLKWMf/ZcihfHY9iT8bpapktU7JeZIXvgp4gq9ydSUVaL8Ggm
         eOAG3rHwbbdAD4ojQnFe1b0KPWz5rPR2kGJNiu7iw9ai+S0zh1kxyK8yb8xDjMK7SU5z
         FSqZzIjpBL6nCB+DlRDb2u98PQjPoQaP6Niu+EdNCb2v3HiVTsjWGL5h2Vy+oRNPfBbP
         oI4xKTmtVdex0UIEgXFq061Eq4C8SHNuhAAEoYf09OhniunH3pOaWAr0I40WyX5QeyHp
         dTGlm/g+Mpf8/NLp0ckOQCZdX0xTwYqy+/k1qIgKzYYxCmwwJP6KGu9L41Q4YnYuqWba
         nzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769656; x=1730374456;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YsQncd25owpjfdXoXU9F5apeEFv3sXjB5NJfFafQVzM=;
        b=HnwXZnmfA+tutohXvCHW9X4UOPvGQHBbFr1rqZMPcP5ANeAe8PeR6bTARr24da8UmI
         6X+nrN6hcWTZPvt9f6vaFMRqhwlTW6jmiNxbOVjGeOAXjlN/XxyPkTDT19XaSLngNgJD
         WX/eJhnDldyxScqi1foYCD108tjQsxrF9aSfx8Bk3B5KFbS5p/UaDKEgMP7rWFWjD9oN
         jru708PxgHT1GRNI6ZrGN7vnx9bEOGofDQ1rbxEI9lPA4OXM1flaHGBhyx3/R2uXrBcq
         9dGqhAo/r8DLWInwVHKbWrP2dBladHJhZmyNLyzkO04FW/xRkqPxxtRS8fG68n5AP1nO
         URPw==
X-Forwarded-Encrypted: i=1; AJvYcCW5PDu0Ai6qGuZL1j9ynub7rhXlz2o606LIQJYfBD6OG4rW+aFcINBFG+f5bJ6zPEW/i+k9hDwQhxh4kCWU@vger.kernel.org, AJvYcCWfWxXzplMOVPUITxi2aCVJcddHSZ581nYjEEALyuzRcjKk6XOeiNUgY03ko9y9zwnkvlTS2gdO24XA@vger.kernel.org
X-Gm-Message-State: AOJu0YwMjKfc2xZJRNMSFSc6C4hghyxqUHb9p4Zd1Tr2wY7+/v1+GwUv
	befsxktiO0abRroPQYvqaVqpYpA2IG2yq0A5ussMk3kcT9gyyNaf
X-Google-Smtp-Source: AGHT+IGlxu2grdHmctp+ae1imSdQFA3g3itBCSb8mjiPY4dlXIsPNQBromHQsNci5+indQ+a30MpdQ==
X-Received: by 2002:a2e:6111:0:b0:2fc:9869:2e19 with SMTP id 38308e7fff4ca-2fc9d59f0d5mr24909771fa.34.1729769655467;
        Thu, 24 Oct 2024 04:34:15 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1202:4fb5:f16a:579c:6dcb? (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad7621csm13933661fa.50.2024.10.24.04.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 04:34:14 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------c4fNOs0pdsGsnSpfgcdLVePm"
Message-ID: <bf16af3b-d00e-4084-aa29-6e4c1955ed88@gmail.com>
Date: Thu, 24 Oct 2024 13:34:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] gpiolib: notify user-space about in-kernel line
 state changes
To: Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
 <20241018-gpio-notify-in-kernel-events-v5-8-c79135e58a1c@linaro.org>
 <d6601a31-7685-4b21-9271-1b76116cc483@sirena.org.uk>
 <CAMRc=MfW9n+y8Dehe_g9b8_=he1YuFr3CEGG3iQEfjYwFiWA_g@mail.gmail.com>
 <CAMRc=MdER_JNcvPMRuzbDFpAUqarC9K8KRP+i5SFTW3H7Mkg=w@mail.gmail.com>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <CAMRc=MdER_JNcvPMRuzbDFpAUqarC9K8KRP+i5SFTW3H7Mkg=w@mail.gmail.com>

This is a multi-part message in MIME format.
--------------c4fNOs0pdsGsnSpfgcdLVePm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2024-10-24 10:15, Bartosz Golaszewski wrote:
> On Thu, 24 Oct 2024 08:49:30 +0200, Bartosz Golaszewski <brgl@bgdev.pl> said:
>> On Wed, Oct 23, 2024 at 11:05 PM Mark Brown <broonie@kernel.org> wrote:
>>>
>>> On Fri, Oct 18, 2024 at 11:10:16AM +0200, Bartosz Golaszewski wrote:
>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>
>>>> We currently only notify user-space about line config changes that are
>>>> made from user-space. Any kernel config changes are not signalled.
>>>>
>>>> Let's improve the situation by emitting the events closer to the source.
>>>> To that end let's call the relevant notifier chain from the functions
>>>> setting direction, gpiod_set_config(), gpiod_set_consumer_name() and
>>>> gpiod_toggle_active_low(). This covers all the options that we can
>>>> inform the user-space about. We ignore events which don't have
>>>> corresponding flags exported to user-space on purpose - otherwise the
>>>> user would see a config-changed event but the associated line-info would
>>>> remain unchanged.
>>>
>>> Today's -next is not booting on several of my platforms, including
>>> beaglebone-black, i.MX8MP-EVK and pine64plus.  Bisects are pointing at
>>> this commit, and i.MX8MP-EVK is actually giving some console output:
>>>
>>> [    2.502208] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>>> [    2.511036] Mem abort info:
>>>
>>> ...
>>>
>>> [    2.679934] Call trace:
>>> [    2.682379]  gpiod_direction_output+0x34/0x5c
>>> [    2.686745]  i2c_register_adapter+0x59c/0x670
>>> [    2.691111]  __i2c_add_numbered_adapter+0x58/0xa8
>>> [    2.695822]  i2c_add_adapter+0xa0/0xd0
>>> [    2.699578]  i2c_add_numbered_adapter+0x2c/0x38
>>> [    2.704117]  i2c_imx_probe+0x2d0/0x640
>>>
>>> which looks plausible given the change.
>>>
>>> Full boot log for i.MX8MP-EVK:
>>>
>>>     https://lava.sirena.org.uk/scheduler/job/887083
>>>
>>> Bisect log for that, the others look similar (the long run of good/bad
>>> tags at the start for random commits is my automation pulling test
>>> results it already knows about in the affected range to try to speed up
>>> the bisect):
>>>
>>
>> Hi Mark!
>>
>> Any chance you could post the output of
>>
>>      scripts/faddr2line drivers/gpio/gpiolib.o gpiod_direction_output+0x34/0x5c
>>
>> for that build?
>>
>> Bart
>>
> 
> While I can't really reproduce it, I've looked at what could be wrong and
> figured that the NULL-pointer in question can possibly be the
> line_state_notifier.
> 
> I realized that for some historical reasons we add the GPIO device to the
> global list before it's fully set up - including initializing the notifier.
> In some corner cases (devlinks borked?) this could lead to consumers requesting
> GPIOs before their provider is ready.
> 
> Mark: could you try the following diff and let me know if it works?
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ae758ba6dc3d..4258acac0162 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -987,45 +987,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> 
>   	gdev->ngpio = gc->ngpio;
>   	gdev->can_sleep = gc->can_sleep;
> -
> -	scoped_guard(mutex, &gpio_devices_lock) {
> -		/*
> -		 * TODO: this allocates a Linux GPIO number base in the global
> -		 * GPIO numberspace for this chip. In the long run we want to
> -		 * get *rid* of this numberspace and use only descriptors, but
> -		 * it may be a pipe dream. It will not happen before we get rid
> -		 * of the sysfs interface anyways.
> -		 */
> -		base = gc->base;
> -		if (base < 0) {
> -			base = gpiochip_find_base_unlocked(gc->ngpio);
> -			if (base < 0) {
> -				ret = base;
> -				base = 0;
> -				goto err_free_label;
> -			}
> -
> -			/*
> -			 * TODO: it should not be necessary to reflect the
> -			 * assigned base outside of the GPIO subsystem. Go over
> -			 * drivers and see if anyone makes use of this, else
> -			 * drop this and assign a poison instead.
> -			 */
> -			gc->base = base;
> -		} else {
> -			dev_warn(&gdev->dev,
> -				 "Static allocation of GPIO base is deprecated, use dynamic allocation.\n");
> -		}
> -
> -		gdev->base = base;
> -
> -		ret = gpiodev_add_to_list_unlocked(gdev);
> -		if (ret) {
> -			chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
> -			goto err_free_label;
> -		}
> -	}
> -
>   	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
>   	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
> 
> @@ -1103,6 +1064,45 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   		if (ret)
>   			goto err_remove_irqchip;
>   	}
> +
> +	scoped_guard(mutex, &gpio_devices_lock) {
> +		/*
> +		 * TODO: this allocates a Linux GPIO number base in the global
> +		 * GPIO numberspace for this chip. In the long run we want to
> +		 * get *rid* of this numberspace and use only descriptors, but
> +		 * it may be a pipe dream. It will not happen before we get rid
> +		 * of the sysfs interface anyways.
> +		 */
> +		base = gc->base;
> +		if (base < 0) {
> +			base = gpiochip_find_base_unlocked(gc->ngpio);
> +			if (base < 0) {
> +				ret = base;
> +				base = 0;
> +				goto err_free_label;
> +			}
> +
> +			/*
> +			 * TODO: it should not be necessary to reflect the
> +			 * assigned base outside of the GPIO subsystem. Go over
> +			 * drivers and see if anyone makes use of this, else
> +			 * drop this and assign a poison instead.
> +			 */
> +			gc->base = base;
> +		} else {
> +			dev_warn(&gdev->dev,
> +				 "Static allocation of GPIO base is deprecated, use dynamic allocation.\n");
> +		}
> +
> +		gdev->base = base;
> +
> +		ret = gpiodev_add_to_list_unlocked(gdev);
> +		if (ret) {
> +			chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
> +			goto err_free_label;
> +		}
> +	}
> +
>   	return 0;
> 
>   err_remove_irqchip:
> 
> Thanks
> Bartosz
> 

I think I hit the same, or a similar bug, on my Edgerouter 6P (Cavium 
Octeon III):

CPU 3 Unable to handle kernel paging request at virtual address 
0000000000000000, epc == ffffffff817a40c8, ra == ffffffff817a40a4
Oops[#1]:
CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
6.12.0-rc4-next-20241023-00032-g01c8e35f8d89 #84
...
Call Trace:
gpiod_direction_output (drivers/gpio/gpiolib.c:4164 
drivers/gpio/gpiolib.c:2700 drivers/gpio/gpiolib.c:2694)
i2c_register_adapter (drivers/i2c/i2c-core-base.c:396 
drivers/i2c/i2c-core-base.c:422 drivers/i2c/i2c-core-base.c:434 
drivers/i2c/i2c-core-base.c:1574)
octeon_i2c_probe (drivers/i2c/busses/i2c-octeon-platdrv.c:247)

(the complete log is attached)

Unfortunately the oops remains after applying the diff and the call 
trace looks to be the same.

Please let me know if there's anything else you need.

Regards,
Klara Modin
--------------c4fNOs0pdsGsnSpfgcdLVePm
Content-Type: application/gzip; name="gpiod_oops_decoded.gz"
Content-Disposition: attachment; filename="gpiod_oops_decoded.gz"
Content-Transfer-Encoding: base64

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
z/+G4lZqJ1t/OII4jm1T6b/xhlb7dpZ+yPllW8xlut5izF2xRdEoo4VAlnB+jkZA3rk6Co6i
/E8Ygolpm1ZkMpVViN+51fQBaYlkY8Z2Po8Ji31TzbV3yP6qlGmgt5nPe2lt0y5/SxaLFkpv
nbWCDZuynTYNVmxqvcCmmAoZVWXN3s7p+WV76C87PZ9lEtJDq2oxxZ38kVxclmm+AqJr/FwP
8yHImzfVIEyTNnSbwtG3Rv1hv0lRG7HLtEzhoTZFnEvEoXfhVEItopVH74NuMMZ23H4mzKJH
FfZxSBnVL+6tHDbv0iVwfn26rDGLLGoLLsTBcp9R4ytXzaNLPXYFA6Vf1TKv/E7Kc+lu1vsR
7es6pv4NPryiZTdetWIO0mbeiZnrYqIVC6vF4qkTwyLTWhETG2JsKaYwrKWLFTnPJJKK2vfr
de0il+724oU2Wo2xmqZSqo4dLYTneFTaPUQYnSqZYy7/DQ8/0iEwqlybRRxgHFLw8PAwaIcO
Atw1VOtFyYzeH1sLq8KwHNdYA+5K8aOTYyzHGZXjzIP/kgVq/nYAp7ifkpmKQ/inPvfz10ce
CJrmXwN4i1XkZ5Iu2rcau8lYbYhFGKWTpSWW3kN/B3TFhysdpVspLhxq7u6W8vZKeS5D/y+r
xIebhIxZyBiuby7eXL+9Wm90IFke2K0gbmna0eFDQK/hLn2b1unxNojIPnVpUae0RVSgSYPb
AWJNFtRkRyMHde6gzkELK4Rpd7De94K10O2RAhBG/zYI2wPcE/Regw+Pv5yM4BfqYZy0ubGT
doVnHJKmptDN+F3TfFgmxh7ymSKaJ6gPXUjqkMRaWCSdln0I9jYI6mhSkDch/5kZNpaDQdSx
FOqRwJ9VlN8Vjce5lLR47TXtVI7l0COC/VNRPOYYjZEvNL2X1TVtcVzOD1vioB1dxz28Ci+x
I29hPWQRB29O69N0ugo9gYmhYFxlKh9nqvMGhDHo9m6rKbC+4WPI8PVwOqGjczcS9ybfGMnq
NmiIsR/9rxvLGMYP3U2kH45BSVG2+akEen9L1xEynqc5VlmL+lXss6vz+pXsW8yDtJF7K+9V
48U2VlicVK714Ic15oIxe2PkPo25qzsm2xZlz1hmeu4hdi4z+wvLbLawGBeFdQj2u7mLZeGK
8UNTaXex19zF23YXy8KQLP6yHW1TUEH4fewoWliHMfOgHZ/tLg5W36LeUubhzedy09scuW/z
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
x+P2A1vaOikHyn/Ev8H+DzN97PsWRgAA
--------------c4fNOs0pdsGsnSpfgcdLVePm
Content-Type: text/plain; charset=UTF-8; name="gpio_oops_bisect"
Content-Disposition: attachment; filename="gpio_oops_bisect"
Content-Transfer-Encoding: base64

IyBiYWQ6IFszMDIyNmFkMTY1NjI2ZmExZDAwOTQ1NzU4ZWNhZmNmYmRiNDdhZWQwXSBzY2hl
ZC9leHQ6IGZpeCBmbXQgZm10X19zdHIgaW5jb25zaXN0ZW5jeQpnaXQgYmlzZWN0IHN0YXJ0
ICdIRUFEJwojIHN0YXR1czogd2FpdGluZyBmb3IgZ29vZCBjb21taXQocyksIGJhZCBjb21t
aXQga25vd24KIyBnb29kOiBbYzJlZTlmNTk0ZGE4MjZiZWExODNlZDE0ZjJjYzAyOWM3MTli
ZjRkYV0gS1ZNOiBzZWxmdGVzdHM6IEZpeCBidWlsZCBvbiBvbiBub24teDg2IGFyY2hpdGVj
dHVyZXMKZ2l0IGJpc2VjdCBnb29kIGMyZWU5ZjU5NGRhODI2YmVhMTgzZWQxNGYyY2MwMjlj
NzE5YmY0ZGEKIyBnb29kOiBbMWY2NGZiOWMyMDQwYzAxOGQwZTA0NWI3ODViM2QxMWEzYmMw
YmY2MV0gTWVyZ2UgYnJhbmNoICdtYXN0ZXInIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9oZXJiZXJ0L2NyeXB0b2Rldi0yLjYuZ2l0CmdpdCBi
aXNlY3QgZ29vZCAxZjY0ZmI5YzIwNDBjMDE4ZDBlMDQ1Yjc4NWIzZDExYTNiYzBiZjYxCiMg
Z29vZDogW2Q3MjI5M2ZjZGFkZjRjYTlmZTI2NWM5MDU3ZTJkNGU0YjhjM2ZhN2ZdIE1lcmdl
IGJyYW5jaCAnbmV4dCcgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3VsZmgvbW1jLmdpdApnaXQgYmlzZWN0IGdvb2QgZDcyMjkzZmNkYWRmNGNh
OWZlMjY1YzkwNTdlMmQ0ZTRiOGMzZmE3ZgojIGdvb2Q6IFtkOWU3ZDU2YWMyM2JhMTNlMTI1
NWZhMTE0YWExYjkwOTkzMzg2YTQwXSBNZXJnZSBicmFuY2ggJ2NoYXItbWlzYy1uZXh0JyBv
ZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ3JlZ2to
L2NoYXItbWlzYy5naXQKZ2l0IGJpc2VjdCBnb29kIGQ5ZTdkNTZhYzIzYmExM2UxMjU1ZmEx
MTRhYTFiOTA5OTMzODZhNDAKIyBiYWQ6IFthMzdkOWExYjE5NzY3ODY2ZmViYWQ1OTc2NTgw
NjA0MmJjNDlhZDdjXSBNZXJnZSBicmFuY2ggJ2dwaW8vZm9yLW5leHQnIG9mIGdpdDovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icmdsL2xpbnV4LmdpdApn
aXQgYmlzZWN0IGJhZCBhMzdkOWExYjE5NzY3ODY2ZmViYWQ1OTc2NTgwNjA0MmJjNDlhZDdj
CiMgZ29vZDogWzEwOTZjY2MxNzcwN2ViNTBmNjc3YTY0NTdiZjY1NTI3YmRmMTNkNTFdIE1l
cmdlIGJyYW5jaCAnc3RhZ2luZy1uZXh0JyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvZ3JlZ2toL3N0YWdpbmcuZ2l0CmdpdCBiaXNlY3QgZ29v
ZCAxMDk2Y2NjMTc3MDdlYjUwZjY3N2E2NDU3YmY2NTUyN2JkZjEzZDUxCiMgZ29vZDogW2M2
YjY3M2RkNjc4MzNmMTJhNTJlZWRiMmQ3YmIyNDI5ZDdkOTVhOGRdIE1lcmdlIGJyYW5jaCAn
Zm9yLW5leHQnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9ta3Avc2NzaS5naXQKZ2l0IGJpc2VjdCBnb29kIGM2YjY3M2RkNjc4MzNmMTJhNTJl
ZWRiMmQ3YmIyNDI5ZDdkOTVhOGQKIyBnb29kOiBbM2JkMTNhZTA0Y2NjMjBlM2EzMTI1OTZm
ODlhMjY5YjhiNjQxNmRjYV0gZ3BpbzogbWVuejEyNzogc2ltcGxpZnkgZXJyb3IgcGF0aCBh
bmQgcmVtb3ZlIHJlbW92ZSgpCmdpdCBiaXNlY3QgZ29vZCAzYmQxM2FlMDRjY2MyMGUzYTMx
MjU5NmY4OWEyNjliOGI2NDE2ZGNhCiMgYmFkOiBbM2FiYTg0MDI5MTBiZmFiOTk4ZDVjZjZj
ODQ3NDRkZTVkYjQ2NjkzNl0gZ3BpbzogZ3JncGlvOiByZW1vdmUgcmVtb3ZlKCkKZ2l0IGJp
c2VjdCBiYWQgM2FiYTg0MDI5MTBiZmFiOTk4ZDVjZjZjODQ3NDRkZTVkYjQ2NjkzNgojIGdv
b2Q6IFs4MTYyNWYzNjI0OTc1MDk1MjZhMmY5YWM1Mzg0M2FlMzBiNDcwOWNjXSBncGlvOiBj
ZGV2OiBnbyBiYWNrIHRvIHN0b3JpbmcgZGVib3VuY2UgcGVyaW9kIGluIHRoZSBHUElPIGRl
c2NyaXB0b3IKZ2l0IGJpc2VjdCBnb29kIDgxNjI1ZjM2MjQ5NzUwOTUyNmEyZjlhYzUzODQz
YWUzMGI0NzA5Y2MKIyBnb29kOiBbZmNjOGI2MzdjNTQyZDFhMGMxOWU1Nzk3YWQ3MmY5MjU4
ZTEwNDY0Y10gZ3Bpb2xpYjogc3dpdGNoIHRoZSBsaW5lIHN0YXRlIG5vdGlmaWVyIHRvIGF0
b21pYwpnaXQgYmlzZWN0IGdvb2QgZmNjOGI2MzdjNTQyZDFhMGMxOWU1Nzk3YWQ3MmY5MjU4
ZTEwNDY0YwojIGJhZDogW2JjNDA2NjhkZWYzODQyNTY2NzNiYzE4Mjk2ODY1ODY5YzRhNDE4
N2JdIGdwaW86IGdyZ3BpbzogZHJvcCBLY29uZmlnIGRlcGVuZGVuY3kgb24gT0ZfR1BJTwpn
aXQgYmlzZWN0IGJhZCBiYzQwNjY4ZGVmMzg0MjU2NjczYmMxODI5Njg2NTg2OWM0YTQxODdi
CiMgYmFkOiBbMDdjNjFkNGRhNDNmYTNiMzRjMTUyYjI4MDEwZDIwYmUxMTVhOTZkYl0gZ3Bp
b2xpYjogbm90aWZ5IHVzZXItc3BhY2UgYWJvdXQgaW4ta2VybmVsIGxpbmUgc3RhdGUgY2hh
bmdlcwpnaXQgYmlzZWN0IGJhZCAwN2M2MWQ0ZGE0M2ZhM2IzNGMxNTJiMjgwMTBkMjBiZTEx
NWE5NmRiCiMgZmlyc3QgYmFkIGNvbW1pdDogWzA3YzYxZDRkYTQzZmEzYjM0YzE1MmIyODAx
MGQyMGJlMTE1YTk2ZGJdIGdwaW9saWI6IG5vdGlmeSB1c2VyLXNwYWNlIGFib3V0IGluLWtl
cm5lbCBsaW5lIHN0YXRlIGNoYW5nZXMK
--------------c4fNOs0pdsGsnSpfgcdLVePm
Content-Type: application/gzip; name="gpiod_oops_after_patch_decoded.gz"
Content-Disposition: attachment; filename="gpiod_oops_after_patch_decoded.gz"
Content-Transfer-Encoding: base64

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

--------------c4fNOs0pdsGsnSpfgcdLVePm--

