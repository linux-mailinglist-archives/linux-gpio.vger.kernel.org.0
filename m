Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89426B7FA1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 18:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjCMRi5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 13:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjCMRiz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 13:38:55 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D677C5FA49
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 10:38:51 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so4190225pjt.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google; t=1678729131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnH8IwHCKiZ0wbzHJKRtwvg6Gh7iU3Ri0hotumXQj/o=;
        b=Ds4ycfUydkXyJupGLOox8EmO6t80PDUOp4lHsq73jOpNiK/tHQ7XSB6e/DPrseJVj1
         cfdHKc3xul/BcFBLAs7wOdDo2kXldLOAImFyN1ZALIoQXFGr1UozY7NumDLrDB4GnBlU
         viMfV06CR+uFGu491lGB5nQTUNIlTNFYz8C1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678729131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnH8IwHCKiZ0wbzHJKRtwvg6Gh7iU3Ri0hotumXQj/o=;
        b=3DRggldCs+Alm3rs0PEAHcJBGnPbV03pAAcesTCpcDC6++x0werelRm6ocV1roansg
         OdGRD0lJAGkxAYKCP29WtBL4fAgLRvUA8+E7D9Y5VlJdBIgg9c2Lj57YdxIOx7/CqCxh
         7vF5K6gR3Tzml/0I5Sss5n2S2R3DJaMSZBT/fRTeXr9GZpyrjzsgNc3JTGFxYXe4pPjA
         GPOqP6d/q2IY+T8xWeE8N2gAw5EvQpqZOwsGy7VteJ/hC9vZodhb40ik6ipkipNPD+5q
         c76WN2HRUEXsZLE1cJCehxeB/uWDRI5Ui5Gqt/KpqGWXANHvIgIA/ENLs8oq4xhjRTyq
         asng==
X-Gm-Message-State: AO0yUKVNuucdfnVI+bz20cNIjD5zlEHmY+kAhcx4zZWOyFGnZKYuAj+5
        LnziGb2JblnDjSgWhUcjG8LqC9xkKRmOds9xdvs=
X-Google-Smtp-Source: AK7set/RJtHCKoyfgpLccQm9UFzLnxQ/XHDNq/hc8F1n9xBsEmRIlkZaL3pacubR3tUxssj7/qO02w==
X-Received: by 2002:a05:6a20:7fa2:b0:d4:ea20:2185 with SMTP id d34-20020a056a207fa200b000d4ea202185mr2167308pzj.6.1678729131150;
        Mon, 13 Mar 2023 10:38:51 -0700 (PDT)
Received: from [10.96.32.61] (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id g18-20020aa78752000000b0059442ec49a2sm2403pfo.146.2023.03.13.10.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 10:38:50 -0700 (PDT)
Message-ID: <ea4ab362-d831-b772-ac37-dfa2ecf1a95b@squareup.com>
Date:   Mon, 13 Mar 2023 10:38:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [libgpiod,v4 0/2] tools: fix compile issues when GNU extensions
 are not present
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230306184545.1316993-1-benl@squareup.com>
 <CAMRc=Mfa_iPc9d2o2wJoFSwDXEG1sHS2Ma9F_oW+wtnahUoXuw@mail.gmail.com>
Content-Language: en-US
From:   Benjamin Li <benl@squareup.com>
In-Reply-To: <CAMRc=Mfa_iPc9d2o2wJoFSwDXEG1sHS2Ma9F_oW+wtnahUoXuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/12/23 6:39 AM, Bartosz Golaszewski wrote:
> On Mon, Mar 6, 2023 at 7:46 PM Benjamin Li <benl@squareup.com> wrote:
>>
>> v4:
>> - Keep semantics consistent with before: help messages should return the full
>>   name, not the short name. (Bart)
>>
>> v3:
>> - Collapse --version print into a single line. (Andy)
>> - Handle program name fully independently rather than rely on any extensions
>>   at all. (Bart)
>> - Move Android.bp into contrib/ folder. (Bart)
>> - Add SPDX license tag and clean up Android.bp patch comments in the context
>>   of it possibly being accepted into the upstream tree.
>>
>> v2:
>> - Add missing Signed-off-by: tags.
>>
>> v1:
>> Fix issue when building against a C library without GNU extensions, such
>> as Android's Bionic libc.
>>
>> A commit with a sample Android.bp file that's working against Android 11 is
>> included for informational purposes, which I don't expect Bartosz to pull.
>>
>> Benjamin Li (2):
>>   tools: remove dependency on glibc program_invocation_[short_]name
>>   contrib: add sample Android.bp to build within an Android tree
>>
>>  contrib/Android.bp   | 136 +++++++++++++++++++++++++++++++++++++++++++
>>  tools/gpiodetect.c   |   5 +-
>>  tools/gpioget.c      |   5 +-
>>  tools/gpioinfo.c     |   5 +-
>>  tools/gpiomon.c      |   5 +-
>>  tools/gpionotify.c   |   5 +-
>>  tools/gpioset.c      |   5 +-
>>  tools/tools-common.c |  34 ++++++++---
>>  tools/tools-common.h |   4 +-
>>  9 files changed, 183 insertions(+), 21 deletions(-)
>>  create mode 100644 contrib/Android.bp
>>
>> --
>> 2.25.1
>>
> 
> Thanks, I applied both patches. For the second one: I extended it so
> that the android build file ends up in release tarballs generated by
> 'make dist'.
> 
> Bartosz

Nice, thank you Bart!

Ben
