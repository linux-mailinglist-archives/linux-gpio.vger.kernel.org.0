Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9613F6DED2E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Apr 2023 10:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjDLIEJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Apr 2023 04:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjDLIEI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Apr 2023 04:04:08 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F2059F4
        for <linux-gpio@vger.kernel.org>; Wed, 12 Apr 2023 01:04:04 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id sg7so38046129ejc.9
        for <linux-gpio@vger.kernel.org>; Wed, 12 Apr 2023 01:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681286643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7sCYQWmrIHjLodZCUEstj/wAUl8903bf+mCezIM9gIs=;
        b=TG3HVhuvb+yHg3+UCrQWVrPaZhnVggB+RTvB0Pk09hNmrC2AYQz++koo4E4+CDrAOU
         pPLu4b9mtg8xMwyxSv0ujdYIw/HzwYiN/TJeZLZD/8GKuGrL5i1+x166V2W1H0TqBPde
         Z+LyeS8tth4XhHd7jdXS2Gsu3+qgmtwuSo9ncvGkxin3QOIkBuAE1R6L9ANkI4lf8ZFU
         +3s4PCb0Xmk9+YoCb42tdD83/YeUZhzsDPybPBh13YPKEF7mXd08dRL9zdCh0ZDJNdV3
         tGQbkY93qCRDW3kpUUKV+OXW297TqIFpSKHBYQ4qxCnzZz1oS1tw0BQgVmev7RsazY7s
         VCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681286643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7sCYQWmrIHjLodZCUEstj/wAUl8903bf+mCezIM9gIs=;
        b=CCZ12BwzXsab4qqufUrvI1FZq9PBRvRJc+XSRYWWErl70KzgBKELsZ3QZSz5aac/cO
         E1oChxeJ/OmCBPQ/9bho5UyPXb1Uv2abcqXu0sVhF5ypAV0dMBTfUyx+XvL1UGbE/Teb
         7nety4B2Ckb6eBSbTJPb3K6Uj39R1yVfKsI4ymQpanYtMudfhufADxNZBU+1Yk3N9L1J
         88FcwFS8Ej1iPs+5NXDizMR8uHeYMvtSYkeYz1Q6ZcroLdpTc2rdsq9iBG2NhbmTbw/Z
         YI3ad5niERytXhSzuPERp97rUnokphP8rZFHXF7G3HbEAkkrgKblIL/rr6gIrf9kAa7z
         yelw==
X-Gm-Message-State: AAQBX9f08zit2y5NeYWJ0rZRtvn2AytRD1PTPd/3cBzExISPMTWfZzlH
        vB6UK87/lwt16OOCoBVFxKsh9Q==
X-Google-Smtp-Source: AKy350bqsn9FugkvkWfL/MPu3dTIMA0gp1RVfg+cMrbd9FUEsvEngyqRYlsTCIugeFcFo52sPdNCog==
X-Received: by 2002:a17:906:8601:b0:948:6e3d:a030 with SMTP id o1-20020a170906860100b009486e3da030mr14441369ejx.42.1681286643266;
        Wed, 12 Apr 2023 01:04:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id sc40-20020a1709078a2800b0094a84462e5fsm2998603ejc.37.2023.04.12.01.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:04:02 -0700 (PDT)
Message-ID: <848f5e3e-44ca-3648-2d6b-7e06ce7b5cda@linaro.org>
Date:   Wed, 12 Apr 2023 10:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v13 03/15] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To:     Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org
Cc:     Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-gpio@vger.kernel.org
References: <20230411184313.3679145-1-sean.anderson@seco.com>
 <20230411184313.3679145-4-sean.anderson@seco.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411184313.3679145-4-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/04/2023 20:43, Sean Anderson wrote:
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, and some registers may be omitted. Because of this, reg-names
> is mandatory, and no order is specified.
> 
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.
> 
> Changes in v13:
> - Fix references to brcm,bcm63xx-gpio.yaml (neé brcm,bcm6345-gpio)

You got some of the same errors as last time.

Test your patches before sending.

Best regards,
Krzysztof

