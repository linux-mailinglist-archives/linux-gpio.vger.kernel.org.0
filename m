Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68CAA63E2CA
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 22:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiK3VeA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 16:34:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiK3Vdq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 16:33:46 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0AF91355
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 13:33:44 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id v7so14162126wmn.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 13:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z979G8RlBVuhhMrxZaQi13bKZQPAThTMx0JsIFtXsdY=;
        b=uHyWIuYKmRzw0KzOmBCB9HiGPz8DndkjxTO7yyPEDABObwtwK8PTrrBvy3e2gz0Axk
         HfDSo/YgPwst0JqJ9twkJycrJjJ2AA5yAQFaztmpYy+9WxjY8/fMu+XfDdEyhcyWGi1V
         N1fJG247dicPgRAwbfZ3iTscWKpo9PqSkGTBaCMNiSRNswLMnprdq8fSGuVdtf8+k3Cc
         +1R6/ujqirYBdQ4tDdrKwFQvaBwkkXHDXQlufbS7tegTh+ZzmW8vuYnrr7vbL2ZAdl4c
         uJ9INEPmP4sZCB4hwEJWCgret3WP0YUm0B9xb6epLMfpj1cmzygnH/OfifW3Dyg6OWae
         2hVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z979G8RlBVuhhMrxZaQi13bKZQPAThTMx0JsIFtXsdY=;
        b=FynvAMVC5Kd56JojNaMXKRrY/MikPf2k1/c/P9QGX+KdrOYYBqT4Qcjmw1GbfpbBOh
         +oARp5YpZc5R2LLwEm30ECX7J178u8PPci3XdLc66HeHiE5XNcwfuHz6jCY8O+dz1DKd
         GhyJ/9nsbRTpwkZ3mj8kyNwcVpr9UqgkrJLvj2Q8k1LkTgKM43mt+ClFMyKm3uSc6ZBh
         njCDd0Hhai/kvGEiQNnfzV2ncIJSXO0pkta0IBThkPCoboLuHfyxb1DUVRzGBTFvnwn6
         N6fil/0T73LA3c395oYKwHEx+Oh7Ym+k+x0f1qTsvb894TZ1ylFPj3RDeeDsky8qrdOP
         pjQQ==
X-Gm-Message-State: ANoB5pkhmW+mE7DU3MpfiCXaVZi7yvaRV75q4t8sjs4gbQyrcD1QKtX+
        z2LR0yv3sOHxxFan7EyT6DbD0olb1Cyt3AIJn+4=
X-Google-Smtp-Source: AA0mqf6GTLBbFEURsXMrco2SN+6AWosSy58l+NeHCU364zLax57nxgFGJbvcViYhA9S90YVLqD+zDg==
X-Received: by 2002:a05:600c:3ac7:b0:3cf:75db:c417 with SMTP id d7-20020a05600c3ac700b003cf75dbc417mr36844502wms.109.1669844023062;
        Wed, 30 Nov 2022 13:33:43 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id p1-20020a5d68c1000000b002420fe50322sm2595380wrw.91.2022.11.30.13.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 13:33:42 -0800 (PST)
Message-ID: <a23d0da6-6f80-a7d5-a0fb-a10e1a408129@linaro.org>
Date:   Wed, 30 Nov 2022 21:33:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org, fugang.duan@linaro.org
References: <20221130164027.682898-1-niyas.sait@linaro.org>
 <20221130164027.682898-2-niyas.sait@linaro.org>
 <Y4fE6CPLHKPdjt9y@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y4fE6CPLHKPdjt9y@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 >> +++ b/Documentation/driver-api/pin-control-acpi.rst
 >
 > We have Documentation/firmware-guide/acpi/, but I'm not sure
 > which one suits better for this.

I started with firmware-guide but then moved to driver-api as I wanted 
to cover driver related bits as well. Let me know if it is better at 
firmware-guide.

>> +			Name (RBUF, ResourceTemplate()
>> +			{
>> +				Memory32Fixed(ReadWrite, 0x4F800000, 0x20)
>> +				Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) {0x55}
>> +				PinFunction(Exclusive, PullDefault, 0x5, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
>> +				// Configure 10k Pull up for I2C SDA/SCL pins
>> +				PinConfig(Exclusive, 0x01, 10000, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
>> +			})
>> +			Return(RBUF)
> 
> In all examples the 2, 3 is used as a pin list for all kind of resources,
> it's so confusing. Also take into account the difference between GPIO and
> pin number spaces as I told before. Examples should cover that.
> 
> Also try to compile all ASL with latest ACPICA tools and fix warnings / errors.
> 

I can try but I will have to repeat the same pin number few times to 
describe the pin function and config for different devices to 
demonstrate the pin muxing part.

>> +Pin control devices can add callbacks for following pinctrl_ops to handle ACPI
>> +pin resources.
> 
> Why? What use case requires this?
> ACPI specification is more stricter in this than DT if I understand correctly
> the state of affairs.  So, can't we parse the tables in the same way for all?
> 
> ...
> 
>> +		case PINCTRL_ACPI_PIN_FUNCTION:
> 
>> +		case PINCTRL_ACPI_PIN_CONFIG:
> 
> These are definitely what we do not want to see in the individual drivers.
> (I understand that it might be that some OEMs will screw up and we would
>   need quirks, but not now)

Hm. Please correct me if I am wrong here. My understanding is that we 
need to do few mapping which only pin controller drivers can do such as 
ACPI function number to internal functional name or selector. I could 
define bindings to do those specific mappings rather than providing the 
current general mapping interface. Would that be better ?

>> +	status = acpi_get_handle(NULL, pinctrl_acpi, &handle);
>> +	if (ACPI_FAILURE(status))
>> +		return NULL;
>> +
>> +	adev = acpi_get_acpi_dev(handle);
>> +	if (!adev)
>> +		return NULL;
>> +
>> +	dev_name = acpi_dev_name(adev);
>> +	if (!dev_name)
>> +		return NULL;
>> +
>> +	return get_pinctrl_dev_from_devname(dev_name);
> 
> Are they all resource leakage-free?
> 

I hope so. Do you see something odd ?
