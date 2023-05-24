Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955C970F499
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 12:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjEXKyD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 06:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjEXKyC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 06:54:02 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5726A3
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 03:54:00 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96f53c06babso134491766b.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 03:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684925639; x=1687517639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ni1DkDWeHlpU28q5c6xxt9N+bLUU3m7Eqmq2xMg2Spk=;
        b=M8Hha3dQIRsQAFr8zXYiGxrA+80Yz38YMr0/R5l6u6lTL+pSJHsikVOR7G5Xxo3CcN
         BYD0AZwCXj960NMgVGGh7uxa7MfMxWm8vIpzyyriyPFrGTDgfxwlHPPLvVQ3XMPUaIhX
         meqycCm26UCy6uQjGnUXpAUQfy9pKI29KkQ/aJlzmmWIg1tMQedRBR+mCGpHSHmoQHp8
         izfcguUdHheKXj6c+3EXHv14qJfspfO6QZIIpml7T0zxLcUnPvKR++fl7wNCA4wXm2BC
         fDjMdm9xFeunmWjV5T4dtygyEvIykfAOCjQWGaLocLZhmum8gXOLEOwpRjwg77mHqs8S
         Iu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684925639; x=1687517639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ni1DkDWeHlpU28q5c6xxt9N+bLUU3m7Eqmq2xMg2Spk=;
        b=JHRb/FmeZD+O/O6JeznxhHjHG+A5zHMQ8S8DCWUAAVia7Sls3iKNDxT7FQtJ9RBwJn
         4wwFBEBtlBaB3h4pyNMRjt3aLC9/CIrh7V7RebrQ+mm3Af7cii+G8yxRcLQZXhyDKKgz
         g2Rlh91JwNDMZsznzF5p03qnVhQQ5qPxQhPfN+LXQbpD1r1ecutecRRvQcyAZgWTpvcU
         jHXA1hUjGh+F/zXF+xRPGuw/7QqVwtvuRUnFFZJaOk0fZIqlmns6ArfaQm3/jbMVzbFM
         EHJ/vB1dEjfL23+ocWyvWAdiTo781H1IBIRoTEIKOWQOeRsjq+jYnXckiE9VwctdAZXW
         fN2A==
X-Gm-Message-State: AC+VfDxumvJmfPwpTwsXqhuDW7MhAWYLoLVvnPEyGaLo4PQw1wx424sI
        NmGHVx7A5h1TBgmj9b+XP0AYoUa2MpOrXtWJU/j+wA==
X-Google-Smtp-Source: ACHHUZ7X0k5J0wJe9lpHVBs+NWUBwecFXgaUUHnVwmuDLSUM3c3KUUVyR7JjJCnqCZ/H2VJ2S+2hfA==
X-Received: by 2002:a17:906:4fd2:b0:94e:8431:4767 with SMTP id i18-20020a1709064fd200b0094e84314767mr16935227ejw.38.1684925639327;
        Wed, 24 May 2023 03:53:59 -0700 (PDT)
Received: from [192.168.1.149] (i5C7404E8.versanet.de. [92.116.4.232])
        by smtp.gmail.com with ESMTPSA id rv25-20020a17090710d900b00965f6ad266bsm5613104ejb.119.2023.05.24.03.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 03:53:59 -0700 (PDT)
Message-ID: <5f782ccd-ccff-67f8-22cf-7b9b1c7e2e3a@linaro.org>
Date:   Wed, 24 May 2023 12:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of
 libgpiod-sys
Content-Language: en-US
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <20230524060341.khmsd2lw32u3jxsc@vireshk-i7>
 <CSUCSUR6CSH3.NHT0430XGAIO@fedora>
 <20230524081454.ztcywdhjgw6axvjw@vireshk-i7>
From:   Erik Schilling <erik.schilling@linaro.org>
In-Reply-To: <20230524081454.ztcywdhjgw6axvjw@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 5/24/23 10:14, Viresh Kumar wrote:
> On 24-05-23, 10:09, Erik Schilling wrote:
>> I am not exactly sure if I understood the above comment correctly. But
>> if we want to eventually be able to consume gpiosim-sys via crates.io
>> (or any packaging mechanism that relies on cargo package), then we will
>> need to decouple the header and .so file referencing in a similar way.
>> The easiest solution for me seems to be to just add a pkg-config file
>> for gpiosim and use the same mechanism that I sketched for libgpiod-sys
>> here.
> 
> Yes we would like to get gpiosim via crates.io as well.

Would simply adding a pkg-config for the gpiosim C lib be desirable? 
Then we can use the same mechanism. There is none existing at the 
moment. I am not sure whether that is intentional or just not done yet.

- Erik
