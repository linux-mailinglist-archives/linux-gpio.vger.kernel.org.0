Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91581744CBC
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jul 2023 10:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjGBI32 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jul 2023 04:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjGBI30 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jul 2023 04:29:26 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7926410EA
        for <linux-gpio@vger.kernel.org>; Sun,  2 Jul 2023 01:29:23 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-992b66e5affso380156466b.3
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jul 2023 01:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688286561; x=1690878561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1biNblKgtJgfVRZwDEOvjX/I6fTJ7KpT17Ok3nZx5M=;
        b=uMqJUTA42zzTNobzfwK8XPREa/a9vj3Xfc/7KWipp1cnp/Jg0XeVY+x4k214j2yY2p
         QoGg5zzyWZV0KJSDggJXTP6f6mbFRRUdjqNSf2NxLj7/wA9SRfIAm46ygvQ63r2uEXpX
         fNoQjpgZVebllbu86RL5eRXcyUHR8Qhpzzihk9iDeJafk2zy7kZGgIGhfVity3Cmmwg0
         pLKzBMIuwWp2HAWLosqYLZF9VyQAZld2sBX35Cf/wCq5foc92YcnAyZQjJYvz2dvD+H2
         e3pIDjwRFmrF+Bh5CEoYUtwBR6uYTLkmSgeZBlRZgUB4OyFMScKs8aVTjco9NECFFkB6
         sGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688286561; x=1690878561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1biNblKgtJgfVRZwDEOvjX/I6fTJ7KpT17Ok3nZx5M=;
        b=SbGJz2ZMwskokIOesb+JvNtWQkYsVaY1cSXqe2iAgezPgv9pI96r/BH6feqVmKhm+x
         APfUlyIzArJwzXElO/j6HJ2W69azeuWQWe2eGgmrBrxhspcZ9dDkBTvwMylErbfy39kC
         8z3Z9TdAJcM4JvClUPGuxxX9zl+YRBvpfGhtAO+jW2HZzImw/2gXEBVLfXbxNV9ICizM
         X7fExqtQqFfE8kbvunEkwxXMEqVg0nOXOfnhazX74RyLoYURzvA6Kk27TCAP3QSVXFR+
         hoAwD55zTFXyEcEZwFHJK8vwtnnxUEdybeF6K6miHeftXs277U3k6qZuBqH56r+wCFrb
         nNVg==
X-Gm-Message-State: ABy/qLYBFs93Y1RQuADmAuqr8wY2/RhZplIhVQ7wE2BSz/qwSD5K6umg
        rPjqAwnIfVbr30Hit1fvYA2TJw==
X-Google-Smtp-Source: APBJJlEq7536nmIYj1sWz/vSWp1KlO2nfy5GE5f1MJ94C2mivpQ6trVaYeegVFmTsikSDWcGy6GDVg==
X-Received: by 2002:a17:906:e48:b0:988:882b:9a3 with SMTP id q8-20020a1709060e4800b00988882b09a3mr5395799eji.36.1688286561035;
        Sun, 02 Jul 2023 01:29:21 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id s22-20020aa7cb16000000b0051bed498851sm9043073edt.54.2023.07.02.01.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 01:29:20 -0700 (PDT)
Message-ID: <29af84dc-7db8-0c43-07b6-eb743cf25e57@linaro.org>
Date:   Sun, 2 Jul 2023 10:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 00/21] Add Qualcomm Minidump kernel driver related
 support
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     corbet@lwn.net, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com, mathieu.poirier@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
 <2023062814-chance-flounder-f002@gregkh>
 <CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com>
 <cc30660f-dd72-aade-6346-a93c6ad4b695@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cc30660f-dd72-aade-6346-a93c6ad4b695@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/06/2023 18:04, Mukesh Ojha wrote:
>>
>>> We don't add layers when they are not needed, and never when there is no
>>> actual user.  If you need the extra "complexity" later, then add it
>>> later when it is needed as who knows when that will ever be.
>>>
>>> Please redo this series based on that, thanks.
>>
>> My bigger issue with this whole series is what would this all look
>> like if every SoC vendor upstreamed their own custom dumping
>> mechanism. That would be a mess. (I have similar opinions on the
>> $soc-vendor hypervisors.)

Mukesh,

LPC CFP is still open. There will be also Android and Kernel Debugging
LPC microconference tracks. Coming with a unified solution could be a
great topic for LPC. Solutions targeting only one user are quite often
frowned upon.

Best regards,
Krzysztof

