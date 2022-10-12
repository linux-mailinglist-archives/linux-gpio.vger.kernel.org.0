Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8261A5FC9FD
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Oct 2022 19:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiJLRmj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 13:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJLRmg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 13:42:36 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44FBFBCE9
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 10:42:35 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id fy4so3097522ejc.5
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F+/oGLzREG21Yj0uftDYL1IyCwSjsexCNfPmeCYYK5U=;
        b=j7mlJDdtav9g6vWHhzB0NwAdum8QysC2za2V7GrivI/Px5eW1urR25/m6DIOgTwa2z
         N7Do86PkEu10oKl5S4Dl/HsMgMoPZmu1QdafheG/q9BqAeH/4gWGmms7wQNlGqFWSZMr
         xCP/NgrU2d8KsGwj/W4HbnB42/mUWL68QTz2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+/oGLzREG21Yj0uftDYL1IyCwSjsexCNfPmeCYYK5U=;
        b=srN0PvT7Y+eUHZBdewqOfqt42XOvZZk20RErUq1fRhDioctM7RVF63q2ExCgQO1ccQ
         Y5ZpgoAhbkuQO0Jg0Q17jev3r8scTpeIOr2boX6oVWkQ7R5x8K9Nw4UUGCUxfdRIPBOl
         WzweDqfCKD2OFksbfV5GIlqVKKvsTu5NfTD7SkWFq2fFkkDomCC4uxqWxWd0xIQZYRnO
         2ANrGFd+S/diRdUQ9Uavem7G1nHtig2wJc4C4rBY9siXl6tFMUwtEpXUZN99Q/W/NDy+
         iEX15HbZRbYAZBmUAFzlBshf/RAdiX92KmOg4/3cYHEc6bA+f1WogOzDiWj/9GilFRGO
         2Szg==
X-Gm-Message-State: ACrzQf29TV9StkPK6SCmrBXc1dFYSeFZi7Oyq7DWUC3iabhZPmTTy3Sq
        vki8SdXyk9T9yJSwA794LkWgVLSLWMaIG9yM
X-Google-Smtp-Source: AMsMyM6ZX/69mcn3ezTVis7VMyEgBzG43lUUv6matzmYGEpOi/8ITr5izEG24S9aS8FJSFp3VqYx0Q==
X-Received: by 2002:a17:906:6791:b0:78d:4051:969f with SMTP id q17-20020a170906679100b0078d4051969fmr24053313ejp.171.1665596553799;
        Wed, 12 Oct 2022 10:42:33 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id fj19-20020a1709069c9300b0078c213ad441sm1591462ejc.101.2022.10.12.10.42.31
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 10:42:32 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id j7so27299573wrr.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 10:42:31 -0700 (PDT)
X-Received: by 2002:adf:dd0c:0:b0:22e:4bf6:6c08 with SMTP id
 a12-20020adfdd0c000000b0022e4bf66c08mr19368307wrm.617.1665596551460; Wed, 12
 Oct 2022 10:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221007145116.46554-1-krzysztof.kozlowski@linaro.org> <20221007145116.46554-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007145116.46554-2-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Oct 2022 10:42:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WN+9DJp-3Ny04NmOLau2RYibeJayEtB7x0uT-YoizFQA@mail.gmail.com>
Message-ID: <CAD=FV=WN+9DJp-3Ny04NmOLau2RYibeJayEtB7x0uT-YoizFQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: qcom,sc7180: convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Fri, Oct 7, 2022 at 7:51 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        default: 2
> +        description:
> +          Selects the drive strength for the specified pins, in mA.

The "default" of 2 is not correct. Please see commit 768f8d8e45f9
("dt-bindings: pinctrl: drive-strength doesn't default to 2 if
unspecified")

In fact, are you sure this even needs to be replicated here? This is
part of the common "qcom,tlmm-common.yaml" bindings file, isn't it?

-Doug
