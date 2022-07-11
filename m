Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2EE5619D1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 14:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbiF3MFt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 08:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbiF3MFs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 08:05:48 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B586274791
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 05:05:47 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id v38so22644185ybi.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h53XL9tfljRmjh33KGv/RYmnriH+WagaJThFUfhVmVg=;
        b=HaX2Z5E+lXn2QGKHJtgE2s6hD1SaL/f2UKK+twuqRZx60PNrfboNMmj1g3AmYlSisB
         8ImwINEOKkcmqDFCkEMr0XJcn8sQTZGyYDpGkfNgvV5MzziOPil1e/Vdc89P08JEtIk4
         owXSUVVC93IMDhxBpJBsEcbYeskxUiMe9ZT/XHIKD/Oajfz/6sUXUr4oLs7sQ6ftxcJe
         vJ2OsbvDcqzMjHjhxAiuoe233H37sgMN5Z891M2RuO1fwbYVBWAKnrkOqZpnICGuJBtV
         lUY8htbRZkjX1sCIQ+49kpa5i49Q2UZJ0Mn92Nc7PuDqpO8FnbHA20sV8Pmh2DvKSNo4
         QHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h53XL9tfljRmjh33KGv/RYmnriH+WagaJThFUfhVmVg=;
        b=BTEWHRkubA97+CWc0a11beTyvVTQMzyjEUww7fQpRe/pzHfD05aHEpmsMyxwvOnXiZ
         9XQt0UQJgb3HPF7oZ4IWkoIhL3Xa+WfA6CGRyk1ATY2LgED6/dzbhJD744xwynf2s/YE
         1NhKuSqWuWWbkXpfS1UEc9wbSd8TeGh/EZxA40PTds8akQOLwcY/iOGjLcS6kSELST/L
         g8AF1c7R9pUAUze9XduAuRTDZSpAP0Mlnmx2nOdhP3Y2taSGOrFulCYNc6nkfDeSSSkN
         AEGfXcs2uknThdnhF2XoWFxVo1qHo3UYA4joupdry/MCl3oosYxs7oLqP5C8MRa4iObY
         LKRw==
X-Gm-Message-State: AJIora+fO8KPc2ptnCwJBwb0AXw71eMdOzZpdrlhvQnKBfngXaarTAOa
        a9rmKHG82lWUFA8sGvKrl0qrGNxf6CdyE7N3c73MWA==
X-Google-Smtp-Source: AGRyM1uurB88LVB/DXHutwKMFOn7AJgyUNu6QfkHVqAtbj3wYo5oJPCAMT9YkXaGRfp9eQSmOr+Zt0tJ9Y/Ee1uRLtM=
X-Received: by 2002:a25:e7d4:0:b0:66c:899b:49c6 with SMTP id
 e203-20020a25e7d4000000b0066c899b49c6mr9589412ybh.291.1656590746837; Thu, 30
 Jun 2022 05:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220621034224.38995-1-samuel@sholland.org> <20220621034224.38995-2-samuel@sholland.org>
In-Reply-To: <20220621034224.38995-2-samuel@sholland.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 30 Jun 2022 14:05:36 +0200
Message-ID: <CACRpkdZQ9UzDsmQRQ+RTiZY8v7tt08gt+bLsFE77925CAiTWFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: Add AXP221/AXP223/AXP809 compatibles
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee.jones@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 21, 2022 at 5:42 AM Samuel Holland <samuel@sholland.org> wrote:

> These PMICs each have 2 GPIOs with the same register layout as AXP813,
> but without an ADC function.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Patch applied to the pinctrl tree.

OK the binding is in *gpio* but the driver is in pinctrl so has to go
with the other patch in my tree.

Yours,
Linus Walleij
