Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C001267E5E7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 13:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjA0M6n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 07:58:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbjA0M6m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 07:58:42 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E5D11656
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:58:15 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-501c3a414acso65630217b3.7
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vh+bKXtdb/z1QCPxI2/PQtGdcBrzsfUgycixwIlm1Is=;
        b=Rr8xhv/OSS7204WgMEKkwF53NcpYDuZMgCQvnk07CQgUmvxNYUMA1RASA9ajGe2IUm
         PGUHbdjtv2Rxm0kppk9PehUhB8HOQE84PDOOidRDcJnHYDTgyjf+cpH98vOqAok2zNb1
         D+nluFpWnwX6ZTnIy75oPmz0VgkhtWTs/aTq+WlyFKMvwLErBewvb8O2QqnwUH8prP10
         7JQKsz37fibUYPXt59nDJnw8tr4saHruJxiDb3vmnk+5PSX5EXsUDydoexGlmMJNNvAY
         XNZeBoaxWxT+BKQK5fxGD+oeCTp8bNrHV5fqp3nlV4iAU7IzNrh/McMlxTE4p28Ja3Os
         /SHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vh+bKXtdb/z1QCPxI2/PQtGdcBrzsfUgycixwIlm1Is=;
        b=ZR+N229/9RPpvZEihcclRZQ3EsfwRSyoA4rZ9yT1g5w6NVeizfsJNAVHvhnHZJrjzJ
         68xkeu3UPLU3ngDKCgqrFnoMevgqSQEYsbi1SETo54yR39HKgLYRskSoGzymLLZs2shi
         U+rSo0v+SkVw8MhSGkPKUbcToFOl9N93GJ4PfDVwQScpyQ6Xfcv8ceiOPniYNDSok0Oh
         6VzNEB7Y3kriqy0krM9bDm3GFiekNckAuhar5aBkq6nBLkNZUo3+9V8blTfGnJD4+WEB
         vIZohRSvRs8eKAQrmeSYJqxlU2WPwwZMxuk8q0u6HE0fu1jfu2aNYlb62kNW0PNfrbEd
         qKuw==
X-Gm-Message-State: AO0yUKWtrfbi5jJCND2RHznU1MvCOhOtJrC9N0PT++g7iUrz7rySElEg
        LnUMD+BV6Q36Tz0VmHtcP9yKCvWzxOCak27zIPJXxA==
X-Google-Smtp-Source: AK7set/pmEFwy14DSxUIoFhgRvUHxwHId97MCz3n4bGfCrxDLXaTZoxTOHGysbJaigoBiETZhxOz45r0mMfJ1dv4PhI=
X-Received: by 2002:a05:690c:706:b0:506:6952:b9c9 with SMTP id
 bs6-20020a05690c070600b005066952b9c9mr1266249ywb.477.1674824288171; Fri, 27
 Jan 2023 04:58:08 -0800 (PST)
MIME-Version: 1.0
References: <20230126-gpio-mmio-fix-v1-0-8a20ce0e8275@ncr.com> <20230126-gpio-mmio-fix-v1-1-8a20ce0e8275@ncr.com>
In-Reply-To: <20230126-gpio-mmio-fix-v1-1-8a20ce0e8275@ncr.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 13:57:57 +0100
Message-ID: <CACRpkdYyRXx-Q4NYEUzpvmBEvyW5b9TVw7DngphhV56VJJCESw@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: dt-bindings: add new property to wd,mbl-gpio bindings
To:     nl250060@ncr.com
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Niall,

thanks for your patch!

On Thu, Jan 26, 2023 at 11:18 AM Niall Leonard via B4 Submission
Endpoint <devnull+nl250060.ncr.com@kernel.org> wrote:

>  Optional properties:
>         - no-output: GPIOs are read-only.
> +       - no-input: GPIOs are write-only. Read is via a shadow register.

"Shadow register" is unclear technical lingo.

Just write "GPIO output registers are write-only"

DT bindings are OS neutral, the fact that Linux and other OS:es need to
cache ("shadow") this value is an implementation detail.

Yours,
Linus Walleij
