Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170407122D3
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 10:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242297AbjEZI7e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 04:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242378AbjEZI7c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 04:59:32 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3859C
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 01:59:31 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-96fe88cd2fcso85358366b.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685091570; x=1687683570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRcYgU08lnE5EqJ4v+qCESdY6+siIsFyl/gyu3+HZFQ=;
        b=R0zwSp7w3kDlCGYzdati0D8YQmny4EYz5QfitVIzal/jBrB3Kh1dk8DCzd+xJiXY7J
         Tv085jpr0YQvFPbsw9X3SZ2Q4eAdnXe/sCLBxCUuHjjgzfllttTr4Mv02ndwNcUA0K8l
         5IFjdOHZYn8pESI7lRN13nGIW/eefEq2URLGrCS9nqluTO9lluzU2FL0/Vw+nNYM7oB3
         ykxr5E3eBMTLCelhX1ruuIaejDz5KQJ60VniA/SnQD1zUkLkhJ5OTaUTpdlm+aHyvMoI
         uL0CPB3eifsILF1mpYjGFnQvAzD7LkyBzTGnNaJQZDaPjkHYIPMBsoEKcHwVmOTDda9X
         y3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685091570; x=1687683570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRcYgU08lnE5EqJ4v+qCESdY6+siIsFyl/gyu3+HZFQ=;
        b=O342lPu5y0TwvKMXv1TQGmHOS8XrCFcItnRfZQLpzu/p/HADWmcWO742sFOjougdHx
         MDDkAX6ByCUhmwSjnTrMBauj1CnfOTyTmczNjYolHA+PP5X8P/6QAp70MSlcwvLRPM5f
         oQk94DUGnDRIojHdJV5yR8tW3iN6GLfjSjGQzcZ+TY9FuwZzhJWNVGKP/XG7dxHOM86B
         Gg3DqWl1fUMps8aH9BkmZRiTBsFftfioBbjdEXRuBgXXi+dISEgXNFuvnTdWUmLbj/W3
         GliF6FWbv6SJvjANvlyspZCksgiXFP3EZC83FJbo9by1nV1oKCGn0Y5dpIf88r204b7p
         guvw==
X-Gm-Message-State: AC+VfDyP0QSq5TXeEmN3JW8PCIq368fj3YGuTGuRSDSVWOGdeJeUSh+/
        3F0llHr7TKsag61/KlCVFepjAA==
X-Google-Smtp-Source: ACHHUZ493QeUFpa+5cSqkI1MipjAp1rd81oE3C/1GZEA40epdSVcNFrtsUFqUdaY6+OGQ8SBGIB6pw==
X-Received: by 2002:a17:906:6a13:b0:96a:6723:da48 with SMTP id qw19-20020a1709066a1300b0096a6723da48mr1287554ejc.75.1685091569897;
        Fri, 26 May 2023 01:59:29 -0700 (PDT)
Received: from [192.168.1.149] (i59F67C10.versanet.de. [89.246.124.16])
        by smtp.gmail.com with ESMTPSA id t14-20020a170906948e00b0096f8d8bd046sm1872678ejx.187.2023.05.26.01.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 01:59:29 -0700 (PDT)
Message-ID: <c561cadf-50bb-a42b-5454-610179bdb1ee@linaro.org>
Date:   Fri, 26 May 2023 10:59:28 +0200
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
 <5f782ccd-ccff-67f8-22cf-7b9b1c7e2e3a@linaro.org>
 <1b9968c1-77f3-6525-af57-a6c7808adb59@linaro.org>
 <CACMJSevb+-eCe+PPaY-=bXx=5t7+sg8BT+9ZYO=t=OzC3hmwHQ@mail.gmail.com>
From:   Erik Schilling <erik.schilling@linaro.org>
In-Reply-To: <CACMJSevb+-eCe+PPaY-=bXx=5t7+sg8BT+9ZYO=t=OzC3hmwHQ@mail.gmail.com>
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



On 5/26/23 10:36, Bartosz Golaszewski wrote:
> On Fri, 26 May 2023 at 10:30, Erik Schilling <erik.schilling@linaro.org> wrote:
>>
>>
>>
>>>>> I am not exactly sure if I understood the above comment correctly. But
>>>>> if we want to eventually be able to consume gpiosim-sys via crates.io
>>>>> (or any packaging mechanism that relies on cargo package), then we will
>>>>> need to decouple the header and .so file referencing in a similar way.
>>>>> The easiest solution for me seems to be to just add a pkg-config file
>>>>> for gpiosim and use the same mechanism that I sketched for libgpiod-sys
>>>>> here.
>>>>
>>>> Yes we would like to get gpiosim via crates.io as well.
>>>
>>> Would simply adding a pkg-config for the gpiosim C lib be desirable?
>>> Then we can use the same mechanism. There is none existing at the
>>> moment. I am not sure whether that is intentional or just not done yet.
>>
>> @Bartosz: Viresh said on IRC that I should ask you about this :). Shall
>> I just add a pkg-config for gpiosim? Or is that not desired for some reason?
> 
> libgpiosim was not meant to be installed for development, that's why
> there's no pkg-config for it. We don't install the header and only
> install the shared object if tests are enabled but with the
> expectation that the tests were built in-tree.

Ah. Did not catch that the header is not installed.

> I also don't quite get why we'd want to get gpiosim via crates.io - I
> would prefer to use the one in the tree. Or am I not understanding
> something here right?

I am also only seeing the libgpiod package using it as dev-dependency. 
If that is the only consumer and we do not want to expose it to 
out-of-tree things then that should be fine and we can keep building 
that one against the "in-tree" artifacts for it.

@Viresh: Could you comment on the use-case that you had in mind with 
gpiosim being on crates.io? I am not seeing any good options to package 
it if it is only intended as an testing tool for in-tree things.

- Erik
