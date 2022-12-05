Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36313642383
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 08:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbiLEHUm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 02:20:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbiLEHUe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 02:20:34 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C1813F64
        for <linux-gpio@vger.kernel.org>; Sun,  4 Dec 2022 23:20:27 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id h10so7658058wrx.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Dec 2022 23:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8HHI5OYeBtZ9OhzgG0GgRcAo9rRNF7SWXi0ONFtD8zg=;
        b=Gtyf27NLGwz2XiJyAx4nDCn5tqBs80SxwiPZ3G6suWCTkrGsFh610dWxT453KuuVpm
         MjglVG6XAHAsh1cBCGbeiOVYBxsZzYX0t425WmazuQ979cKQqTv64wEanGsxcMQfJnB7
         5W7dx4W/DuAPA2lvsctDADQvD4cRhAz3OiY6UAxc6EHLGnwb2J4FP/n8xRHmo2zDA/NO
         j8taob140c1zU0OZwCXrM57L2WXjgH2jtslWoPEDlZb1LeCouI3gsy1JCkjHWhDpqpTN
         NVwinMu3+eD4B0wDrfWWMSAK53wXyONEBkajceqml3GBPDpRzaipTrp74M6q0ddHa/KO
         UpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HHI5OYeBtZ9OhzgG0GgRcAo9rRNF7SWXi0ONFtD8zg=;
        b=8ASMqpcxj3+Xo+vwsbg01URJM5VXSrg9st0fkJWNj3j6PNezoFhc+QC5d6qd5SVFQ6
         sp5gSnc3VdGeDEtyPAX2LCquN8AE+7KQtH68fsLCU3Svbs0fjBg9SNehndMKXlZZXhaF
         tQUlVLZLRM/TfZgihYBdIUWc2lYoJvc6XC8wTviz7cFSmH0DBx8yDuPAbRLCohg6NQH8
         ANPKH3e4cvfH1CgFsbzdgfQP6LcupCl1WXseRmJHeseysogiN2TW1nX+GOAj61CbKYtK
         kp0AgHQh3pqTnL6VILEDrVlT2EOqY6JkhEXw2iDIGfOD5FvWOjq9Gj3Af01s98Cq7TSu
         GJbg==
X-Gm-Message-State: ANoB5pm+9nVuL0Nb/kO6dNfwgH8COXNK91Y0zh1Ih21do2ooaEqFO9UR
        2IxZ4mWh4qzez21fW5YkO4fuX/FY4OH3+FD77Ho=
X-Google-Smtp-Source: AA0mqf5nO4+4Z/GwlwROnBTkRpD+efTpWzHkE+bzi2nICroLKVvSxMtFnYzLVI9kdIy6X9Coc6H2JQ==
X-Received: by 2002:a5d:5712:0:b0:242:4bac:a100 with SMTP id a18-20020a5d5712000000b002424baca100mr6266840wrv.117.1670224826319;
        Sun, 04 Dec 2022 23:20:26 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm22274069wmq.31.2022.12.04.23.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 23:20:25 -0800 (PST)
Message-ID: <ae60701e-a2f1-4945-d9e0-e8ecd1c82f62@linaro.org>
Date:   Mon, 5 Dec 2022 07:20:24 +0000
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
 <a23d0da6-6f80-a7d5-a0fb-a10e1a408129@linaro.org>
 <Y4fnoOKngSLW7dfb@smile.fi.intel.com>
 <a033178f-89f8-1843-ee02-321da8c2ca90@linaro.org>
 <Y4kzG3K1LlC5ZcQi@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y4kzG3K1LlC5ZcQi@smile.fi.intel.com>
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



On 01/12/2022 23:04, Andy Shevchenko wrote:
> That's why third (?) time I'm asking you to provide a design level
> documentation of your approach to understand it better.
> 

Sorry Andy. I made a wrong assumption that the docs added would clarify 
things. I will put together a design document.


> The pin control has provider-consumer idea behind. When a*consumer*  device
> is being probed, it tries to configure its pins based on the data collected
> in the pin control device that*provides*  the resources. At this point of
> time the pin control subsystem parses tables (currently DT and board files)
> for that. For the pin control device itself, the registration of it also
> parses tables but for the*provider*.
> 
> Now, the pin control device driver (*provider*) may or may not have
> (a subset of) the pin functions and pin groups hard coded in the driver.
> This can be used by the pin control subsystem as well as data that comes
> from the tables. The data from the tables, nevertheless, is not really
> needs names of the functions, because it's not what is programmed into
> HW registers. That's why when driver doesn't have that information, it's
> fine to generate it.
> 
> Also note, that in ACPI all Pin*() descriptors are optional and we need
> to cover all such cases, I already pointed out to my preliminary research,
> which I have done 5 years ago, where I tried to understand how it should
> be covered for the most used cases.
> 
> I think I stopped with my solution in particular due to the problems with
> the power management interaction with pin control, i.e. string-based odd
> states (4 of which are hard coded in the pin control core code).

Let's start with the design document. ACPI have far fewer information 
for the pin controller compared to DT. I am not quite sure how we can 
generate data from Pin(*) descriptions for the pin controller reliably. 
Let me first put together the design document, hopefully that will help.

-- 
Niyas
