Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDA46D19B8
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 10:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbjCaIZJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 04:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjCaIYY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 04:24:24 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A191B7CE
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 01:23:33 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g17so27908407lfv.4
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 01:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251012;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SFM/eoJq62VMd0BThJcIsWt0E57OGZL4qf+KcrA3TXM=;
        b=qjBLAWtwVkcMJKOf/T/zHVv1LHnyI0dYBudnw1wyesrWNPDE/UH+dZ0bG6t4MrjHmm
         rBBbOTK8Fivj12NbFtEWthmJU/vyNbHTvSbwlJR+rM7ufQWTGDagP2WH+qCt8kmePvov
         iiiIN4fyAPCHSIIkTxkdd2OOEWlYEZSzirBzt8JJDkqotaDfQcE/c4KTAb2rAj/vMGs1
         lVAsOZlgc3GgEE3fx6OoAyTQXbVHZSOQM5UrZaMEzlmPY2ZrVz/zbb7qt7TxpxJMniwq
         b9CdtqGL46fkIm5Wdigo2zj+ersnKnkARaSgqFUbz5TMzvxmRp6Bdke6LF6T2BgEI2JE
         G5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251012;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFM/eoJq62VMd0BThJcIsWt0E57OGZL4qf+KcrA3TXM=;
        b=dgU6LDLZgVbZPg1gaCsT6MLKLSjS29Y+06K45/FD11+5dgkpS7H5c10qDbVUhQ0hgc
         hM242K3mvPZ93RMpd/672RdEGAn1t7m4YdCxclTbxsXJk7JXvXL8Xw2PTisLKZs3VSc+
         acnKjSyMB00tvK8+fVDp5TAXvyhBUYs6sMZXvJenJVoglAh5S2v9AZRqF1EZWGgv4Al6
         eZd37gYZTu5Dv7R8SGlxzx+ZWgBcNET57GTM1vyixwIh1D7iAWxjl+aDi4RjTDWraxsY
         bwfADkNaCtVD/X6XwSSqhQIh3EBDNpAgJjuCKSAnLEpYZxe/9d8qkXsfEq2i3XYHktDe
         esAg==
X-Gm-Message-State: AAQBX9d4MC0SfnsAT4XTkAdvoMBRP1YAgMW/4Gr3uMXhi6j8C8UXR0T/
        KQpQo19qU0h1LKvfQlm7VW72hA==
X-Google-Smtp-Source: AKy350Yx2sdKgu8tI9CRCsLXniSwS6JAiBf3Jf4pjSYqbo9lRR7T1GxMyik5Jl1LaHt+KwpoJ99OCw==
X-Received: by 2002:a19:7003:0:b0:4dd:af76:d3c with SMTP id h3-20020a197003000000b004ddaf760d3cmr8275543lfc.48.1680251011806;
        Fri, 31 Mar 2023 01:23:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v11-20020ac2558b000000b004d85316f2d6sm282684lfg.118.2023.03.31.01.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 01:23:31 -0700 (PDT)
Message-ID: <a4d235ea-8476-23ad-6678-1ecbce93ade6@linaro.org>
Date:   Fri, 31 Mar 2023 10:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: xway: drop the deprecated
 compatible strings
Content-Language: en-US
To:     Aleksander Jan Bajkowski <olek2@wp.pl>, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230330212225.10214-1-olek2@wp.pl>
 <20230330212225.10214-2-olek2@wp.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330212225.10214-2-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/03/2023 23:22, Aleksander Jan Bajkowski wrote:
> This code are marked as deprecated since kernel 4.5[1]. Downstream OpenWRT

References to commits do not use [1] bookmarks.

"since commit ....., in v4.5 kernel."


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

