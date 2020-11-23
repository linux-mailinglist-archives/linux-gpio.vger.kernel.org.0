Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554702C0B57
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 14:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732924AbgKWNXR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 08:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731532AbgKWMf2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 07:35:28 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BBDBC061A4D
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 04:35:27 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id s27so3521686lfp.5
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bIWsoLneay5Kl8XDCK10cRcYyCYPRUIRK+zSmVlUvos=;
        b=ucPq/htyydn+9nClVGlZXYjYlkUMJiVSI6//s3K2lB127+Dttlcf30ubg2H0y6FtTe
         0t0/uAcNyjks0BNC+Nc9WQM9twGuyQgzeJDmHOJCcuG+BPEgo4hZphWquRikKVGCaEDH
         fZ9J0t0/u2VfMvu3ThtvvLpxoqAXFYzigtfxsm/UFO7lW8Qd2SlHVODvvjva2lUIv9Wh
         C56U3YkqIoZLIrq/Q6mXCqbIVVZjrdUbXXTgF57i/vdQhFyGr1ys40XzGUOvAyMl6YSB
         r9W3JHWAvhB32/0yGKToSVztgYnBmSn1zD2LDPjUKQH80SPA+8oNJEecXJ/c2Cat6vX+
         DDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bIWsoLneay5Kl8XDCK10cRcYyCYPRUIRK+zSmVlUvos=;
        b=B45vw1I4ZqO+xo9NcQO+PO9LfMTVkHAgObfMxzFo2x7y1fcq+/bdfnPDDsZ997tXD1
         hP5Iz95SfPIqm7w3XceOy8kGjCQ0RfeVOY43pVdLhhxrupOs+Zgfck5HvwPCQBqjFlOu
         CsLWnSu3gLVsv2fZm5+mbjhUXs6nBp6CTtBeGGfexoy2H4FRYxtjrbDuGv9LZTFjdV68
         kui97IlRhrkUTMxZgmaJQwj+7rffaukcRMR4+ohaAbVKYHnJPv/8XddKifzb6g5hjTD2
         IfawVAWNWxnLo+GDm9RpA6DIyb7U83OUHD+5o+M5wzDflTfupPdJgO54WWXDv94cjrAc
         q/gg==
X-Gm-Message-State: AOAM532mwEyhmf3KJmXOE3QGeE7t1rShsRmhbtomHPj92udB26HgS1bH
        xEAL/DWlCFXM7vhF/h55pF4BInrbMqF1tDMA03MnpQ==
X-Google-Smtp-Source: ABdhPJyKTHrZB4S6+zJWCf7UD8YLgth7EXVZo1EcgOOYpBLPQaWWmzkLYbQnaZmrG7aYqRK3IZDf1ocx2qEm2ucjD18=
X-Received: by 2002:a19:5f11:: with SMTP id t17mr1536573lfb.572.1606134925520;
 Mon, 23 Nov 2020 04:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-3-john.stultz@linaro.org> <20201116155936.GE2224373@ulmo>
 <20201116163603.GA30507@willie-the-truck>
In-Reply-To: <20201116163603.GA30507@willie-the-truck>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Nov 2020 13:35:14 +0100
Message-ID: <CACRpkdZ9P0vG-deWmK8A-zRZbndq1gz_oaK_b128bu4NfUB+Nw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Will Deacon <will@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 16, 2020 at 5:36 PM Will Deacon <will@kernel.org> wrote:

> Linus -- please can you drop this one (patch 3/3) for now, given that it's
> causing problems?

Reverted now, sorry for missing to do this earlier.

Yours,
Linus Walleij
