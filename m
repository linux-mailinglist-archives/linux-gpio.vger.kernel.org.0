Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9723062D9EF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 12:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbiKQLyI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 06:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234837AbiKQLyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 06:54:00 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CBBBE0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:53:58 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id z14so3429477wrn.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azewer6Lt6yCibzct1Z8n46Yt5pC3HQR+tV34H81/nU=;
        b=JmLxMhUhF8QIUM+G6KMePT6w5NhYUiddfi15H4/quMcdy6iEbEf1QouqioPZOwO9Nq
         xD8Sh51lI35w6OXskiHRsNl9ZoVC+9FtkYTSmM59Dc45VwZu04nzjanTSH7N+P+RCY8Z
         psIPS2JLCfCcQIr005yNcOsa2An+6GF5kBKDJgjjdgwcJSX5NkoqMROMj6oDmWm0Fxqd
         aubgj1ChDbvG+wIzgto1e5YZL4XeSdd5l1JjzKRkmaJu3t+yNdpH9wI/24TrtInpEk8E
         LReOmADM04BcV6Ro3U/m8lvxKvvKZabooFdrllqfZpwlrAN7iyG86bOs4fNhUrXJZRAp
         fBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azewer6Lt6yCibzct1Z8n46Yt5pC3HQR+tV34H81/nU=;
        b=7GrBxSnUfZ+8m5wiO0DZk0ao6fUpRNpBMhg3ivKmAwU4AiVxAgCIpmxTy+uaq221eq
         3U4ZOeotxIdZ3tpYIUkQvsw2tWiacHCpKhwb2m5UkXMGhJubePxF05LWc+lyv854bRNy
         jBD/UOVnrGcZdPu4VUQ45L5fpTGesqiM9ntSG3ZcmG+fhTXZ8nL/KKy8BJGhPUT1K21e
         5EbSgiTQpEiydeMrvfLzynb304IQtKToGGokjALytILmJWAXu4Be67B0sbkWAX91l8tL
         7TX3DaadUXGe4BjUQc+Sqz8Nx0yRn8sCiV2tIqNAPBP2Yn7wwksHBtp/wAgiY9nttSZe
         gHxQ==
X-Gm-Message-State: ANoB5plLAJynJpq//h2S+lPXXyAyuiuN1sV+6jfpADXW9SU3PesNctjs
        mVdgF5bOKCxoQ+T7l9B3JGN+5g==
X-Google-Smtp-Source: AA0mqf5QJhZ7CwjMSwzMHAyLIWWgOtnTM7h7m1RS+RFsa+NWWK4UwYnUUs+X3YzTObmHn9VeSn4d5g==
X-Received: by 2002:adf:f38a:0:b0:236:5270:7347 with SMTP id m10-20020adff38a000000b0023652707347mr1316042wro.35.1668686036597;
        Thu, 17 Nov 2022 03:53:56 -0800 (PST)
Received: from [172.16.30.75] ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x2-20020a1c7c02000000b003b4935f04a4sm1268940wmc.5.2022.11.17.03.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 03:53:56 -0800 (PST)
Message-ID: <209115e5-c448-6a8d-37a3-c1e1f15ed02b@linaro.org>
Date:   Thu, 17 Nov 2022 11:53:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC v2 2/3] pinconf-generic: clarify pull up and pull down
 config values
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <20221115175415.650690-3-niyas.sait@linaro.org>
 <CACRpkdarFa3GYprA98Q2zq5nepe_naY4mZJ0q+HVvz-MBqWEMw@mail.gmail.com>
 <Y3YO+F03Hgu7KVRU@smile.fi.intel.com> <Y3YPYT8HkEFF1hJw@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y3YPYT8HkEFF1hJw@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry for the newbie issues. Somehow I missed the space vs tab issue on 
that patch.

I will send a patch to fix the two issues.

--
Niyas


On 17/11/2022 10:39, Andy Shevchenko wrote:
> On Thu, Nov 17, 2022 at 12:37:44PM +0200, Andy Shevchenko wrote:
>> On Thu, Nov 17, 2022 at 10:30:37AM +0100, Linus Walleij wrote:
>>> On Tue, Nov 15, 2022 at 6:54 PM Niyas Sait <niyas.sait@linaro.org> wrote:
>>>
>>>> PIN_CONFIG_BIAS_PULL_DOWN and PIN_CONFIG_BIAS_PULL_UP values can
>>>> be custom or an SI unit such as ohms
>>>>
>>>> Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
>>>
>>> This patch is good as-is so I just applied it. No need to resend with
>>> the ACPI series.
>>
>> Is it? I think it's visible that it has TAB vs. space issue...
> 
> To be more clear, the "such as ohms" have been indented with spaces, while
> everything else with TABs. On top of that I would use proper capitalization
> for unit, i.e. Ohms. But the latter is minor.
> 
