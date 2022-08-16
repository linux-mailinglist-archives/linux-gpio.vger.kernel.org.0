Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4116C595D5D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Aug 2022 15:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235720AbiHPNao (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Aug 2022 09:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235779AbiHPNaX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2022 09:30:23 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FE0B8F04
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2022 06:30:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o2so14959683lfb.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Aug 2022 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=HS3oZr3WBhNNsRHtdxFrbXCE2V9zgobb5QWVf0AGmdY=;
        b=hkBUgKtApBf6JtTX0hC2k+Z0jGioeWYa6a/JVa5tXkNG5uZjlGMVy4rdTzS/lJfu1T
         xQauPa0OuY6GxehVYSl1oNh5WJ0ng1KiGGOcziZqY+EdF3tYAdjGVLDMmefJK6oxy41j
         Jn1C24mnEDkpVsS4W2S1MQa/nnfAvl5vqhwKUJTcrTpG1kwTAgxm3ADXa/zk56cvMupO
         ILMAcMGCThoDTEwr/DCYvdJx6fjrEq3TKnLfooODc6hMdR4vG7l+ABZX7np5ngETKtgz
         uOfp/vnx3cHr1H/4DFm7SlEB+1lC/rDinO26R/UwCxf8ycklEy9XQIzzUH937q6T54Uc
         RQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=HS3oZr3WBhNNsRHtdxFrbXCE2V9zgobb5QWVf0AGmdY=;
        b=hKv/HAcysdCptQ5J0Dm1EI0HCvssmCnV5wXWuUizJ3jnihW1mu0tbcnoOUz7qjtK0O
         TjEQs+aV5b/V5bphPOKh3LWUmpAVkTpVyz9IuMYJEYh3q1eTau90FEv+QpJfkfGH2r5x
         nwC4tYjaonAtFhxDUQ+E5RE4ACE2jFBOneSMFZGWrLXNB1BcSAQW96RqApUgCWeE4X0P
         llpKpz7UUo1+bKT0ytr5VXkNIx0516G1vumJLZ1aGnfk/ovQz+waMRa4+bFhf9P8inTL
         x1EyEKP14dW697CF4B5f0lAuMltk3V/lBneuwtiBtvFbkyRXrImFhDQ5nQqIMjWsfMtD
         vB5A==
X-Gm-Message-State: ACgBeo0C3+O3ZJZ2Al6D/3OegMUtxBb5TkJ8UBtSjmUU7N5BhAEkWQW/
        I8Zf/h3SmI0pWpmRiEMDSnsxyw==
X-Google-Smtp-Source: AA6agR5tpEp1fDlN49U9Zv9v0kUqYCywdThruRzO+ILElAG4Qm47gDL97wqjtoPF51H2AioBtrdEvQ==
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id y14-20020a0565123f0e00b0048a5edd99b2mr6712350lfa.124.1660656619410;
        Tue, 16 Aug 2022 06:30:19 -0700 (PDT)
Received: from krzk-bin.. (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id k19-20020a2eb753000000b0025e42f8e771sm1816301ljo.34.2022.08.16.06.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 06:30:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] pinctrl/arm: dt-bindings: deprecate header with register constants
Date:   Tue, 16 Aug 2022 16:30:14 +0300
Message-Id: <20220816133016.77553-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Changes since v3
================
1. Add patch 1 - bindings example fixes.
2. All dependencies were merged, so this can go via Samsung pinctrl tree.

Changes since v2
================
1. Split last bindings patch per driver changes and bindings.
2. Add tags.

Changes since v1
================
1. Correct title (in the comment) of each header (Chanho).
2. Patch #7: Adjust warning message.
3. Add tags.

Description
===========
The Samsung pin controller drivers were always expecting DTS to use raw
register values for pin configuration (e.g. pull up/down, drive strength).  DTS
had these values hard-coded all over, so at some point we decided for
convenience to move them to dt-bindings header.  Less code duplication, some
meaning added to raw number, etc.

However these constants do not fit the purpose of bindings.  They do not
provide any abstraction, any hardware and driver independent ID.  With minor
exceptions, the Linux drivers actually do not use the bindings header at
all.  Because of this "dt-bindings ID" approach, these constants were re-used
between chips, e.g. Exynos ones in S5PV210.  These does not make much sense
because the values between Exynos and S5PV210 (or S3C24xx) are not related.  If
it was an abstraction ID, this would be fine. But it's not.

Clean this up by:
1. Moving the constants to DTS-local headers.
2. Deprecating the bindings header.

Tested by comparing DTBs (dtx_diff, fdtdump).

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  dt-bindings: pinctrl: samsung: stop using bindings header with
    constants
  dt-bindings: pinctrl: samsung: deprecate header with register
    constants

 .../pinctrl/samsung,pinctrl-pins-cfg.yaml     |  1 -
 .../bindings/pinctrl/samsung,pinctrl.yaml     | 63 ++++++++-----------
 include/dt-bindings/pinctrl/samsung.h         |  7 +++
 3 files changed, 34 insertions(+), 37 deletions(-)

-- 
2.34.1

