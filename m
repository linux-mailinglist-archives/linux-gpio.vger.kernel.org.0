Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99F5E729955
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 14:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240212AbjFIMP6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 08:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239103AbjFIMP5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 08:15:57 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6852D172E
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 05:15:56 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5169f614977so3024234a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 05:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686312955; x=1688904955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsC1KD3dA45FMSsNnFjCf0F+PjjkyOHDGJNk30SGuGw=;
        b=kUHgWml+tv4XhD5ftmOU5IF4nEN5LAwgIdDlC4Y/FKwp6EDi+3YQheOgzKDmmDDhvr
         2s+afyry5obiGTXH8rnEExyYog8dI3YPChejOlBOE+slpSLFKF7Y23bEKTScN8z/LdcP
         CjOpuUSb6qpYPRtUh8Lj3RNDWeyXJYIavLAQlP85TTErPXtKxVzI8QTnOObZJpAy5YQx
         pktLowNxYOj3ehiyLv0oJVYHtWKyAofaoNW1Lib1sebk7vftO2Rm46oCFUT+5gNb0ept
         NZCcS6nfecI/72MVh/7uMdHiCq5h4ikmVfniofN9l5zY3IjVE0ScyAdjBPc2RUCXOzFF
         ojEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686312955; x=1688904955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsC1KD3dA45FMSsNnFjCf0F+PjjkyOHDGJNk30SGuGw=;
        b=fv8EikufyOQ2dQrdyEMMNKfkWKNI3kVaG4A/DUqjL8iOa/dmnk8j9xmJXabkAc8kpl
         pAn7RJyF47RvrqqA0AcjD/gqZOyO9qeTHtLd3B7MY4BSKTKe7I3U8h2UexRi1PLsyGBA
         R1SNh+hiawPdvaX8E4S9qWcJ1CdmHYYLgyzTk5rBtAGtjafgrTZPIT3yPOQkMueuDbEr
         An6+tHAvwX2KGdkijQyD1ZosD5//lfZJSWknXzeC7ls7MYs22amjlMnQco3Q8lyZSCpV
         NJLQBe7JNfIfDlU4shu5G6hElKrpdF1/O7bPbARSA6wc9gP5k4M3gEyb1mud3KcuvXAY
         Q3BA==
X-Gm-Message-State: AC+VfDzfX91lzEkow+JFkVDy+viTUKbFxicjyhAZ1rX0iA1za6e4Y7Il
        aorG/1sc89VuS9nDBTztjK4vgc6Wbp7LzwCkFOE=
X-Google-Smtp-Source: ACHHUZ4yD8Eqbbnff1yTFECpfYeJdWVgPYCSBzh25RIaV6iF9P/2DbIGFHV4opVmEVKaUirgqZ1kyA==
X-Received: by 2002:aa7:c401:0:b0:514:9dd7:4bcc with SMTP id j1-20020aa7c401000000b005149dd74bccmr1164011edq.14.1686312954847;
        Fri, 09 Jun 2023 05:15:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7db8b000000b00514b3a2008esm1703436edt.2.2023.06.09.05.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 05:15:54 -0700 (PDT)
Message-ID: <daeeebcf-d1cc-4dda-3450-8fa137c090bb@linaro.org>
Date:   Fri, 9 Jun 2023 14:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/1] dt-bindings: gpio: gpio-vf610: Add parsing of hogs
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20230609121044.586214-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609121044.586214-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/06/2023 14:10, Alexander Stein wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> This implements the same as commit dfb49cc231a48 ("dt-bindings: gpio:
> fsl-imx-gpio: Add parsing of hogs") and reuses the commit message as
> well.
> 

But it was suboptimal. Do it like in commit 6c19974d1e83 ("dt-bindings:
gpio: Convert STMPE GPIO to YAML schema"), including also narrower pattern.

Best regards,
Krzysztof

