Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 532E2744CA5
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jul 2023 10:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjGBIMb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jul 2023 04:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjGBIMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jul 2023 04:12:30 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A372410EA
        for <linux-gpio@vger.kernel.org>; Sun,  2 Jul 2023 01:12:28 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51d9128494cso3088591a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jul 2023 01:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688285547; x=1690877547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQhWpYL9hEZIUpMtAIawe0pmPnv0SY03GJaWnN0onTA=;
        b=xC51ZzzM4ZKoBMI4V8NMMtadmxxxemrNka3FteTPT7S80w9jo771KZxMwoCSxXnHVq
         mQ/Ct8hPihzooSonqa0IwxYHmKNrlItug0o22lRahVLPGJc1i55rQSPq2fN7K1quMuZm
         MOCR6eeodx9vxyhmr9XCuHDKgC/1DzM7KvWBbB8llOnnaM9+leerRAYvBAO6YOv0nFK0
         7o46635deoSiuDR0sB0z1qogjbx3AreMLxxqTa8e11rEptZpS7koADwxBvHAhUPNcB3W
         ICnzlnLQ7sHXvp5fLTlxXJAhkksI+Roh13Sp/hK7eKrPoIo0ltY/2eR0NZOuHZxTm9H8
         0Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688285547; x=1690877547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQhWpYL9hEZIUpMtAIawe0pmPnv0SY03GJaWnN0onTA=;
        b=bXMoavzIzk4V2ZpQteGyU0bmKggFRyVonE71HzTfAgFf4C5fjCrKARBhsyiwC2Qxqv
         tlu9gN/KlkW+c4wLYVNDQuAyk0GWO9Nssiksyfnr3SXuffruaghIOTLQqM1vK4haLsmj
         4h269NhYQpqSB6vQxxxX5j1rTr00g25PWWJf0bWxwqSI9u7QUp/+x+VGRZmtH3A3NsuB
         +ZoANIYafNh3/kFejmi1c+LgQ69Mn6hQeHH+HOdvzWj2SlI5LJ1g77xJC8euT49U2bIZ
         9WxGLUVX2qE0qiTH8zW/oYSKjcQarMMfBJJx42B7MinO6cMyK0cZricIajP9uE5o8MdD
         cumA==
X-Gm-Message-State: ABy/qLZBBNDBtHuXvnyDEPPukPhdnFSuwqbKWjhJ7tCQ17B4ambJFTId
        3HQSZ0lnfBCn6JQue2FEAx1uhw==
X-Google-Smtp-Source: APBJJlHReryiI//h1VlOhpsruyExVn57irLSs+XOEUnGWSBEjP9I8qHbI0tF2FJsXM3COMPNyHY4aQ==
X-Received: by 2002:aa7:d7c5:0:b0:51d:9664:e84 with SMTP id e5-20020aa7d7c5000000b0051d96640e84mr4610483eds.9.1688285547047;
        Sun, 02 Jul 2023 01:12:27 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id n15-20020a05640204cf00b0050bc4600d38sm8804565edw.79.2023.07.02.01.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 01:12:26 -0700 (PDT)
Message-ID: <58a26b9e-a48d-d567-c310-193a2c52521e@linaro.org>
Date:   Sun, 2 Jul 2023 10:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 08/21] dt-bindings: reserved-memory: Add qcom,ramoops
 binding
To:     Mukesh Ojha <quic_mojha@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     corbet@lwn.net, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com, mathieu.poirier@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
 <1687955688-20809-9-git-send-email-quic_mojha@quicinc.com>
 <CAL_JsqJ_TTnGjjB2d8_FKHpWBRG5GHLoWnabCKjsdeZ4QFdNEg@mail.gmail.com>
 <cacbbb02-732e-076e-50bf-292d20a4d722@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cacbbb02-732e-076e-50bf-292d20a4d722@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/06/2023 17:01, Mukesh Ojha wrote:
> 
> 
> On 6/28/2023 8:17 PM, Rob Herring wrote:
>> On Wed, Jun 28, 2023 at 6:36 AM Mukesh Ojha <quic_mojha@quicinc.com> wrote:
>>>
>>> Qualcomm ramoops minidump logger provide a means of storing
>>> the ramoops data to some dynamically reserved memory instead
>>> of traditionally implemented ramoops where the region should
>>> be statically fixed ram region. Its device tree binding
>>> would be exactly same as ramoops device tree binding and is
>>> going to contain traditional ramoops frontend data and this
>>> content will be collected via Qualcomm minidump infrastructure
>>> provided from the boot firmware.
>>
>> The big difference is if firmware is not deciding where this log
>> lives, then it doesn't need to be in DT. How does anything except the
>> kernel that allocates the log find the logs?
> 
> Yes, you are correct, firmware is not deciding where the logs lives
> instead here, Kernel has reserved the region where the ramoops region
> lives and later with the minidump registration where, physical
> address/size/virtual address(for parsing) are passed and that is how
> firmware is able to know and dump those region before triggering system
> reset.

Your explanation does not justify storing all this in DT. Kernel can
allocate any memory it wishes, store there logs and pass the address to
the firmware. That's it, no need for DT.

> 
> A part of this registration code you can find in 11/21
> 
>> I'm pretty sure I already said all this before.
> 
> Yes, you said this before but that's the reason i came up with vendor
> ramoops instead of changing traditional ramoops binding.

That's unexpected conclusion. Adding more bindings is not the answer to
comment that it should not be in the DTS in the first place.

Best regards,
Krzysztof

