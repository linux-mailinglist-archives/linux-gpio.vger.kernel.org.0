Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0114A7123EB
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 11:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236860AbjEZJpL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 05:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjEZJpK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 05:45:10 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3629F3
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 02:45:08 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso251088a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685094307; x=1687686307;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSbFJ8E2JHrSjp8k+iWxFPTQ839aHv9oHZdO21Ym1sA=;
        b=gOgRj3/+OauQCHc9DX4XwY+5yHKxaeQ8hVNGinFOlpsC7hDynpqeFCv3jNW2eFME8a
         ZGMeYIHStL+8MXDxlrUiKCSCiB0L1XIZZs0ZEP/t1cGpKwinzSPbjJABzFt/CoDsAZw1
         9NJtj+0Fyxpe29UVRubyaE30SHaIlwsWWYp2AiuqU36k5lnhxv3DlPhMB3dFDmsZx87D
         5nqwiHFMdsKFRWiH5KaJt3aulnHfIjTdXQLCK2HJWotPON6hseL4Jkv3U+qKRrVXYLSd
         Qu5SAdJTVt8p0/mLG2V1vUMpnJE/Y1/zi60qNDIVEwQBbl4QMIxqfkKJQoZb0/js03Y6
         vqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685094307; x=1687686307;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSbFJ8E2JHrSjp8k+iWxFPTQ839aHv9oHZdO21Ym1sA=;
        b=Kg/HXok/Blg2NxLyOU6j2hq8ZmRfZdDW7XrbRtO2J0tWz/z2v5p0+d3KK/nohFeSme
         Cns8FetCQj5uzmjL6onq1IBjzdk6DEic2XBcHKhbWZ/WZl2saRxmBi7VyBo+3qmysYNZ
         ay4108zCzIwLFb3DhjMM8y1lumInP/kLElNyMXWPdUR1l9H0fFM7SHxpfgnprn888o0x
         HreW2Si0KjAhUdKTgKYODNKzr6cqgODbzP5It6WHmI8w3xYtaaudEwLFydmip2tM0DCt
         jpNmSsQ/sxNPNzOVRO0VCH7K2YTsyWnC2g5c0BHsIqOfWXfZeQtr2cHXf5xK5tG/6mjj
         E/Mw==
X-Gm-Message-State: AC+VfDwH75RS/hmW66VZlXEWULItTpbJu7oU5W2xHh/CTZ0lwJ0vO3xx
        2MSCP/qe3yW0kgkWSsNFOuyQ4w==
X-Google-Smtp-Source: ACHHUZ7qFTjoPed6w1+mo3CEDy4KTgwEVhyPQtlcl25YZuai247+/11dpCYltQGIqRZOEqIVshtodQ==
X-Received: by 2002:a05:6402:708:b0:4fe:ddf:8d8c with SMTP id w8-20020a056402070800b004fe0ddf8d8cmr920931edx.13.1685094307499;
        Fri, 26 May 2023 02:45:07 -0700 (PDT)
Received: from [192.168.1.149] (i59F67C10.versanet.de. [89.246.124.16])
        by smtp.gmail.com with ESMTPSA id d8-20020a50fb08000000b00502689a06b2sm1364709edq.91.2023.05.26.02.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 02:45:07 -0700 (PDT)
Message-ID: <251ba18a-1b78-1530-dc7b-61e305bce2ec@linaro.org>
Date:   Fri, 26 May 2023 11:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of
 libgpiod-sys
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <CAMRc=Mfmo0vVpa8xgcf4E7190AMjiDAz_7SOP2-1ghk0FPxijw@mail.gmail.com>
From:   Erik Schilling <erik.schilling@linaro.org>
In-Reply-To: <CAMRc=Mfmo0vVpa8xgcf4E7190AMjiDAz_7SOP2-1ghk0FPxijw@mail.gmail.com>
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

On 5/24/23 11:17, Bartosz Golaszewski wrote:
> I applied the first two patches, I'll wait for the respon of 3/3.

Thanks!
