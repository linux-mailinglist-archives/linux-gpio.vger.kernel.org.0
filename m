Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4056FE042
	for <lists+linux-gpio@lfdr.de>; Wed, 10 May 2023 16:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237378AbjEJOab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 May 2023 10:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237195AbjEJOaa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 10:30:30 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDA15FC9
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 07:30:25 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f1fe1208a4so5281198e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683729024; x=1686321024;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lfKRKCVA6ub+6ekqvom3uIKjLzZacdhUnlykA5A60I=;
        b=Z2A25jCFbE+7HrnPweXb3+gxnyH4702b0nssKURS6ETLWoV9wfad4egBcg96wrTo4J
         9h4dmIZerWpErsyG6/41nxRyubFmh+S7YueYLmcKsMI2Is42k9ZuBbyrbXEKOeui3/WY
         gzrDiq/IG7CUj4z/gBdoUHRh/cjngAxyBZN4ve/nGI1FdmIhHVjIu8rauHtTsca3M7MP
         9wK7BBpuxPSdzgyAN+ZVvsVGFcjV9GPhdcsZX/ZHMA6/QCgYjIU54kx+ObleXZdjl/X/
         IX85KhNlFdT9lI/stnmwJ4gi7Qp3EsiAzxEKw6Yb3Ws9teomUH/vLEURkZAqSQg1g4qW
         tp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683729024; x=1686321024;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lfKRKCVA6ub+6ekqvom3uIKjLzZacdhUnlykA5A60I=;
        b=VvHQLdFiigzSce1ztz7Dnh3jMRxIXjwwk6sYCzsZsGKTsFDUfv75cFUWMPlILLRGrH
         bI6euRYQ2UUr9IexO0NDu+G9tLlr2NELX3+pGNIaS6Zqcyju169xIv9bOaxiCYNbAreV
         kbdOCeL2wYBtQGQVj4UVlMojlKYdrOBkGOBzudoELSd5uF46LlXvFiT5g00S0YterqCk
         2mnWHvsVtwiIecdyONOjn7HWdatjJIr6Sbh4CD0Cb8VLvZeNzQos6wrrWuqr9x8i7x0+
         QMWrC88s+20fs3PGGsOCbbUfQRSrlm/iF1tqQsb0yUSLsFt121ovesTJv1DBMrR0sDC7
         rXeA==
X-Gm-Message-State: AC+VfDzHxl7DoiDG0ysyBJF3DpL/O3FmURwFScNfQM/TFlDUvlHr/YIK
        eQ7D9hHcIwT1g01HO5yT4RHJUA==
X-Google-Smtp-Source: ACHHUZ4xlCeZkQvYcwbdSDxDS5TJL6kPkeiBHT0SHAsmUAKLdfQcXrvKjJcWuGLebXvS1ppEu/8fJw==
X-Received: by 2002:a19:a406:0:b0:4f2:5c2a:19ba with SMTP id q6-20020a19a406000000b004f25c2a19bamr1337069lfc.46.1683729024141;
        Wed, 10 May 2023 07:30:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id e28-20020ac2547c000000b004f13634da05sm751594lfn.180.2023.05.10.07.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:30:23 -0700 (PDT)
Message-ID: <1a2612ff-b228-8fbe-e513-8449e4bd36f6@linaro.org>
Date:   Wed, 10 May 2023 16:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 7/8] arm64: dts: Add ipq5018 SoC and rdp432-c2 board
 support
Content-Language: en-US
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230510134121.1232286-1-quic_srichara@quicinc.com>
 <20230510134121.1232286-8-quic_srichara@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510134121.1232286-8-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/05/2023 15:41, Sricharan Ramabadhran wrote:
> Add initial device tree support for the Qualcomm IPQ5018 SoC and
> rdp432-c2 board.
> 
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Co-developed-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [v4] Fixed the address range for intc v2m nodes
>       Fixed all schema check warnings
>       Added cache-unified and cache-size property for l2 cache node
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

