Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C10B71879E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 18:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjEaQiU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 12:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjEaQiR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 12:38:17 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A8C18D
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 09:37:54 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5149e65c218so6157593a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685551073; x=1688143073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5OT9KFf8Tf78vvk5PWAxrUl4UkPQ4PVclta5xiQ/qU=;
        b=NAPzMWTzB+wDoW1GiW10JIGYJfbf0wj18abOg+pEHZxAH4LVZTYgWWbcM95TdKEneO
         EJwuhgz5mRPjHbdjlxfHv9lrO4ayrCmpoNd67txMZfCUDFlhk/SUTj6Job1dE96wtzMT
         R0VIY0nYcxIxx7ESXs3+y9v8KFL7K/aivUGE05NeoemoO1Pt68cBXr1o3Vc7Pm/ZBsRz
         96bZc4mW1Fn4WbPZ5pmj9PrFR+8mLdZ4cJtfmY+mfGWkpK/I/FYHJGeYYNUzBk4kPHFR
         Un3BqzTpLyP2/8SHIXP6YMXGq6h3s+UiXgL3gcfNBzOt88NryOx2BAk3IAYXczDQWbGE
         hObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685551073; x=1688143073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5OT9KFf8Tf78vvk5PWAxrUl4UkPQ4PVclta5xiQ/qU=;
        b=YdEIiFfQjBYWU+Tes6eKq/5b2McqUzropLjgURusIv7hO++3/m8M1GrcELg8QxzB5E
         v2JfFj5s/8RkFf4eaujw6HF93/LJdrjkJg/Q+W8ivm1lGRSjrNivFctd1l1J+j2g8qt+
         N2LIxIrILZ6oX8dmiu6QdwzqvjhephOLXAXAcmjKkayLSXoV6kttH8GqyRGv3EmVRxCJ
         h57SnsYwcaexAGM/DgscMlsWs7TDHVP5BIe9JPJ0qSNWIuxHkH8bSAwD7g8YHoe1DHMK
         SCVwwtd44CKQAHjSt4QWmglDoy/Hdm3kRrCN++Cf86QrFuLs2oXhCxUPm/DS8rB1rs3p
         KCqA==
X-Gm-Message-State: AC+VfDyZ/NJuPiJc8rj7esaWoeBL482MQEvnBpUBZsALspV3WYMB2uVS
        azcYPVdI4qefjpqCXzef/8av7g==
X-Google-Smtp-Source: ACHHUZ7zacc3Wdi1BXj0dZ/seBtl2Jjrzi6i8AH/zg/c4IwdBAlJHrshpDrkLhhhrDMIgJ0bVfxxPQ==
X-Received: by 2002:a05:6402:38a:b0:514:a6af:e299 with SMTP id o10-20020a056402038a00b00514a6afe299mr3848352edv.23.1685551072886;
        Wed, 31 May 2023 09:37:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id u20-20020aa7db94000000b00502689a06b2sm5867485edt.91.2023.05.31.09.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 09:37:52 -0700 (PDT)
Message-ID: <d94ad429-9f82-5751-8a49-03592bea7918@linaro.org>
Date:   Wed, 31 May 2023 18:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <a926837c-8773-1809-0bb3-34d449c5d7a5@linaro.org>
 <CAHp75VcJMwoG07-d86obSLuPNGRQuRo_oW2JJA50ps--3s0kJA@mail.gmail.com>
 <4810610.GXAFRqVoOG@steina-w>
 <CACRpkda7CuiJ0=9+gw9G+mmBAOH+P2xmofb2dVANjqqrW78xfw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkda7CuiJ0=9+gw9G+mmBAOH+P2xmofb2dVANjqqrW78xfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 31/05/2023 15:44, Linus Walleij wrote:
> On Wed, May 31, 2023 at 8:53 AM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> 
>> What do I need to do to get progress on this topic? Without this kind of delay
>> handling the DSI-LVDS bridge on our hardware cannot be used in mainline.
> 
> The DT binding maintainers (Rob, Krzysztof) need to ACK the approach to
> how this is modeled in the DT bindings.

I left it for Rob as he was involved in v0 and v-1, I think, but since
this calls for attention I replied now. Sorry for the delays.

Best regards,
Krzysztof

