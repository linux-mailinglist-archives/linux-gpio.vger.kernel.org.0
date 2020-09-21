Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F122734FC
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 23:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIUVjj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 17:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgIUVji (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 17:39:38 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A19C061755
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:39:38 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y2so15689679lfy.10
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jlBxInjPm5t0XDSk0y08+7dpKsD39PH4cNb4KCOJB58=;
        b=Xaj+K3td0umJyXC/hUUyjgJGL8aG516WKRCWcC781y8rGVFm1eixKy7rfkh4yjC9ES
         uLjL5Yk1Lv10yPCQOzgoQfGvngQ8vg3glzh3PJQkg9VaFeEAA9SaxKTUdRiV4Mg3vJIi
         w0MaR3carH7RnVlkEajbqavYHjKxljPRud6cfAEBz8/H1Nkru3Sbo/LXCMFyFRjmS4zK
         3f1P69T76qgiiTHarkCb/LdcfUnafakZTBRVQkocMFYONkCnv8K5IiRVuj5yh+47r00R
         uG+NUc8zRf4Q83NB3b0Frqoz4GIq5nOK/UXwjvpCEExi0vcCCrm2kicuL1pcPzYqOShU
         98Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jlBxInjPm5t0XDSk0y08+7dpKsD39PH4cNb4KCOJB58=;
        b=OPpBZwuL0IoO9jqcqWjj6HJ18mRvM9WdGevIiLmZI2fNb0HshQJI184k2uRHvYRWWs
         yLMXY6Cz/IN2+nKnxCfPU5qVTVKQAiBcc8uOCqCVhLcF0hkd/1WQRHevYmsbNEeMz8x0
         oSPvuPkJKLVY7LrJGoKohmHUyxd5iSCii/+sCFUhrIqx3XyNCPci1cZT81zBCya7ey0M
         SmCup19lSmu+CiCuor/YhhzGKCwz9gccocBGSavZ58voaNkoNEcggch2pMCvnkoZE2XM
         4VV9awE0XIsltQ2tQXR0HJ5dQxwxZldVY2sIY2dD1M/dtXDIlqc6fWQRpeF37OEdSng9
         cpQg==
X-Gm-Message-State: AOAM530CLbh8D1vbFWDp42jVRSQW9GXimj7pXAGSKcoLzJipLRhnMhpj
        Lo9aROiKPEDnBud56oVhndte5G9NxMf2shnrQG2ycw==
X-Google-Smtp-Source: ABdhPJyF8mAhRMAD6SKRnWKEZLEUZX07aQNZIcIJSD27skqa/xK2BoFD1Tg2z9bpLODBRwifSXj9A1EpmBjPniQ74ks=
X-Received: by 2002:a19:6419:: with SMTP id y25mr562178lfb.333.1600724376843;
 Mon, 21 Sep 2020 14:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200917113227.20704-1-brgl@bgdev.pl>
In-Reply-To: <20200917113227.20704-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Sep 2020 23:39:26 +0200
Message-ID: <CACRpkdYs0=mErvvegEs=-x0AeUCYhWweGyEq_=_JKmv8M_nzYw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.9-rc6
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 1:32 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> please pull the following batch of fixes for the v5.9 release cycle.

Pulled into my fixes branch, sorry for taking so long.

Yours,
Linus Walleij
