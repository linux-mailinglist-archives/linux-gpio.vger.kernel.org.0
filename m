Return-Path: <linux-gpio+bounces-30152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB3CCF45DD
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 16:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B2E2309BCB7
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 15:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634A12E6CB8;
	Mon,  5 Jan 2026 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LphmDeQx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B58B2D3231
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625679; cv=none; b=PgCb/qnHeb64lwbwodzC3E3MmSDBZ6QPUj7N2gc6AW4Ckl7hgFfxtwp4/nOIlP5m6IaUha8Y0/jX0LeubMq/SfEy/+DyQ2KORL5Rymx0nrzxlMXe5Yt94TYuTExxIY0LM98tsr5ONVtCZr/GxeV6G6+5PvVgs3ltiKGNrBqNEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625679; c=relaxed/simple;
	bh=OV9Z1KUE5yeE2dXIw79nHbxNnn1GF3eh4qO1VR3wxi0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CqcgD/E7jQzW/4l/DcmML/RPnrGbOVwN8GOVYGW6FwTLurnWDdAFNZA44GMjQE8zrKZIWDkC60GjsvF3dHwKamfNsR+FtzldwNNqDjWqKL4vO6wlFQ3OUlhI1tOxRmpGOEc6vBBGEaenXFWehxQLNajDUBpSAb4h/vE32+tX7qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=fail smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LphmDeQx; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so18305e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767625676; x=1768230476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJeP3umUUPJKCdZprAUZ1ZTfLiCOqec4hH3IqgMAE2k=;
        b=LphmDeQxjhzU/GQtoKhKwhGyDr1TlcsN+pLu4GxhMT1d3Nv0OC0w8FyiW4A80aFMKG
         YJMgA8B0XlZG8Q5EurogkddbmBd66pJB2bIa2c9mg4K8E1MfSouy1pTrVN8/+QxUTI9f
         ksQnfUUpw4uOdS4JPUAIG+Xudd2otNdWEjyFsiTrxbZO7GgZHNR1zl6Z0gHNdMXuTn92
         TYsLgRyR9oIcYwDbbmLyvrJb14FnElNdsVNRBKiLwxakvNf6WWFHETJAPlHK+75wmeVM
         E2pBpPvpaMZbuma/f8ZFnubh7dlOFfuuko/9zCFY69ISLYf3VCBAHnB8z71RQnxDt2jg
         pDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625676; x=1768230476;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJeP3umUUPJKCdZprAUZ1ZTfLiCOqec4hH3IqgMAE2k=;
        b=HvVNVW9zxoFvR2ASeAe46gWIwb3RU/SDdAf74sucKhChCYKQwnhxbtwsCMHNHzmfsj
         do+A7TGV5LXHpS896Oc6WHQLGwXp1Gri3yzuMu3gE5iY7jzUpSLm2TxaQ34Z2+AlMysZ
         n8h+b7oLT+ULRPQ7uyQCeE4R/RlzVlie/6reaThPdss/R/JpiunSCwBkukp3RDOljzqJ
         K8r5sXMWgVAflWzSSe9Q3x0f9TOP1kUSe56MfKN5vPmvV1jmE8rn7Ackqz50ML8VR7SB
         Mx5WGFXVCPWo3pQIzMA6JuGb2Lyi1blaHR7EUT91l6UF6rfffDisiHCw9SZKXigzsttr
         LYRw==
X-Gm-Message-State: AOJu0Yzlto4Y5iJC2RwenpBbBLeq7py+PTVHTmsDc99ipa2vVlc7ps05
	AK6c5v2TIFnuYeUI5KCXZElkNRZ5kpZoM6kLd7LazVkY+eAaaN7rNekS5vEopyP3xFg=
X-Gm-Gg: AY/fxX5EOvV67KTCJQMyY0GfkgFvHmhjvjnZoqko4zKnlrBSTmrtFafKlw9iuXNj0dK
	GEh3pxRlPGZQfEDJxCm9E5ZwYzeJD02eAf4U1UoLxulUj8URtVGSvLkWGa5fEkt4R++iaKohUAq
	5/8irJKdaAOze3QLhriAe1ikx7nRXs1ELv4rOwmgDfnVBiTWjKTGLAuUGZvGCJesOFA5oZIfzE9
	gYkz2InAgzdPRR4x91NiAS0IuMXPyBzmBzJxpZ2IYziWDOAcdIJqQ/4rzoIxWvrpxRi5FdCQAP/
	IImQLHklRxAswAtBwU01xUaQ7N1slm/47A6JLsBy+ZRtih3K8+5DiWOdTG7vESutsbJ5+UC2alv
	GL1EIfRyDnohv2j25oaxr2lCFnSZ/oTWo2iX+KyrXMvaDjMQZvC/++sq4pmgIu7GF+Eag/2B/M6
	Edw9vWBBhwqSxFW3R9oNUXzwK89GlJKhaaPIBdAGY+NrqxT5UNqo8lD31UNt35JEU=
X-Google-Smtp-Source: AGHT+IHNPKjsE1L43Mcol0BPhYCu+RrWOpaqpZKfNqq23wdaZg/I9TTFl/xgV8vj8QWVD5+5pya8pQ==
X-Received: by 2002:a05:600c:5249:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-47d1954a128mr636773765e9.13.1767625675529;
        Mon, 05 Jan 2026 07:07:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033? ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7443c04csm35338465e9.1.2026.01.05.07.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:07:55 -0800 (PST)
Message-ID: <0a457882-1700-4edd-ba86-3682b05731f0@linaro.org>
Date: Mon, 5 Jan 2026 16:07:54 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/26 16:05, Bartosz Golaszewski wrote:
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization.
> 
> This can cause the following lockdep splat with shared GPIOs enabled on
> boards which have multiple devices using the same GPIO:
> 
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 142, name:
> kworker/u25:3
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> INFO: lockdep is turned off.
> irq event stamp: 46379
> hardirqs last  enabled at (46379): [<ffff8000813acb24>]
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (46378): [<ffff8000813abf38>]
> _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (46330): [<ffff8000800c71b4>]
> handle_softirqs+0x4c4/0x4dc
> softirqs last disabled at (46295): [<ffff800080010674>]
> __do_softirq+0x14/0x20
> CPU: 1 UID: 0 PID: 142 Comm: kworker/u25:3 Tainted: G C
> 6.19.0-rc4-next-20260105+ #11963 PREEMPT
> Tainted: [C]=CRAP
> Hardware name: Khadas VIM3 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>    show_stack+0x18/0x24 (C)
>    dump_stack_lvl+0x90/0xd0
>    dump_stack+0x18/0x24
>    __might_resched+0x144/0x248
>    __might_sleep+0x48/0x98
>    __mutex_lock+0x5c/0x894
>    mutex_lock_nested+0x24/0x30
>    pinctrl_get_device_gpio_range+0x44/0x128
>    pinctrl_gpio_set_config+0x40/0xdc
>    gpiochip_generic_config+0x28/0x3c
>    gpio_do_set_config+0xa8/0x194
>    gpiod_set_config+0x34/0xfc
>    gpio_shared_proxy_set_config+0x6c/0xfc [gpio_shared_proxy]
>    gpio_do_set_config+0xa8/0x194
>    gpiod_set_transitory+0x4c/0xf0
>    gpiod_configure_flags+0xa4/0x480
>    gpiod_find_and_request+0x1a0/0x574
>    gpiod_get_index+0x58/0x84
>    devm_gpiod_get_index+0x20/0xb4
>    devm_gpiod_get+0x18/0x24
>    mmc_pwrseq_emmc_probe+0x40/0xb8
>    platform_probe+0x5c/0xac
>    really_probe+0xbc/0x298
>    __driver_probe_device+0x78/0x12c
>    driver_probe_device+0xdc/0x164
>    __device_attach_driver+0xb8/0x138
>    bus_for_each_drv+0x80/0xdc
>    __device_attach+0xa8/0x1b0
> 
> Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 18295b15ecd9..4507dc8b5563 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -619,7 +619,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
>   	pc->chip.set = meson_gpio_set;
>   	pc->chip.base = -1;
>   	pc->chip.ngpio = pc->data->num_pins;
> -	pc->chip.can_sleep = false;
> +	pc->chip.can_sleep = true;
>   
>   	ret = gpiochip_add_data(&pc->chip, pc);
>   	if (ret) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

