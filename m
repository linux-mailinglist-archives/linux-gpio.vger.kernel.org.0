Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1CAE64EE18
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 16:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbiLPPrF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 10:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbiLPPrE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 10:47:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771FD31DF3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 07:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671205577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9miN79vuneG4+xiAXBKAhjQmKbcytEgoN1Q0VxUiPr0=;
        b=YY7QFEi9x+5wPH0VgJrr8dW6bsnjUyo6mZGmlqii4A7Nq7JN40aNtQCBVLsJRysVjg7GR+
        Rtmy/LzLJz8kb3S04dggvcBhLISY5gJiGP9da2VrXxh+xFFlnEkJx1SFN3+1jvXmyrpnMr
        DpMJ3KGKUyPUVbEfjjF/0Gm5aTEP1Ug=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-iga8Bg8gOl2ur_MGrV2ewQ-1; Fri, 16 Dec 2022 10:46:16 -0500
X-MC-Unique: iga8Bg8gOl2ur_MGrV2ewQ-1
Received: by mail-ed1-f71.google.com with SMTP id s13-20020a056402520d00b0046c78433b54so2152778edd.16
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 07:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9miN79vuneG4+xiAXBKAhjQmKbcytEgoN1Q0VxUiPr0=;
        b=7X92UGt7/AsSOA1QMNUciUpkPA8RVuXnVeK5G1BQeghDSjoQe65W3Si4J0tj+Mxo5n
         Gl5A91PQ778QhD2jBK7KDUj1KNp/toHNkLh44eqilKdgufdL4jPoH8CdzLEuiL4UTe/k
         vIALup3sjKrYc167Xhl/VSsngIajPIvr29sPlXTa0KZOoxEN3w7RzqGV1Sq9MkObzsc2
         RK7eU5G5J0PCf6yJQxqEZIa49JArnQb952CJgD5mnM6SunUao6T1mtXDD1bIYaOjiOlG
         G/5vQBYP0YUKbE1VDko28MudUkQzdI4p5+CFjPRw5kzZQ1HqjFxqbbxc3jBNwTSJuwtc
         4P6g==
X-Gm-Message-State: AFqh2kqG70GJp9AcpJzN4V+xyyUEIYRZ2iaSrf110PFgrhRkfejQ2OA6
        Aevrywt/dtZiG1KrXiTuD07PJnqGLTaHiLx0OVV76msaXE4pnwLeMkWk7F3PhdpfOwNY9fabbhf
        gtXVrvNwdJvzeMWqvXJa9kA==
X-Received: by 2002:a17:906:6b13:b0:7ae:29fa:ba8f with SMTP id q19-20020a1709066b1300b007ae29faba8fmr18501456ejr.2.1671205575485;
        Fri, 16 Dec 2022 07:46:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt1F+qGVMz5rlxsdm1cVTC00+hNjjzyZuB6NkuP4nyFnjpBc63rkQq2R/tNIbj6f9TJ3hqZGA==
X-Received: by 2002:a17:906:6b13:b0:7ae:29fa:ba8f with SMTP id q19-20020a1709066b1300b007ae29faba8fmr18501435ejr.2.1671205575286;
        Fri, 16 Dec 2022 07:46:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id 5-20020a170906308500b007be696512ecsm965332ejv.187.2022.12.16.07.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:46:14 -0800 (PST)
Message-ID: <143dc036-ed98-871f-57d9-e94bfa84ea5d@redhat.com>
Date:   Fri, 16 Dec 2022 16:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 02/11] leds: led-class: Add __led_get() helper function
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-3-hdegoede@redhat.com>
 <Y5x4mcv4rft2Wc+l@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x4mcv4rft2Wc+l@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/16/22 14:54, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:04PM +0100, Hans de Goede wrote:
>> Split out part of of_led_get() into a generic __led_get() helper function.
>>
>> This is a preparation patch for adding a generic (non devicetree specific)
>> led_get() function.
> 
> ...
> 
>> +static struct led_classdev *__led_get(struct device *led_dev)
>> +{
>> +	struct led_classdev *led_cdev;
>> +
>> +	if (!led_dev)
>> +		return ERR_PTR(-EPROBE_DEFER);
>> +
>> +	led_cdev = dev_get_drvdata(led_dev);
>> +
>> +	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
>> +		put_device(led_cdev->dev);
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>> +	return led_cdev;
>> +}
> 
> If I'm not mistaken, the entire series leaves this function as is.
> At the end I found three _get functions:
>  __led_get
>  led_get
>  __devm_led_get
> 
> 
> As far as I can see the above can be named more precisely, i.e.
> led_module_get(). Or alike if this sounds not good either.

led_module_get() sounds good, I will rename this for v4.

Regards,

Hans

