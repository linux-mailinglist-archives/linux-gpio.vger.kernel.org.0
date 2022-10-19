Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 458B06049DD
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 16:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbiJSOxM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 10:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiJSOw6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 10:52:58 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA9836BC1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 07:44:44 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id 8so10825731qka.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKQEXeWxMX3FWxR8gAaDH3agUnKqOGg9yD1UN9nvtm8=;
        b=mzi1oPgKDU4nTwUrj7IziJCz8J14fzhHsueMIOH8EmxWizYURJNn/cf6F4oSNnMMBe
         GSHTxtiKbFrdP8IgqY+dMvOTBgkVylxT+YbIhwBsBeUzfGPdF5fLQSUIngQbfbr8ZLJf
         6WAHgAP+NT2YCTyUAYP02Jx+Ai77+sZN84wZHyZ5AsP3HN+z/tRTcojWzPkiHQEYfsAc
         3P4tQP3s6tiNd50llaXxxovZuR9unvXsWrQUK3nXXYsAnvqsZtQqecPz+3TSKDjtPZpg
         zPKHGLTGY9Mc9Hedh5j3so7ecG7Q4TLihKNSqIFiuwjF6KujolcDjpcpvse4JBN9wpM7
         S2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKQEXeWxMX3FWxR8gAaDH3agUnKqOGg9yD1UN9nvtm8=;
        b=FK+ICjRWedjwrjM6qG0VSG3ZZk4qs0LjznfbLz514J+rmTcwFIhm1eNEbaxq9qW0Vu
         UK+P2TiQP/TpezA+O0dIXLWMSF4mTytH4QPps9Uw46acdMI5eRS1HGX3Q3fbPxFHgxBr
         NHOsI3fYHul9WErr98w5+UZ53t/T+ApL+OBkPamvb42B4It4Dp9zM6vB+Pez5bqYSdT9
         RZXlBqxa33OSk7a+bKxLD5ROi5yJQH7lOmxHXhyUy00Q297d/S8vsmLPdzI7SA03/G1l
         JmnTtrzIWf8Fb/fVydeMLgCltKsnGVxisA5jDIRRyumfZszUQpfkwwf04bd/X4M2hkCw
         avvg==
X-Gm-Message-State: ACrzQf1EyZgm9ZugL2MDYOtDKh1KvoEULsWkzWArWxIQQ8AdvcoX4Byy
        QkYuxZ8YWqS97H1By9Iyg66GWw==
X-Google-Smtp-Source: AMsMyM4MS9IlBeVMvQA+i5ix9GNLeCLMMzCT93FeqIlxmTo3coqSg5O4NKSwLsH9Rbpc+c35WLgp5A==
X-Received: by 2002:a37:a9d7:0:b0:6eb:2696:727a with SMTP id s206-20020a37a9d7000000b006eb2696727amr5819190qke.8.1666190684045;
        Wed, 19 Oct 2022 07:44:44 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id y9-20020a05620a25c900b006ed61f18651sm5211917qko.16.2022.10.19.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:44:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v4 4/4] dt-bindings: pinctrl: qcom,msm8998: convert to dtschema
Date:   Wed, 19 Oct 2022 10:44:34 -0400
Message-Id: <166619067067.168589.15210358274400590967.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017234653.55506-4-krzysztof.kozlowski@linaro.org>
References: <20221017234653.55506-1-krzysztof.kozlowski@linaro.org> <20221017234653.55506-4-krzysztof.kozlowski@linaro.org>
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

On Mon, 17 Oct 2022 19:46:53 -0400, Krzysztof Kozlowski wrote:
> Convert Qualcomm MSM8998 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[4/4] dt-bindings: pinctrl: qcom,msm8998: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/4065e0c1f81292eb8d954fe84ea1ad2bba703856

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
