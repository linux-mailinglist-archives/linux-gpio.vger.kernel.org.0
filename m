Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCAE4EE911
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Apr 2022 09:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343856AbiDAH2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Apr 2022 03:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245674AbiDAH2i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2022 03:28:38 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB901E6E9C
        for <linux-gpio@vger.kernel.org>; Fri,  1 Apr 2022 00:26:48 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id i16so3920060ejk.12
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2022 00:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NdTMEHh8oRMxb7NiIdktFSXpzpErp6CoIfFe7HFO9xQ=;
        b=ZThfXhy8kPE8H7TCQCO20gfWtZhZpSvB2ZG6pIMKbH1Ob9pnWv6MRgDSs/OSLP5Uye
         CEU82Kbk7/mP0RnSg5v63GPFx+XjtIq64L2kwWnbh40UPDLa5pu+InXMaFrc1z76d+/Z
         NwPDfdno928IUwZlRiA4pjX602Qmh9l8C7lH0YXABj7ioNDpIy1GvRhGP7ANMbDAunun
         qI+5NBtSO65pkGm8GQg3gSTJStmgP0xU8Ar3MiSo6siYKw316BEck6vWZDYtuWPS8ko3
         41POlSYghyhWa6i94Mp8QKVjP3ZfStwlb4Jrs47Vl1mcil+1745KbKkeu1HzLk/5+KGs
         UD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NdTMEHh8oRMxb7NiIdktFSXpzpErp6CoIfFe7HFO9xQ=;
        b=j37iDCozojn5NhSTwZDr33TcBToLLDX8brn+hfwpdiKDC/uPXwaAeGbkIxv2+rKutO
         qR06u4A/fgHRkBMUO2fgC4r9LDV7PtEbg7PHdAVFKsM9HBoHDDJ8JHbFiXnutjUaaVyc
         mymiaPp9MU2dvyc+eijAC1FUSXtSmuM0+zbNT+Hgo+qAhLvWAUzaRvDVpjS4HXiiX9LU
         oEYVHOpgVs8qlm75goDI1tQYVpjsSs5gE0ouyf2voOIGvm6BsQtq/KBH9imf1tO0wfd8
         /uO1YMERX3banK4BbaHDlZT5zuboBeF6XSnGYFtjxmrmmm/Xiv1VjK7u5gSRO4alfieK
         WfIA==
X-Gm-Message-State: AOAM531qbOT6LfpKHTucM/b4UvRO49U1Bm8+nnh5BMP/2yur45xKRgDA
        Y1hmXGa/e238Q8cbAKT3gVchiA==
X-Google-Smtp-Source: ABdhPJw4NUMeYfYEXv99A+ew5bxec2wBqmCLyVi/J0IPPNISeAyh6EXLBZyvvoF2Re5BLb7Ii3x/pw==
X-Received: by 2002:a17:906:9c82:b0:6df:c5f0:d456 with SMTP id fj2-20020a1709069c8200b006dfc5f0d456mr8099253ejc.287.1648798007531;
        Fri, 01 Apr 2022 00:26:47 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c4-20020a170906340400b006d077e850b5sm706672ejb.23.2022.04.01.00.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 00:26:47 -0700 (PDT)
Message-ID: <76108d17-37cd-4ac4-f1d7-b54b2d338f43@linaro.org>
Date:   Fri, 1 Apr 2022 09:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] dt-bindings: gpio: add common consumer GPIO lines
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20220401072516.105903-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220401072516.105903-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/04/2022 09:25, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Typical GPIO lines like enable, powerdown, reset or wakeup are not
> documented as common, which leads to new variations of these (e.g.
> pwdn-gpios).  Add a common schema which serves also as a documentation
> for preferred naming.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Wrong email, sorry for the noise.


Best regards,
Krzysztof
