Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 826D860301D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 17:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbiJRPuN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 11:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbiJRPtu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 11:49:50 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE701FCED
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 08:49:35 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id r19so9902854qtx.6
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 08:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9/gbvCVZ8iIK7DwUdLAvDXXnYd+qtT9+oSM5gVKGXM=;
        b=IGWASz9grofd91h1vAvD53WlzxBhs0KQIWjs7GoLBIj9NTG64XJbJUY1OK5O+id/4z
         R7CR/VhuX1jVpWTdBpdIUAVqbGKorj46b535HpE+dCwGrUbKHXYIX1KjQrKlJovshZae
         q+x/nW0dAN9Z98VReGEY2EuQrfxDZAwU4w+f0b2SdREUNmjgUcSytqr2dRRzBztw0C3r
         uQshFXoL7gYgC7Ee0yBThzxtVMnocQ/8U6xMven2Kn+3Gw0On/A3YCsSpOGoCMYd8Jqh
         48uGpQm5LzCLGC7LUg6BEsLG/PN38DWdkkTnoPKT5Dd2ZJ+TfnrPBpB1rxwRn53LxWkv
         aO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9/gbvCVZ8iIK7DwUdLAvDXXnYd+qtT9+oSM5gVKGXM=;
        b=1p8vX8goecX7TMEDQ0kAkZVZDKbbUT9rPadAkyzMs/QDVos20Gz0NGt9zuz/7fOFiT
         ykjqfGcu3bCUu3VcT9ssKXjh03Y77nFZc4V7sE/EMIiNR8GqczHUldR2AwD3pciRrzo+
         8/4g0tnbK5wrZ+b/NhwD2SfKX06sJtHtgk8pESaac91mhrUd4YEPv8+yoXa9uCkXHvRY
         nh0iXOT9ca9ezXg0OoAF1dmKOc2i7idVTW1A2FMtT+TqetI4rc/xCFm9nAtevHM7Hx5l
         uLSEQnxxwCiZ2cbySWUqZuP5w1eGFyfBWsIyQ5C7JztZ9iLlXFaJi2YR0AaHN48A5KM8
         L6Xg==
X-Gm-Message-State: ACrzQf3fRq+24kpTNbzjLPAkF7yp1IP3Q1KjmOeZhzh2eCwATqRaPNDJ
        i8RpGs//GWAy3ETH4rWcQC4lgg==
X-Google-Smtp-Source: AMsMyM4HugIuZ4qeTnQFtGTGK45DMjfSABvWxEzY37vX7q0nB7SxlPg8WZrzCFdW+FSd1skwX0Xwrw==
X-Received: by 2002:a05:622a:1013:b0:39c:e5fe:6321 with SMTP id d19-20020a05622a101300b0039ce5fe6321mr2634773qte.66.1666108173983;
        Tue, 18 Oct 2022 08:49:33 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id c25-20020ac86619000000b0039543f89109sm2029202qtp.96.2022.10.18.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:49:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 16/17] dt-bindings: pinctrl: qcom,sc7280: add bias-bus-hold and input-enable
Date:   Tue, 18 Oct 2022 11:49:08 -0400
Message-Id: <166610814672.37912.6435598751868796642.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-17-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org> <20221016172212.49105-17-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:22:11 -0400, Krzysztof Kozlowski wrote:
> The SC7280 pinctrl driver supports bias-bus-hold and input-enable, and
> DTS already use it (sc7280-idp).
> 
> 

Applied, thanks!

[16/17] dt-bindings: pinctrl: qcom,sc7280: add bias-bus-hold and input-enable
        https://git.kernel.org/krzk/linux-dt/c/a92ffc90739fdbb2925bccdcc61f3aa8b62c15b2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
