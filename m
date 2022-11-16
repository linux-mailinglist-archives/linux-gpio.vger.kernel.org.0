Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30EB762B5CD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 10:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbiKPJAZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 04:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbiKPI74 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 03:59:56 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B01E25E9F
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 00:59:00 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id d3so20971205ljl.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 00:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4IfNeC1Qcq4fPLdPB19ZJ1fa7AFFBmM6/Rey4bmXio=;
        b=OGoju5uX3y8iIKX9U8A6GzDLoWbtUcScchGeoye14nl6MlB84bERq48ZRCd+yfeLTZ
         MgNKXX80x9CfJFl06epbK2NwP25K4YRyHPc5SdsEnb4ZqIra2mLPmgdgPHgKf93TQP8C
         EIt9KV1sY3mdjCMTO8pPcGHc1pK3yMuv8lsrsEnyVfBwC73+llrHxJFRGDqHsTGkeMH4
         6e/A6f3TBKcrR8d0L0pQk6QXu0rQumEy6wtiHW29Mo6jnJ9wnT9RvGklmNcE+q3ObsXX
         m0Y+iCKdts5XqyR6TTLnrNiQGLQOoI1SZV+YEIRjRjrqFUiuZakH5ODsdv5vbMOBY6zl
         LnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4IfNeC1Qcq4fPLdPB19ZJ1fa7AFFBmM6/Rey4bmXio=;
        b=2pX2xKKSeX7p1Q6NPPGxnhWII6WcTyaqwykd9WUMJclNqw5pw4pIhdL1VYoT8E0NQ/
         ewaopK782NAfNjrlP4S4hDkughPG15JkxqjLeMiad1rwWOxU8vU5H3ymg4ERLO4KzCd7
         wXHh8PO2kRpHmhSOWpxffh4rPXNX0ReVLWMyYj8VwqyiDBwQkuATvkeEefMliKzY/+6J
         V0iTesMm6jI2n5kGViHlTswgVOXlpODBBRe2Y/MBtGfZ2bSkUuRja1YPMu7OPPgu8fp4
         OoV4PsjEQA8JimmyxEbVbspZ6e9GWSZyHj6gK26y6APFqiZuVDrM0ZAQh/xyUHRPH3ua
         JS5A==
X-Gm-Message-State: ANoB5pm+d3s/oSky7m9fSviPii5KPD2zg1ws34TdRaJDsfIkrKFTrI5H
        4m+86YAChNB8HsPWCqlAJCJupQ==
X-Google-Smtp-Source: AA0mqf702DWyhH86Tvlj4FTgeDoZA52uJlESfzCus0o2RqxEEzZNDQ5Cnm1E4Zu/AO72TkjpWZH2Xw==
X-Received: by 2002:a2e:99ce:0:b0:279:1349:b2e2 with SMTP id l14-20020a2e99ce000000b002791349b2e2mr2454667ljj.382.1668589138928;
        Wed, 16 Nov 2022 00:58:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q26-20020a2eb4ba000000b0026e0434eb1esm2806109ljm.67.2022.11.16.00.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:58:58 -0800 (PST)
Message-ID: <c1745278-9ae1-81a4-7775-0289e9ce5b76@linaro.org>
Date:   Wed, 16 Nov 2022 09:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: gpio: gpio-davinci: Increase maxItems in
 gpio-line-names
Content-Language: en-US
To:     Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Keerthy <j-keerthy@ti.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Robert Nelson <robertcnelson@gmail.com>
References: <20221115231021.2389-1-nm@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115231021.2389-1-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/11/2022 00:10, Nishanth Menon wrote:
> gpio-line-names really depends on ti,ngpios. However, the maximum value
> we have seen across the board is on K2G and da850 platforms where it can
> be upto 144.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/20221115200357.qa2rvw3clbz7unzq@symptom/T/#u
> Fixes: c830b87a761b ("dt-bindings: gpio: gpio-davinci: Convert to json-schema")
> Reported-by: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

