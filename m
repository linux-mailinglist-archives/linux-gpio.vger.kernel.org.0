Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3C076834E7
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 19:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjAaSLa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 13:11:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjAaSL3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 13:11:29 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60C23B3E8
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 10:11:07 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id y1so15070017wru.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWOkPOxt2qf1gG5sEfiTsnx4l5TC5v5zUyamsy5O9Cw=;
        b=T6vnV4P7p6PVM55GtM0V2/WeG5zBy3qCZg6EoRNaBppZhh1UkwnSh3vv+O4n+8PbGm
         3ueb4GjUoVRi/Cw46tGcM7zR+UvwdU4b3iTHYjfR+OSxsKm4lCo2QGQToRcA/fAM9T+X
         gndtBGFOZkAAuL4inSMiS0amYktF9J3LUjwGW/Z/zpSTFSYkbKAzVyVO4iuoHq/UQHTK
         iFdtXVcH1e0VasSSI6ml4r7rdLy3NeJj/x5AHj6fGT2dTgUXnIqkiB0YsTTR65mIm/eo
         1/lBpzxRZ/4g24lkSC63EBSV8TvfJgAlNoBhknfhnc72QQutWAZrBAyr9o4/R344Km+Y
         kU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWOkPOxt2qf1gG5sEfiTsnx4l5TC5v5zUyamsy5O9Cw=;
        b=XzSon9qW8n04G/vcgL1KvkmDMGIH9io9V1XB3Ls8lpry68YbBQ5OoRa4GOd+zO+rBP
         jv9xWpZfShu753tB6T4rZjLrmuxkhgH/frm1M/SbaMGr9hwBvBoclIRB9IuvkEIFi0OX
         MQ0HUtgpbdFVau6MwNNU31m6+hOReFgwXbPBtBkgktn6kUxXJemUqrO1fwnuMTENxmJ3
         8aJ1ChDLZgcW8Iw0KvU6+Ie6WP3RbjbSuA3GUMYlRpcnH+n4inplCVqVb3jPWdc0BBlW
         SHdeucwmMC9dihHbJM45sMNUnqvHGC/DsaRax7rlFRUpSjPoBatztSisDWm/xEET/MuH
         01rQ==
X-Gm-Message-State: AO0yUKVDL5jZ+hxbW3ZyIxgZ30Vw6bAVYF4PyfMwA9CbKWOuz23Ti6sR
        KrQhWOicG5gPUw6EADchbC71kw==
X-Google-Smtp-Source: AK7set9JK0ZBUUaDhEm7/e5P17cu9FTQca5M7RmQSailclmFvRvrsxzB37db5I4kUChz3yTE4Nwtdw==
X-Received: by 2002:adf:ffc3:0:b0:2bf:f735:1303 with SMTP id x3-20020adfffc3000000b002bff7351303mr5420825wrs.55.1675188664799;
        Tue, 31 Jan 2023 10:11:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n17-20020a1c7211000000b003dc3f07c876sm14094039wmc.46.2023.01.31.10.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 10:11:04 -0800 (PST)
Message-ID: <58d8a765-7873-d00e-d995-7aeee1061e25@linaro.org>
Date:   Tue, 31 Jan 2023 19:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 5/7] dt-bindings: arm: qcom: Add ipq9574 compatible
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230130125528.11509-1-quic_devipriy@quicinc.com>
 <20230130125528.11509-6-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130125528.11509-6-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/01/2023 13:55, devi priya wrote:
> Document the new ipq9574 SoC/board device tree bindings
> 
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

