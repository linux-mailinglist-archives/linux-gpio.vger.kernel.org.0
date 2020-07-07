Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E148A216B1A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 13:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgGGLJ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 07:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGLJ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 07:09:57 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD51C061755
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 04:09:56 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z24so24508387ljn.8
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VaSCRLtCrk90TumvUz/Z4QVNeqV8TMaq8CybR71ewns=;
        b=RhLsvm8VT9OIKAAFSStWG5ReYbC2n93FAXmMlFAO1iFRQW37+2M/r0+H6bMa+FgACX
         7pV22TO0zFCtgAO5F21yS7FYhxXgdbRLNkdbV89VjRH8K2QMwrHhOi4v150ih/qlcTWj
         TlH/S+u6u/4qqV3fkMO/hSwy996jpabTWJOOr8HK3PoXg97urogCcYWn/JrcwsRf9xAb
         KirRVyhv++e4/bXw8n05uWre/s5G4tifiDUXqpsmeC/wsEepjymcx9H51c5qtJGmsoqR
         XwPXjt1YOXCbbN0GGLhfN260x9Ji6tuD9LtQxMyYsW3zZtQ+jY84iOsh4KHC5rQXZ5qc
         4P+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VaSCRLtCrk90TumvUz/Z4QVNeqV8TMaq8CybR71ewns=;
        b=h7B1r6FcuySsJYhiuLYEoW4kUEYkgcrdK1yb9wTpPhfiYDNf6oelh0QUoJkTU+s5Ix
         vsNDUWsgmZtjRUgZ4ygoUk6p1KRvSj6ruHgMtSmW+NS27cgDECIGf55Bd1g+p/kx5hn8
         SWqUm41SynHWqqeO50eahBgPJp7zLb/AtWfAqKA93pC3ARcVqSdSfPnS3WV0GCZWw8Ie
         UFQFQUfWoHvvc0NKYYd4q12nZ065I+AwliGRZYV90MHXpoguop/OJGpomLmPXuA1WURy
         CprNXaBUXXdysVlsoU1TQ2qAtg4pWl9M1t1VSGT6SyLvIHAD9vbH8OfpD6FAgiofygiO
         1s6g==
X-Gm-Message-State: AOAM532lJM2M33NdcNpDOTlHNbnxjdKaPzAMRP8BT9vwDKq9b/y5YNWT
        MyjNrIgBuuvUt9pvw2wyVd+vqQ1LvOb42AVc7SKldw==
X-Google-Smtp-Source: ABdhPJzailpwjkAxmkvJzTbxi6vONoWocrB2dOb0V07DxEU2Vj9zHvfg7KPm8aLCOJiMlNlBJtZbBqglev9lxaiGSjE=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr15865899ljg.100.1594120194427;
 Tue, 07 Jul 2020 04:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200611164953.37039-1-hancock@sedsystems.ca>
In-Reply-To: <20200611164953.37039-1-hancock@sedsystems.ca>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:09:43 +0200
Message-ID: <CACRpkda0MOXHgD6KNAzzDNTFSc2f1_Nng8-UFuOGo-dm+6VS0g@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: xilinx: Add interrupt support
To:     Robert Hancock <hancock@sedsystems.ca>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 11, 2020 at 6:51 PM Robert Hancock <hancock@sedsystems.ca> wrote:

> Adds interrupt support to the Xilinx GPIO driver so that rising and
> falling edge line events can be supported. Since interrupt support is
> an optional feature in the Xilinx IP, the driver continues to support
> devices which have no interrupt provided.
>
> These changes are based on a patch in the Xilinx Linux Git tree,
> "gpio: xilinx: Add irq support to the driver" from Srinivas Neeli, but
> include a number of fixes and improvements such as supporting both
> rising and falling edge events.
>
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>
> Changes from v1: Changed platform_get_irq to platform_get_irq_optional

Looks good to me, two questions:

- Can you make sure that this applies to the GPIO "devel" branch
  that has the previous changes from Srinivas.

- Can we get a Tested-by or at least ACK from Srinivas?

This driver currently lacks a maintainer. I would be very happy if
Srinivas or Robert or both would send a patch to add you as
maintainer(s) in the MAINTAINERS file, and would also like
Michal to to ACK that so everyone is happy.

Yours,
Linus Walleij
