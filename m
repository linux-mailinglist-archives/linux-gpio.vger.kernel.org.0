Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22E674699F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jul 2023 08:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjGDGZP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jul 2023 02:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbjGDGZO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jul 2023 02:25:14 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D429CE5F
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jul 2023 23:25:08 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51d9c71fb4bso4873386a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2023 23:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688451907; x=1691043907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gXLbcQakGOuD9xEtAslIaebWUauZ1RX8TuYQEBPUVc=;
        b=xSMRQAliLvhuDESAsKTgXWLEaEErgpxYiZEp4WUdnlIajkTIjUdradyi6+28eYsRoK
         1Up1eKR8cbP1LTZBIuBCbbTXMqjjUSaIFj4cXqEaW8+gWIP06tbOy85E07q7H5eVeFE+
         JFoKWQDwsX3/AmNVO6vDr4RHvNsCcJD0+uUEE/vAtqhiYVwvYNltqNQEleay7Ge2MEzc
         ztKz0CFae+BS9nwzQS9gDq6Ukwnjb5pZ5gIZ3ZEk79tWON7y5PpkMyYk2SLoCxuFlGDc
         aGAb47E6ngH0D5V9bmqNdK2q/lgQNew1ptZJq35gIJEJ+P7J7K5Shjb45ry2QEE5DoP9
         rF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688451907; x=1691043907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gXLbcQakGOuD9xEtAslIaebWUauZ1RX8TuYQEBPUVc=;
        b=Do6XgBBeWKFWIPrgBinhdpDtJqqHadGXW3Y/Q+/PB7jE4oTimBbQD5S2lu59pvvcSL
         9E3gV/lCZoPCOKtJTcWQdB94vz+wm1DblPn4iTZGsLgBXq8Ur00pZVKF/z/VATAjY8LU
         ZWVDjGQFrXn4zWhbYEFdDQmJES7/0zhj59dvAZp3mveVzEAH4EdJuhODQ5Fw0yz3KydP
         FB/A1OTVQDgV2et/rvZ/B2NcOaHBLKwnaU26g2FlLqkYHug0qlY4bhT5Emycyb//hNkH
         B3xgkMtOnSvl4ovcIS8S2KQRBbZRZWmPLn1q6BQy8HjtB1fqoz35hee9iDFiGSMup/Xq
         VC8w==
X-Gm-Message-State: ABy/qLaK6UsIMoGS+SeBBLdNEAE/OP7JjRggSvLNvfAuAT3yAeTAoiK+
        EaIAU6JhiVoZq14Q6hXuZYpgNw==
X-Google-Smtp-Source: APBJJlFf70iU68uuAsACk+p1i0iiLiZZc2D4Lk4akWYnHOTrbQbjHx8k7fL02j7c1jBDCYaC3seXVA==
X-Received: by 2002:a17:907:9844:b0:98e:2b00:c509 with SMTP id jj4-20020a170907984400b0098e2b00c509mr9125002ejc.30.1688451907419;
        Mon, 03 Jul 2023 23:25:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qq2-20020a17090720c200b00992aea2c55dsm6597272ejb.153.2023.07.03.23.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 23:25:07 -0700 (PDT)
Message-ID: <08b503ac-98bd-dd8c-bf1e-c81f1ed0b47b@linaro.org>
Date:   Tue, 4 Jul 2023 08:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/10] dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx75
 support
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <1688395346-3126-1-git-send-email-quic_rohiagar@quicinc.com>
 <1688395346-3126-7-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1688395346-3126-7-git-send-email-quic_rohiagar@quicinc.com>
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

On 03/07/2023 16:42, Rohit Agarwal wrote:
> Add support for the pmx75 GPIO support to the Qualcomm PMIC GPIO
> binding.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

