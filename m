Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42B942B091
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 01:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233903AbhJLXue (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 19:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbhJLXue (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 19:50:34 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3578C061570
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 16:48:31 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g8so2536325edt.7
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 16:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vc3CH5v4CBSXLkSVO9jLX0r7Nwhcrzxe9j4W7AySQ0A=;
        b=YiYwmX9uZwhLPGxi7YYAyH1b7YCNSdYLJBQQQo8XkaUlp5MBhCvNlkmvNNKwGAVb/h
         XLZ/+Bt5Y7JVQQG6o5ysOyO1NeB32cFZWCLGBzYvXDwmeCLZMH9TW2eHtHUN2esOJrBc
         1nJr05dIxcDvBSDU2wE4relg4p6aNfdPOQyL2G3b2l1HRHJXL29/LA6zeQreq3Yevwzn
         3vR9BCW23XkQZRExUHQsvigdweyc2Y2gXO032aEFxF2dXmT4lDEolY/k4LIFNU92ZCjo
         q43xIbAHyyosboB4j+OEMwt1RJjxoqn4dY9xb4SilxHsQz12Cz6WGSD+vUIsfwepnire
         DWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vc3CH5v4CBSXLkSVO9jLX0r7Nwhcrzxe9j4W7AySQ0A=;
        b=EvwmmqV9nOwKE2ZOTSCUhzB449MOh6gKKM3b2+svNgJtu6VMTExvCXRkKJMwn/bax1
         6pHZ82FneZ2XUK2XQgbyk4OwNzHQaxBJb48x24JaWZCB7RykOk2PTcKKLF+32A4GQm7f
         Sf1qSoZSI3f5bEGdTE3TrKMnHKfPpF5qPCYaFAEC/aVdTgtGrGt2mWTxm0lpT/9gPjDt
         j74G6DwJBXnBmfOp0nMsPYU14EeE9SCoQsqP307+ecror7KWjX2nDYrYbKxLF7Bark8C
         7CuFch2By84+MU5Xyr+8i5I9lBBqrh0dyHBZ/TbJe0jUBWacHmo0dIvq/SDnBUg/iUPE
         /KNA==
X-Gm-Message-State: AOAM530yJpLkP7hEUbs/xZ4IhIk5pahTh8IMrR7cVx/6DOLHAPYBE+gv
        T//AVQYELAWyzAdnBU6cKDolFvxr2hPoRK/OmUVvGQ==
X-Google-Smtp-Source: ABdhPJz5Gqo2ypBZPFh79sWzBRrMyiHHhGRW+TvFqxOmmo8tMMyafTzE6U4WIDqmviR4WoadTP4iD5T4YS9aBr8UrDQ=
X-Received: by 2002:a17:906:5e52:: with SMTP id b18mr23544441eju.560.1634082510434;
 Tue, 12 Oct 2021 16:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211007212444.328034-1-luca@z3ntu.xyz> <20211007212444.328034-5-luca@z3ntu.xyz>
In-Reply-To: <20211007212444.328034-5-luca@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Oct 2021 01:48:19 +0200
Message-ID: <CACRpkdYPh-fHi-MkZRn4jq4J9oaAiHDSe-0vTokJZCfv4osnLA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 compatible for PM6350
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 7, 2021 at 11:25 PM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add pmic-gpio compatible string for pm6350 pmic.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Patch applied as obviously uncontroversial.
No need to resend this one.

Yours,
Linus Walleij
