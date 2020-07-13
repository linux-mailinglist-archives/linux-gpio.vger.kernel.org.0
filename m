Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80C221E1FE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 23:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgGMVWF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 17:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgGMVWE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 17:22:04 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D22C061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 14:22:04 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z24so19803442ljn.8
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 14:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CIJE94Z4rfFdNMyp6uggUS/DLeI6u8NZPSsKrMY/O3E=;
        b=lszkyRrj4/jkV4+Q4CXSJHNSg+avlARsLPvu/L2tgo+3jtn2diINljxwOjwPbUUEi8
         iT6SPJyto3Ci4pCbpn4pw6pAO6F4sdwLP7UoCd1n2u/+V1ITWZgmT/pLnumepmwLQeu5
         mmcZMU76jEX8xbp3Tm9y8nZxl/IoPmoBNU+Otrk2WVX4sFpnm+PT9GnALvsF0ct5MgBb
         ev6qALR4+LFBfcsiQh2wervMXc50pHaiw7IXWX2MyIc98TkEmh9AV29IE42Xh9TiDFry
         2YqS5DZXdEMywO0uhqno3kRrBlq3cl1qMxyDYDGc2W3ZXkY3EIL2Jzi08r3seoeyYtE7
         AFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CIJE94Z4rfFdNMyp6uggUS/DLeI6u8NZPSsKrMY/O3E=;
        b=N1ZwKfIlxIncJz++wJMxVitN8Vyfp1kmpAJwfoxOiPxhNG9iwe3+NWpoxQiI2ZWIe6
         zteXW5fbxEBevcWXCsuBSJKXeb9zgOtK7vlpoZPZShlTqiVuJju3hhrKCX/XuvVgxL8l
         y8NiZqjvf9XFVZC9ysi2qu32ighPSm9PXUHw4j1r2P9joH09oW/Bwds6MRiCVg2DV9w5
         VJvt5aH5HRUaEWU0nI/lVWUIEIREBnWlwPd6y4TSluos18pbedInL0sn2ZkaXjsmqP2D
         Xddxpc8Ix40McuDUnHcSi7egroXswmP+1ikKTF9pngQWCPc5Lw+fyqTPhaf66YThYncL
         4pFw==
X-Gm-Message-State: AOAM531gtPetOQ/mDXyLRyxvbh8TvVIwjg3XuAUftM8jJY1vTN9AWKQP
        ab9FGvvhIV19lpt2tv5XGyNU2AI/a60/+nPaATNn/Q==
X-Google-Smtp-Source: ABdhPJzroqBgDShWJfTjm1njg5PqeghstKB2OYvYEGq1n2Wb25H9ko5FNBxkpB6NHyQOpAiduaIMfXdfLVmEg29eeJc=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr704293ljc.104.1594675323008;
 Mon, 13 Jul 2020 14:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200712082529.21023-1-brgl@bgdev.pl>
In-Reply-To: <20200712082529.21023-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Jul 2020 23:21:52 +0200
Message-ID: <CACRpkdbRH5tbAg+a0M7kRC8Y1w+cbkQz0HROjjnMFE_SRgMBAg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.9 - part 2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 12, 2020 at 10:25 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> please pull the following set of changes from Kent introducing a lot
> of improvements to the character device code. These are non-controversial
> changes before the V2 uAPI.

Pulled in, thanks!

Yours,
Linus Walleij
