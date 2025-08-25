Return-Path: <linux-gpio+bounces-24937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC9B34103
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 15:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A58D167568
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 13:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165F127814F;
	Mon, 25 Aug 2025 13:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCr5k46v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CF923D297;
	Mon, 25 Aug 2025 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129408; cv=none; b=gpRH0UQIJLsWNsT+mk3wi2X7VpCiN4D1jCGMhuHHAPZ6j9RabRERkowNKvFZaK8xAdEE/74Cdq44WA1RD4MrZcxsWMEuRlH2BRcQN6eYuZWPbRm4w4OnndRtttXsfrINcFFoan+hxZSMdjlu8oEOCVIDT69EM8r7ctAqzo8hnlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129408; c=relaxed/simple;
	bh=hQMwXvLwmQEv1kEvo1+9eCKCllPAT+aam54JtX7RwQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eyXcScnTu6cgE5ntPhszV9/X46z6rkI3UAfCmHaQnbr2s3j3bEHg9JCbJtjX4mtWHRJd3i5Oj3Oz+PxY9o9bI2D6Ouojh46oOBt8jPnmIt25HqfF8aJ2chxOVveO9h9OLfrpQGhpbANqQ4tVkpdMbRbOWk3SyNAd0o1psKTEjpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCr5k46v; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb732eee6so763533366b.0;
        Mon, 25 Aug 2025 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756129405; x=1756734205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jAbKVYpYb9nh9ya4q0qpbx2OQpViyyQmlpd1mwtIPFY=;
        b=TCr5k46vkdO0EJSjFFVjZxe1+IglZ9VemDdyZNgptfYQrmF90+VXp3CX2ji7Yxd8v+
         xmo64m6HgUnqwMU352Ok0Oc5+KPgDiLimk8stgQsLjE+CGaFjrngSCZ79/uvm5jV7itS
         BEtu4Azkb/IwpjEEVg1BEpSwAyyuxJSxVvQ3/8EQ7N93E1bykFDpDU4mYMNIud84Z05f
         82f3Wh0X8ZYfQmzsY8upg2fPjx3Y01Nu5tVWc/CPjRT9tzROytAkMSnR5HrOX/ph+Ugf
         llFcPhqFWpAG5I5fz2jXHTMrkIdyuqdDLXr8/AB7LuhRR8XBh/BUxwocm5LAeB03Hk+p
         SJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756129405; x=1756734205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAbKVYpYb9nh9ya4q0qpbx2OQpViyyQmlpd1mwtIPFY=;
        b=q4ueCMckbKzZML+aIAU5DjExwmYXmT7/xJVMF8GFbMHw4FAuwiRIq9rW2sx/e4hFjp
         VOSX0fjdh9xLNVFaJa96p3O7qZayubI5pIsQStk7GHUv4mKkxIZX1UzV8Xb/Ged5tbvY
         3N0X5OEjerasKChfgYE3Ox11ibKJqSaqYbuYkKWZC1kbMLwG4TpvU7JnP8wmOQSqsHfh
         EDZc0fadS1hDPDo01nPg0qPmNjJW1dxs1OHQs/t6iPMk4TRv+/yRNfEfZkQBVLd9722P
         rBCri1EOCEc+pHaa6YvyK9HJQVDxPKrsLK3gVKddSo/4FlG0Ku/kSiOVG3LuHtCpvZPc
         iGbg==
X-Forwarded-Encrypted: i=1; AJvYcCVuHT4x9IEC5uXU0DqT8kTDhK41wz4PI5I2IYV/tkUV8PgNI6VEEa3UbjR6WdqdRmB1v7lgQznJQ2jG@vger.kernel.org, AJvYcCX/iIX55n4d5u+yHV4rwZe2IcX8HyTZGKKQQuMs+SC199Nq4tLtNwLIQ7h2yjWtple4FTH1Zihkbj8Bm9o=@vger.kernel.org, AJvYcCXmIGF6BI7QjX1Bbw5zwFEGwf3Rl0gPkdjlOIUW8TzXUQZXw8lfdgAqPTjADHBW43mWaYOeA9Wep/PL2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj2Hkin+/6OoRpEbNxgaWLvz7sWJGnuhlB8c3pkYAuARpiV7yy
	Yiic5LIpw1/WHi7iRWbUm2BmpkLOQydTQksKKuk0yL0EqRgLm6iJ2Rw=
X-Gm-Gg: ASbGnctSUOHCFgdoq47Ab2ZpFbwg4xZbOGzCgPEEb/aPRes8lZzkfT6a+mZGkSpA48I
	yROY0y8XdngOxkO61lcA/sxfgRrckuYARBoe7kzThHTjd8z1cz+/Sa9OPTIH+lMhzPe0GuXaojs
	+OMkKoilh0Ak0QuRX8VqrHp5ZJ2lpbWrBnnwT1JjPWYBp6fEwgkpvbHDIA17p+Z4H9cbNRFL688
	P+P5KjJOi94xbvnk9pPymSa/SGjXrcOd87MHBAKFeFSfb4M7sw10ufO8v5xGFiDtuB/x1Uy4dVX
	YUW0Vbcd3NWW+XMrCUy70HiDi5QNbScHi2w4I9Vrb0593BTXFxYZPHuoNX89E4ro2E9ZPYKB5e6
	1KH2lb6Kd3e5NRUxzPLAZKfEz750zLhoBxygYxxxPoHTEKhqhnYcIsw9sh2cWSFz51uWsZXqqKF
	BXbKotB6szqw==
X-Google-Smtp-Source: AGHT+IHLJ4qg6ex2bm+0hQ+1u00bCZ4MtkgwHM+oSFotZaHnr+IyLH+ElzkG+gFK7XgWDVfoZZ4PwA==
X-Received: by 2002:a17:907:3e13:b0:af4:12f6:420 with SMTP id a640c23a62f3a-afe29441ab7mr1037855666b.13.1756129404949;
        Mon, 25 Aug 2025 06:43:24 -0700 (PDT)
Received: from [10.104.197.164] (mob-194-230-160-118.cgn.sunrise.net. [194.230.160.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe70f0121bsm326761666b.55.2025.08.25.06.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 06:43:24 -0700 (PDT)
Message-ID: <eac8ce16-4e63-4092-8729-dc73b3433ece@gmail.com>
Date: Mon, 25 Aug 2025 15:43:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] [RFC] leds: led-class: Add devicetree support to
 led_get()
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Daniel Scally <djrscally@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
 Mark Pearson <markpearson@lenovo.com>, Andy Yeh <andy.yeh@intel.com>,
 Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, artur@madrzak.eu
References: <20230120114524.408368-1-hdegoede@redhat.com>
 <20230120114524.408368-6-hdegoede@redhat.com>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20230120114524.408368-6-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/20/23 12:45, Hans de Goede wrote:
> Turn of_led_get() into a more generic __of_led_get() helper function,
> which can lookup LEDs in devicetree by either name or index.
>
> And use this new helper to add devicetree support to the generic
> (non devicetree specific) [devm_]led_get() function.
>
> This uses the standard devicetree pattern of adding a -names string array
> to map names to the indexes for an array of resources.
>
> Note the new led-names property for LED consumers is not added
> to the devicetree documentation because there seems to be no
> documentation for the leds property itself to extend it with this.
> It seems that how LED consumers should be described is not documented
> at all ATM.
>
> This patch is marked as RFC because of both the missing devicetree
> documentation and because there are no devicetree users of
> the generic [devm_]led_get() function for now.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>


Hi,

It appears this patch was marked as RFC due some missing dt-bindings and 
not having direct DT consumers at the time, and was eventually left out. 
With recent inflow of arm64-power laptops (Snapdragon X1E/X1P) which 
mostly use MIPI cameras, this feature becomes more desired. I have 
rebased this patch onto 6.17-rc2, and can confirm its (still) working as 
expected (with respective DT changes) on Dell XPS 9345.

What would be the best approach to revive this patch? For Hans to respin 
this? Alternatively I could respin it myself keeping the original 
authorship.
Regarding missing dt-binding documentation, would 
`Documentation/devicetree/bindings/leds/common.yaml` be the good place 
for it? Afaiu it was mentioned that no  appropriate LED bindings exists 
in this series (3yo), but this binding is ~6yo, so perhaps its not a 
right place after all.

Thank you in advance,
Alex

> ---
>   drivers/leds/led-class.c | 37 ++++++++++++++++++++++++++++---------
>   1 file changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 0c4b8d8d2b4f..2f3af6e30208 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -234,19 +234,18 @@ static struct led_classdev *led_module_get(struct device *led_dev)
>   	return led_cdev;
>   }
>   
> -/**
> - * of_led_get() - request a LED device via the LED framework
> - * @np: device node to get the LED device from
> - * @index: the index of the LED
> - *
> - * Returns the LED device parsed from the phandle specified in the "leds"
> - * property of a device tree node or a negative error-code on failure.
> - */
> -struct led_classdev *of_led_get(struct device_node *np, int index)
> +static struct led_classdev *__of_led_get(struct device_node *np, int index,
> +					 const char *name)
>   {
>   	struct device *led_dev;
>   	struct device_node *led_node;
>   
> +	/*
> +	 * For named LEDs, first look up the name in the "led-names" property.
> +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
> +	 */
> +	if (name)
> +		index = of_property_match_string(np, "led-names", name);
>   	led_node = of_parse_phandle(np, "leds", index);
>   	if (!led_node)
>   		return ERR_PTR(-ENOENT);
> @@ -256,6 +255,19 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
>   
>   	return led_module_get(led_dev);
>   }
> +
> +/**
> + * of_led_get() - request a LED device via the LED framework
> + * @np: device node to get the LED device from
> + * @index: the index of the LED
> + *
> + * Returns the LED device parsed from the phandle specified in the "leds"
> + * property of a device tree node or a negative error-code on failure.
> + */
> +struct led_classdev *of_led_get(struct device_node *np, int index)
> +{
> +	return __of_led_get(np, index, NULL);
> +}
>   EXPORT_SYMBOL_GPL(of_led_get);
>   
>   /**
> @@ -329,9 +341,16 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
>   struct led_classdev *led_get(struct device *dev, char *con_id)
>   {
>   	struct led_lookup_data *lookup;
> +	struct led_classdev *led_cdev;
>   	const char *provider = NULL;
>   	struct device *led_dev;
>   
> +	if (dev->of_node) {
> +		led_cdev = __of_led_get(dev->of_node, -1, con_id);
> +		if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
> +			return led_cdev;
> +	}
> +
>   	mutex_lock(&leds_lookup_lock);
>   	list_for_each_entry(lookup, &leds_lookup_list, list) {
>   		if (!strcmp(lookup->dev_id, dev_name(dev)) &&

