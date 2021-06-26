Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4623B4FD8
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 20:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFZSbh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Jun 2021 14:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhFZSbh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Jun 2021 14:31:37 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D8FC061574
        for <linux-gpio@vger.kernel.org>; Sat, 26 Jun 2021 11:29:14 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id g19-20020a9d12930000b0290457fde18ad0so13235796otg.1
        for <linux-gpio@vger.kernel.org>; Sat, 26 Jun 2021 11:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xsfNESfqMuHVR/3TWEKQgeF1cU+m5Si9kUXhTtiYi2M=;
        b=AUVNQ6pPe4FF/zaIXnkLzesJs02J5fe9cvA6qVX9vqGnmRLKlVRNk2b7820AUsu0TM
         t/lc6GywsJN1N4kLgz2qOaad3f555GN75Rqlf4mYrF7DT2gndEbx0zR+DCZwJ/1kP+nQ
         wSrE9eWMEmYprGC9PZJ+egb2KQLDzZIyOJUn62dd6Z1+xSF3MP90/xOUkHG9aVPM8eHk
         ca/DAqSRA1LyiFucGgCNOzoQ7FjdW5zXr7nBGwMhWaqBwueSsDcKfCgbeohBkEaFywLk
         dotnFrJApzg9sDzJEka/le6GZUzU06ObsF+K+jPmm64iw8f7SIGw5jHTgqpsPRf3Q1SP
         xIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xsfNESfqMuHVR/3TWEKQgeF1cU+m5Si9kUXhTtiYi2M=;
        b=cAnfQEkA8taNJl3Ki+XJ3CecVyXN+z7Y1AKntKbm9t0URn9zeA9mw5aEKQeAUYxM4t
         vcrqBUpVhTuuiL8R54N8v28Nx3lJFwcMdYGoiKKb9D/KskLFGmATwqOg5nzmkMHtv5KJ
         KDP+4Jo7jniWjWrnDllPrq/99n7+lmbCN6giHpmN0OTg5j1fndBSIl9MEr9aJbl/IwV7
         hxPMSuVNIi7bx/52/4LVQGw9MXN1dgAiww30336MrHhh7eVQWA+iKOc31LVAB2IcdliF
         TtlLgTbM47Rgw6rZGV7LEDUU27wjFczOJx20NhkgpQ7NK+w+xPmjZfUHK1tF1LrrmAwc
         xd/Q==
X-Gm-Message-State: AOAM531TpAM9tqqutQyyvFRjy0nCMNEqowrQjt/fCKvZlJ3GU9ryij3I
        sAWiF7PxhGQDn9rIe1VeKOPbCu4Ad371+gIsBO7BDw==
X-Google-Smtp-Source: ABdhPJzEYyfnyegOz/k5HDxQyXJRDyKFyA6MoFz3oNGViR9pD0HqIr10ZJLT3l532va7kK+4+T+2jtpiik5jFTu1KDM=
X-Received: by 2002:a05:6830:15d3:: with SMTP id j19mr14303580otr.51.1624732154316;
 Sat, 26 Jun 2021 11:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
 <20210617053432.350486-2-bhupesh.sharma@linaro.org> <CACRpkdY9=Exgaqf4KdsfwH7gK=KGh0HVJSWD_FTqLtwd+pOBYQ@mail.gmail.com>
In-Reply-To: <CACRpkdY9=Exgaqf4KdsfwH7gK=KGh0HVJSWD_FTqLtwd+pOBYQ@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sat, 26 Jun 2021 23:59:03 +0530
Message-ID: <CAH=2Ntwef4SpAF+zAxkNvy2pjBfuQZONpUgJavMKfGuV-2uzow@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: qcom,pmic-gpio: Arrange
 compatibles alphabetically
To:     Linus Walleij <linus.walleij@linaro.org>
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

Hi Linus,

On Sat, 26 Jun 2021 at 05:21, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Jun 17, 2021 at 7:34 AM Bhupesh Sharma
> <bhupesh.sharma@linaro.org> wrote:
>
> > Arrange the compatibles inside qcom-pmic gpio device tree
> > bindings alphabetically.
> >
> > While at it, also make some minor cosmetic changes to allow
> > future compatible addition to the bindings simpler.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>
> These patches do not apply on the current devel branch in the pin control
> tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
>
> Please rebase and resend!

Sure, Let me rebase and resend the pinctrl patchset.

Thanks,
Bhupesh
