Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6539A2A94F9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 12:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgKFLHu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 06:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbgKFLHt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 06:07:49 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A19C0613D3
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 03:07:46 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p19so714538wmg.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n7O8QvaxHe67uhrGjIcnRsG7AT5yAAmj1iYj13UlWSk=;
        b=sotY8lsijBMHrgYWzuJFn2xDYKLi5oQpVgBSlGqq1p9jFgvL2qVYnUnZLOPj6Rc8Ij
         /zYg00YTvSRuq6ZJL9EVCVxx2ZgwLw78VHw+PNSkhJSay3Xeghsksi63Gs/mFvgltOrE
         9LOq5eOnwExTRslV6rYH9ctYH0qcMfI0gOcyW0gD77RaEd+JerRvz4BsWwS14ge9B5O3
         tfNycJsJyxAVRXvKWm3PfvJKiwVOnrgOw861TqoJeTOiCED5HMt11B1GhD5VvJgew66U
         BcVN925IXn3WWd34yhaESEb+WTuZX1E8oUc0tN+X2gGp4AJBlN65uRYWQkYbxmJUO5wl
         XrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n7O8QvaxHe67uhrGjIcnRsG7AT5yAAmj1iYj13UlWSk=;
        b=BPjppUPbAgIFEkfVGLi+GzvjQmunpaDxHhD883X4eNQ7jND2GFk92luXGPfTqbMS5o
         cEUy5OGZBc45F9k+wqq6SsramTZNc41xdmpAQbJthYMo+cLF36W+7UqHbdC93ujCximQ
         Khs0/hqOBPuZGULSwM0yPYFsxeTq/60gN7kpMtPnIVZJ0DcgqrmuV1HZ3nhsFSxUkX1M
         4lwAXd0pMwHD3T9sM2D1IFCf2hFL1cHvL675X1cS4PCQdvjj4FW4LGYaLr6ECqZvta/c
         K/wk427Hq52To0CAIvd53WTZmPJbkgXX4/djq4JVsri1HaH2VEq1J1rDTi5iV2P7Pg4/
         Sycw==
X-Gm-Message-State: AOAM53195G/k9FZzLnMJU2+yyL5lNTwfGsSRD8z6Z1ilISr0R5RimNog
        HlF4rc6XCm2Ysq/icodUGJ+YaA==
X-Google-Smtp-Source: ABdhPJz0VpUwzSEJM0C94AmhzrNY+e+xXXJWgjWfhL2b/c+qUr+twopaKZjYT44xkHyz8UuRHlUL5w==
X-Received: by 2002:a1c:e919:: with SMTP id q25mr1811606wmc.142.1604660865058;
        Fri, 06 Nov 2020 03:07:45 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id q2sm1548574wrw.40.2020.11.06.03.07.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 03:07:44 -0800 (PST)
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201105120410.18305-1-srinivas.kandagatla@linaro.org>
 <20201105120410.18305-2-srinivas.kandagatla@linaro.org>
 <CAHp75VdM9LUV2M6rEZyK=4rh_+hwFK5_2-9RB7YQTuMxHSYCMg@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <640e8a15-d66d-3fca-6637-bd8dae32ea4a@linaro.org>
Date:   Fri, 6 Nov 2020 11:07:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdM9LUV2M6rEZyK=4rh_+hwFK5_2-9RB7YQTuMxHSYCMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Andy for the review,

On 05/11/2020 12:32, Andy Shevchenko wrote:
> On Thu, Nov 5, 2020 at 2:06 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> Add initial pinctrl driver to support pin configuration for
>> LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
>> on SM8250.
> 
>> +config PINCTRL_LPASS_LPI
>> +       tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
>> +       depends on GPIOLIB && OF
>> +       help
>> +         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>> +         Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>> +         (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
> 
>> +#include <linux/of_device.h>
>> +#include <linux/of.h>
> 

I agree with most of the style related comments! will fix them in next 
version!

> ...
> 
>> +#ifdef CONFIG_DEBUG_FS
>> +#include <linux/seq_file.h>
> 
>> +#else
>> +#define lpi_gpio_dbg_show NULL
>> +#endif
> 
> Hmm... Doesn't pin control provide a wrapper for this?
> 
I does, but the custom code can provide additional information (such as 
pullup/pulldown configuration) which default one does not provide.

Most of the pinctrl drivers have there own version of this!

> ...
> 
>> +       int ret, npins;
>> +       struct clk *core_vote = NULL;
>> +       struct clk *audio_vote = NULL;
>> +
>> +       struct lpi_pinctrl *pctrl;
>> +       const struct lpi_pinctrl_variant_data *data;
>> +       struct device *dev = &pdev->dev;
>> +       struct resource *res;
> 
> Redundant blank line. Can you keep them in reversed xmas tree order?
> 
> ...
> 
>> +       core_vote = devm_clk_get(&pdev->dev, "core");
>> +       if (IS_ERR(core_vote)) {
> 
>> +               dev_dbg(&pdev->dev, "%s: clk get %s failed %d\n",
>> +                       __func__, "core_vote", ret);
> 
> First of all you missed the deferred probe issue, second, __func__ is
> redundant for *_dbg() calls (okay, when Dynamic Debug is enabled).
> That said why not
>    return dev_err_probe();
> ?
It looks neat, I will use that!
Thanks for this hint, I never knew we had some function like that!


> 
>> +               return PTR_ERR(core_vote);
>> +       }
> 
> ...
> 
>> +       audio_vote = devm_clk_get(&pdev->dev, "audio");
>> +       if (IS_ERR(audio_vote)) {
>> +               dev_dbg(&pdev->dev, "%s: clk get %s failed %d\n",
>> +                       __func__, "audio_vote", ret);
>> +               return PTR_ERR(audio_vote);
> 
> Ditto/
> 
>> +       }
> 
> Why is it not a bulk?

I can try that!
> 
>> +       clk_prepare_enable(pctrl->core_vote);
>> +       clk_prepare_enable(pctrl->audio_vote);
> 
> Either from them may return an error. Also, when you go devm_*() the
> rule of thumb is either all or none. Because here you will have
> ordering issue on ->remove().
> 
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       pctrl->tlmm_base = devm_ioremap_resource(&pdev->dev, res);
> 
> devm_platform_ioremap_resource()

make sense, I remember doing this! somehow I missed it in this version!

rest of the comments looks sensible to me, will make sure that those are 
fixed in next version.


thanks,
srini
