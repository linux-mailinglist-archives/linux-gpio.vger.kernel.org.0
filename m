Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292BE6A4CEC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Feb 2023 22:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjB0VPO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Feb 2023 16:15:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbjB0VPL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Feb 2023 16:15:11 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8E5265AB
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 13:15:10 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id p6so7366843plf.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 13:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zK0MN8xR64kU0W0Ybe/VvCyL7uZAnFD9dGD26iLkVo=;
        b=QsrYbFa6RkDAZcYPV6pcT38JOYeEiPz+ziOxquFesQBBDr25f3HALfRyGnu8u+1eK+
         nZiAqRYLm/w2qBWKxMZN1EiTdy9V9UVMBpe1/g/6AuuSoss3KB8GkCWN5P93S9uxUbOd
         JFa2BYi4CCzvHHj1NR/Z/5TFUwzdAlVN9rr0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zK0MN8xR64kU0W0Ybe/VvCyL7uZAnFD9dGD26iLkVo=;
        b=PzZvo0JIgeidnl8AZfhPCYGtQ+u95rozpwvHGl4Il//TqaWeOmyRrmppNsp9vmzr4U
         ro3p1i0B4P83C2dKzxpAyJHG5IRTtSVuSgaofZvd8SwF5UBYIiDNcGoiVBPYEom6Iw5i
         KJv3/pCb6/XyKfX3raAi41Gy7xdii8N+eYCuZQuxsFjAcVji++bd7Q8TT84opd71Elpm
         o8bdQwVg6FmcQTOZXvg3hMru+67+QoBGmLKi112MqOYbvG1rxU+m5UiLr2qHxdhQzl3m
         gaw8ZxMaF/lQWMvoo7n/qY1oxCt5wxoPiStBwAIXeBgcR+VzxzxHc+yMY2rR7L/E2WGe
         F2qg==
X-Gm-Message-State: AO0yUKUmWxPGYvqcPwLjRjIVeYkjA6ylUmZ+TNHi+WBC9Ry/2ZV6ekUI
        N8/AyqVe0RyHmE/mTYenLpCPLg==
X-Google-Smtp-Source: AK7set+RKOLviG/PHo9nKBIlru++sjEiNdO+U9O0E9ngeoZL6vsWBtunsUnoBwgkvl6gDxVrQTBdXg==
X-Received: by 2002:a17:90a:1950:b0:239:cb9b:6886 with SMTP id 16-20020a17090a195000b00239cb9b6886mr588394pjh.20.1677532509902;
        Mon, 27 Feb 2023 13:15:09 -0800 (PST)
Received: from [10.96.32.61] (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id h7-20020a17090a9c0700b002348d711ebbsm4823654pjp.16.2023.02.27.13.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 13:15:09 -0800 (PST)
Message-ID: <03f61e27-3d0a-cd17-d75a-2b919c2495a7@squareup.com>
Date:   Mon, 27 Feb 2023 13:15:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [libgpiod,v1.6.x,0/3] build: fix compile issues against non-glibc
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
References: <20230225030813.3885661-1-benl@squareup.com>
 <CAMRc=McAAT7A9-XM4QdRtr9mFbDNM8bpDNJXUrxxxg6QppmfHw@mail.gmail.com>
 <2e7df47a-f9fc-01a1-2b6b-c1bfb5b153ca@squareup.com>
 <CAMRc=Md7Uwy9Qv4oxsjFiu1un_2mxquBR+Nn4xpkwfOiSadESA@mail.gmail.com>
Content-Language: en-US
From:   Benjamin Li <benl@squareup.com>
In-Reply-To: <CAMRc=Md7Uwy9Qv4oxsjFiu1un_2mxquBR+Nn4xpkwfOiSadESA@mail.gmail.com>
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

On 2/27/23 1:01 PM, Bartosz Golaszewski wrote:
> Ah, right. Android again. :)
> 
> Does the android build file need to live in the top source directory?
> Can it go into a separate contrib/ directory where this kind of less
> maintained stuff could go?

Yeah, that should work as far as I understand. I'll test it out and
re-send the Android build file patch if this works out.

> Sounds good I will add it. Unfortunately it's impossible to know the
> kernel version at build-time so configure checks are useless. We also
> carry our own copy of the kernel uAPI headers for other reasons so
> checking the target's headers won't fly either.

Thanks!

Ben

> 
> Bart
