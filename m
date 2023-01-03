Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B59F65C430
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jan 2023 17:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbjACQt2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Jan 2023 11:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233296AbjACQt2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jan 2023 11:49:28 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D469117A
        for <linux-gpio@vger.kernel.org>; Tue,  3 Jan 2023 08:49:27 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id co23so30153455wrb.4
        for <linux-gpio@vger.kernel.org>; Tue, 03 Jan 2023 08:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VT1UUFbAGnT54DANd47ZV9TROObDjAe1dJyEnota21g=;
        b=SHBoYV3TEfZBw0iySEGHOinQWiLLAN0H0jGmXNdyLbATtpD1kYADUTZDaiVL6qCwTf
         cp/Anq4uRK27Qajwm3rbQv1XNPnyGAmrmqcHhdHj4GX+waugM8DUdukhEPfaBvwqRBAr
         RnCM5yzOZskQf3j+Xx7Qqg6f1EiWcBjjPg6wSdAoXfhJaXTBprevjtlU7J8pU04QJ5us
         lHAIZGC+EL840U25P5OdlhZboXjdz8797JJbXsnf1cwIM7of4G3azyoGocBPX0JmxfWp
         tZzw2bD/gGF83+aviAE8fXUrKmCBGgPr5qU2VOmy33lVijzdl7yDiIHnsJxvyDO8oaI2
         qMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VT1UUFbAGnT54DANd47ZV9TROObDjAe1dJyEnota21g=;
        b=ObyVOVE15Ef/UgpuWGw9HzU6syzCLuRVEvJluF2WEl4cyD8mXp+zGtxKCvWPk/aPMp
         cb4DyyJigXeb/eqA4zylKBW6bVDo+Fqac7auK77sYglFCsbW16rrCUXC23osZMN1PMjf
         CcDgokxnXFslQ+Lvdln5p1xVKRAq7CeyegagKNIpsqoqMe3TCoCA9rhFMBUgsqXHMvMF
         zKeGX+XbKTPE3dG9WMD/guW8uYpu7N7RmUOyucgsSBdlc0XKQkfJJBhpAVHiEM4zzxnF
         ZpDZ1jZTJpHhmdkx+O1ctJkHtCocLc6NDeFbxbQHHKLFEfo8vHhEUgjDCGFmRt9jI0zr
         35lw==
X-Gm-Message-State: AFqh2kpfTnqzQYh5HihggV0VDgGUk8fHM44pi62Gui4ZzWfRcPg21jwZ
        HoSMRhJ4T4aZx0hYNUKDFgAgfA==
X-Google-Smtp-Source: AMrXdXt6SFY3k0Tz2Mu2sU4dI541mSLI8B7oma1oHXYIgsKeHdRBGk1dXtI+HJR3IUfC7wpnAVnM0g==
X-Received: by 2002:a5d:5c12:0:b0:242:800:9a7f with SMTP id cc18-20020a5d5c12000000b0024208009a7fmr29458232wrb.65.1672764565521;
        Tue, 03 Jan 2023 08:49:25 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d438d000000b0029e1aa67fd2sm3009812wrq.115.2023.01.03.08.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 08:49:25 -0800 (PST)
Message-ID: <a85b6bf6-e00b-243a-4ca4-8339a1c81c48@linaro.org>
Date:   Tue, 3 Jan 2023 16:49:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
Content-Language: en-US
From:   Niyas Sait <niyas.sait@linaro.org>
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
 <24bf8b5d-d0ff-1d45-9c36-12bcc6fc3868@linaro.org>
In-Reply-To: <24bf8b5d-d0ff-1d45-9c36-12bcc6fc3868@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20/12/2022 10:53, Niyas Sait wrote:
 > Hi Andy,
 >
 > As discussed previously, I've put together a design for the pinctrl ACPI
 > support in a google doc [1]
 >
 > Could you please have a look ?
 >
 > [1]
 > 
https://docs.google.com/document/d/1bgLAOEGmhVnxSF_Bx6-blg1_ZNnv8BTQGYW6gixOvjY/edit?usp=sharing
 >

Hi Andy,

Did you get a chance to look at the design doc ?

I am not sure if I missed any of your comments.

Let me know if you have any feedback.

--
Niyas
