Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7CB7082F0
	for <lists+linux-gpio@lfdr.de>; Thu, 18 May 2023 15:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbjERNkD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 May 2023 09:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbjERNjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 May 2023 09:39:55 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FD41B7
        for <linux-gpio@vger.kernel.org>; Thu, 18 May 2023 06:39:53 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96649b412easo321527866b.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 May 2023 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684417192; x=1687009192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9TjZBlEcYTCCpYd0EWrlM/xAExh6zuB4ZIDwlVPxXTM=;
        b=UtoOLaPCtVZiaeUG2eAR+BoX6XervPJ44kNitEkB2i8nE19OiPwe4WPG71xS9pCu1x
         sArEfo/YPzCZZXlyjAVWSv9fIlagSo4a8k6kNho74FfM9XXGpzGQEcgLCu8w8ZMnnb4e
         fnFrD1VfE8ksxCsbIbxMofGopGZ0wBoauS5ABMJnQjdKof/lo+ROYTs/DLGV56IsRO1k
         SzkjlYnDFU0m9lpu1vDEBGXnDQf/5Gz9LoMDv7lVcUWFEUg/rrJhDYvdBp6b+i1XoRr6
         /gKp4CLyot03bsSfuT3b8edrPbizU3BXXnxcR7JLjO9S17y4Z7N1hIEuuVkVcw7HnA36
         guUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684417192; x=1687009192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9TjZBlEcYTCCpYd0EWrlM/xAExh6zuB4ZIDwlVPxXTM=;
        b=NVEpaTskG3Tl4FXv3nSrTLoz5Oi+D8Wo0ow9wNwirzSiJdn0EPsA72krbTFSGjzC4z
         VBumzTg5WogUJcQOR2CxrlbFma84GfEtSaoO8CKogrr7Fz4HMntb8YHfdJVevHFrSJ/l
         8Mf+r3lhnarAOXop3SXs3N/ANY8oefsUsRSh4kt45gBBDCaYK6+ic46yYfEgTOnBP2yw
         OjvAA623VyietvBzK+KMRYhZQR3zIG8hAETTsN1OhAdybyOa3IpB1Uf1fx/kft3kju0c
         GLUvXkl4/f31/7qXfLc0dH3qmsV7aIKJnWI0C3suUriqG6RTQ4NVNuwBTQ3cXJhOhl09
         h5bg==
X-Gm-Message-State: AC+VfDzbAEWvdS/BgGH+xow5bnDQM4v7+hmd+1PvXk/sqX98pJ1Vzy6d
        8F2dAdBi+Kl80yKn9vjigTxylA==
X-Google-Smtp-Source: ACHHUZ7BmIRiwtmUUF+QH7l8KYeBPlkWIy0PM9v8f7UFbcRNmiiSYH5CXMZJR3OovEEGm8cP3klyJQ==
X-Received: by 2002:a17:906:7303:b0:965:6d21:48bc with SMTP id di3-20020a170906730300b009656d2148bcmr42875928ejc.75.1684417192268;
        Thu, 18 May 2023 06:39:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e24:6d1b:6bf:4249? ([2a02:810d:15c0:828:7e24:6d1b:6bf:4249])
        by smtp.gmail.com with ESMTPSA id i24-20020a1709063c5800b0096f0c21903bsm1003848ejg.31.2023.05.18.06.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 06:39:51 -0700 (PDT)
Message-ID: <b93a1717-acde-0df3-ab8d-7a3e33fdb1b3@linaro.org>
Date:   Thu, 18 May 2023 15:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/3] MAINTAINERS: Update the entry for pinctrl
 maintainers
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        richardcochran@gmail.com, manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <1684413670-12901-1-git-send-email-quic_rohiagar@quicinc.com>
 <1684413670-12901-3-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1684413670-12901-3-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18/05/2023 14:41, Rohit Agarwal wrote:
> Update the entry for pinctrl bindings maintainer as the
> current one checks only in the .txt files.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

