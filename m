Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60CF659BC1B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 10:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbiHVI6R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 04:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbiHVI6C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 04:58:02 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CAB2E9D7
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 01:57:56 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id u15so11101134ejt.6
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=jTQbXyMg9r3med0uSMLluxQqeC3wGCp06F4u7Jn1hdQ=;
        b=HKHryUj/fY20Lew7jHG+MQol3bfEuzzUfSCFDVmmicEXfh9P1oSuGJJS6xqt4J1fRI
         9zs72NBC92ppwjmLAbbUbqWKcE1Xf0nN8EMmUdhNK2LvmmkNzZXy6Vt/A0tDefZdfLxH
         4yxXYyLqGYS0OCnpL4Y1sy287cIgzjVIDktW9Jzh5FX/ZjuzqhUJQaBqaGe+YQVMLj8u
         NwaBG/Y1c/noFYBbokhjANfk0YPnHXJH9v/J3y285B1qLGzgVJehZgW5oCN2UmKmJ52Q
         UeEaq2n98BpZ5pPhdtYOcPHSAcxV2Jw7IXBBDFF0Ls9ZEkjbseqHisbaUAAi5l9s9Xh5
         Qs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=jTQbXyMg9r3med0uSMLluxQqeC3wGCp06F4u7Jn1hdQ=;
        b=OQrqkE4zuJZVvefbH6OGAS5xgifN5j5J8+ILg0YIOGqUcM3XfIV/ACChxHfKfbXFwi
         V8zItAR6QIZnwsgsq1/gVFge794HnxrDCcD+aP+rjpMiL/iVBrP0gVw6LgXwBUQ1CyTA
         BT6xl5DKcd0P3OT0kXh+m8CyFp+/jlD9OxWDwMjgomSqy3eJcUuO3f9fMZKZ8Yhb/dJi
         2UCrHpFKz5zHKvSPYGFwZQ/u8idmR1Ri+JXMx6RgPcMvbwOWKTs7a4q30UxtovXft+Gs
         ojzsz8l3Nu0rNcoJj0bW043FzCDfbFklBE4msbmzoKJVEXk2jSScD1AZkV321UvzYkbL
         X4xA==
X-Gm-Message-State: ACgBeo18Z/Tw7q4SYYmGfHCjKpEpnB173MThJGvN2qm8y0eGLqwYehoQ
        P/kjKP18jX2XckAWm8hBoRbFZtWspq6ynvTctV8NFg==
X-Google-Smtp-Source: AA6agR757vge7CPF+i+vP7/jt6Q9bY0gwlu3RPbn25FYHPGmVHhY0zQdbdTS9hXBrOXg3IpgjKNYOglStzl3jKw3ZrQ=
X-Received: by 2002:a17:907:6d93:b0:73d:8593:9608 with SMTP id
 sb19-20020a1709076d9300b0073d85939608mr1614438ejc.203.1661158675377; Mon, 22
 Aug 2022 01:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220807122645.13830-1-mollysophia379@gmail.com>
In-Reply-To: <20220807122645.13830-1-mollysophia379@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 10:57:44 +0200
Message-ID: <CACRpkdbZUOv69Byu8RUKD_DUzaTFyRUbS+QZQm0SyAUOv_D4MA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix some typos in SC8180X pinctrl driver
To:     Molly Sophia <mollysophia379@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
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

On Sun, Aug 7, 2022 at 2:27 PM Molly Sophia <mollysophia379@gmail.com> wrote:

> There are some little mistakes in the sc8180x pinctrl
> driver. The following patches fix them.

Both patches applied for fixes, thanks for finding this!

Yours,
Linus Walleij
