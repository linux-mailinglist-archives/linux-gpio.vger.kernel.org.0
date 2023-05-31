Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3201B7176B6
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 08:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjEaGR0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 02:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjEaGRZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 02:17:25 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7369810F
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 23:17:24 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-514859f3ffbso7137829a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 23:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685513843; x=1688105843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AMISh2RAYJDYb8fFKwlyiL9iNYV1MI9zyzZGEIT5KCI=;
        b=OkC+/bHYQ2FgxnddM4u7P8t4oEsJZTolO42YrlBcIIzoUEeBk5N4/oaUH7qBp/3QPW
         PVtWeJkslhXwQUUvCMcIpSxKFKiGXAlJDMSxq/h7IHes9s3B/2a9lhwBJAWxw0aYHW+s
         JV4hdh8EgyYqA3oCSEG8EnwnDAYOGMOZ/TLQNBggt8lB1Slipmd/lBzyF1hogJ47JJjr
         XuDUW/9h1i1TkdDXwArQVDvrsALeg1YKVkvPPKUYMs8E78abQEYr6lK0RL9/nJ4FBa5M
         8jpEM5NkDtpDnvKPa4DMV0noonl+yP0a1a/1ZWx2YWtPZwmQ+kI8gIP6yZL6f9Gg8x8n
         PXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685513843; x=1688105843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AMISh2RAYJDYb8fFKwlyiL9iNYV1MI9zyzZGEIT5KCI=;
        b=ikSnf7WnCKms4iEz2qnliLXFZdJU8j/TayTOvzCPG7QaA2oL5PXZAz1Y+jdMYv9fJb
         eifuEqYM4mZC0Py67RWfhwgjMwS9oaf/sY4EpuEPgEVqkRCfoFVkaXxDDGTfrl24kL6n
         kYZOmgoixkNBnA1VLui1UKRbG32d0vzo+FuWeR+y1iS9qtusUEpSOcnd+WW9F3+MglZB
         AQ5XiYyBPjiySvcv8QZxddlgk69WJa0Rw9Uo/6jCCtxWRP8zySIxkximo69rsIGaWgjR
         RwtgO9CZ6exiTC2pQFdwssEirgRNvmgeeROV/eWjvxVHU/7DyK4DVFjIqpUL+pKkJtEg
         wmIg==
X-Gm-Message-State: AC+VfDxutyTUfhgFnwRiDXIKRnbXlTdIx/ZqovO/Fyt3RVxeX+TsPDJH
        AO9XI/Y/A8VprI5Y/xCzBTBq5g==
X-Google-Smtp-Source: ACHHUZ612vesONPsbTapw6GJrGzstK/SsbCMyJKj48qQuVqKqiybQfRZfSgiIi4okbjwnx1rMF5VQQ==
X-Received: by 2002:a17:907:784:b0:971:eb29:a082 with SMTP id xd4-20020a170907078400b00971eb29a082mr4225480ejb.49.1685513842935;
        Tue, 30 May 2023 23:17:22 -0700 (PDT)
Received: from [192.168.1.149] (i5C741499.versanet.de. [92.116.20.153])
        by smtp.gmail.com with ESMTPSA id b8-20020a1709064d4800b00965f31ff894sm8328055ejv.137.2023.05.30.23.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 23:17:22 -0700 (PDT)
Message-ID: <45485257-44cc-fd90-0042-d5f65d0bb9a1@linaro.org>
Date:   Wed, 31 May 2023 08:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH libgpiod v2 2/2] bindings: rust: build against pkg-config
 info
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org>
 <20230522-crates-io-v2-2-d8de75e7f584@linaro.org>
 <CAMRc=McTnKDxxT-qii7VtDQMbd2aCdk8oM=9iK4aXC=udiymuQ@mail.gmail.com>
 <CAAjaMXbE58V-LCKvhOJkJkyVzgDEws3D5Wnea5ikeccMZNRCSQ@mail.gmail.com>
 <CAMRc=Md4Kko03g81emupFhpQL9A=mNTumJmkmMpeOvacMB-3-w@mail.gmail.com>
Content-Language: en-US
From:   Erik Schilling <erik.schilling@linaro.org>
In-Reply-To: <CAMRc=Md4Kko03g81emupFhpQL9A=mNTumJmkmMpeOvacMB-3-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/30/23 21:04, Bartosz Golaszewski wrote:
> Ah, got it. Ok, now applied.

Thanks for merging! I will start a separate thread on how to get this 
onto crates.io :).
