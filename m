Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8A42D4484
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 15:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732608AbgLIOkQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 09:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732444AbgLIOkI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 09:40:08 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25ADBC0613D6
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 06:39:28 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id x23so2613786lji.7
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 06:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R0601a1e5i5xQevieU2LxvDwqpa0dOWVpQhaCRkw0Vo=;
        b=IFXRcCxd4CuhNpRr72muJpAWBVSjOebg8dPIkZ7SIzJp7QLqOKa7uBk5TxBQ1+opSD
         1W3EXTDUdesLmOkv35ZEKBVz79MLKnDaLtRw4wivuveU3qRlaG/MXJlvS7q83EPq1tEL
         MPVLIt/yZzbqaAgpOFwXhypjwc3/EZTfCLN5lwXoujJfnPv/YhGPftJ0aFT0AWZhekqY
         ZN9IiW353/KazBqZAmD+uUK8tq/ZufVcWX6iUzceNNoSeB3i5rXsZ9zsOqfTOImbhoKh
         zALegOOHG+2GAh3bM4c2c5J+Ih7LEYoXFBLvAUMFIU8ByDBd9LkZMNbayA14ywCk2zWc
         Conw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R0601a1e5i5xQevieU2LxvDwqpa0dOWVpQhaCRkw0Vo=;
        b=hJTJhqoWCV9qwwj3xQEmJzXJvVZQyQbOe5XYZYKiG25+b1aRXMSTgZl5yy09Y77LQ4
         Nz8Ub56mEXEAW/wqJIEI9aYw9vld5PpFpG/eg+x1Owjh20o/rhSf7zRHu3Mohpp9IbZh
         MgM4HOFELrmKNrhLn4paWq7SrH86UpitUBiG/qHKO4lCFi3wpBzYhCTBiS/GZUKhtMR+
         Nqxths8UCV5wKl3wCbS1jgmUN4Nb4pFmDtGnfSPC866hEL40vIOjyUXCHURTF8mib9o3
         Vpw+57qivxjDD/k2GZK5HD7/QJsQolPtbYG9SuxPGcUPv6gmUnhgZJkWZruEmMHMp22j
         MNSA==
X-Gm-Message-State: AOAM5330FhZOZ6TiXhetXb+AO3iwfVrsfg+rgjUgE3+CiAA7P6EDg0H0
        7ndbTS7xVdkXvmczu6xQrLetWYC2kx5AOfFKepucQA==
X-Google-Smtp-Source: ABdhPJyTI7HysoChY+T7gr1dArxZrgIiylfceG+FBFsZEG3FCOT7vVTd8pkZwlDDgswP9Yi7rk41vkFPAYDy6rGL50s=
X-Received: by 2002:a2e:3503:: with SMTP id z3mr300158ljz.74.1607524765766;
 Wed, 09 Dec 2020 06:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20201209095248.22408-1-brgl@bgdev.pl> <CACRpkdZgK3dmjM32BYAWFvHOhBUsQbNbCSNMaebvRr+Jnes=Ww@mail.gmail.com>
 <CAMRc=Mdq7LBTAbUguuLH=f5_vfo5pc95BCveqSvApBTC26aNQQ@mail.gmail.com>
 <CACRpkdYM2knogZLRp+AAdE5ssvhULDZ6xr8yGrO8rvSMrZuScw@mail.gmail.com>
 <CAHp75VefreUB1KvdPGYUqmd7jq+hEWuPoq7nRG4RxLP6YpPRLA@mail.gmail.com> <CAHp75Vebqe2ndfAx5b_awLnjM7UCh2bmcdJBEakVZL3hSQhRQA@mail.gmail.com>
In-Reply-To: <CAHp75Vebqe2ndfAx5b_awLnjM7UCh2bmcdJBEakVZL3hSQhRQA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 15:39:14 +0100
Message-ID: <CACRpkdYbANG6GCYPrUus0k_wnEzF-6rkE1GMRLc3-nvqja=73w@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.11-rc1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2020 at 11:39 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Manually I did the following:
> - removed the conflicting hunk entirely
> - added 'break;' to the existing function in 'case
> ACPI_IO_RESTRICT_OUTPUT:' case

OK I did the same and merged in Bartosz branch exactly like that,
let's hope it works!

Yours,
Linus Walleij
