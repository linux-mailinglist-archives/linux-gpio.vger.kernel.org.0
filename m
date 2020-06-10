Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0FA1F53A5
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 13:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbgFJLkE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 07:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728481AbgFJLkE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 07:40:04 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF19AC03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 04:40:02 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s1so2071718ljo.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 04:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3P0Ka1wCVHz8nfABo8/AoWh2f1DQKtjek9OpIbSue2I=;
        b=gzcvXjPk5e0YMFO3Jy4DiLzAkEDMQySBBtwQJ8Uzc42Be3vEID2pDEDnBxPYixeQ92
         L+N1gvZM3Xdm0LkG/0Lr0Dut0WjUMA5oF37M55+taHomm/uWMs1R2DMi/p1xH0ntMAWP
         Gvgrufw+IrNhqtGaLmBXRLHyqwHf8MIxPA5VE7SvU6v+IcGKM5Rlmmi803WrRIwT7b4B
         aPJFyGnsKr4NORap1bXoGC0707OyZil2lChJPTc9GORY53Zp2EKRjQst8YJs6S6RZhZC
         QNd04C+HwGPkr4fhcy76mPnQB9WQOCMYW4N2aLm3vvE0ssBTWXJqRtmM9hU2RZXMQ1GR
         UXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3P0Ka1wCVHz8nfABo8/AoWh2f1DQKtjek9OpIbSue2I=;
        b=d4LtphSPMytMgO203Puu5eo6mI1qjDTaRp+qIG4cNvPthMdldfyFUqKkWFYsY/EZY/
         cDhesZ8IDE8iJ7tuIHf5Z7/lOjk9nUeOd1aTPrU79WFyuVVBKfruplThuGX8cFOTCvo1
         9Xz971Zdr679pgAAgwKGKNMAz3UAt2t5/zKRBXLfOmcUyQckHEPsN4kx8/INs1nfxcOJ
         hNWi+FFn3oBFV/7yFy8PHAipqHx3ISCClCwLx7lIXsgyrLNL1YO5KFn7EWACzTLMH/eK
         q5k4/9VxVpWKu0L9oVotp0BxysYF8G03YswUrKRUQwX+0WDEaBkU2LFD7kgKoGBfigcK
         0hUg==
X-Gm-Message-State: AOAM531By/kZk65N9URCZlxU/A6ms2Zhv/zmqN0y98EpGcM02aF+CeNJ
        sSLW2bSZ8HrkTgI0BwM4sqT/EmGJJYJ9p3VFjkEBpQ==
X-Google-Smtp-Source: ABdhPJyaRhe8qpw1XZQ5sLwkKEMtvfKW20PZmltb0nNky9zkl90NlOBwZes/InaXRy8KomtNSv5QivttnLFVEvz1dL4=
X-Received: by 2002:a2e:880c:: with SMTP id x12mr736369ljh.293.1591789201394;
 Wed, 10 Jun 2020 04:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com> <20200608134300.76091-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200608134300.76091-6-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 13:39:50 +0200
Message-ID: <CACRpkdY5wAAVmsbi3UgJR4j_oofX5sDp=x0Pmag+w=L0XfRNoQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] gpio: dwapb: Get rid of legacy platform data
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 8, 2020 at 3:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Platform data is a legacy interface to supply device properties
> to the driver. In this case we don't have anymore in-kernel users
> for it. Just remove it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I really like where this series takes us so I hope we can still apply all of
this in some form!

Yours,
Linus Walleij
