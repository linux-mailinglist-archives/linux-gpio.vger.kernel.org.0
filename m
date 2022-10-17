Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F54660190B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbiJQUMJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbiJQULj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:11:39 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42EE67B1E6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:10:34 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id f8so7406712qkg.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dimKLI2qKjWwV75hr8dYm93XmJVv6ru0b43DYF3f1IY=;
        b=lRm/vM+Nkfxd6Kcp5c0oghTsSV9s/U4+tpm7pkv5nmQsLIzBqa3TR0kHon3EircuL1
         O+nPcDuWyMPPX20e6Z4mB/i9WjJJvOIxNY0AtkVKTX4BLYaopEFzFH8B3OkW/Cf4lV6e
         QGrDbChwjgMCIdGlqCNOu9C/zat8XlmTfpK/okYVxvtmTdyZ8owm2lDoihRN/VP5BXzE
         jacDKT9jInxutQxapV4TGTAkJ7sZ03pxaLwNVSLjZIOiS0Z2V2WaAHozVa3tk+sHVRNd
         +cs9O0S4IABb/zsJ7WSSoGdMTGuGChnj3zvF67cubkPONyUVSwDv3o3fqrbeUzCpSlV9
         1GiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dimKLI2qKjWwV75hr8dYm93XmJVv6ru0b43DYF3f1IY=;
        b=bjVHJK9p4w+OOCU7J7zmjLEzrTWJlnLU14Hot/RlCPE4zPbH2tx/jaelzoHBl3zk3A
         VJDSuksb/29u/hV3dsmNZiehzM8BvZG2wAzJcYyQko2b2YMmjtQjYoux6WIZliDwbfhw
         +gejfpfStwjija7s/4WysKTuZnrZzcJkSwpo+S1XVqUwDeCJhS39nmaFPmHoW7JXXHKG
         K9aWvHDxM/RR9oKa+wrQVO1ljL0nCp6i+ROD+7z7ahrcZzJ7xO+Vaz2JQjNwoBw70UcM
         dSn2QIksYUZUlRRpZNMMB0flTlWJk7FEd7hIKqzzf48df6NSjzcjxeq/aPwe2NdjQNoS
         zOHw==
X-Gm-Message-State: ACrzQf3LvXKkj700SbasCOAgx7CzJ0PP+OpnnFpvUr2m17fbmH1GdyD6
        vfRNiFYrqTtl/bsTT14Bz1nJhg==
X-Google-Smtp-Source: AMsMyM4MJGRSS4PtC6wnOefiE2BkrMc90TLVJ23FkzdE0IzOQB+/89EUcb4ZTHPtOK5cVgLKhiralg==
X-Received: by 2002:a05:620a:891:b0:6ee:a929:7427 with SMTP id b17-20020a05620a089100b006eea9297427mr8820614qka.53.1666037368316;
        Mon, 17 Oct 2022 13:09:28 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 29/34] dt-bindings: pinctrl: qcom,sdx55: use common TLMM schema
Date:   Mon, 17 Oct 2022 16:08:10 -0400
Message-Id: <166603728602.4991.16161457775238509078.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-30-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-30-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:30 -0400, Krzysztof Kozlowski wrote:
> Reference common Qualcomm TLMM pin controller schema, to bring common
> properties, other pinctrl schemas and additional checks, like function
> required only for GPIOs.
> 
> 

Applied, thanks!

[29/34] dt-bindings: pinctrl: qcom,sdx55: use common TLMM schema
        https://git.kernel.org/krzk/linux-dt/c/fd583a4f6db479a8e3f4ed3390b1cc3c258ace63

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
