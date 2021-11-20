Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43BD3457AA2
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Nov 2021 03:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236589AbhKTCs1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 21:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236587AbhKTCsY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Nov 2021 21:48:24 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65403C061574
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 18:45:22 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id r26so25361243oiw.5
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 18:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+gjmalkbLsMWtzHg+sW2Q2ZeVI+or8AQawNVW8phag=;
        b=NscSNuq/2c2gKnQYyPrBrFXLZhu16MIprOA7QciX/pMXmBhRXcXDGZsE4CSVFYk2Ke
         5xlemeYQOqhi89sfMLtOAlTV7zNjHqIrUlCVMOQrgo4NvQmwMh/SZdtraoAa9bDCH21X
         L5BSkAHs5OgumaXGD+S0zZTDH2MuUcbKuxeG74RxN1yPX/LgTxxBwkkEW+cjfbaynd6m
         lUNs2MbAc/fGSWINPGIXXncST5fgRvdRLQOkW8Z2sLr5g7yKRBvv3FODeu3vvpchjY/0
         0gyt9F/3Ze5OBfSqNw81ppNYuS467lclp04eI1TD71IWaxuC7d7+Gl9JUSdS3U/hVWRr
         01bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+gjmalkbLsMWtzHg+sW2Q2ZeVI+or8AQawNVW8phag=;
        b=KiU7DefUrwVxoQp3TS6q4V94X8NT/j1Q41VXG2UNUl6MIJP3qgd1aE/lcPgCCH5D/m
         oov+K6dCyJxHQx6QXjhTo9OUweS6EGFfPRj3i3lpw9NUgw1E2JYRjSEKy1dg270pndez
         GiFdJUDpb60cQGhShnPzcxTaHYTeHdAupkRCf4xq2icCbqBenJYUupEjyEW6kbdtO/DO
         EwrXTg/1nPF0+pGVgqfeFt4v+2UPJDXVJ8ADhalIaNu/pEQdTf5bhkC8bzlknW9bCfWV
         BJcpKarKTWkefBEACY+p+spRKY4IJyu9jPrFVju58ZG2Y2ZYRH5At23X4RUI5bt8NRQV
         qz1g==
X-Gm-Message-State: AOAM532Al52zHE/1oiQTJhkLNQjsFioLbfkSXOddRtFDySGBKVel/tpz
        FomXpdekutdzCXM68aFIzV042jieY8JTgauxcsfEpRZMhRs=
X-Google-Smtp-Source: ABdhPJxq8NkyRND0CwX+iDSiKufCZ6vWQPitbKvTmREkzVajip0dF7zu1/pTqFrHN+m6+CN/C0ZRuslLWlG7Jw74LJo=
X-Received: by 2002:a54:4791:: with SMTP id o17mr4637885oic.114.1637376321772;
 Fri, 19 Nov 2021 18:45:21 -0800 (PST)
MIME-Version: 1.0
References: <YZdkKaU2LAa/BQy1@black.fi.intel.com>
In-Reply-To: <YZdkKaU2LAa/BQy1@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Nov 2021 03:45:09 +0100
Message-ID: <CACRpkdaqCWw0Y13AXWqHpyhYDhYJO2nYWFp1CQG2fKGyhqmg5w@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.17-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 19, 2021 at 9:45 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The kasprintf_strarray() series as PR for both Pin Control and GPIO subsystems.
> All tags have been applied.
>
> In this version the typo in zynqmp has been fixed, thanks to kbuild bot.

Excellent, thanks for your hard work on improving libraries!

Pulled into the pinctrl tree for v5.17.

Yours,
Linus Walleij
