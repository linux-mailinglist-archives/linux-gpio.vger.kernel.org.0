Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD4966FDFA2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 May 2023 16:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237336AbjEJOHB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 May 2023 10:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237232AbjEJOG7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 10:06:59 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6112BDDA1
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 07:06:26 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50bc37e1525so13846460a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683727581; x=1686319581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARBQUsaVQponMA5mnWdXy/zQ7OiCE9Ro+edRw3MjYqs=;
        b=u6Qu+20hbBbQYyeSG9XMkauzHXzGpCJ7O4gX3g2BYukjU3CP9Edeu3z3/wpPAG+aSr
         ug8QpC15kWF04CYERv3/WL5c1lSvhRILYk2Y1JEmGQ/Dd2a/j3GbWh8mm9ZD0Q/j+PR2
         JLvgpW3v4mYpZummO79cBw/NlhOPCh81NNF/KJJRDvuXNsJvxl+hARwFE/Y63pwHY7gV
         CIAukCJeRQbEdVpc5f9SrU91telOZbc2UlWhNrtCh6Orne8f3B5qvQq4fFzCWEqTIZ4q
         +QkjkBKbwH8MLExki8uSTLDOILf/GfHs1RnBe2v0tHdioyojO8O8yKEtGM3dGNoNf4Ag
         GAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683727581; x=1686319581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARBQUsaVQponMA5mnWdXy/zQ7OiCE9Ro+edRw3MjYqs=;
        b=dWdiafzLLXk/ZFZ9rQg9ewy8JpgkTFERM3kC0u4TcHxnnio1LMTPmkxjIceCTEo4J5
         HTD2rltT6mqvOs1R5Jt8DaKJBM4a51lMpsxTN4383bRvoghLJ2+kHvg4nrvc3bWA4RfJ
         6sXQfIusYTnDgRZC+JRTJvXPPw2NXtcOU6ipXPM5/2016Az3oxFrpoYWKhMFzWHFZiJw
         PEEOk4p5ZI13J4YoFgCiO8F/75UJZneBUT+6Gbvjx9nu7+0gVID/lnkOepymfWglQ4Bq
         TPb62s66b2Xi2E63ukTTJ+awLV5MKAijYwEeKMZn5c5tBTJrvsmV8YOYjFMH8YPKNENs
         BGOg==
X-Gm-Message-State: AC+VfDzxHYAOO9DHOBpIxGMjkHjtphucuEPylMJ3MdCa5wmlF/Evpeml
        8iqTbfh0Wj2uPEsQ5Rq+6vsNBq4O2Ue3knlOvMo=
X-Google-Smtp-Source: ACHHUZ5ojUiRYeqPo+ilqYZrRAEcLsRSAiliDxvXI8npNXnU/onMW9LAHs2l1ORWNz9bcV3sezT6cA==
X-Received: by 2002:a05:6402:181:b0:4fb:953d:c3d0 with SMTP id r1-20020a056402018100b004fb953dc3d0mr14166101edv.20.1683727580240;
        Wed, 10 May 2023 07:06:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id n8-20020a056402514800b0050d8aac0a1esm1935347edd.19.2023.05.10.07.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:06:14 -0700 (PDT)
Message-ID: <9ed645c0-bae0-eb73-ab96-72fd69f9b463@linaro.org>
Date:   Wed, 10 May 2023 16:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 0/4] Add pinctrl support for SDX75
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, richardcochran@gmail.com,
        manivannan.sadhasivam@linaro.org,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <1683718725-14869-1-git-send-email-quic_rohiagar@quicinc.com>
 <c0c3db1d-e83c-3610-ed61-db84cd88b569@quicinc.com>
 <CAHp75Ved53idRgpCDb2c=Bq9HXaE+sOWpY256rSRz-6bfRYnqA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAHp75Ved53idRgpCDb2c=Bq9HXaE+sOWpY256rSRz-6bfRYnqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/05/2023 16:02, Andy Shevchenko wrote:
> On Wed, May 10, 2023 at 3:16 PM Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>> On 5/10/2023 5:08 PM, Rohit Agarwal wrote:
> 
>> Patch 2/4 didnt go through in the mailing list linux-arm-msm because of
>> char length.
>> BOUNCE linux-arm-msm@vger.kernel.org: Message too long (>100000 chars)
>>
>> Here is the link for it.
>> https://lore.kernel.org/all/1683718725-14869-3-git-send-email-quic_rohiagar@quicinc.com/
>> Please suggest if this patch needs to be broken down.
> 
> Since lore.kernel.org has it, I think nothing additional needs to be done.
> `b4` tool will take it from the archive.

Patchwork does not take from b4, but msm list, so this won't be applied
by Bjorn. I would suggest either pinging him to notice it or splitting
the patch a bit.

Best regards,
Krzysztof

