Return-Path: <linux-gpio+bounces-6228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6AC8BF99B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 11:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5B1C1F23ED0
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 09:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A9676413;
	Wed,  8 May 2024 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A25ZMflr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E701DFE8;
	Wed,  8 May 2024 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715161121; cv=none; b=c5oIP+KkLTj57q16RnuLz+42EBgmwynjkJ/ey2t+UeftlUDb0giLebjsdrijEju+JismwuJljXI1XQNj1wFfdQKBGtaubVJg5PhS8DyFfAGqrnXITFxtYTO4l0qVnBEkgeaIuMFVqQUn+4R083CVDxvPqgbwcZqTebb9bMeCUXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715161121; c=relaxed/simple;
	bh=9wqcotEsglkXeMSlE6+fb2wY29ZPktzdi/rnhFYWLPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NvbORB6rhgBYCIDEaBkgl18rjaLj3eNYQ3aOqVFG5Y4iYOXpV2o1E7jiOoh66QXl7xa1dcK7yiigsDeKFOXP+71lBT334mQaWJJ3/fHnrSJ823eqjzo8vAKBcgxLiXld7tUVvdKq804qlsDxlAts247U0HCXKZRTl3ySQIOZJU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A25ZMflr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ee954e0aa6so10212935ad.3;
        Wed, 08 May 2024 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715161119; x=1715765919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JF/qpsXS51Z6tRUSnj9l+AYuD1pdvwOaKrJpHSI9AAw=;
        b=A25ZMflrUekMB1NOFFQ2g8Plng4NHnf/5ebEtwKp4RJoPwgINZWKDJoXXsXyaFQ8n7
         gGKi7ShX/ezcgh98pnLNlII9beModmbNHcJcGOTibAIlkPoKRUeTOx9VfTjKYOrp4HgC
         6hICIc+tdHo7MOIJBfk7umqTHhsBj2Vvl4Rbi/swtqj8Nl1MqhcL0EHlUMuBEZ6QsMg+
         jyvKEiRjEMvzxp9Rnb4TffKNUo+dgJQcD6TgsAXKupmY0/Y3Emzt6NITIBcRkUa0U1j1
         SJVRowvQdA1fbm9qQ8IFUHq3PAHhnaV6uHJsk9zkDLIaNc6giPopUA9Zn4wIO7MnN8Q7
         /Riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715161119; x=1715765919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JF/qpsXS51Z6tRUSnj9l+AYuD1pdvwOaKrJpHSI9AAw=;
        b=PYFX3zH7/4w7j6BhXgsr3KbuupEaUemlzZ/BAerHKCpxDj893lBcW9tQRR2vCTFssM
         SjGetBj+W3prOeZJXAMLX/mDHWLEWEq1o/BiNtQSZEWZKvboD/6Y3aeMzsQQiC2Okwho
         /7stfSreih4j32mq92gPFEgLD9S20oWR1LxsAdt992TTbYtA13WA8iixt1QTqjtyVN31
         E5ywZWM0PEZIaqkl+ojnYEIfhx6w/EyDQdulslbFDtxDCWw8W5488QyteokXA+cEtoy1
         xzG5H/GykIgmbar1gOFDppraDDrgLDDAgzLJJ4USiMXumBJk0YRs9BXr2MV9JF53ZyZO
         J5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp7ZeXddlN5SW363uMSjHEAvKI+wgqJEvGQGnMul5ZiQ+q90GYO7yuTqUAGYyYbEwMVvFJNQ4jE6BMetua85KwQo76Hj30/EXSFJQJWeXN7iSMCAlAY5EdrK5bKt+5gFGPNkJjqdz5DJ43Ym3B6gMJEAoS4MeMLXjD/J7LQClexD7oorY=
X-Gm-Message-State: AOJu0YztHELOUGttM9cbJJ9DYzebNueQgqUn8iZQcNznNRfHnFOaSc8U
	xbzoGF+eHb9SwXCcyd+KMP4hzEn32S3nug9kwQNQDrrVmLwtjrV/
X-Google-Smtp-Source: AGHT+IEdhFF3Ew3jdyl0hmQI+QvvQEt79sBObejV5XMWSPqrQeyJaah84ujgkbCX5ym+rR46Datgiw==
X-Received: by 2002:a17:902:f552:b0:1e4:6e70:25d8 with SMTP id d9443c01a7336-1eeb03a546bmr25188815ad.13.1715161119386;
        Wed, 08 May 2024 02:38:39 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id ju8-20020a170903428800b001eb492fdf93sm11420932plb.146.2024.05.08.02.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 02:38:39 -0700 (PDT)
Message-ID: <3ee92974-6f55-426d-8cd6-bb871a23499f@gmail.com>
Date: Wed, 8 May 2024 17:38:35 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO
 driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com
References: <20240508065141.565848-1-ychuang570808@gmail.com>
 <20240508065141.565848-4-ychuang570808@gmail.com>
 <39ff586c-24fc-4987-bf5b-c99f0b2ae8f9@wanadoo.fr>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <39ff586c-24fc-4987-bf5b-c99f0b2ae8f9@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Christophe,

Thanks for the review.


On 2024/5/8 下午 04:38, Christophe JAILLET wrote:
> Le 08/05/2024 à 08:51, Jacky Huang a écrit :
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> Add common pinctrl and GPIO driver for Nuvoton MA35 series SoC, and
>> add support for ma35d1 pinctrl.
>>
>> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
>> ---
>
> ...
>
>> +static int ma35_gpiolib_register(struct platform_device *pdev, 
>> struct ma35_pinctrl *npctl)
>> +{
>> +    struct ma35_pin_ctrl *ctrl = npctl->ctrl;
>> +    struct ma35_pin_bank *bank = ctrl->pin_banks;
>> +    int ret;
>> +    int i;
>> +
>> +    for (i = 0; i < ctrl->nr_banks; i++, bank++) {
>> +        if (!bank->valid) {
>> +            dev_warn(&pdev->dev, "%pfw: bank is not valid\n", 
>> bank->fwnode);
>> +            continue;
>> +        }
>> +        bank->irqtype = 0;
>> +        bank->irqinten = 0;
>> +        bank->chip.label = bank->name;
>> +        bank->chip.of_gpio_n_cells = 2;
>> +        bank->chip.parent = &pdev->dev;
>> +        bank->chip.request = ma35_gpio_core_to_request;
>> +        bank->chip.direction_input = ma35_gpio_core_direction_in;
>> +        bank->chip.direction_output = ma35_gpio_core_direction_out;
>> +        bank->chip.get = ma35_gpio_core_get;
>> +        bank->chip.set = ma35_gpio_core_set;
>> +        bank->chip.base = -1;
>> +        bank->chip.ngpio = bank->nr_pins;
>> +        bank->chip.can_sleep = false;
>> +
>> +        if (bank->irq > 0) {
>> +            struct gpio_irq_chip *girq;
>> +
>> +            girq = &bank->chip.irq;
>> +            gpio_irq_chip_set_chip(girq, &ma35_gpio_irqchip);
>> +            girq->parent_handler = ma35_irq_demux_intgroup;
>> +            girq->num_parents = 1;
>> +
>> +            girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
>> +                             sizeof(*girq->parents), GFP_KERNEL);
>> +            if (!girq->parents) {
>> +                ret = -ENOMEM;
>> +                goto fail;
>> +            }
>> +
>> +            girq->parents[0] = bank->irq;
>> +            girq->default_type = IRQ_TYPE_NONE;
>> +            girq->handler = handle_bad_irq;
>> +        }
>> +
>> +        ret = devm_gpiochip_add_data(&pdev->dev, &bank->chip, bank);
>> +        if (ret) {
>> +            dev_err(&pdev->dev, "failed to register gpio_chip %s, 
>> error code: %d\n",
>> +                bank->chip.label, ret);
>> +            goto fail;
>> +        }
>> +    }
>> +    return 0;
>> +
>> +fail:
>> +    while (i--) {
>> +        bank--;
>> +        if (!bank->valid)
>> +            continue;
>> +        gpiochip_remove(&bank->chip);
>> +    }
>
> I don't think this is correct. This is to undo the 
> devm_gpiochip_add_data(), right?
> Because of the devm_, no need to explicityl call gpiochip_remove()
>
> (more over, it should have been --i and not i-- in the while)
>

Yes, I will just drop the whole "fail:" case and  make it return from 
"goto fail" with the error code.

>> +    return ret;
>> +}
>
> ...
>
>> +static int ma35_pinconf_set_drive_strength(struct ma35_pinctrl 
>> *npctl, unsigned int pin,
>> +                       int strength)
>> +{
>> +    unsigned int port, group_num;
>> +    void __iomem *base;
>> +    int i, ds_val = -1;
>> +    u32 regval;
>> +
>> +    if (ma35_pinconf_get_power_source(npctl, pin) == MVOLT_1800) {
>> +        for (i = 0; i < ARRAY_SIZE(ds_1800mv_tbl); i++) {
>> +            if (ds_1800mv_tbl[i] == strength) {
>> +                ds_val = i;
>> +                break;
>> +            }
>> +        }
>> +    } else {
>> +        for (i = 0; i < ARRAY_SIZE(ds_3300mv_tbl); i++) {
>> +            if (ds_3300mv_tbl[i] == strength) {
>> +                ds_val = i;
>> +                continue;
>
> break; ?

I will fix it.

>
>> +            }
>> +        }
>> +    }
>> +    if (ds_val == -1)
>> +        return -EINVAL;
>> +
>> +    ma35_gpio_cla_port(pin, &group_num, &port);
>> +    base = npctl->ctrl->pin_banks[group_num].reg_base;
>> +
>> +    regval = readl(base + MA35_GP_DS_REG(port));
>> +    regval &= ~MA35_GP_DS_MASK(port);
>> +    regval |= field_prep(MA35_GP_DS_MASK(port), ds_val);
>> +
>> +    writel(regval, base + MA35_GP_DS_REG(port));
>> +
>> +    return 0;
>> +}
>
> ...
>
>> +static int ma35_pinctrl_probe_dt(struct platform_device *pdev, 
>> struct ma35_pinctrl *npctl)
>> +{
>> +    struct fwnode_handle *child;
>> +    u32 idx = 0;
>> +    int ret;
>> +
>> +    device_for_each_child_node(&pdev->dev, child) {
>> +        if (fwnode_property_present(child, "gpio-controller"))
>> +            continue;
>> +        npctl->nfunctions++;
>> +        npctl->ngroups += of_get_child_count(to_of_node(child));
>> +    }
>> +
>> +    if (!npctl->nfunctions)
>> +        return -EINVAL;
>> +
>> +    npctl->functions = devm_kcalloc(&pdev->dev, npctl->nfunctions,
>> +                    sizeof(*npctl->functions), GFP_KERNEL);
>> +    if (!npctl->functions)
>> +        return -ENOMEM;
>> +
>> +    npctl->groups = devm_kcalloc(&pdev->dev, npctl->ngroups,
>> +                     sizeof(*npctl->groups), GFP_KERNEL);
>> +    if (!npctl->groups)
>> +        return -ENOMEM;
>> +
>> +    device_for_each_child_node(&pdev->dev, child) {
>> +        if (fwnode_property_present(child, "gpio-controller"))
>> +            continue;
>> +
>> +        ret = ma35_pinctrl_parse_functions(to_of_node(child), npctl, 
>> idx++);
>> +        if (ret) {
>> +            dev_err(&pdev->dev, "failed to parse function\n");
>
> Missing fwnode_handle_put(child); ?
> (or a scoped version of device_for_each_child_node() if it exists)
>

Yes, I will add fwnode_handle_put(child) here.

>> +            return ret;
>> +        }
>> +    }
>> +    return 0;
>> +
>
> ...
>
> CJ

Best Regards,
Jacky Huang


