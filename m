Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4696A4CA8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Feb 2023 22:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjB0VBE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Feb 2023 16:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjB0VBD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Feb 2023 16:01:03 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FCA28848
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 13:00:51 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id i3so8173246plg.6
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 13:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wF0FpuWSxH8lq7GemtcSD4B99mthNOtqev63m1aLdNE=;
        b=GyMzLWLOAGSfuZt1NpB73rMmAXZXRAF7uIMaK6pkettG9H8cmQMTHv5zb0UoXJQxdd
         Vk4POk5kRGZNHO1wL9d+aCk7LpAOCBMBXFntxBZaXFS/seG6CYLJUFxDDaP1hB2Vy3cW
         Taiapc0Qsw7PhKmWUk6V5VDEqNDWDlwQoVTPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wF0FpuWSxH8lq7GemtcSD4B99mthNOtqev63m1aLdNE=;
        b=yk0nPgqWdj6jGsRaOQV8PQEHcdQdXcMajHdrbnFfk53CwU56+9IzfD6OslpfiveKc/
         eBwxx38ttzVLLlNNabHY2OOt20TdTc3lj5d6SxlpIgDv4fvfEqo8ylXZl9GDc0+wsQ9T
         FdDW0hxGZLC+kQ/BcrG7M2Tlp5OXVp0gOYb7JMalM/7LVB7SVZY0gThKmoLvRerR4qrh
         lRAJ7UhY6EC912e1eOfooQ8xSFeNJ4m0pQYCkjL2YC3ZVAcrMcNo66u6ERy2CK0kUkxl
         ERsFDNDzxCnowIiQCFmHcZ/iUQ6fEZhkcs1EuYkZ/7Ki8BLhkJvZdljllY5irn66LfFW
         3DaA==
X-Gm-Message-State: AO0yUKXXfwAV8z5IZe/UHEXAAlXPnVLm5yjwsSfCODubkvwrn8FCHlyK
        SO0IP1HK/gNKj3SKuXS79FLq7w==
X-Google-Smtp-Source: AK7set/iDvRjyCF2bZ68J/WS85UQW+Ja6QqOKFViE71NuKvfBvlVaylH5ZCvQ+scZYW7UqY7lMZtuQ==
X-Received: by 2002:a17:90a:7e12:b0:237:aab0:a539 with SMTP id i18-20020a17090a7e1200b00237aab0a539mr494701pjl.41.1677531650690;
        Mon, 27 Feb 2023 13:00:50 -0800 (PST)
Received: from [10.96.32.61] (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id u5-20020a17090a518500b00229bc852468sm6651560pjh.0.2023.02.27.13.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 13:00:50 -0800 (PST)
Message-ID: <245095e8-1527-e56d-8e99-3cf21a9faace@squareup.com>
Date:   Mon, 27 Feb 2023 13:00:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [libgpiod,v2 1/2] tools: use getprogname() when available to
 remove dependency on glibc
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230225031235.3886280-1-benl@squareup.com>
 <20230225031235.3886280-2-benl@squareup.com>
 <CAMRc=MfTpSV7hmUmbY94JHmwx=aZNiBytCMacGpC6Gwf6qJ0_w@mail.gmail.com>
From:   Benjamin Li <benl@squareup.com>
In-Reply-To: <CAMRc=MfTpSV7hmUmbY94JHmwx=aZNiBytCMacGpC6Gwf6qJ0_w@mail.gmail.com>
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

On 2/25/23 4:12 AM, andy.shevchenko@gmail.com wrote:
>>  	printf("%s (libgpiod) v%s\n",
>> -	       program_invocation_short_name, gpiod_api_version());
>> +	       getprogname(), gpiod_api_version());
> 
> Now this can be a single line.
> 
>   	printf("%s (libgpiod) v%s\n", getprogname(), gpiod_api_version());
> 

Thanks, will collapse.

On 2/25/23 10:36 AM, Bartosz Golaszewski wrote:
> This is only relevant for gpio-tools so maybe instead of relying on
> either a GNU or BSD extension, let's just ditch both (and the checking
> infrastructure) and introduce our own local helpers:
> 
> void set_prog_name(const char *name);
> const char *get_prog_name(void);
> const char *get_prog_shortname(void);
> 
> And call set_prog_name(argv[0]) at the start of each program?
> Alternatively we can just use prctl() like libgpiosim does for tests
> but then we'd lose the potential info about the executable path.
> 
> I'm thinking this is better than relying on extensions as I've already
> had to stop using twalk_r() due to it being a GNU extension not
> provided by musl (not by bionic as I can see).
> 
> Bart

Sure, that sounds like a better solution. Will make the change.

Ben
