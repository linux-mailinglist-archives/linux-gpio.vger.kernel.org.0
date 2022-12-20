Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C905651F46
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Dec 2022 11:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbiLTKx1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Dec 2022 05:53:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiLTKx0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Dec 2022 05:53:26 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D746186C1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Dec 2022 02:53:25 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 131-20020a1c0289000000b003d35acb0f9fso720390wmc.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Dec 2022 02:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGQieaMM2SS/RNpFPoqY2XRjHxDGe7+i1pDVLBPKNJg=;
        b=anEt3+F6uSgZrJKYeboQjiomtNFZzf3YpsysRQLcYpFxpPa+blxpypKNJWmo8nIj8J
         Tnge+0fU4slYFnz1IoDAmftM5S4VU4Kh6FLAK4LkIFCtRynvCvrUYweHRk5JCxSRR5PL
         9e/dv6STYF0bf2+ABygJJqkKwxuISj3/JKGlyHuAw5/H0PN1ZzL0rXiiAlIHjM3isj2X
         Bnrx27/nVRYtHCW8vatP7sOA30wejc73uDo39O1h+Asm+Z2iGTRaDSSzWxMULGFLLzf1
         0enKOghBcKIUlhVx0tkSN/8q44x8BEDWsElOLqP1CePp44dxcMBbORW7P1+j/Tz6hPBP
         2yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UGQieaMM2SS/RNpFPoqY2XRjHxDGe7+i1pDVLBPKNJg=;
        b=OpcxrJiC0nn7s3e8hDYUacU/Oj+8SYotrrko5FnbWKlQbNN8J72LU+4PhUtj5RCdbg
         GU8rcPGmyvuCChrkcfBZIwTl97MTUEXNNihdgTpu1WXUmw67CP7xKznbrD8cTkKXcynh
         Rrp7H/9rNMGTII7GWS47CvNiE1AFhOck+JIduTtAUZiGcN9bEE5BITAgulmVrnmJSUmT
         0brFduPg5pNFx3K3xzufdHwBt8mZGxH5b1/UJ11kAugxuG4OlSPevABupukNGRZHpMMC
         2RRUyQgWzSZmTh8lH4YMgwKPskID0p0i+erOgk934xckfacoBZ1v+BRyVrYuIlDCTZrl
         TILQ==
X-Gm-Message-State: AFqh2kqtwe0Edw/KDNvRT7yS7vL0D8NgaPizHDQSOFYlYQxxldfo+ORA
        BL4WYa/N6JqPyK2OxaqM+Wu3VQ==
X-Google-Smtp-Source: AMrXdXs4IRguV/XdPG+qmh5wlZoP2WkPzBmqLt6aQKHFWKTbNa6oX4lak8CrmDkhQ8BysOi2hhabEg==
X-Received: by 2002:a05:600c:3d85:b0:3d3:59a8:252d with SMTP id bi5-20020a05600c3d8500b003d359a8252dmr5561705wmb.9.1671533603811;
        Tue, 20 Dec 2022 02:53:23 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b003cfa3a12660sm1769831wmq.1.2022.12.20.02.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 02:53:23 -0800 (PST)
Message-ID: <24bf8b5d-d0ff-1d45-9c36-12bcc6fc3868@linaro.org>
Date:   Tue, 20 Dec 2022 10:53:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
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
 <ae60701e-a2f1-4945-d9e0-e8ecd1c82f62@linaro.org>
 <Y43oYSF8WWu6ziJ9@smile.fi.intel.com>
Content-Language: en-US
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y43oYSF8WWu6ziJ9@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

As discussed previously, I've put together a design for the pinctrl ACPI 
support in a google doc [1]

Could you please have a look ?

[1] 
https://docs.google.com/document/d/1bgLAOEGmhVnxSF_Bx6-blg1_ZNnv8BTQGYW6gixOvjY/edit?usp=sharing

-- 
Niyas
