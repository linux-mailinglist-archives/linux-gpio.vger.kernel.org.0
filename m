Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7300E57C648
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jul 2022 10:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbiGUIdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jul 2022 04:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiGUIdQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 04:33:16 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DB77E316
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jul 2022 01:33:15 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q7so946799lji.12
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jul 2022 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QOOeUfM26Su9hhaUa74K4aP8otfOF7CO4lVlJM7tdsU=;
        b=naQvHtD5qpiZ7D1B/HRtl7hSMuhE/IYlMtl9XEP/E8Bjc9unQvj904i6QBaANDkYBN
         rpJ6zQhBQBGL1tNxMZh1wdTIcG1/IRDMbpY1sjcnZ5wqJ3iU+7Lo88wgO3d+5HgT9y6k
         iQD7G0rAko13zDL2SWoeFRMz/HPWba7fSHrsaaCuACJWYorvqxA5cFeaaOgKwwQpafFn
         gQxPWKUGlOcUesztAp+tF5hUYzp3dqYGF1djIET4FRHd0s1d22lbbfsBWzRNcmuDG0FQ
         FK4it7d+MT5dkpwAffjGlUGnsyxcAYgi8FVQRnudqFjsIXLayoZh6rizwrhJyYhgM0d5
         W0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QOOeUfM26Su9hhaUa74K4aP8otfOF7CO4lVlJM7tdsU=;
        b=nGR3jhZYaK6gzPqcgsDR7nZUJe0d8MKDd080eaDTymOWbpVBiN2rB3DpW83msq1ZK5
         3wpi3aApirPDLV2PisufN7fPn0IM1YzPkIeEYotARCwOexjrZYIFhEseV0zIywnj2yqX
         lRynE5Xrgebi3Ss8ndw2WOD/rVR2HbdhMQLyhtzjO8p20hoZ7B9tcx7Fg1dQm4Fdraem
         raxt+dn33ohfnHcmHC6OX+WZ+Bcf82w41AcFL57gNiULETEMdUcveuzKOwn8pq6tjdnP
         /6aPlJONMZN9gi8ksmJnEDlGjrLEcaAq8nu4xLHAnLEL8PSDcdGOWp4avm1tXK6wRv5y
         UX3Q==
X-Gm-Message-State: AJIora9lcsieXb8mStVF5vagVfdvCPfcYX1p61f2nSjbIpFvoOgrGMcu
        K4Rk/op8WfpA/JVXIBa6y4OFTg==
X-Google-Smtp-Source: AGRyM1vEJGyKhNasV9yDdLlr85sfaIhfxqsFkDuLk0CePqwv+/Rl5yI2XJNoHzr/5+8h7ww8fIlwfQ==
X-Received: by 2002:a05:651c:a0e:b0:25d:a7b9:762f with SMTP id k14-20020a05651c0a0e00b0025da7b9762fmr12786995ljq.458.1658392393703;
        Thu, 21 Jul 2022 01:33:13 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id v5-20020ac258e5000000b0048a29c923e4sm302892lfo.7.2022.07.21.01.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 01:33:12 -0700 (PDT)
Message-ID: <eabeca38-6264-5f2d-cd86-65a4052278d0@linaro.org>
Date:   Thu, 21 Jul 2022 10:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 05/10] dt-bindings: input: adp5588: add bindings
Content-Language: en-US
To:     =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220721080423.156151-1-nuno.sa@analog.com>
 <20220721080423.156151-6-nuno.sa@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721080423.156151-6-nuno.sa@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/07/2022 10:04, Nuno Sá wrote:
> Add device tree bindings for the adp5588-keys driver.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
