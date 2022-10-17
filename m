Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25FE2601D0E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbiJQXCc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbiJQXBl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:01:41 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D9D8049C
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:21 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id d13so7664887qko.5
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSxECrikAeXfssATxfomgxzLebNGhh3XjC7E0VIMzV0=;
        b=ea90eX6hFLH1aMqdAR8asohMJVNs/uP1+M5feLY9APL5AgWJP0d5/vopNiOZ6b1qfN
         CSSPQrZv+I5YSzRDgAFJfg5vH9XNHUN0aC9ghxUqgIO3fu4eYgehdqnGvvEsSODC3oSD
         92nZBSFeb5Y/kRxmA5jm+i6b+TyRuXsSwK62mh/EVIuYan2U8GUzgK+uz7+EQw0thTNl
         JZbwhzzv8xlpv3s33GVm5SqDtWRZZYbZJ6+mSH8T6TLD8s62tLOesT/huIrRzfM8jaTQ
         qs6Z6DExwYXfCdEI48/2M8FV/bOVPzPbeMzgl9ztku9dzCzMCyhiMBImJiZ/3kHIGv4K
         GkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSxECrikAeXfssATxfomgxzLebNGhh3XjC7E0VIMzV0=;
        b=IoAly3i236uncwy6czKY+j7R7zrOiUMDlYXUeII4fHzkfQ8SmWP2fLNP89lTi2msoH
         /3xs0aBAEUQr09TJUFD8LVerd2XfBmmBeyotZPbQx1s4LrfYASP57tXOBkm8geCfwX+w
         JM1VICUDDBBdu76jVWERdfz9gYKK6VysuwVCGtrrJhudst8vRUy09OxMWvmmM4oy8VkB
         NTZYRP/HCIE50tos2X4YLOvba2Bt5vWseTXmHXchNZZh3BU0erQ1cMIltF2nJiigBGfJ
         gW0cu1tlWbfYF1cEnrzY6yYstPMUVpCawhdmfWF752qtQ8wLoVTwBxNOo3SCk4LB2ITn
         QX9A==
X-Gm-Message-State: ACrzQf1WGI1I9Fz1oSv2IU3q3siGNiTH+M58SIBaTD8emJrsQ3em6Iki
        QZnaF31Y1RgdyQMX7g/aY/gOPg==
X-Google-Smtp-Source: AMsMyM4yLffsl7Dszfa5jNIyM3AxB/XtyrTblPdwYj2K+VwX0IVJw+dpTnMtzlncqRm6E57YKvCfng==
X-Received: by 2002:a05:620a:408e:b0:6da:aac5:390d with SMTP id f14-20020a05620a408e00b006daaac5390dmr9330600qko.745.1666047680874;
        Mon, 17 Oct 2022 16:01:20 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id c25-20020a05620a269900b006ec51f95e97sm858491qkp.67.2022.10.17.16.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 4/4] dt-bindings: pinctrl: qcom,sdm630: convert to dtschema
Date:   Mon, 17 Oct 2022 19:01:17 -0400
Message-Id: <166604765632.48316.12007024171680924159.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011190231.76784-4-krzysztof.kozlowski@linaro.org>
References: <20221011190231.76784-1-krzysztof.kozlowski@linaro.org> <20221011190231.76784-4-krzysztof.kozlowski@linaro.org>
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

On Tue, 11 Oct 2022 15:02:31 -0400, Krzysztof Kozlowski wrote:
> Convert Qualcomm SDM630 and SDM660 pin controller bindings to DT schema.
> Keep the parsing of pin configuration subnodes consistent with other
> Qualcomm schemas (children named with '-state' suffix, their children
> with '-pins').
> 
> 

Applied, thanks!

[4/4] dt-bindings: pinctrl: qcom,sdm630: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/5c97a94cc3707ca7ed652131717f331678e887c9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
