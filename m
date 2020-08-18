Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4319F248746
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 16:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgHROV1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 10:21:27 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20611 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726635AbgHROVZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Aug 2020 10:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597760483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yz2aFioQzK66jmr3N2BmfzM3+e8xJ7f1GvUhfZfDu9o=;
        b=S/zPVX9xPOlDOm/n4FsWL1agOijcL+u8Pfa9fplShSgsXLTiv1vrVXKKKUmrwfMUCoU2+q
        y0/Fu2lqkFux6ew5C4yDzk1Imwcas9i/pT9vsmLfSQR16h4JGkGPPQno3vXO6EHDJgnRwm
        h3BRYvt5r7eoILxKBHF7Ke/J0K4dJI4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-YEeDjAHuPnuM23AJbdYemg-1; Tue, 18 Aug 2020 10:21:14 -0400
X-MC-Unique: YEeDjAHuPnuM23AJbdYemg-1
Received: by mail-qt1-f197.google.com with SMTP id h10so14533620qtc.4
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 07:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Yz2aFioQzK66jmr3N2BmfzM3+e8xJ7f1GvUhfZfDu9o=;
        b=p/4119Wc+HlUt+Ae+YJSBrUEDoAsROBd7lrKW0O+KFnMSTpr30TiU6oJLdagRS47IK
         0D0OXg77w0Y6+j/gyEoLpRtDm4pksGpXoSTNQpRY0vELVd3jR7nXWCsBFrl4eR3xLeSS
         LQYHyv6MalrmnkyBWzuezfSp6eT/sYgxoU5MnnaWISWRfEiJMtC5FKymN8le9Zfq4vM9
         JgdjJ7YbAZzIuIW9hHtAAslDfyaB2rMQ0/YFtxG6XrSA8zPIn2i7vYC8qhKt8Q7a8WFK
         v+iz5srjX7xPeedNREJk0rKXJ1U5CaU3KTxe1+ojK3nvJZE3A2Cvu0vjFZ2KYcq1pXzt
         9GBg==
X-Gm-Message-State: AOAM533EIvKWmz1z4k1cJj8YPsgi6xCJqkRyle1gcH3xEXY3WETeVWT6
        PuoPLSKalJ8xvd/M9TzMKiyNBA8lnCk/l9TACSIPTxvBp0Po4Dvn5CPMJAa2KG6+5VlMtmUBDou
        5QhfcPSo14Z0DtWsjRcoEGg==
X-Received: by 2002:a0c:aece:: with SMTP id n14mr19686879qvd.68.1597760473502;
        Tue, 18 Aug 2020 07:21:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR7cqBHSHZWO71g7kDKxrm2e6bQpvtnq4BHkeoL4lVYkiYaEGKTNKdjAybReLDnZZ+QWqphQ==
X-Received: by 2002:a0c:aece:: with SMTP id n14mr19686865qvd.68.1597760473260;
        Tue, 18 Aug 2020 07:21:13 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x5sm22753285qtp.76.2020.08.18.07.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 07:21:12 -0700 (PDT)
Subject: Re: [PATCH 2/3] fpga manager: xilinx-spi: provide better diagnostics
 on programming failure
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-fpga@vger.kernel.org
Cc:     Moritz Fischer <mdf@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Anatolij Gustschin <agust@denx.de>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200817165911.32589-1-luca@lucaceresoli.net>
 <20200817165911.32589-2-luca@lucaceresoli.net>
 <b1a1a9d9-d36b-40f0-24e3-f793e55db929@redhat.com>
 <51694865-2a05-ac67-43a0-dbcb9989cbab@lucaceresoli.net>
From:   Tom Rix <trix@redhat.com>
Message-ID: <397b99e2-9b39-5a67-e1c6-8dcf3482f96b@redhat.com>
Date:   Tue, 18 Aug 2020 07:21:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <51694865-2a05-ac67-43a0-dbcb9989cbab@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/18/20 3:20 AM, Luca Ceresoli wrote:
> [a question for GPIO maintainers below]
>
> Hi Tom,
>
> thanks for your review!
>
> On 17/08/20 20:15, Tom Rix wrote:
>> The other two patches are fine.
>>
>> On 8/17/20 9:59 AM, Luca Ceresoli wrote:
>>> When the DONE pin does not go high after programming to confirm programming
>>> success, the INIT_B pin provides some info on the reason. Use it if
>>> available to provide a more explanatory error message.
>>>
>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>> ---
>>>  drivers/fpga/xilinx-spi.c | 11 ++++++++++-
>>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/fpga/xilinx-spi.c b/drivers/fpga/xilinx-spi.c
>>> index 502fae0d1d85..2aa942bb1114 100644
>>> --- a/drivers/fpga/xilinx-spi.c
>>> +++ b/drivers/fpga/xilinx-spi.c
>>> @@ -169,7 +169,16 @@ static int xilinx_spi_write_complete(struct fpga_manager *mgr,
>>>  			return xilinx_spi_apply_cclk_cycles(conf);
>>>  	}
>>>  
>>> -	dev_err(&mgr->dev, "Timeout after config data transfer.\n");
>>> +	if (conf->init_b) {
>>> +		int init_b_asserted = gpiod_get_value(conf->init_b);
>> gpiod_get_value can fail. So maybe need split the first statement.
>>
>> init_b_asserted < 0 ? "invalid device"
>>
>> As the if-else statement is getting complicated, embedding the ? : makes this hard to read.  'if,else if, else' would be better.
> Thanks for the heads up. However I'm not sure which is the best thing to
> do here.
>
> First, I've been reading the libgpiod code after your email and yes, the
> libgpiod code _could_ return runtime errors received from the gpiochip
> driver, even though the docs state:
>
>> The get/set calls do not return errors because “invalid GPIO”> should have been reported earlier from gpiod_direction_*().
> (https://www.kernel.org/doc/html/latest/driver-api/gpio/consumer.html)
>
> On the other hand there are plenty of calls to gpiod_get/set_value in
> the kernel that don't check for error values. I guess this is because
> failures getting/setting a GPIO are very uncommon (perhaps impossible
> with platform GPIO).
>
> When still a GPIO get/set operation fails I'm not sure adding thousands
> of error-checking code lines in hundreds of drivers is the best way to
> go. I feel like we should have a unique, noisy dev_err() in the error
> path in libgpio but I was surprised in not finding any [1].
>
> Linus, Bartosz, what's your opinion? Should all drivers check for errors
> after every gpiod_[sg]et_value*() call?

My opinion is that you know the driver / hw is in a bad state and you

are trying to convey useful information.  So you should

be as careful as possible and not assume gpio did not fail.

>
>>> +		dev_err(&mgr->dev,
>>> +			init_b_asserted ? "CRC error or invalid device\n"
>>> +			: "Missing sync word or incomplete bitstream\n");
>>> +	} else {
>>> +		dev_err(&mgr->dev, "Timeout after config data transfer.\n");
>> patch 3 removes '.' s , and you just added one back in ?
> Here I'm only changing indentation of this line. But OK, this is
> misleading, so I'll swap patches 2 and 3 in the next patch iteration to
> avoid confusion.
Maybe just remove the '.' at the same time and/or collapse 2&3 into a single patch.
>
> [1]
> https://elixir.bootlin.com/linux/v5.8/source/drivers/gpio/gpiolib.c#L3646
>

