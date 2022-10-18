Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB8560300F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 17:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbiJRPts (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 11:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbiJRPt3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 11:49:29 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15581DBC
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 08:49:22 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id b25so8890074qkk.7
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 08:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCo1xOY01cejeRlFeZn0Jtq9ZufHMdK6OrIjoKrAc8w=;
        b=GmeKk1kVtm+Z+AoFXK425f7kyMH505W4C+1DQkCHaoHABhSXgskTaBlG6wPpR4oFvi
         XEc06f3MBZ4q7AVZGCG7RFw/P5HPzoszBUjFYLkf1TWhRGdfPQaYeRmEQWjGUGMke0EO
         bCM9nTcEFxCC99Mc93XOoGbThH9++e/QEueYx2OCn0A3mw0sZqRMZEDb5RinnuGeRVQZ
         NLkVeOXqB0JscqkyTMYd2qXHgfBuEfLAfoPta9zDfjALF27WNVKnhYL/IF7EEIrGGdco
         7psed9Ejokc7+cmZuuHSGlpTNANEZJQBAH3rWkPD0g8oMvdS2IXopkoQc3ofdqZH8Vmd
         4XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCo1xOY01cejeRlFeZn0Jtq9ZufHMdK6OrIjoKrAc8w=;
        b=qtmDF/qm2Qq0EdvRQhk+Pt+4mupjcINnQoG0qRlPsqHWJJYnyncc+/pIsSi10GQR2+
         sPx1/qXuTx8az/rjnC3kDL6exms0AawI3YL+NXfGT3u+sGxeMwgMBTs1d4PEdY/O4L7B
         jRkTqRDrERN7+BIgDv9EtqNnMRSFkKUm1xiU7YHWhcL4RxjjRsQRQCaoP8JMqVJmWYWa
         0HVkzXTiYjaWq62fuLEa0OMPKCj7VPt1qGGPCYRxH2jHDjS/CuLO9hhv5DRhPm/AEEwq
         RIBCIVkWkIbnntfQ6q1/TzHq+EArk81cr/flAzZ2SNITpi8aMGGc8cb6HCgZ6kdcNglO
         Rm9w==
X-Gm-Message-State: ACrzQf199YRcw+B4/WfAhUFyBOJtGWsGmPXbDw2iYatyGfpbH36u8/2L
        RWckBygJuRY2z+corjhtbMHw9g==
X-Google-Smtp-Source: AMsMyM77riaATFzFE9bB7TQFKuJkwJLxnidS4LFNnUq7FMVjhEuln3OJYf4jeJodZMul8/HxGsBkjQ==
X-Received: by 2002:a05:620a:152:b0:6ea:d82e:f7e2 with SMTP id e18-20020a05620a015200b006ead82ef7e2mr2318511qkn.164.1666108161572;
        Tue, 18 Oct 2022 08:49:21 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id c25-20020ac86619000000b0039543f89109sm2029202qtp.96.2022.10.18.08.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:49:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 13/17] dt-bindings: pinctrl: qcom,sm8250: fix matching pin config
Date:   Tue, 18 Oct 2022 11:49:05 -0400
Message-Id: <166610814671.37912.11634519342649854274.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-14-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org> <20221016172212.49105-14-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:22:08 -0400, Krzysztof Kozlowski wrote:
> The TLMM pin controller follows generic pin-controller bindings, so
> should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
> (level one and two) are not properly matched.  This method also unifies
> the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.
> 
> The change causes indentation decrement, so the diff-hunk looks big, but
> there are no functional changes in the subnode "properties" section.
> The only difference there is removal of blank lines between common GPIO
> pinconf properties.
> 
> [...]

Applied, thanks!

[13/17] dt-bindings: pinctrl: qcom,sm8250: fix matching pin config
        https://git.kernel.org/krzk/linux-dt/c/a327e870af48c7f0bde57263c6a0ec65b0192217

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
