Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE4863E2D8
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 22:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiK3Vg0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 16:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbiK3VgX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 16:36:23 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67D992089
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 13:36:22 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id z4so29265140wrr.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 13:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wm8XvUWd0SDMN1ycm4fnONIa2UjMcG1z5cssOSEnYUM=;
        b=gDPx6bLSaxrhrQAKL54H3ufT0AMV3WppzTWk7xd34MDxwKXhIiTggc3FzVdQ0usQhL
         8B2cloa8Ee21Q2BrsHwlFS+4CEL+UbNf9AcokeEncb4Ic+cpN6QerwozN/cdomAPs3K3
         ofloJmZz2kRQY+sV/qIPbmSlD3KT4zhjUVqg7AyuLJC/xLmyc1h/cl+R0y8ow2f/BUl2
         3li0kqWDQrc5jolsZ8eqFQ08Ww0efIYDDGVojsUkiSLkZ/XUkep8CKgGAyHVfHAB4aGI
         NoG5OE0fTkrylj3yhfZN3D+pz7v2st67CYBDNTVTx1NR6YsTQhWIfNoEJa9pOMNlrn/o
         NhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm8XvUWd0SDMN1ycm4fnONIa2UjMcG1z5cssOSEnYUM=;
        b=p+F4AdG3H065MxxyFtfjiEQ0GD/1D5Ljvt9Lep47/lC1DnFZOFUJIn3uSJoU/rJBHz
         x1vPHCwPpsDVvotfFC5PPltpYOogq2UdR0mtKu4hNuCBc2coURwScCX3XIxV8BvdeVQ4
         r0CnlfsmfitLdFP2r3zxOcdiUIHGuK/SZFGAWpmXxwY8sy3OBRyJP99f8bK6a/JNNyk+
         d4qzKoY17HtbHqpuMRx5NOzMTV9oGqDu3HCoRxs1xeJAhdtExHchazY086Iba5g6x59M
         YbwB/ccN8eM8M3R2P1Iua48mnzuquCqwyfeRLojVoqyFa6vFFoHDw8f4hRS2AHH1mFT+
         Am/w==
X-Gm-Message-State: ANoB5plv8swZQMq6xOL99DaI4DGZo2B6/DLOY5y5IrE7JOhryixnaMZW
        c0hdKwlZKAEg7cz/yAgjCk57Pw==
X-Google-Smtp-Source: AA0mqf52YRRak4p4sZbYIS5xsQI71EB3gX5nYDB0eUdqeegV4V4h5l8ufPXuCqFHJsDeH5OyqzqtOg==
X-Received: by 2002:adf:ef0c:0:b0:241:e4cc:f03d with SMTP id e12-20020adfef0c000000b00241e4ccf03dmr21944263wro.43.1669844181451;
        Wed, 30 Nov 2022 13:36:21 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm7526247wmq.31.2022.11.30.13.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 13:36:21 -0800 (PST)
Message-ID: <50f04f83-93e5-3516-3e6a-a09bd995ec8d@linaro.org>
Date:   Wed, 30 Nov 2022 21:36:19 +0000
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
 <Y4fGx3yWnbejOsVy@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y4fGx3yWnbejOsVy@smile.fi.intel.com>
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

On 30/11/2022 21:10, Andy Shevchenko wrote:
> ...
> 
>>   	struct list_head dt_maps;
>> +	struct list_head acpi_maps;
> Why these can't be unified?
> 
>  From the pin control point of view the data it needs should be ~equal
> independently on the resource provider (ACPI, DT, etc.).

Yes I think they can be unified and some DT specific functions can be 
generalized as well. It is going to be a slightly bigger change and will 
touch most of drivers. I will add changes to next revision.

-- 
Niyas
