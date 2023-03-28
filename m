Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20E5E6CC281
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 16:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbjC1OqB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 10:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbjC1Opx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 10:45:53 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80975D51D
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2023 07:45:30 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id cn12so50747658edb.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2023 07:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680014729;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+LzNi+WKhxITd4nhakeVgxz/emADyS2pObOAuVfYNE=;
        b=Q2TCXrLDaw3Qwe8C5aKV3ssSZgAN5t4ee1EiGotaCbWRv0BUCUayay/T2L3ywZafKc
         KiA9yT3gnJzacs0N/CwQagq+eL6Na6KwsKKUZwrPKGmAX2hrc0RHyldbYLiqGlgmiLKB
         MK+xAYuUJTyQ6QOhxN0DHSihiBDLlyj1bdRDigpr8cP9LecVYXt+d5vvx0/QpUcwfZdJ
         kuNXjYV5BAhDmPAeis+KNBV0CKQ6YxIp1g7zXzZ714HTlXookUc8IXp1t4VxxCYZvknB
         09iho+RQ+l0OTdUoktnWKonj9n6h60+qHaUj0ZsI+2CqERfV/WdZQH7U0SJJ17+Ardf5
         bYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680014729;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+LzNi+WKhxITd4nhakeVgxz/emADyS2pObOAuVfYNE=;
        b=0wwvsATO2MRSFAIpfKFG6VU65jOjRFQ3FlO++DNVRAiCDVjTtJqq0NfW2RJMk1OGKB
         IHXOWObRnk2c31vbu+WX5PWsM5t2gqzVLVwx05hRrX344BCifB8rvHiKR1O2zS0KV72N
         /K1vr4JsicF4pwug+07HUwuX0aLIYm+IRqFYcxHlr48BtlZDM8EDamgkFOIkZ9FloLJt
         quTbH9h3d9CUyc5CR8BJ+TnZXklhvzNOCt1n6OHZ4TCHIJ14aOB1kQgpJ5U/2i2bKdok
         z/tOMTWBfx7zLM8zhtRHsnZ0kF5qqji/gyJci69NBO+nRnlAOTMb5ONMdzNlbH/q3nlZ
         lxNg==
X-Gm-Message-State: AAQBX9dy7T/FPxkpBh7PkQx7ydX+P5kXEWZzUVEMYnpqsQdnHS1oJyLe
        UWJcFjSSgnZO9aCbTxJZWfR8Gg==
X-Google-Smtp-Source: AKy350a77CF0+D7QzfQ5lDGcMfjiA/7skkNmOzdvJIRrcMFod3WgDy+fqB2dX8bfoSZyDWfdRXyhKg==
X-Received: by 2002:a17:907:20ee:b0:930:6e31:3c11 with SMTP id rh14-20020a17090720ee00b009306e313c11mr17032880ejb.70.1680014729005;
        Tue, 28 Mar 2023 07:45:29 -0700 (PDT)
Received: from [10.105.135.205] ([88.128.92.162])
        by smtp.gmail.com with ESMTPSA id g8-20020a1709061e0800b0093bd173baa6sm8702873ejj.202.2023.03.28.07.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 07:45:28 -0700 (PDT)
Message-ID: <e2c0fdd6-75ab-ee18-787b-bf3461fbe55b@linaro.org>
Date:   Tue, 28 Mar 2023 16:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] dt-bindings: gpio: vf610: update gpio-ranges
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, stefan@agner.ch,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
References: <20230328052912.1957000-1-peng.fan@oss.nxp.com>
 <20230328052912.1957000-2-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328052912.1957000-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/03/2023 07:29, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> 1 is not enough for i.MX9, enlarge it.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

