Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3145D33CBD
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 03:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfFDBaS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 21:30:18 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:51163 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfFDBaR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 21:30:17 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20190604012950epoutp03800462f6d1390a62f0136ce59b38c58d~k2qjsuL2-2784127841epoutp03b
        for <linux-gpio@vger.kernel.org>; Tue,  4 Jun 2019 01:29:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20190604012950epoutp03800462f6d1390a62f0136ce59b38c58d~k2qjsuL2-2784127841epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559611790;
        bh=+D/nJ711q8xI2Qg5OY4D/1Bwae1+mpml8ufa46iKuH0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=toT3neBM1I/IRqUKe5EWcycPEoCbQHVQtZMb1/vey6VIylGQJAQMCZWa+LxMQ32ec
         sJ9NNs5btEDYRKuDUi1bnoQPcfVQRstvUJUHHVftpeZ+kRUd9Im4ee4uq13UOrqa7w
         qdDIvCx9XsWXeRBWo8i1knm9bqgfHmJBekLN4Ozw=
Received: from epsmges1p2.samsung.com (unknown [182.195.40.157]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190604012941epcas1p1afe4518d6d508e36ce820f9b2b58b9a5~k2qb-czHJ0549305493epcas1p1E;
        Tue,  4 Jun 2019 01:29:41 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        D8.81.04142.189C5FC5; Tue,  4 Jun 2019 10:29:37 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190604012936epcas1p1cd77444b71c8af11bfd5c133032f2658~k2qXcGjl42511625116epcas1p1K;
        Tue,  4 Jun 2019 01:29:36 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190604012936epsmtrp1c97223751318d720a8bcdc991f9ed0f0~k2qXbXuWd2985129851epsmtrp1U;
        Tue,  4 Jun 2019 01:29:36 +0000 (GMT)
X-AuditID: b6c32a36-cf9ff7000000102e-26-5cf5c981596a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A4.71.03692.089C5FC5; Tue,  4 Jun 2019 10:29:36 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190604012936epsmtip24b9e456115d0b7ff60eb1b52b9143769~k2qXSwF5O0107001070epsmtip2m;
        Tue,  4 Jun 2019 01:29:36 +0000 (GMT)
Subject: Re: [PATCH] extcon: gpio: Request reasonable interrupts
To:     Linus Walleij <linus.walleij@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <28b92b86-19ac-0bf3-57d8-c7ab4557a45b@samsung.com>
Date:   Tue, 4 Jun 2019 10:31:42 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530183932.4132-1-linus.walleij@linaro.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupik+LIzCtJLcpLzFFi42LZdlhTX7fx5NcYgy3HRC2m/FnOZLF5/h9G
        i8u75rBZ3G5cwebA4nHn2h42j74tqxg9Pm+SC2COyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneO
        NzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMAdqmpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFV
        Si1IySmwLNArTswtLs1L10vOz7UyNDAwMgUqTMjOOP+bv2CFbMWMKS/YGxiniHcxcnJICJhI
        vL/WxtLFyMUhJLCDUWLKrpusEM4nRonW8y1QmW+MEt8/b2OGabnc0scEkdjLKPGh6TxUy3tG
        ianXz7KBVAkLOEjMuv6ZHcQWEQiX2HfsAFg3s4CNxMvtnWA1bAJaEvtf3ACz+QUUJa7+eMzY
        xcjBwStgJ7HslhGIySKgIjHrjChIhahAhMSXnZsYQWxeAUGJkzOfsIDYnAK2Eg+ubGCDmC4u
        cevJfCYIW16ieetsZpDTJATOsEkcuXQF6gEXiUkXfrFC2MISr45vYYewpSRe9rdB2dUSK08e
        YYNo7mCU2LL/AlSDscT+pZOZQI5jFtCUWL9LHyKsKLHz91xGiMV8Eu++9rCClEgI8Ep0tAlB
        lChLXH5wlwnClpRY3N7JNoFRaRaSd2YheWEWkhdmISxbwMiyilEstaA4Nz212LDACDmuNzGC
        06GW2Q7GRed8DjEKcDAq8fBWiH+NEWJNLCuuzD3EKMHBrCTCm3j7S4wQb0piZVVqUX58UWlO
        avEhRlNgYE9klhJNzgem6rySeENTI2NjYwsTQzNTQ0Mlcd547psxQgLpiSWp2ampBalFMH1M
        HJxSDYzCXlIuc6yCgift78wzC5er6tHqmyR62vjAAeNztaKX7B0yTnXEaVz9yX6gJMmv2Wjq
        TpZHu6zMj5z/nrJSqE/x6duj11bpNhita6vZGaqz+TaX+rwVrYd3Trd2Ofty34uuf0rFgdUv
        Hi49lsCR8pMp93iK0hXh5YKFd1T0lCu+Zk1Pmn+DbakSS3FGoqEWc1FxIgCSPzvJnQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWy7bCSvG7Dya8xBvuOG1pM+bOcyWLz/D+M
        Fpd3zWGzuN24gs2BxePOtT1sHn1bVjF6fN4kF8AcxWWTkpqTWZZapG+XwJVx/jd/wQrZihlT
        XrA3ME4R72Lk5JAQMJG43NLH1MXIxSEksJtR4tH224wQCUmJaRePMncxcgDZwhKHDxeDhIUE
        3jJKLJirC2ILCzhIzLr+mR3EFhEIl5i94D0ziM0sYCPxcnsnG8TMCYwSDb9+giXYBLQk9r+4
        wQZi8wsoSlz98ZgRZD6vgJ3EsltGICaLgIrErDOiIBWiAhESs3c1sIDYvAKCEidnPgGzOQVs
        JR5c2cAGsUpd4s+8S1BrxSVuPZnPBGHLSzRvnc08gVF4FpL2WUhaZiFpmYWkZQEjyypGydSC
        4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjOCo0NLcwXh5SfwhRgEORiUe3grxrzFCrIllxZW5
        hxglOJiVRHgTb3+JEeJNSaysSi3Kjy8qzUktPsQozcGiJM77NO9YpJBAemJJanZqakFqEUyW
        iYNTqoHR/HDspFcfU2Y0h35fuWHiH4+1rMvWbvmt5ztrRei5u5H+ZS1VcxnzHgV+u/V62dGw
        mYe5RbV0IrZJZTb73Lr/tanrzJVtbDUR+TtepE1/LiV+8dy9TTOr7tZE2kVv+ncjeoL90YKL
        Ivw/bj4KVZ8bezhe4cjeiXemzJM0VErpviFoc/U6a/8jVyWW4oxEQy3mouJEALTEsKaGAgAA
X-CMS-MailID: 20190604012936epcas1p1cd77444b71c8af11bfd5c133032f2658
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190530183941epcas5p4688d5fa80df649e4184a296ea78e6256
References: <CGME20190530183941epcas5p4688d5fa80df649e4184a296ea78e6256@epcas5p4.samsung.com>
        <20190530183932.4132-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 19. 5. 31. 오전 3:39, Linus Walleij wrote:
> The only thing that makes sense is to request a falling edge interrupt
> if the line is active low and a rising edge interrupt if the line is
> active high, so just do that and get rid of the assignment from
> platform data. The GPIO descriptor knows if the line is active high
> or low.
> 
> Also make irq a local variable in probe(), it's not used anywhere else.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/extcon/extcon-gpio.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpio.c
> index 13ba3a6e81d5..a0674f1f3849 100644
> --- a/drivers/extcon/extcon-gpio.c
> +++ b/drivers/extcon/extcon-gpio.c
> @@ -30,26 +30,22 @@
>  /**
>   * struct gpio_extcon_data - A simple GPIO-controlled extcon device state container.
>   * @edev:		Extcon device.
> - * @irq:		Interrupt line for the external connector.
>   * @work:		Work fired by the interrupt.
>   * @debounce_jiffies:	Number of jiffies to wait for the GPIO to stabilize, from the debounce
>   *			value.
>   * @gpiod:		GPIO descriptor for this external connector.
>   * @extcon_id:		The unique id of specific external connector.
>   * @debounce:		Debounce time for GPIO IRQ in ms.
> - * @irq_flags:		IRQ Flags (e.g., IRQF_TRIGGER_LOW).
>   * @check_on_resume:	Boolean describing whether to check the state of gpio
>   *			while resuming from sleep.
>   */
>  struct gpio_extcon_data {
>  	struct extcon_dev *edev;
> -	int irq;
>  	struct delayed_work work;
>  	unsigned long debounce_jiffies;
>  	struct gpio_desc *gpiod;
>  	unsigned int extcon_id;
>  	unsigned long debounce;
> -	unsigned long irq_flags;
>  	bool check_on_resume;
>  };
>  
> @@ -77,6 +73,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  {
>  	struct gpio_extcon_data *data;
>  	struct device *dev = &pdev->dev;
> +	unsigned long irq_flags;
> +	int irq;
>  	int ret;
>  
>  	data = devm_kzalloc(dev, sizeof(struct gpio_extcon_data), GFP_KERNEL);
> @@ -96,9 +94,20 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  	data->gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
>  	if (IS_ERR(data->gpiod))
>  		return PTR_ERR(data->gpiod);
> -	data->irq = gpiod_to_irq(data->gpiod);
> -	if (data->irq <= 0)
> -		return data->irq;
> +	irq = gpiod_to_irq(data->gpiod);
> +	if (irq <= 0)
> +		return irq;
> +
> +	/*
> +	 * It is unlikely that this is an acknowledged interrupt that goes
> +	 * away after handling, what we are looking for are falling edges
> +	 * if the signal is active low, and rising edges if the signal is
> +	 * active high.
> +	 */
> +	if (gpiod_is_active_low(data->gpiod))
> +		irq_flags = IRQF_TRIGGER_FALLING;

If gpiod_is_active_low(data->gpiod) is true, irq_flags might be
IRQF_TRIGGER_LOW instead of IRQF_TRIGGER_FALLING. How can we sure
that irq_flags is always IRQF_TRIGGER_FALLING?

> +	else
> +		irq_flags = IRQF_TRIGGER_RISING;
>  
>  	/* Allocate the memory of extcon devie and register extcon device */
>  	data->edev = devm_extcon_dev_allocate(dev, &data->extcon_id);
> @@ -117,8 +126,8 @@ static int gpio_extcon_probe(struct platform_device *pdev)
>  	 * Request the interrupt of gpio to detect whether external connector
>  	 * is attached or detached.
>  	 */
> -	ret = devm_request_any_context_irq(dev, data->irq,
> -					gpio_irq_handler, data->irq_flags,
> +	ret = devm_request_any_context_irq(dev, irq,
> +					gpio_irq_handler, irq_flags,
>  					pdev->name, data);
>  	if (ret < 0)
>  		return ret;
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
