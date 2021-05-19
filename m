Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0C0388CCF
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 13:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350767AbhESLbP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 07:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhESLbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 07:31:14 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73E9C06175F;
        Wed, 19 May 2021 04:29:54 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 10so9692235pfl.1;
        Wed, 19 May 2021 04:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gPh7J+iB003pLmJ1JUeofy6Rw9ewvrADCNhDGWuzUcc=;
        b=LwFIGuuRBzsRMd04iquKjbmcw0WrxmKhrL6qGUuhHon9X6LaXKD/+klrHFqdySYidO
         KykBHpxPsWLPb+UsX1q/SsubkR+6jp+PIKraPz4EKvF/49Reako+U4/KjO9avkgfhyjE
         NXpDqfTBAeTY57emA+orgHhfl8UQ9k7N7D7Rvv6yi8vBFRhIWFX7Ki9PqYgh8Q6+uwBw
         eeJhqyP7HFOaPh8D4/arefGSwXaO7Y7yHym2WYr1hZuKZIUwzRnZkvTSCoEis8QSWZNZ
         RDpgj7y1KVOHdx+nLaCSCuhTgdwKCrDDugM1cj0PwabG1mLzbYHtQD/ZYlaORbQoXl7f
         ubYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gPh7J+iB003pLmJ1JUeofy6Rw9ewvrADCNhDGWuzUcc=;
        b=Q/zXssv3ysd2fzB3EtOvOEvBwh0cbLxl/JuG1wbAE8KcfMx1UXdzvcdNbmj6U9L27I
         iYdEVGYc4irXYiVXjs+icZd8+uM1vrU+PgaNBKvpIhRC+D74njZQRGaHvSEiACjl6Gtf
         cyHJu8m3oY00TrqNvCD4RXmEffOaFwdHzOPPpf5vAJz9IoniLLGFQxT3h1MW/iDVvKi6
         RD3Kad8R+oswi5neB+6PxgCF2/QLCzieYIGXywrHDW5T/0w7pLmj4icdfl5ZY4V4aq/C
         Fh2rI7gRlge3/FW6Y2JqxhMDuJE4uVZ+LeD3d8lyJlCGQduxQsZLff1mQWXJzKYiVxsX
         pnkw==
X-Gm-Message-State: AOAM533F9kBdx04FNq6g/UcQHU0ovKV7Dv4Hnl8bhRU0QXhCbDekn28b
        /G9s73qNuWf/8agKkfmw425EbygYjHOMqaAJHUk=
X-Google-Smtp-Source: ABdhPJyMS595KBDEgY3B5QwcVqHvgA5M48MFso3q1CcWyuni0NSqV3I5CfzVkpnV7dEal1Fk8YRrIyOgVV4qU5qexk4=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr10325998pgg.74.1621423793952;
 Wed, 19 May 2021 04:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200002.6316-1-dariobin@libero.it> <20210517200002.6316-2-dariobin@libero.it>
In-Reply-To: <20210517200002.6316-2-dariobin@libero.it>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 19 May 2021 14:29:37 +0300
Message-ID: <CAHp75Ve12r5buxv6T=aidQmYq++zwntpMTedRXMe5X4H8dmndg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: core: configure pinmux from pins debug file
To:     Dario Binacchi <dariobin@libero.it>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 3:58 AM Dario Binacchi <dariobin@libero.it> wrote:
>
> The MPUs of some architectures (e.g AM335x) must be in privileged
> operating mode to write on the pinmux registers. In such cases, where
> writes will not work from user space, now it can be done from the pins
> debug file if the platform driver exports the pin_dbg_set() helper among
> the registered operations.

NAK. Please get into discussion and encourage maintainers to participate.

(Esp. taking into account that v2 of this patch is the same as v1)

-- 
With Best Regards,
Andy Shevchenko
