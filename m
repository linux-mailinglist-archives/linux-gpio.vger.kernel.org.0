Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8599F6C9BE0
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 09:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbjC0HVo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 03:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbjC0HVn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 03:21:43 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735951715
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 00:21:41 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id cn12so31800052edb.4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 00:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679901700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1kmkGGKOC2DOFLaKztfpmKO66ZiDM1oI9QitXcbWRY=;
        b=YFgO8izI8KPgwRdaWTv8FOGsZzcWo90//KS4t/kb55TH6spdhFgTx5xt9e/AOiv4tz
         16W2kjkVY5k0OLmHUKpVaPFLvft92e/wan6cAxh013iL2C6skGARWC7VRTL9Qiaxdgsh
         KQpZ9+p1hNeUZekqlFSlA6O2kV0UnbQoLghslbMGP/0u4IW7r7woS8qBSTM4ZN5Qsxub
         roxskJxzeRuIArMXEVhFFu82yt35RvYoftQPn1rt7vouPu8AiMenaomdBj62WrX4HyIs
         NSHJ/sKoUZOamfoiNDndHewGC2RZ2tf7BfPf/Krb683LtntKYbIgygtNC1K1MfctO2Wc
         Z2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679901700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1kmkGGKOC2DOFLaKztfpmKO66ZiDM1oI9QitXcbWRY=;
        b=ejYMF6h3hlBtpQ2EeP2IsjBGtH25XIfH7PRalrpG5P+VDrzKWSWZuBpdwBW2/UrS9P
         /LSzY4eTfXM7/SiGxiPAMjbWIJwfmsc9VETlcT+YZGiwKNq5PxrjwJA4c9KQQtjQWwKY
         XuyWUCEQZaC1IRbiC1B0EzZYn+DgNqc3GOy/60wyXvr3sR/ZEYuEXlNVbHKebwGu2tnt
         FJ4sLrL9OtDPF7Pkh/4mcC9AHMPZ2HjYOIGhuwWsu1ZiSWQZqMiDqaichyHvMXRc/FD8
         Hu8Qr2lIsDGuLmPXBnsFfAJo/M2Yv9wXoi7jT7jpPWcroUSo4xtk83AZ3UzJy2n+u5Yv
         ScKA==
X-Gm-Message-State: AAQBX9es8WH6zORmf9qjj1FCxdFQQNxHCpfkYYZHzFdHfyyU1nj2n9Nf
        xRDPCsgqh4mmYdDLRWA0VHELbg==
X-Google-Smtp-Source: AKy350ascTU0kWfHqxU5rF+es5aVwFq+4hfnvmCTwIWkquehDJ3j+Wo0cThfKkRpw+G2Nkm880TzFQ==
X-Received: by 2002:a17:907:a68a:b0:93f:9b68:a0f4 with SMTP id vv10-20020a170907a68a00b0093f9b68a0f4mr6626314ejc.26.1679901699901;
        Mon, 27 Mar 2023 00:21:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:198e:c1a5:309b:d678? ([2a02:810d:15c0:828:198e:c1a5:309b:d678])
        by smtp.gmail.com with ESMTPSA id g5-20020a170906394500b0092fb818127dsm13853619eje.94.2023.03.27.00.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:21:39 -0700 (PDT)
Message-ID: <58ba3b6f-578f-0bdd-13cd-980eda28d2c7@linaro.org>
Date:   Mon, 27 Mar 2023 09:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 06/14] dt-bindings: pinctrl: qcom: tlmm should use
 output-disable, not input-enable
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20230323173019.3706069-1-dianders@chromium.org>
 <20230323102605.6.I291ce0ba2c6ea80b341659c4f75a567a76dd7ca6@changeid>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323102605.6.I291ce0ba2c6ea80b341659c4f75a567a76dd7ca6@changeid>
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

On 23/03/2023 18:30, Douglas Anderson wrote:
> As evidenced by the Qualcomm TLMM Linux driver, the TLMM IP block in
> Qualcomm SoCs has a bit to enable/disable the output for a pin that's
> configured as a GPIO but _not_ a bit to enable/disable an input
> buffer. Current device trees that are specifying "input-enable" for
> pins managed by TLMM are either doing so needlessly or are using it to
> mean "output-disable".
> 
> Presumably the current convention of using "input-enable" to mean
> "output-disable" stems from the fact that "output-disable" is a "new"
> property from 2017. It was introduced in commit 425562429d4f
> ("pinctrl: generic: Add output-enable property"). The "input-enable"
> handling in Qualcomm drivers is from 2015 introduced in commit
> 407f5e392f9c ("pinctrl: qcom: handle input-enable pinconf property").
> 
> Given that there's no other use for "input-enable" for TLMM, we can
> still handle old device trees in code, but let's encourage people to
> move to the proper / documented property by updating the bindings.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

