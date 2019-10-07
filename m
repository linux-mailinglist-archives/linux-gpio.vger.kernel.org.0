Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F81BCE61A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 16:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbfJGOxV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 10:53:21 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:21186 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727711AbfJGOxV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 10:53:21 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x97Eke9C003277;
        Mon, 7 Oct 2019 16:53:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=BHdMjWZVBOApScvksxR8joV5keqKZpJ60rXE2ibEO8g=;
 b=fpejq/z7supoEWxe+slx8u6VsoOpWCsVfD19jaAqZhI0pGQbGv+uJOtfLP7w1ByISxdX
 CYK7sCHsQVt2L31c2fYrKMxsnwZkc5uqOwdxtWgmUwK4BOb+whM+iCemw6GeF4p6MVWk
 IXbLeZ59vIWWv/VQE9UIHvcuEaZF8D9W7TowMUWX7m7dLpCMq1WbpTZPTk/6EyEwci6u
 Y2UjuqSbPnsaON8A9D+I9S8LNdbmRJbtGk4kPlB31EpsXVzBf669j3K+9gHsp4WsF/pI
 5/5T32y1goOidFIYn5kiV9QGm+44s5OKMQa5D1xGw4nwtE0FwzFpIUw1UpYMsCuzbzjp vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2vegaguahy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Oct 2019 16:53:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83456100034;
        Mon,  7 Oct 2019 16:53:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76D982ACFE5;
        Mon,  7 Oct 2019 16:53:10 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 7 Oct
 2019 16:53:09 +0200
Subject: Re: [PATCH 1/1] pinctrl: stmfx: add irq_request/release_resources
 callbacks
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20191004122923.22674-1-amelie.delaunay@st.com>
 <CACRpkda6CyYCt-s-VkaK856Jt3TxQg+HVDz-5Ww9T9KNHHAjaQ@mail.gmail.com>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <8eb2090a-e50e-2e4f-982b-073ad24e553c@st.com>
Date:   Mon, 7 Oct 2019 16:53:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda6CyYCt-s-VkaK856Jt3TxQg+HVDz-5Ww9T9KNHHAjaQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 10/5/19 6:49 PM, Linus Walleij wrote:
> On Fri, Oct 4, 2019 at 2:29 PM Amelie Delaunay <amelie.delaunay@st.com> 
> wrote:
> 
>> When an STMFX IO is used as interrupt through the interrupt-controller
>> binding, the STMFX driver should configure this IO as input. Default
>> value of STMFX IO direction is input, but if the IO is used as output
>> before the interrupt use, it will not work without these callbacks.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> 
> OK I see what you want to achieve.
> 
>> +static int stmfx_gpio_irq_request_resources(struct irq_data *data)
>> +{
>> +       struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
>> +       struct stmfx_pinctrl *pctl = gpiochip_get_data(gpio_chip);
>> +       int ret;
>> +
>> +       ret = stmfx_gpio_direction_input(&pctl->gpio_chip, data->hwirq);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = gpiochip_lock_as_irq(&pctl->gpio_chip, data->hwirq);
>> +       if (ret) {
>> +               dev_err(pctl->dev, "Unable to lock gpio %lu as IRQ: %d\n",
>> +                       data->hwirq, ret);
>> +               return ret;
>> +       }
>> +
>> +       return 0;
>> +}
> 
> Just call gpiochip_reqres_irq() instead of calling the lock etc
> explicitly.
> 
>> +static void stmfx_gpio_irq_release_resources(struct irq_data *data)
>> +{
>> +       struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
>> +       struct stmfx_pinctrl *pctl = gpiochip_get_data(gpio_chip);
>> +
>> +       gpiochip_unlock_as_irq(&pctl->gpio_chip, data->hwirq);
>> +}
> 
> Just call gpiochip_relres_irq()
> 
> But all this duplicated a lot of code from the core which is not so nice.
> 
>> @@ -678,6 +706,8 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
>>         pctl->irq_chip.irq_set_type = stmfx_pinctrl_irq_set_type;
>>         pctl->irq_chip.irq_bus_lock = stmfx_pinctrl_irq_bus_lock;
>>         pctl->irq_chip.irq_bus_sync_unlock = stmfx_pinctrl_irq_bus_sync_unlock;
>> +       pctl->irq_chip.irq_request_resources = stmfx_gpio_irq_request_resources;
>> +       pctl->irq_chip.irq_release_resources = stmfx_gpio_irq_release_resources;
> 
> What about just adding
> 
> pctl->irq_chip.irq_enable and do stmfx_gpio_direction_input()
> in that callback instead? gpiolib will helpfully wrap it.

Thanks for pointing that out to me.

I can't use .irq_enable because of I2C transfer to set gpio direction 
(scheduling while atomic BUG occurs in this case). Indeed, .irq_enable 
is called under raw_spin_lock_irqsave in __setup_irq() while 
irq_request_resources is called before.

I could apply gpio direction in stmfx_pinctrl_irq_bus_sync_unlock 
depending on pctl->irq_gpi_src[] (checking which one is set, to set 
input direction), but this will be applied each time a consumer requests 
a stmfx gpio irq.

IMHO, keeping .irq_request/release_resources callbacks and using 
gpiochip_reqres_irq()/gpiochip_relres_irq() seems to be the best compromise.

Regards,
Amelie
