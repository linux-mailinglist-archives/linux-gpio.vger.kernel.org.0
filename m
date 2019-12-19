Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEFC12680C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfLSR2y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:28:54 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51135 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbfLSR2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:28:43 -0500
Received: by mail-wm1-f65.google.com with SMTP id a5so6278619wmb.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KM9qiMDfWKFWWdCAAPZQUcLR4rcoEPUjfLdlA5II0go=;
        b=Xk3y9UvfTT0+Ov2hyWIqLRGjMtYrhB1HcKktCLIY0h/JLmVYGwjuV1P6zpdiJh8qNR
         TmcZB+0dGj0Ko3YCsB5487mevpccX9VqujsdaaNeoIbRIPcvy+J99YXACmc1m25VD2A7
         iDPWOs6laaTvmsHw+2v027T3QnXfBukqPbs2fuaxKJaX3o1acyRS0+qG5C+fpC8cvg+1
         78LrhSHW5jUUSCN4QsQMGkQ/4wB7aT1m9qMe2lTBVhHnmT3k5z4zpBhg9A1tRkeSuU8e
         UnuM4Va7wx0yd+kY6cgbyjh7Ha/FSiT/CTkLVrOx349EcPEat7shDxLuOkLv9fpX6B48
         n0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KM9qiMDfWKFWWdCAAPZQUcLR4rcoEPUjfLdlA5II0go=;
        b=HIA4ZtUz4y3STwakLmRoWggEzYpFdBjfmDcIeCStci03y4SZToqvUmFgI3LbYGMT/V
         5JLRwyUgePN7Wb2+YdbQ58YKsaG2cH6gMhiLou8iON9OrLVFkhRHUR6AkQtw5D5t36OV
         bn/eDID2Mnfx9QlP18qChfuFZJ+NjaYDunMwZ9qI6KcSN3Q6/+zfz4Cx79B5ZJHwQNgV
         0lXpJkYScZvIpERIzU+m4xqx+ps/NPy9u26rtYfG8QNNzKW7Qd/+MwDwSart1V+p9+fU
         GgrAyudVRGGq0Fvh8/lPu+jy57KqdFzAlP+lzhVCbnqWrmCIcwfcHESt+5Gl9zkHQibL
         XbuQ==
X-Gm-Message-State: APjAAAUs4gHG16qxa/sNbJEQrqBg6nukD4fak1S+KsXRfJGQHqIoclgf
        hmHUyMJJ69DmvtLfz1SFOIWH7pArJcA=
X-Google-Smtp-Source: APXvYqxEChvbzvXz1AWKw3LjAHZoXrlun6tgfrVy7bOQosew+hDZAwYPv96u+0LKl9otucSH4hTVGg==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr11102986wml.83.1576776520153;
        Thu, 19 Dec 2019 09:28:40 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id n67sm6887821wmf.46.2019.12.19.09.28.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Dec 2019 09:28:39 -0800 (PST)
Subject: Re: [alsa-devel] [PATCH v6 02/11] mfd: wcd934x: add support to
 wcd9340/wcd9341 codec
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc:     robh@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, vinod.koul@linaro.org,
        devicetree@vger.kernel.org, spapothi@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
 <af48cd71-fa1a-dbc5-0e88-e315ea13c28c@linux.intel.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <db36d6d7-40a2-bbd2-f299-838abf4d92cc@linaro.org>
Date:   Thu, 19 Dec 2019 17:28:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <af48cd71-fa1a-dbc5-0e88-e315ea13c28c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 19/12/2019 16:36, Pierre-Louis Bossart wrote:
> 
>> +static int wcd934x_slim_status(struct slim_device *sdev,
>> +                   enum slim_device_status status)
>> +{
>> +    switch (status) {
>> +    case SLIM_DEVICE_STATUS_UP:
>> +        return wcd934x_slim_status_up(sdev);
>> +    case SLIM_DEVICE_STATUS_DOWN:
>> +        mfd_remove_devices(&sdev->dev);
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
> 
> this is interesting/surprising - I just noticed what looks like a 
> significant change in how probe/initialization are handled.
> 
> It was my understanding that in SLIMbus the Linux devices are created at 
> probe time, and when the device reports present this 'device_status' 
> callback is used to notify the codec driver of a change. The rationale 
> for this was that the codec driver may control power switches/gpios that 
> are necessary for the device to appear on the bus.

We use same rational here to power switch and flip reset pins in device 
probe to power up the actual SLIMBus device in device probe.

Only difference here is that the actual SLIMBus device itself is 
represented as many child devices based on there functionality.

SLIMBus parent device in this case is MFD device which is created at 
probe time. However child devices for that device like gpio controller, 
codec, clock controller and soundwire controller are created only after 
the device is enumerated on the bus. Before that none of these devices 
will be in a position to talk on the bus.


> 
> This argument was used to require an change in the SoundWire 
> implementation, so we followed this model of creating devices at probe 
> time based on information reported by ACPI/DT, and used the 
> 'update_status' callback when the device is present on the bus (which 
> may happen after a delay or controlled by an external power switch). 
> This approach can lead to 'ghost devices' described in firmware but not 
> populated in hardware, and power management opens on how long a bus 
> needs to remain active if no devices report present.
> 
> What I understand from the code above is that the devices are actually 
> created when the SLIMbus device reports PRESENT, which seems a 180 
> degree change in directions?
> 
Note these are the child devices of the MFD SLIMBus device.


> I actually prefer it this way, and all current discussions in MIPI 
> circles point to the fact that when the bus starts all devices on that 
> bus should already be powered and have the ability to report present 
> immediately (if the bus starts in a 'safe' mode and then later programs 
> different PHY parameters, a device can no longer join the bus)

In our case we need to switch on few regulators and flip the reset pio 
to be able to bring the device to enumerate.

> 
> I would however not remove the devices when the status is down but only 
> on an explicit .remove.

Am open for suggestions but I would not like the child devices to talk 
on the bus once the SLIMbus device is down! Only way to ensure or make 
it silent is to remove.

Thanks,
srini
> 
> Feedback welcome.
> -Pierre
> 
