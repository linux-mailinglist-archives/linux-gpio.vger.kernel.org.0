Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D8A5B6BFC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 12:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiIMKzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 06:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbiIMKzI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 06:55:08 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CF018390
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 03:55:06 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id bo13so3620624wrb.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 03:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vD7gsQSG7/RgR3U6tGxQtB/SQTavqkLOmUPnntEGd4E=;
        b=jt+wJKTVrcmFj8OWdLPvhkTkzPsR9PN/4e/XbHWKqDY6v0qBCJN4iv/oSSgN0faDVb
         YXJONA517G998oOCtker3S2TLWjvAewYECjPXVi4andCnKSPFeiavMrV2GKCn3SSBlMJ
         K3guPSwAUXBCYZEh5QaJFkMBV6VLzu1mkKN1OA1Nx66C0Bg+w8cXpa740NBOp8TJ+f+1
         OkAMFHqdZvIMpw+2UHq87cH7xCsfG+6t3UWuQAD2qBPCvKCeUov/nCZSlzw7nIn/jCRz
         a+UAjpj74f5M6iPkuqnQskRreJ2mtap8aBgWwLGwAxtK4KjIfiwEIt4eFsSpUk1wxLDS
         2ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vD7gsQSG7/RgR3U6tGxQtB/SQTavqkLOmUPnntEGd4E=;
        b=XBt4mo+tx1MKUJlZ63RbPMGNle2XbG++4M8AEzTu4WlEsFRPqjNr+/7+WXKn35wvag
         1pHuUzHZqI3KFLynFFfmfMRqVhq2j8K+jqnfkCkSLjNQpI+O8oEEzcLoreT/pvE42Sdb
         TwkE0C7yV5KXEMxGojopEJe2qdJfENLQSi8XKDHJnl50mj9IfqRvqo26zXbYDwySmNON
         ZIA+X1mVMgLm7df4vAKn/aSfy1jiID+iS67D7NRzHnMGcfpUlUPbcNcWr7oNrCTy6nYQ
         5lx8xanhlOIvtlrRIzwwOTn9uwhTnZbNG5nNlOtrqNTz9/NUdaJAF6QY4wLWlqoxc+pu
         dkqQ==
X-Gm-Message-State: ACgBeo0f8xOhydrMhOdUJ3BiXItm7BiqhtqM3qzP/d39ibhh/e4HrjM2
        kGf76njdYtbMRlkybZXOn0owwg==
X-Google-Smtp-Source: AA6agR5iiGGH0zXFnAmQCnQ/uaNzWRKbpCbE3lwpN5hm9PAilmAZEHWU1o4i3t817frheSLazfrg0A==
X-Received: by 2002:a5d:6609:0:b0:22a:3965:d5ad with SMTP id n9-20020a5d6609000000b0022a3965d5admr12993616wru.62.1663066504694;
        Tue, 13 Sep 2022 03:55:04 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
        by smtp.gmail.com with ESMTPSA id k42-20020a05600c1caa00b003b4868eb71bsm7273342wms.25.2022.09.13.03.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 03:55:03 -0700 (PDT)
Message-ID: <26324afa-e106-d623-38a5-3cb8263ccd3a@linaro.org>
Date:   Tue, 13 Sep 2022 12:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/4] dt-bindings: qcom-pmic-gpio: Add PM7250B and
 PM8450 bindings
Content-Language: en-US
To:     Anjelique Melendez <quic_amelende@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_jprakash@quicinc.com
References: <20220912210624.4527-1-quic_amelende@quicinc.com>
 <20220912210624.4527-5-quic_amelende@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220912210624.4527-5-quic_amelende@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/09/2022 23:06, Anjelique Melendez wrote:
> Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
> to include compatible strings for PM7250B and PM8450 PMICs.
> 
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
