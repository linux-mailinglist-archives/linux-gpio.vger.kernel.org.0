Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE0566C8D2A
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Mar 2023 12:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjCYLEh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Mar 2023 07:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbjCYLEg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Mar 2023 07:04:36 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8E5FF1A
        for <linux-gpio@vger.kernel.org>; Sat, 25 Mar 2023 04:04:35 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b20so17413581edd.1
        for <linux-gpio@vger.kernel.org>; Sat, 25 Mar 2023 04:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742273;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGuQcUMPAohDQdYCn6esi5t8mBDfcwG+UMgt1Vpx+WM=;
        b=pMAvRb8aCJ2b0iCd+bQbJvnxrHmZdtK2pRSRcgh8uUGqvblJeke1gYjt2UVdKTPv2T
         tE/Jx7SUB3KniKeL3tXU9iLtWMVaVOQn2bD0tkfIwL+eY/NlNpJBI/hXmIDAh8bMyaYI
         HxIWizm/znH9TrCyib1AJNP0PMJXPbJ1I8+dxmfRO9M6mkYHa9lSvSjWmGoAta0y3o61
         RUXOIC0PIN/nYSvCp4SDQyCd2//4jjpLR3o1hFqT22PbPt8syu6kWex4RbPC1Voip8PD
         jMvgpF3URNTFFCWYZiTX/Qv30J+QbEIufaG3hIQmjufi0hl6LEfjfX2yX6SW+1o5ZMfX
         LrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742273;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGuQcUMPAohDQdYCn6esi5t8mBDfcwG+UMgt1Vpx+WM=;
        b=ZEyZRHzS6nb3444dPPxbQAPOqNygyUJ25BMeIp8XMDr/72XrRUS2RQLL7ktuVFlTTm
         Is6P6LgKp6fqx2JenvrSaEwLdfXEDPlQYU4ZKCSoMvEsnHTL8KHgcM60im/jAKzFXCPK
         lSmNCldFKox+qNrxR/qy3rD/gd/qMCjooglvS0RAiiER/3KJLBfF8DqE/1yz+kMQZtSq
         dW7raFgqM81j6gLmrJ17m6e7DMfmFY41VtpRbfOqt91tzSXyrdvKbpppzveCOTzb8RdL
         Fwz9H8PtWJ+YSz/up6hRLy6q945rGghNgV3uIRZoh62bw+3eH10CcguEknHFADSq4B9p
         cycg==
X-Gm-Message-State: AAQBX9eB0bd9ofDq6AFVj3cF0qX8a2jU+xJGvzah32+a5nIz1mlUzSlo
        RoH1aicOpOki4jr2cMDjWmsPTw==
X-Google-Smtp-Source: AKy350Y/NlId/yerM/9zRTivgf+nQ019MPql1v8mGNitanGiTO1YCTgARhntB8wDoJL8eH7ILlPbiQ==
X-Received: by 2002:a17:906:951:b0:933:3cc7:4420 with SMTP id j17-20020a170906095100b009333cc74420mr5852539ejd.45.1679742273597;
        Sat, 25 Mar 2023 04:04:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id b1-20020a1709065e4100b008ca52f7fbcbsm11602168eju.1.2023.03.25.04.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:04:33 -0700 (PDT)
Message-ID: <55ab6fdb-7b93-38bb-bbf9-9d9e2051afba@linaro.org>
Date:   Sat, 25 Mar 2023 12:04:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V4 02/10] dt-bindings: timestamp: Add Tegra234 support
Content-Language: en-US
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
References: <20230323012929.10815-1-dipenp@nvidia.com>
 <20230323012929.10815-3-dipenp@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323012929.10815-3-dipenp@nvidia.com>
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

On 23/03/2023 02:29, Dipen Patel wrote:
> Added timestamp provider support for the Tegra234 in devicetree
> bindings.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
> v2:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

