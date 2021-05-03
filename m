Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4671037129F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 May 2021 10:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233036AbhECItz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 04:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbhECItz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 04:49:55 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9CCC06174A
        for <linux-gpio@vger.kernel.org>; Mon,  3 May 2021 01:49:01 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id g24so1876069pji.4
        for <linux-gpio@vger.kernel.org>; Mon, 03 May 2021 01:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HTDi/+Bzgfiv/FzsqLt6rJPzSzkgLbhwEdoJwi0Q3YA=;
        b=VF1sLanE+TBcU8+96pMfb3tzHQ35ghXgLgHgT/Td3HMUWkiRnioesCtC/nCQZz9DH0
         6y9tEYx+puXp8Kfr/NJdluxJ+on2IU743f/OqhfLSWkNgkzdpya2Tbk3zV9IR/A26XQK
         FI1XIRXQbgUq+rmH4eHjom6bDvthp9xMuw/ZaKxXUlKCFeVBRJQhLIeOfH6yzMd92cFw
         KcRcqfWZ6gBPU8qGE/4Xucd2jNfdkU1W20Cxln25NgBGUKvPY6YljHdn4O4mrMR8NK0h
         l9QjoKmTBIR/St10N2sdErp173kFpJBIWoU031O4IjdC0FcsrgVxHmp9oYymUiiC5vDK
         7IZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HTDi/+Bzgfiv/FzsqLt6rJPzSzkgLbhwEdoJwi0Q3YA=;
        b=T3zzok5v792ziyO7Nhpv7cUhSwBAjiGVfEd2fsABGXNETLdOMWuN4H2ZPE/AsNkk34
         FDkNwxQceLqudw+bI/GvBmU54jbyLSdaZVTW0wc0TFh0sOrnOcAFFHyFND0wrh95guJR
         0C1VjhUPBim91zbwjCV9BcHlIqeU6G92KpD6qFLnBp39wuQTIyUnqS6IqNNdMuG92xHS
         qLD00V9qQumBeByqt+iXOxliBUR8jkkWNojGFVPTUoaUT22ZcdpmQUdY4LOcX6ZFfPPK
         IC2W6KkQBEWwFqVRpWqrjDv9f9scIYJSwmK5YobCeA2VLvBNXDbW7GDmfQvq7sUdLdmk
         BYfg==
X-Gm-Message-State: AOAM532iFEKmpuDvTgXC1CGm7HKD19iqKnAw5aG3+dtoQiD3JwZla4XG
        R64pl+xgrisfQh2CBSss3rjXk2EAEP9FAr7rRcs=
X-Google-Smtp-Source: ABdhPJwwML4M5AWuQoZ+qJFs5ZC0fRLgefOgmM3RkOa3rQxMaOhs+ervM0MlN86HzV7hYWTrnv3HdB1SIKV11rCFj54=
X-Received: by 2002:a17:90a:bd13:: with SMTP id y19mr31092406pjr.181.1620031740998;
 Mon, 03 May 2021 01:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <dd5443384071ef55c46316e7a66cca55348f6005.camel@microchip.com> <CAHp75Vf3j5NmZFq8cuMy3nbKuKq193_=B25nfCoS3e7D8CcOMQ@mail.gmail.com>
In-Reply-To: <CAHp75Vf3j5NmZFq8cuMy3nbKuKq193_=B25nfCoS3e7D8CcOMQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 3 May 2021 11:48:45 +0300
Message-ID: <CAHp75Vcr8U5sMofJVH3kN4_R=dVwUExmCDA6_PELPC0bnsR0aA@mail.gmail.com>
Subject: Re: Error code handling by GPIO subsystem for PIN_CONFIG_PERSIST_STATE
 config
To:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LinusWalleij <linus.walleij@linaro.org>,
        Kumaravel Thiagarajan - I21417 
        <Kumaravel.Thiagarajan@microchip.com>,
        Sundararaman Hariharaputran - I21286 
        <Sundararaman.H@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 3, 2021 at 11:44 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, May 3, 2021 at 8:32 AM LakshmiPraveen Kopparthi
> <LakshmiPraveen.Kopparthi@microchip.com> wrote:
> >
> > Hello GPIO Maintainers,
> >
> > I am writing a GPIO device driver for one of our PCIe based
> > devices.While addressing the warnings and errors reported by checkpatch
> > script, I ran into an problem while fixing this.
>
> The problem is that you started fixing the symptoms, not a cause. The
> cause is... checkpatch itself. Please, fix it instead (The warning
> should be rewritten to be not so frightening).

Read this [1] discussion to understand how to proceed.

[1]: https://lore.kernel.org/lkml/cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com/

-- 
With Best Regards,
Andy Shevchenko
