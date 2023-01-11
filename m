Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63E4B6657FF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jan 2023 10:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbjAKJsX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Jan 2023 04:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235879AbjAKJrg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2023 04:47:36 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E22AE52
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 01:46:07 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id g10so10676922wmo.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 01:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8qJr9kxb2tGVbF6bozT+Foz2HcY6He6TrHRTcyBEDM=;
        b=rsjaoGyhFkfmSubHNTKsjmnS6j/NmQ2fI7phFAvhMi1KiNzoVpbU32S/6rCEQav80Q
         k8wcwGy3RWZ7sAS5zTiIob3nVWXuDCVwKQJBl5dg0fbA/BO2dARaE+gLiJu74Hykirhy
         nTrYygWQ6HxEpJf18QaCMVhwgthjG0/ZcU73PjN1mvRVqgMD+4Hy5ssT1PUJSHTWGpEe
         hZDBKFXVTpmqweD8YSHKy/16VP/8WYUvrHZJxFB9ZY5xzgFp+DZD+xF998O60Dlr4ph2
         63enZTgXLDiIS81V7cev0/G770QAuiHVx1BD/q7KMVDK0OqjzW4YrDq8K2g7/dJPQPW8
         cTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8qJr9kxb2tGVbF6bozT+Foz2HcY6He6TrHRTcyBEDM=;
        b=7RF3wyyhvXVXzPsEjFdhjo7UDfgSRaYPclwwbidLU3lOypy+0J98MR6g+vXKMBe2xd
         UqwliSAJtuOjh+M3r+exGUHmo3LYkMZEuS2CE3M4yoIaHNouELE25WOGgoUnLhc7tFPk
         O+W1pmkc3pUhqaS3YYZArwAdyB+NEIy9b4CjtjCciT0IKk8d8m8fRCEvMs227OXZRTgq
         x5lJsIcYZ8SU9AZig9HlL2ZZrBA+rghRqGL+8TSINQSI02p8Hty8DrfTLtl5iijYBar7
         xAr9aL5jrqRRg7LdK2Rma3+gkWzW92rzq3jhAmPzShudsfOjlx5tZA62vEqCHir1WctQ
         +Udw==
X-Gm-Message-State: AFqh2kr8gOB33fKVjjG7zbWPbP+URyfQ7wXYcWsq4IZDl52tTucHjbyF
        3sMpRVOMRCMbO55bETFT3Icopw==
X-Google-Smtp-Source: AMrXdXvOSu6TmuYVPNW8+fAGh0hq7brP7g4tp3JJcm7IGvJ4njHTnFBbiRTuZMJLH4ukwt7yYhNCQQ==
X-Received: by 2002:a05:600c:22d4:b0:3cf:82b9:2fe6 with SMTP id 20-20020a05600c22d400b003cf82b92fe6mr61741450wmg.8.1673430365782;
        Wed, 11 Jan 2023 01:46:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t8-20020a1c7708000000b003d9f00c8f07sm9678192wmi.21.2023.01.11.01.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:46:05 -0800 (PST)
Message-ID: <4d3003e7-f671-9971-dd3e-08b8654473db@linaro.org>
Date:   Wed, 11 Jan 2023 10:46:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/7] dt-bindings: arm64: ipq9574: Add binding descriptions
 for clock and reset
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230110121316.24892-1-quic_devipriy@quicinc.com>
 <20230110121316.24892-2-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110121316.24892-2-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/01/2023 13:13, devi priya wrote:
> Adding support for the global clock controller found on
> IPQ9574 based devices
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Best regards,
Krzysztof

