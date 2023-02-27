Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E92C46A4C94
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Feb 2023 21:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjB0U6M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Feb 2023 15:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjB0U6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Feb 2023 15:58:11 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD29B778
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 12:58:10 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id n6so6778490plf.5
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 12:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHnkFadmmXcTvon1WbBi9RFGfuCyHQUBNz6yO3FV120=;
        b=W58KSJhfttkntvO0BTSogQmDknJmS61eOE/br20anukb/h0gI93Erx/TMZEkaGhHT1
         xEhFi3CUwkI22i7rOll9spSsYssnpi2fuMEVGSxxasrDkhu7n5GynlspLMhM2PMDVP/l
         kblF8nNLYgFCiIvVPWQL/r76IJPJZZkGCnVbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHnkFadmmXcTvon1WbBi9RFGfuCyHQUBNz6yO3FV120=;
        b=0xQ28rQeEOOw9mPUfVCrptw2T951+q85yODOGKkidnvyBSCcWXEjoEBWNw/JGPFkyg
         UY4P+HylS8GDn4tYcvR+6k92tF/OPQ9kEGfo0tH9VdFebJhTdYZIpUU2/1q9WB4sVxWe
         pnM2XThuNvUG2MhLDLkiT7pW7KEG/jnrgyjc7nBSQKcJUFEQTLrHzCfB//Bq19o9lKTE
         lVdsZj7ZNmI+ya1gDNmfb/1xXxCj7C0K5BdlCOcxLAymcGqy/Ig+5wqK+8NWnrJMa6oa
         PLopbDDB/2kkO2wHUSuqFALFgz2UzwP9GUcWgGYz/7PepmljWw+rE285KFvarzyV3F+w
         5OTQ==
X-Gm-Message-State: AO0yUKV8lah7a2yTzeCJ8n21xAPvwWKE1jMteFcsoau2A4PxeXT6htqM
        anX+mjgd2fapea2NpB7tVxv27OXw1fgN2EBR
X-Google-Smtp-Source: AK7set9xv09faZAB1seJR9AsQvw1njqlIrkAHduWLSU5z2jI13Csn3Q+avW/8Gu3CYjFVqUQZDlzrw==
X-Received: by 2002:a17:902:c941:b0:196:5787:d73a with SMTP id i1-20020a170902c94100b001965787d73amr232006pla.53.1677531489668;
        Mon, 27 Feb 2023 12:58:09 -0800 (PST)
Received: from [10.96.32.61] (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id jc22-20020a17090325d600b00198ea7e4bafsm5061081plb.92.2023.02.27.12.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 12:58:09 -0800 (PST)
Message-ID: <2efdd9ec-ee5e-04ff-3539-01232554f3f4@squareup.com>
Date:   Mon, 27 Feb 2023 12:58:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [libgpiod,v2 2/2] build: add Android.bp to build within Android
 tree
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230225031235.3886280-1-benl@squareup.com>
 <20230225031235.3886280-3-benl@squareup.com>
 <CAMRc=Mc=14fp=5nqux2M0OYi1Z=qJF8=G5t=J1oC_xNEOvSTHQ@mail.gmail.com>
From:   Benjamin Li <benl@squareup.com>
In-Reply-To: <CAMRc=Mc=14fp=5nqux2M0OYi1Z=qJF8=G5t=J1oC_xNEOvSTHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/25/23 10:38 AM, Bartosz Golaszewski wrote:
> If I take it into the main tree, I would like to be at least able to
> check that it builds correctly. Could you post some instructions on
> how to build the android package in the least number of steps? Will I
> need to jump through all the regular hoops involved in building
> android images?
> 
> Bart

Ah, I mentioned in the cover letter that this was informational and I
didn't expect you to take it. Unfortunately I think you would need to
jump through all the regular hoops.

Roughly, the steps would be:
- Checkout AOSP: https://source.android.com/docs/setup/download/downloading
- Checkout libgpiod under external/
- Build AOSP: https://source.android.com/docs/setup/build/building

Of course I would appreciate if you went out of your way to take this,
but otherwise hopefully this public mailing list patch helps other
Android device manufacturers/tinkerers for now.

Ben
