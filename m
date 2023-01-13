Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57CFF6694B8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 11:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241365AbjAMKw5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 05:52:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241175AbjAMKv4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 05:51:56 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B596276AD2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 02:50:36 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id qk9so51414476ejc.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 02:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86YNKV7ERvs48G31PrQn9Ba4ne43LtOrEHPlldl2cQc=;
        b=SjCu9NmsN8+/FE+4zR5zjEen0WKSRDIdnrW/35oZDlm3KMLq5OwU8rL9WJvFIsUgM0
         qjCbJsbwvtU9BewrboKhPDlo8i35N6RoVmXcd01ZrlXUHOFozt0gr2dVbqCj0DC99zyP
         i6duGuTNDBvrbmJS1hHfG7YH4ndqvMPfcJs/AjkWylffJeHhPfSm4aIdjJbsxuiC9wiw
         pouwl+L2072ZlTAUqX/DVIfCcfcf0T9q7QEWE+FiQVJRrdfJpl5Fx6UpiUEaWfCe9Vsy
         1f8vgMVA/IWHII69VgVfbY4JiOz9JYIzGnc3Q1vG0mSv/67qj8W5GwgTgBvipv9rYpT9
         x6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86YNKV7ERvs48G31PrQn9Ba4ne43LtOrEHPlldl2cQc=;
        b=0zzp2BBdh5O5MRZ0ab8fIEbxm9PlIUgEOHz/QAUpoKpycZwi94N5X3m/GTPOjNXF/m
         Ca/WrD0fj+XJSo05NvpJYdPJE595SMvB13ttZi7qpVA99IiqVrE0sDOa0L9UmvQhfajU
         P0xG+JvrTwBxPjczkghSma+DxJQSqjX6wPSsJvVTqiETKrnF4EpDwJB8r+v6dK6GxJ/V
         XQAxXoli0L+U/3kUpI0A44kVSveErH0I/OZ8jWldsgb43xUzafxqUf1FTs8K1xSuQkYY
         oHeFb9iDrxok0y6lmT7Km7SNWW8Q1bSiOHgxJSJBOo7xBXoe1KPXYiUkxRdHRzb9CXWL
         s7sg==
X-Gm-Message-State: AFqh2kphGofM0YLbAlVaMJxsEhjWonJgrc9cDMoWCE7DFMY8AaLRSHpv
        EazVKbP19qdUvpEf2AKYgKNMAwIEuacMZX/o
X-Google-Smtp-Source: AMrXdXseGjAkr45KZ2Ab4zyWoR5AjO2Aa9xw2TTqtXy6bDE4JKAHstbJ0yHwPYUROCC7qmH+3s7tTw==
X-Received: by 2002:a17:906:7747:b0:7c1:1804:a0c7 with SMTP id o7-20020a170906774700b007c11804a0c7mr65582144ejn.75.1673607035104;
        Fri, 13 Jan 2023 02:50:35 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090618a200b0077a8fa8ba55sm8348581ejf.210.2023.01.13.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:50:34 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, Iskren Chernev <me@iskren.info>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH 4/9] dt-bindings: pinctrl: qcom,sm8350-tlmm: add gpio-line-names
Date:   Fri, 13 Jan 2023 11:50:15 +0100
Message-Id: <167360698783.32701.5569639381957095080.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230135645.56401-4-krzysztof.kozlowski@linaro.org>
References: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org> <20221230135645.56401-4-krzysztof.kozlowski@linaro.org>
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

On Fri, 30 Dec 2022 14:56:40 +0100, Krzysztof Kozlowski wrote:
> Allow gpio-line-names property (quite commonly used) and constrain
> gpio-reserved-ranges:
> 
>   sm8350-sony-xperia-sagami-pdx215.dtb: pinctrl@f100000: 'gpio-line-names' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
> 
> 

Applied, thanks!

[4/9] dt-bindings: pinctrl: qcom,sm8350-tlmm: add gpio-line-names
      https://git.kernel.org/krzk/linux-dt/c/86a8754b08de4d9d5bd1f31b56283efb8763b8c7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
