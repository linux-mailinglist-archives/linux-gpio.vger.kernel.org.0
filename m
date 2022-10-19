Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026286049D9
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 16:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiJSOxQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 10:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiJSOw4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 10:52:56 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 191B629359
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 07:44:37 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id d13so10814958qko.5
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFqmsof4elJm21pzoAg/G9G0xB8dLKzDp3IL7lx6FJw=;
        b=we7OpX9NoPh6lBqA7TpqJlgnmCqiMs+2U03f4+7/XFHxZct/6CBLsVFHM5L0lUubNg
         QQmu0nnGOobJ3/ctqkiDZNuIo+YhXrwC5I43APTP6KFl7vTUFEV+RLFNZJQPTz3kTrRQ
         oS3OTm1HewuC59pQIrU8DTzqMD/JqY0jKHflGy3IpjglBZYmo/ydPAgl4BgkZeYNZDfX
         U8MomcQg0lbDZJVBVl5jhrwF5L6Eusi/gFM/JM5VP82CxuKg1yAkVpBapqlhzf40o/40
         eSeAKNtW1PynQoGi+hHeLVZ7z5DruHvjJ2mFEiZATmbGhdUtlBfPnv3C0EPdw2Hu5ese
         LodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFqmsof4elJm21pzoAg/G9G0xB8dLKzDp3IL7lx6FJw=;
        b=2x26ykoDjNS5vTd+TiViiWCZ9EUPzaKB11+hbg1YhtsHHzRCfnrV6h4L7BQlfNr/sH
         th6SUPtDzfCgSZzgOodQ1VOl/f2GP5q0Ehiy3i+ekFUUURD1TKtlbg/vd9w4GVZNcx5U
         W3w2d0NlatD2smx1G2Su3h0nG9xRIIX34EkUuf1Bh1HVWKnFBf5pPiFnSSz/QIvSMhBC
         7CAuSyzl/wolv2zCKdxf+Fsx6EGLyNZqWvgVT2ks5g/bRMhMOsZG6rQLfA/lbO/L5F+V
         JePVCfngL2rhbWe25auA2n2YJiTbm6vGstPMAafBwGCCrdi8+GzKycYCovJFe+8VK5FB
         fWQA==
X-Gm-Message-State: ACrzQf1PDjkDuxpVvNaU05wQLy7lAX2n7v7TNYF02WZuXWZ2HF5INTRi
        9fWgDsAenf/mifElMINdiRVZzA==
X-Google-Smtp-Source: AMsMyM5L/3yBf3HXAEt118QSS1F24MC2zRKuqhpDUVmyZk5IURkgVDDQ+7XdT35NHbbOBJieFOLRKw==
X-Received: by 2002:a37:557:0:b0:6ee:790e:d1d1 with SMTP id 84-20020a370557000000b006ee790ed1d1mr5899619qkf.118.1666190676793;
        Wed, 19 Oct 2022 07:44:36 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id y9-20020a05620a25c900b006ed61f18651sm5211917qko.16.2022.10.19.07.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:44:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: pinctrl: qcom,msm8974: convert to dtschema
Date:   Wed, 19 Oct 2022 10:44:29 -0400
Message-Id: <166619067067.168589.14766691488395495770.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017012225.8579-1-krzysztof.kozlowski@linaro.org>
References: <20221017012225.8579-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 16 Oct 2022 21:22:24 -0400, Krzysztof Kozlowski wrote:
> Convert Qualcomm MSM8974 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,msm8974: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/6f3ff1689448448a955af4e0bd7a210ca7aafed9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
