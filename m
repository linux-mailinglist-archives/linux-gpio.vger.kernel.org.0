Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8A9468F884
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 21:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbjBHUBF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 15:01:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbjBHUBE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 15:01:04 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9911F37541
        for <linux-gpio@vger.kernel.org>; Wed,  8 Feb 2023 12:00:57 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id m14so17944032wrg.13
        for <linux-gpio@vger.kernel.org>; Wed, 08 Feb 2023 12:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZxYnrztJQ4eDEbU8A1T3W8ovc8PPmfsiHiDtNQUwlQ=;
        b=d3XyuezZb1iZPFkJhUMtGng7s/dZ0xorweUXRKY7x0ImWXN+iO7lvy7TAxd+eJGrFG
         KnRrJZT8y0dl5INmjVVbTDpG8CxVsHeeixRGqUSXGUvGKpT0iyWtKsurJlhndnB/vUfm
         ervowSR4S57Fvf25QvgEju5aJt+xb9+7gDSPTUxxSw8L67O8oxIe6hJMJESwJLgs9qMe
         BbNLjLz86zVl/yZeJDncivQCHz4qBExAeRKvT3FhPrdJSrk+B0d4mSWEwyOQCbNJW+zj
         n4PQ5IILi/LGAuU3ZPK3d0Qar66hC+N3Y0TFBUEAsGcLTIi+Z6odJ77yF+9w4bOhS+NG
         3W7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZxYnrztJQ4eDEbU8A1T3W8ovc8PPmfsiHiDtNQUwlQ=;
        b=JneRvb85T22+EZgqPu9DOwTx8HajzGWJJnSjYiyyphOc9uSRmfOzz5vKJBtVIcqZL3
         IvyIrbsUs0zR27rcpud6JahRbj9Lon4etYcUUbukwrASoYZH+nWc4VvJTjMNM6h3D16/
         aGUUjtvI8uJ2XKdmpd26/MKjSZg+D2VhzJ/UCeu6AoYwsSoZ1DVgp3XGp4ixJEmRLdh4
         rZd59D63p1RUlwpzBCfqI8Z+SAw6Ay8XVEh/G6CHLgHxsdPeRfaGwhbVIa3MZOCeuPEx
         vkMJolC4/qhzF/SZK1LNN/wdx6UeQy+E/J/Sh7u8AzJS5fDTM2Y4D5+iGrrLelxv5nGg
         Pmug==
X-Gm-Message-State: AO0yUKXY8baomkGEpdAsIH4BQVJGorx3Khp3C9oWud2xpfir+P59bID/
        7xM/3Ku+X5fpMwtTkpn98bk=
X-Google-Smtp-Source: AK7set+ja0i2SbQPDEP8EJ3Bx0SEeuVscvRi0U7mFf8phXwyXDwuPRLi/aVZ29MCBG5RqcTYKtQktg==
X-Received: by 2002:adf:ed0e:0:b0:2c3:e16a:aa33 with SMTP id a14-20020adfed0e000000b002c3e16aaa33mr7704910wro.36.1675886456006;
        Wed, 08 Feb 2023 12:00:56 -0800 (PST)
Received: from ?IPV6:2a02:a466:68ed:1:166b:d2af:2cd7:4492? (2a02-a466-68ed-1-166b-d2af-2cd7-4492.fixed6.kpn.net. [2a02:a466:68ed:1:166b:d2af:2cd7:4492])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600002ab00b002bfb5ebf8cfsm15174000wry.21.2023.02.08.12.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 12:00:54 -0800 (PST)
Message-ID: <14de29ca-e9b5-101c-351d-156b21f4a3df@gmail.com>
Date:   Wed, 8 Feb 2023 21:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [ANNOUNCE] libgpiod v2.0-rc1 released
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
References: <CAMRc=MdyS6CsMkyvRL+_Shr__QnYxXE_Di6DqRKvh+QB_A3Qgg@mail.gmail.com>
Content-Language: en-US
From:   Ferry Toth <fntoth@gmail.com>
In-Reply-To: <CAMRc=MdyS6CsMkyvRL+_Shr__QnYxXE_Di6DqRKvh+QB_A3Qgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Op 08-02-2023 om 16:08 schreef Bartosz Golaszewski:
> There have been no issues raised since the RFC so let's get it out.
> I'm tagging a release candidate that I will also try and make
> available in meta-openembedded with the hope that it will get some
> exposure and testing before we commit to a final v2.0 release.

That is very good news.

I'd like to test this on Intel Edison-Arduino.

I guess the recipe for meta-openembedded will a -rc as well? Where can I 
find it?

> The core C API as well as all the bindings and tools have been
> completely overhauled. There are too many changes to list them all
> here - please refer to NEWS and the docs as the library has been
> entirely rebuilt.
> 
> Thanks again to Kent, Viresh and Andy for the hard work on designing,
> writing and testing the project.
> 
> The release tarball[1] and git repo[2] are available on kernel.org
> 
> Bart
> 
> [1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
> [2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

