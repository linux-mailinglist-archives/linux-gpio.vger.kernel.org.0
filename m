Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B63581D7D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 04:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233600AbiG0CQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 22:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiG0CQf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 22:16:35 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB533C174
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:16:33 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-31e623a4ff4so161223377b3.4
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dVN886NSrhQs8UWcwxaCPHANRVdx/m1bEPjAIN2GoxU=;
        b=GjkAHE5qR37LBJVes25IDRzw02yBl1adJiKjgbAj6FShHvOdjwfz78fltGk1xlzovC
         uwLhYx4fFuZp3QWHsGSvAXWaoq8EFp7PeFaXSMnvG7yxhZdKDDFlJereIUDZQns8h5I+
         V58kR3heJaQqGz0rMaQQ/zKGX45W3r720h1gluPDtnn9qaAkxBni08RmBRPsB8w/CdEp
         QxIr787KZucoU6ES4FEW/8dt27JadkSsdISlSG1WodhxdWG6F1DQJvYxBcWabL5ysU1D
         pzmk7hhNkcyUIN3ATMp1FSYkXJias/sOiSvv7vKwpc4DkvA5MrRGJxjrzCgYkldrAFlt
         8Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dVN886NSrhQs8UWcwxaCPHANRVdx/m1bEPjAIN2GoxU=;
        b=601i40askLStQmXBvMYuBrS4KxYLPgavPAJux8Rt9WVr9X0ZPmnnj1vjAGgaojen61
         4e8Td0iSHRPAzGzBUb2FfxDVaEG4td+/IuYEpFFcQuMd2BVmxCz5Yt5lML32w/4HOejh
         sXsGLjCUk/fw0vf3Z4+lZfnleSFaeYlLwEPqw4J5Cl5rWrNK+lM44b0aMti58oUGeah9
         LFhzavuTFXVLKGlJuLowTs+hKSOxZkWUzYP0N7mV4XgHPCqiT4Rctr1ciMg4hU57a8iZ
         vcpo8sRYAHpXNahUb9yi1IMZSg/ZORfU2a4GrsZ4TjmpvsieU0cE64cGkxCaQ7SgVdwW
         HLYQ==
X-Gm-Message-State: AJIora+BvehaIta7OCsTAoqW3VnhVeAnGkDfPO5WomRGUKdA7LaVLvU3
        0FQDZsYq1AvGWBL76Bnm2bEs78SCRudUowvWdIhEbA==
X-Google-Smtp-Source: AGRyM1shFIftgpaxzZdS4kTpLlP5M16qJKmX4KJ/sZiobJ0XSiBFR7JGQsYQPUGcISQ9B3sW42W/eq2EFfD3Ddj/6ac=
X-Received: by 2002:a81:4807:0:b0:31e:7002:46cc with SMTP id
 v7-20020a814807000000b0031e700246ccmr17615235ywa.83.1658888192913; Tue, 26
 Jul 2022 19:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220727013403epcas2p452b5f66597b4298b7a573393927ac96e@epcas2p4.samsung.com>
 <20220727013349.3056826-1-saravanak@google.com> <000001d8a15c$da89d980$8f9d8c80$@samsung.com>
In-Reply-To: <000001d8a15c$da89d980$8f9d8c80$@samsung.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 26 Jul 2022 19:15:56 -0700
Message-ID: <CAGETcx8W8kveuW9Wk7kQEMJuKUHZUk2wA2B39Uy0CJL6UYVFzg@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
 registering them
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 26, 2022 at 7:02 PM Chanho Park <chanho61.park@samsung.com> wrote:
>
> > Subject: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
> > registering them
> >
> > As soon as a gpio is registered, it should be usable by a consumer. So, do
> > all the initialization before registering the gpios. Without this change,
> > a consumer can request a GPIO IRQ and have the gpio to IRQ mapping fail.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> Make sense for me and I tested this on my Exynos Auto v9 SADK board.
>
> Reviewed-by: Chanho Park <chanho61.park@samsung.com>
> Tested-by: Chanho Park <chanho61.park@samsung.com>

Thank you!

-Saravana
