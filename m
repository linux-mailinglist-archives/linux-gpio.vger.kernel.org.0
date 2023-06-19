Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011F8734BED
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 08:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjFSGyt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 02:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjFSGyq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 02:54:46 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EA713D
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jun 2023 23:54:45 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9829a5ae978so515228366b.2
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jun 2023 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687157684; x=1689749684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3+YFbtY8An0H9BGn2tS+970lQV7NoBq3xn34dWebHA=;
        b=r4uda18mlUkzLD0R6iLJdwL0U+NXm7BTp1KQy8c66RGuIs5ZP28D2uVqfckHDEayyN
         uwPXUauPQi0eV+/dJeyKh8orU+1XNZ0qeMIzjyRbQfvYui2pIxZEa6JA/KB6IlXr3c/X
         agtJdFOVYNqWMzgsR5z/mvf6bvrhHBTBU1qxOKujz+FaBSZYc+3NalRXBRYLyu6tnXop
         63imWcRfdrj2ZSwcbeEQDhlIdOpOytXyplEnhsrs3WJB1itNebvVHjy4aAALbh2SnGvv
         VHAxnmqt6Onv3uYLIrHbAOpXVbYSUI20FuYfms+fJW67G5YrM0w+FwFcwaK5KW5sh8Eq
         bT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687157684; x=1689749684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3+YFbtY8An0H9BGn2tS+970lQV7NoBq3xn34dWebHA=;
        b=ThHwSQWIi2imni+qvhDfxW3B+wcFoOuHEt3Km4tBA+8+bvBPgZRRq6Cx7ngz+VNKUc
         ii6KzYraEe7fPNYND+YntStl7gnCSSw/JD4saElWsov9gJ0kViaePw0Ly0bOYLfcGR6O
         4BX6wZpdhFa7vicfXOZKmBEa9Xc30z302HL5nDqyez3qnNuf8eXPTO1KcJWjSmG6wX9A
         9BkVl3D6G0+ETVZ1mHAl3yRKeD++7BY3LL5WwjMswCovfbrOgBOkhHkV7aUobwI3q4zJ
         oiq52dFSUzXGE6XLJclJVwBw1mVWc0eg6hW+BHMLOgHkycYUjFwjSNcw4Z5TbM1fXVZf
         WSTw==
X-Gm-Message-State: AC+VfDyY9os19bKLDJb3lxuetmZ0ORPYC/U2wHbc3IbZuKfQ12xWaZLW
        7l/1bcZJi9fZcGXC3cfIrpBEOA==
X-Google-Smtp-Source: ACHHUZ5drhx8iVHq64mSKGeVaVdBPQcz/QemgDXxSn1B9J4kPFwBHZMbT6LGmJW4CPeySipFrA3SOw==
X-Received: by 2002:a17:907:2da4:b0:988:76ed:e563 with SMTP id gt36-20020a1709072da400b0098876ede563mr3315115ejc.50.1687157684033;
        Sun, 18 Jun 2023 23:54:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s13-20020a170906bc4d00b009887bb956e0sm1724282ejv.103.2023.06.18.23.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 23:54:43 -0700 (PDT)
Message-ID: <c4253947-0429-3e45-7d0b-3d89dfdd9af4@linaro.org>
Date:   Mon, 19 Jun 2023 08:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: gpio-vf610: Add parsing of hogs
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20230619063907.128561-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230619063907.128561-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
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

On 19/06/2023 08:39, Alexander Stein wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Narrow the pattern
> * Remove properties covered by generic dt-schema

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

