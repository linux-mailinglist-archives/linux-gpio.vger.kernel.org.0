Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1751B4C8F72
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Mar 2022 16:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbiCAPyH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Mar 2022 10:54:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235839AbiCAPyG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Mar 2022 10:54:06 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD788554BD
        for <linux-gpio@vger.kernel.org>; Tue,  1 Mar 2022 07:53:24 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id w3so22556857edu.8
        for <linux-gpio@vger.kernel.org>; Tue, 01 Mar 2022 07:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t6eRS8LLx0EIsoZE2si/Vtn2mfrD2DrXtB6ImUiYkts=;
        b=diZdQX+Cvsc9WZ+RoOrNFFNaVIDwxWQqvZSb1x0Iv+Y57Uluon179uVDZnLVu/V7gp
         PD/1KVvCLBHwOULAcLVyZRbXz+9DJtiIZ7AFFVSX8FX7l5myPmw07DDNJnlDpcffrCsh
         Qo/A8XM+nSGSeAg1hEOtDTRxjy3e0SEHWO9bXxpCyxlNVlsWumsvPjzubWAYYcYuj5Qp
         nbpQToIYd6EtTbwznrWNCoa0aqUFPVoV1SUclvu0uLCrioP2zt31YcgyMEc/YeKLEl/4
         VfjPUjJSEZD/8A5xaoy7y0MV4Y+AUN7bb9uK4k6FGzJ3nqOLxw1z+S9wjiqy8zeZfjRK
         j9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t6eRS8LLx0EIsoZE2si/Vtn2mfrD2DrXtB6ImUiYkts=;
        b=Me1m5/8B2wWoO/eprriYMHo2hSbwZa27nRBSSM76lHkxgaatVXTmSNRPNM93D7InoO
         hJaFqYDTw4BkKrX2/UmKrP0ywhxyFtO+OTJRg/b5jEKCifKVTen+9vQei+796aOMvSlO
         ABMllIE0ASYLCkCbpOydFqDgLGjBRmZM0CIUJ/M4ajyzUg8CBsPMlyOfPCmkUsT7z2ib
         RE6vLUzs4N1qW2umlIuHdx0mqV7728WudJazyoQx6aObK0uP+WVD/oTlQGOpXcDI01s8
         UL60erjU7Qo4Sow40VSAQoL0tiBbhGGmiFU9DxO0WVG83HWelX4WpVUZ1bI6H/XdoldV
         sjYw==
X-Gm-Message-State: AOAM530MGQNbGiEnp1r3IIEcbvoNzm75XdxIEurZxyrF0zqjZf0lEXMb
        uwhoIw7CdRUjmB6Psj23eht1u9jL5RlHNGKjoETKSeO1E4E=
X-Google-Smtp-Source: ABdhPJy8V8/tuj3w4XmatTQ9ZZYRD5BH0OmdSEYAEyvPCqXxSOnsGsOHFpveoGsVMl+5tcg42GWaKENTTmMu/A8nDr8=
X-Received: by 2002:a05:6402:d64:b0:40f:3ef3:a160 with SMTP id
 ec36-20020a0564020d6400b0040f3ef3a160mr25297278edb.141.1646150003275; Tue, 01
 Mar 2022 07:53:23 -0800 (PST)
MIME-Version: 1.0
References: <YhzBFbci4OnhfxTJ@black.fi.intel.com>
In-Reply-To: <YhzBFbci4OnhfxTJ@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 1 Mar 2022 16:53:12 +0100
Message-ID: <CAMRc=MdgVbNmOOrQtZETGp2ONkucaCvk8=aXHGbHF5VqkErSCw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.18-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 28, 2022 at 1:33 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Set of (almost) Intel GPIO driver updates, which hanging in Linux Next for
> a few weeks. No merge conflicts observed. Please, pull for v5.18-rc1.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
>
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.18-1
>
> for you to fetch changes up to a1ce76e89907a69713f729ff21db1efa00f3bb47:
>
>   gpio: tps68470: Allow building as module (2022-01-24 17:23:15 +0200)
>
> ----------------------------------------------------------------
> intel-gpio for v5.18-1
>
> * Set IRQ bus token in gpio-crystalcove to avoid debugfs error
> * Check return value of kstrdup() in gpio-merrifield to error out earlier
> * Clean up couple of drivers from unneeded of_node usage
> * Allow gpio-tps68470 to be built as module to reduce memory foot print
>
> The following is an automated git shortlog grouped by driver:
>
> altera-a10sr:
>  -  Switch to use fwnode instead of of_node
>
> crystalcove:
>  -  Set IRQ domain bus token to DOMAIN_BUS_WIRED
>
> merrifield:
>  -  check the return value of devm_kstrdup()
>
> tegra:
>  -  Get rid of duplicate of_node assignment
>
> tps68470:
>  -  Allow building as module
>
> ----------------------------------------------------------------
> Andy Shevchenko (2):
>       gpio: altera-a10sr: Switch to use fwnode instead of of_node
>       gpio: tegra: Get rid of duplicate of_node assignment
>
> Hans de Goede (2):
>       gpio: crystalcove: Set IRQ domain bus token to DOMAIN_BUS_WIRED
>       gpio: tps68470: Allow building as module
>
> Xiaoke Wang (1):
>       gpio: merrifield: check the return value of devm_kstrdup()
>
>  drivers/gpio/Kconfig             | 6 +-----
>  drivers/gpio/gpio-altera-a10sr.c | 3 ++-
>  drivers/gpio/gpio-crystalcove.c  | 9 ++++++++-
>  drivers/gpio/gpio-merrifield.c   | 3 +++
>  drivers/gpio/gpio-tegra.c        | 1 -
>  drivers/gpio/gpio-tps68470.c     | 5 ++++-
>  6 files changed, 18 insertions(+), 9 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart
