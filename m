Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE251F00F7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 16:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389701AbfKEPOb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 10:14:31 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:55752 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389766AbfKEPOb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 10:14:31 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xA5F2XXW016060;
        Tue, 5 Nov 2019 16:14:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=sGcJotaSzAOF4wGBo2lc42IY7N+BpinNhWjk4Wx5zlY=;
 b=NeNQEYXPLvC3WCliUp9foYV7DboksxXg5AylZVZxb3SgTkByJKTqjh4al8hpgwgwC+kw
 KDq8KB+bY+m/l/sPplfQ1h3g2R4FboTw2eX3sStxXNQmYMx+wUSbd+e+qkOFnTbuvB16
 oh2QlH5a05G3/CRmytr5aW7l1TZx8MyIXOG84pD9gAzqPuJlKPipM3xI+E4phHECsjdV
 dGuU7sYCxIuxgh0SuDcunzdaQ6QdFBSIQ/ht29GmniLT0SCWXAatRqmm3duk5wX6ODZJ
 yY+NDtcAk+1n62SgZTGjDI0rmzcKvhblqXCWvBlPCLGo2W6PRYs7pdQs4H3Qi6W0rrE0 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2w1054r40k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Nov 2019 16:14:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9294C10002A;
        Tue,  5 Nov 2019 16:14:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82FD92D3768;
        Tue,  5 Nov 2019 16:14:19 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 5 Nov
 2019 16:14:18 +0100
Subject: Re: [PATCH 1/1] pinctrl: stmfx: fix valid_mask init sequence
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20191104100908.10880-1-amelie.delaunay@st.com>
 <CACRpkdb1c-NHXDQXYS78VTcGPnJApmxjzZbF_cM8SUknhDiQ4Q@mail.gmail.com>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <64f8096f-cec6-fef1-5a4e-ddca3bf8c73d@st.com>
Date:   Tue, 5 Nov 2019 16:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb1c-NHXDQXYS78VTcGPnJApmxjzZbF_cM8SUknhDiQ4Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-05_05:2019-11-05,2019-11-05 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/5/19 3:32 PM, Linus Walleij wrote:
> On Mon, Nov 4, 2019 at 11:09 AM Amelie Delaunay <amelie.delaunay@st.com> 
> wrote:
> 
>> With stmfx_pinctrl_gpio_init_valid_mask callback, gpio_valid_mask was used
>> to initialize gpiochip valid_mask for gpiolib. But gpio_valid_mask was not
>> yet initialized. gpio_valid_mask required gpio-ranges to be registered,
>> this is the case after gpiochip_add_data call. But init_valid_mask
>> callback is also called under gpiochip_add_data. gpio_valid_mask
>> initialization cannot be moved before gpiochip_add_data because
>> gpio-ranges are not registered.
> 
> Sorry but this doesn't add up, look at this call graph:
> 
> gpiochip_add_data()
>    gpiochip_add_data_with_key()
>      gpiochip_alloc_valid_mask()
>      of_gpiochip_add()
>      of_gpiochip_add_pin_range()
>      gpiochip_init_valid_mask()
> 
> So the .initi_valid_mask() is clearly called *after*
> of_gpiochip_add_pin_range() so this cannot be the real reason,
> provided that the ranges come from the device tree. AFAICT that
> is the case with the stmfx.
> 
> Can you check and see if the problem is something else?
>

stmfx_pinctrl_gpio_init_valid_mask uses pctl->gpio_valid_mask to 
initialize gpiochip valid_mask.

pctl->gpio_valid_mask is initialized in 
stmfx_pinctrl_gpio_function_enable depending on gpio ranges.

stmfx_pinctrl_gpio_function_enable is called after gpiochip_add_data 
because it requires gpio ranges to be registered.

So, in stmfx driver the call graph is

stmfx_pinctrl_probe
   gpiochip_add_data()
     gpiochip_add_data_with_key()
       gpiochip_alloc_valid_mask()
       of_gpiochip_add()
       of_gpiochip_add_pin_range()
       gpiochip_init_valid_mask()
         stmfx_pinctrl_gpio_init_valid_mask (but pctl->gpio_valid_mask 
is not yet initialized so gpiochip valid_mask is wrong)
   stmfx_pinctrl_gpio_function_enable (pctl->gpio_valid_mask is going to 
be initialized thanks to gpio ranges)

When consumer tries to take a pin (it is the case for the joystick on 
stm32mp157c-ev1), it gets the following issue:
[    3.347391] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller 
didn't like hwirq-0x0 to VIRQ92 mapping (rc=-6)
[    3.356418] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller 
didn't like hwirq-0x1 to VIRQ92 mapping (rc=-6)
[    3.366512] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller 
didn't like hwirq-0x2 to VIRQ92 mapping (rc=-6)
[    3.376671] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller 
didn't like hwirq-0x3 to VIRQ92 mapping (rc=-6)
[    3.387169] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller 
didn't like hwirq-0x4 to VIRQ92 mapping (rc=-6)
[    3.397065] gpio-keys joystick: Found button without gpio or irq
[    3.403041] gpio-keys: probe of joystick failed with error -22

I can reword the commit message to make it clearer.

Regards,
Amelie
