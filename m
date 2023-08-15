Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F30C77CBEC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 13:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236814AbjHOLpu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 07:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236614AbjHOLpQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 07:45:16 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B751171F
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 04:45:14 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d682d2d1f0dso3456268276.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 04:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692099913; x=1692704713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Uss1xJ7T68zJOpOSvzMeDJcEGS6v01LgFXbHfvNCt4=;
        b=aDQ16dIx0q5/7i3e7tpyb0N0zy8GDO3EpKuFeU/wDyf7QsB3dGAQPev7p+hH429+kN
         htuMTHuhS7lYZ69eem0ZpAFp0Dwpk4SbfVSmC4L4AOVBZM8AFwnW9BiDdevI9bSRKtS7
         abUEyO5bRRHZWa8Z2gdGUXiw5ERi7QXIgqVUmew1LsDt+4fqsKIvBBPcKdEOqZCkDDvh
         XNkoZXnr1vvnjEmhTslPdsphwNlyUCnPlWb2WcJ1KuMWozvWJvqwZlinKzaKPoUlOCUo
         51YLkOkOzZlh0zEoFSnfo3C7GfSXrNWNsaA3dW7XUYe65vPzwrvyWqiPzb3fwlgsDYOq
         8FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692099913; x=1692704713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Uss1xJ7T68zJOpOSvzMeDJcEGS6v01LgFXbHfvNCt4=;
        b=G9fpeyaBwRi6K5wLGbgK39YcLLxGUjdEV/eqU83jTER7V3hCuP6hoRla1TWGzKUBK4
         5ao1/pB3dxZ8I9KeeMEE5Nd4rYOLM0obLWOcjVabUaRnZaU4+diSWSi09RrraBUk3cNO
         QURh8v4gW28K/7wEI4p6w8IQoHMpCszkc5Z5RXvPFRq0oeWmGvwOpyvJ3zILUEPVzuyw
         5BjmrG3mVBKN2WRabVtaE1bQgmci3BlCAWlMFE3JTeUdDDKogoJ9gHVJ0u1GWFlUm0SQ
         AbB+7dqpQTMZngwNWx/tKedtc9NvmQMQoIZwCdhvqsQlqqasq0m1gmOLQdpcpbMskSGW
         nJ7w==
X-Gm-Message-State: AOJu0YyBSb6c0gccEvZocGqYjNl6Y014krK96yQ77SH8lS3lP8B+Uxly
        FLDRBBh+vgO6A9j1q+CSGrw5h2iDAyOUe6/4/2UXAQ==
X-Google-Smtp-Source: AGHT+IE7hVv+xxjJPAe+fTihw9d0B4IaDQAkSwLsCePXvP5rKchR4KKQEE/ROaNrkhm0HsbxrwNmE8/cO2OeGJvMUC0=
X-Received: by 2002:a25:abab:0:b0:d3f:a6cd:f2d2 with SMTP id
 v40-20020a25abab000000b00d3fa6cdf2d2mr15268160ybi.50.1692099913433; Tue, 15
 Aug 2023 04:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230815110625.317971-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230815110625.317971-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 13:45:02 +0200
Message-ID: <CACRpkdaBee108wbXcAcz5j7Ws1pbDw5TJ7id7dupJi64YHU0mQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: fix concurrent register updates
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 15, 2023 at 1:06=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The Qualcomm LPASS LPI pin controller driver uses one lock for guarding
> Read-Modify-Write code for slew rate registers.  However the pin
> configuration and muxing registers have exactly the same RMW code but
> are not protected.
>
> Pin controller framework does not provide locking here, thus it is
> possible to trigger simultaneous change of pin configuration registers
> resulting in non-atomic changes.
>
> Protect from concurrent access by re-using the same lock used to cover
> the slew rate register.  Using the same lock instead of adding second
> one will make more sense, once we add support for newer Qualcomm SoC,
> where slew rate is configured in the same register as pin
> configuration/muxing.
>
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver"=
)
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Here it would be nice if we took a sweep once this fix is in and switch
over to scoped guards, like Bartosz does:
https://lore.kernel.org/linux-gpio/20230812183635.5478-1-brgl@bgdev.pl/

Yours,
Linus Walleij
