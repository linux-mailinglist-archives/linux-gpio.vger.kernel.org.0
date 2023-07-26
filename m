Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D57676318F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jul 2023 11:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbjGZJSg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jul 2023 05:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233779AbjGZJSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jul 2023 05:18:05 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081C35BBF
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jul 2023 02:14:29 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99454855de1so945785166b.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jul 2023 02:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690362867; x=1690967667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jvc/RhqNLdkjFRyjCOu0p34PReK+9h2dYQzWRcFMNIw=;
        b=ElJAnz3BZ4qfXm2EftBuGmkxiLcoteHMM/oqwiTQBZXrfIi+d2BzbdKZmoYdUJnd01
         ZmD7Oo1jUFJ1/OHMZJ+Z/WbbEFeq3dZB96P98sxLA3RcYlLj2X1Nm69O8ey0lfAT9fty
         XJtZOyAh3RiJQ505r5elES0m7XQvBHqusJFczEINPlrRQIDF34rjW2iuy7ujnGNVOKJs
         CVZbJczu4oxz04rDIwO3p/9TUK8eB2zxOcTwMXAJvJnVIleM8G7F5hvn/4hfyrWK5qHU
         gIDsldMuOiqNZ0ZCexSzeeviyqqCJJUpmcHBkMxQyGwxJ/0eV7uVwGpuaepQ6ktH058w
         y94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690362867; x=1690967667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jvc/RhqNLdkjFRyjCOu0p34PReK+9h2dYQzWRcFMNIw=;
        b=A0zu4qAyliMayNRYcgB0mL8RavsoigHzFdKCwmb43lPtf1of8NHoymXUqyxIX7q7q1
         nRAdS93moyYhFUQHlziM7QzL/ULhYuQqkxHEX48Fz+BT0uvefcUdAdesw3u2lP0UG0Xz
         s6Hq0pRAq05xmZkTJo4GcXTVpXFaWCnuS+TS66j5/SVF+sQd3Gajzbpih3GJPMmRD489
         S9o4ia9+HP7I84rGEZ60LGnWgT6t156gtR5FCMKvtnhBZ9zOokBfFL59C6QeD+hXzpK3
         Dst++4cznrGAmlU+1FHGDOERcPk5AE1ndn2OoyFgQhbRiZq6pEVZkERTY0cAKLp5OAe7
         fDBA==
X-Gm-Message-State: ABy/qLY12L1H4q2fZBl8afcoLqr6gTcjpqVrLnjZoXa1s2oJbmQBPXOW
        /OwEC3VihsxORrqhCHnn7uIXOw==
X-Google-Smtp-Source: APBJJlE4uAOMQkzCfIHvNfWVsRo1Z5fDKEWftJoSlaP+9PziYE1W5ZH6TLp3F5a9F/YPbnYXMUijjw==
X-Received: by 2002:a17:906:7692:b0:987:498a:87f6 with SMTP id o18-20020a170906769200b00987498a87f6mr1021396ejm.34.1690362866937;
        Wed, 26 Jul 2023 02:14:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm9384492ejb.84.2023.07.26.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 02:14:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: document PMC8180 and PMC8180C
Date:   Wed, 26 Jul 2023 11:14:16 +0200
Message-Id: <169036285578.127914.17434119559896271515.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720083539.73675-1-krzysztof.kozlowski@linaro.org>
References: <20230720083539.73675-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Thu, 20 Jul 2023 10:35:39 +0200, Krzysztof Kozlowski wrote:
> Document qcom,pmc8180-gpio and qcom,pmc8180c-gpio compatibles already
> used in DTS and in the same binding in allOf:if:then section for
> narrowing available GPIOs:
> 
>   sc8180x-primus.dtb: pmic@4: gpio@c000:compatible:0: 'qcom,pmc8180c-gpio' is not one of ...
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: pinctrl: qcom,pmic-gpio: document PMC8180 and PMC8180C
      https://git.kernel.org/krzk/linux-dt/c/2422f74eb9dc99097c9537c30ef50f88a0b54acb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
