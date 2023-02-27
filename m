Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD196A4C8F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Feb 2023 21:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjB0U4o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Feb 2023 15:56:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjB0U4n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Feb 2023 15:56:43 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9BA26CF4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 12:56:38 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso3483207pjb.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 12:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kD1wqoWqTD3TNLEL4mA1i/Av/wBUTqmBZkrSiiEBpr0=;
        b=Z2SkE2teTcNONnYDsM83B82HNsRe48tf2a2nlR6agQ1U4bq529bMskfcvPMwaXFZgB
         ALZ17b89bKmnvnmXKdG4WGc5S9dOv5Uup0/lJ8Eol7ZAvo6tMeoCNwoOTIzOyRWltNce
         DKc2QX4Zt1rPc1OVka34fXkORuJb12YI7CERU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kD1wqoWqTD3TNLEL4mA1i/Av/wBUTqmBZkrSiiEBpr0=;
        b=6HoSUbgto4zXWA7Rexalk9/FE63bFLj23CjLpfMyzIloHxNzT8Cl80WUeFv3gBtGo5
         Efn87wHOzp5FuheHmZ0HEsBVtkSyHeAvIDthSVLEYVBZJRV0DApd60aNNruPULvMo4vA
         7xT835gR7we4/CzCtbZcJcxn+doywE3LZGF3tRdCI0pZUt9IUnrJdFqKnDgFbxxxVr1V
         hN3eNdAcQHMSi5DxyOfkbWoQ758VKsHryF38cIv+NePOiyphb3p3SN3Ue2rCpxJ0gWzG
         E3x2myRgwe9mPmTt4lV5+ysKmCw1FKaPiGl1V5HEhOKfx1/a/N8jxCQa9Jsi7/pL5d2T
         AE0w==
X-Gm-Message-State: AO0yUKUtLoOfUnvzC2ARcyj7cu3kLAV52xtFlSibZPiTZE7qcoRyYJa4
        ElZunmaVivtu1qRiomvzp8wr6h9ojIiCM1PQ
X-Google-Smtp-Source: AK7set+oE3ITjL7ZeJodyu6r3YF1AfwU0Y2cuVlkJqEm9Za/d5JJSXb9m+Rvwo1pfhC7ZSbMuCdQBQ==
X-Received: by 2002:a17:902:d4c4:b0:19c:d4c0:ce78 with SMTP id o4-20020a170902d4c400b0019cd4c0ce78mr10860864plg.29.1677531397458;
        Mon, 27 Feb 2023 12:56:37 -0800 (PST)
Received: from [10.96.32.61] (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id ij15-20020a170902ab4f00b00194d14d8e54sm4981286plb.96.2023.02.27.12.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 12:56:37 -0800 (PST)
Message-ID: <2e7df47a-f9fc-01a1-2b6b-c1bfb5b153ca@squareup.com>
Date:   Mon, 27 Feb 2023 12:56:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [libgpiod,v1.6.x,0/3] build: fix compile issues against non-glibc
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>
References: <20230225030813.3885661-1-benl@squareup.com>
 <CAMRc=McAAT7A9-XM4QdRtr9mFbDNM8bpDNJXUrxxxg6QppmfHw@mail.gmail.com>
From:   Benjamin Li <benl@squareup.com>
Cc:     linux-gpio@vger.kernel.org
In-Reply-To: <CAMRc=McAAT7A9-XM4QdRtr9mFbDNM8bpDNJXUrxxxg6QppmfHw@mail.gmail.com>
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

On 2/25/23 6:10 AM, Bartosz Golaszewski wrote:
> I applied patch 2/3 as it's a fix. For the rest of them - my goal for
> the v1.6.x series is to not support it anymore, than is absolutely
> necessary - that means no new features and android build looks like
> one to me. Any chance you can carry this locally?

Sure, we don't mind. But I'd like to gently remind that a lot of device
manufacturers like us have platforms that are unfortunately stuck on
older kernel versions that don't have the v2 IOCTLs.

Are there plans to introduce backwards compatibility to libgpiod v2
to support pre-5.10 kernels without v2 IOCTLs? I assume no based on
your talk from July since there's a major data model re-architecture.

Anyways, as an aside it would be nice to note in the README about the
5.10-or-later requirement for libgpiod v2 (apologies if it's mentioned
and I missed it).

I didn't learn about the compatibility gap until I tested libgpiod v2
tools on-device and found that they failed without a sufficiently new
kernel. Bummer as I was looking forward to being able to reference
GPIOs by just the labels in the CLI!

> 
> For v2.x I'm open to adding it but have a couple comments, see the
> relevant email threads.

Thanks, will respond there.

Ben

> 
> Bart
