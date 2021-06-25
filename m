Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B653B4B5B
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhFYXyS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhFYXyR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 19:54:17 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B59C061767
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 16:51:54 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u13so19140368lfk.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 16:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JNvprdUsOPKu5qiHa61DeIoD17To05xoRs5N6OXIiHw=;
        b=XeaoFTTfpfc5MQfQ9tPlOUzzSUJtMTvOoqj62LMJDjEL7/VRI3w++Bu61kIZ+lJmwK
         UBqrBXQBDO9a9UQxToHDHenU4FDFK5NPPnXdLACcQkj+paBUYM7EqXo94pR64SWRKi4H
         iRgrjhz7xDqfeP5xvZMwfieXdBj3Pte+F5RHNZLNoOoxT21uXqqFcCEppLHyQacQN4Fd
         9usgEMkXoVJeTkEprBTBsPcdBDYAD7MwMlHOIeWZPofesOjivGq79+zvVMO5WP6yGdXW
         IQDhY0WP5/EeE8LoM12IoMyK1hFW+6cNsDlcIRs2UxZdWbo3rU7cMcTOLFDnhLt1SP7+
         XZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JNvprdUsOPKu5qiHa61DeIoD17To05xoRs5N6OXIiHw=;
        b=WBxtQOSkPmEtxERXkK9oBkHDKNjNk+kp8yNWsmyOu/bqhC6BzP9AbCidNHXmdNnbqO
         QjNdezSMAzzsxL52Yh6Sv3cUsEhZeTCaR2AHm8Kf89YxiExGkh+urhQAreGBSmYSAt7o
         kAl95NFnje8S9PeQUTLeKBcj+CoRp9254/DTk/nKV3KbHrZgvYzp8Yr12fPQTXl+11l0
         /ATfrokN+gYrqVb3+9RY2YnqvM48dXtkPkic0tfRcCjVFXsgbQvf1w4mLkDmyxpTMta+
         HMxZfIhFIU9fDDqGNmWIa/yk7ie9wqGjtOzoEIsMIB1Pcl8DYt2+N/2yISORnjb+lgDt
         jAqg==
X-Gm-Message-State: AOAM5309bwe6/Fhn/7GeXS0s2tZWHsp0HaSexjSSLRwYiXYs+HLZMfur
        5T/o8IhRCI0KRPnpy5o4/9bvWmNleKh5eLRBliNyvg==
X-Google-Smtp-Source: ABdhPJzriZY34bCDHuL4b89gYeFPZHgtn6NxEtvgC6rAg9/MEavzCB5MewSpa90qaJDoQfgbhqHfzSVctplxy1gj2kw=
X-Received: by 2002:a05:6512:1508:: with SMTP id bq8mr10130305lfb.529.1624665112943;
 Fri, 25 Jun 2021 16:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org> <20210617053432.350486-2-bhupesh.sharma@linaro.org>
In-Reply-To: <20210617053432.350486-2-bhupesh.sharma@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 26 Jun 2021 01:51:42 +0200
Message-ID: <CACRpkdY9=Exgaqf4KdsfwH7gK=KGh0HVJSWD_FTqLtwd+pOBYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: qcom,pmic-gpio: Arrange
 compatibles alphabetically
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 17, 2021 at 7:34 AM Bhupesh Sharma
<bhupesh.sharma@linaro.org> wrote:

> Arrange the compatibles inside qcom-pmic gpio device tree
> bindings alphabetically.
>
> While at it, also make some minor cosmetic changes to allow
> future compatible addition to the bindings simpler.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

These patches do not apply on the current devel branch in the pin control
tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Please rebase and resend!

Yours,
Linus Walleij
