Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B604C712239
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 10:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242545AbjEZIao (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 04:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242692AbjEZIah (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 04:30:37 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 941FB1AC
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 01:30:35 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bcb229adaso710237a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685089834; x=1687681834;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ewhYMlnlPhJssSvuZ396W23YA5FlTEZs4idLRJWQIUQ=;
        b=eTilbX86Hdjd+3wr0gbbL2yGow218tAgeSfnHyzndjrzXR6RohlcDR+2Ui+RCcwz9n
         wpsFxwkuOPv32gINoZ8dGxaCIcmqo8eovXBiSoy3HowxHeXLv8NKoVGX66Or0QMzMxL+
         irZg7VtHIFPlUUIaiHEgYu/7xFMk1yGtMo+snnEKSoNqIqPaC2EzvGiA8PWHM/qnXgdh
         hFub6ilbGNUMGLnbtaCQsRm8Vl1zhBRdG87UZZa4dgAg9UzZjVjjvO8S5LyIQ/LxhKVR
         2F5qkZ0Bnex4QkD19hQrKE7s8aFcCusxtyJTQTDEWidTpTdWv0yEyziHLqmKAE/PC2eA
         1wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685089834; x=1687681834;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ewhYMlnlPhJssSvuZ396W23YA5FlTEZs4idLRJWQIUQ=;
        b=es2q341q51ftlz2eDVh5MP/jaGjDRoMWjJvSZM5iQNU3611C0Xnq8IdjCYGXG8EPY9
         kT3337AyL7xMzp+WlYff//Uga49ikP0zUdDGdbCAwoYb1cBvrjnUtCwlxmI9FSQ30djW
         zXJcgsdCPD1MYVjcNJyyk6z1fG1zRXZCEo5saXXaGbfhHQ2dnv76PTvUk8k7sedUV0M8
         ITq6XkdzIU+JTZldF6pG3xucOfoBrTBxkh+NvuAVEBcPjMoLEWxlWzoUkd9OYEgj+3td
         6mhSJ9JZL1UlirfcBivJytNDxckj5yY3aeJRkYlBVSY80vhXAd8so+TLE67MUW4RKY2d
         fXBQ==
X-Gm-Message-State: AC+VfDy5v+USLDGkYzxthHiv3t8mYikhQJJXtTap5Xebg7ChC9/6kEBE
        dQaXCrbPc6rQOqm046glC6oxRQ==
X-Google-Smtp-Source: ACHHUZ5UDqi2XO4Y6hSXEqtFmrzQQykXJx5tev1xwuqr7Ful8bs7vMdXUTUz3rABV3Im5uXeP6S1YA==
X-Received: by 2002:a17:907:e91:b0:960:ddba:e5c3 with SMTP id ho17-20020a1709070e9100b00960ddbae5c3mr1440421ejc.32.1685089834053;
        Fri, 26 May 2023 01:30:34 -0700 (PDT)
Received: from [192.168.1.149] (i59F67C10.versanet.de. [89.246.124.16])
        by smtp.gmail.com with ESMTPSA id z26-20020a170906715a00b00959b3c30f2csm1854000ejj.222.2023.05.26.01.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 01:30:33 -0700 (PDT)
Message-ID: <1b9968c1-77f3-6525-af57-a6c7808adb59@linaro.org>
Date:   Fri, 26 May 2023 10:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of
 libgpiod-sys
From:   Erik Schilling <erik.schilling@linaro.org>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <20230524060341.khmsd2lw32u3jxsc@vireshk-i7>
 <CSUCSUR6CSH3.NHT0430XGAIO@fedora>
 <20230524081454.ztcywdhjgw6axvjw@vireshk-i7>
 <5f782ccd-ccff-67f8-22cf-7b9b1c7e2e3a@linaro.org>
Content-Language: en-US
In-Reply-To: <5f782ccd-ccff-67f8-22cf-7b9b1c7e2e3a@linaro.org>
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



>>> I am not exactly sure if I understood the above comment correctly. But
>>> if we want to eventually be able to consume gpiosim-sys via crates.io
>>> (or any packaging mechanism that relies on cargo package), then we will
>>> need to decouple the header and .so file referencing in a similar way.
>>> The easiest solution for me seems to be to just add a pkg-config file
>>> for gpiosim and use the same mechanism that I sketched for libgpiod-sys
>>> here.
>>
>> Yes we would like to get gpiosim via crates.io as well.
> 
> Would simply adding a pkg-config for the gpiosim C lib be desirable? 
> Then we can use the same mechanism. There is none existing at the 
> moment. I am not sure whether that is intentional or just not done yet.

@Bartosz: Viresh said on IRC that I should ask you about this :). Shall 
I just add a pkg-config for gpiosim? Or is that not desired for some reason?

- Erik
