Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D060B218114
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730301AbgGHHXT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729887AbgGHHXT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:23:19 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7F1C08C5EE
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:23:18 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id m26so26259039lfo.13
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ols8fE88SOECty4ug3M3JHhI6m5+t3LRMsYguz2UCws=;
        b=ERVIiViD/iI07aPNMiZegbsH2kVCDifsiyM7h9FotGZUkC+BE9yb5iEpRWefKTJnkd
         jReQfyFSiRV8jK7vXeMOXJeEAOLJT48CLEv3e2jRwzs4+OeYlSQC0NYsZFlvbGBnrDmI
         XvAq1Puv9oLu2GH99BVBlWbMYhsa4sL/iKLN6isDfuXORZ1GIEzSjU57Wq09WZrx4U3Y
         y2LPZLVrbECvVf9m+MD7bkPcBzaVrGLesjJhBKT4/FAabPEfAgEU13B+zk4z0+8lUBnk
         rX2KJK3j1Dt4ttJR41YT2eellrR5IHkjJwEQm6an1VijL05wsIEpFXsancfjD4bYgLQ1
         mv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ols8fE88SOECty4ug3M3JHhI6m5+t3LRMsYguz2UCws=;
        b=mbskI2OiIvZzY4ArnRqfRoLUHd8kIyDdNHTMr+Esnx08qPRj8PxlpDDpMVpiYGqwf5
         Gbcu5f7Yx2/ZJSI4YJIFbNrFvRLXJVw5W1lrebW4juRDSzPvSR9IttTPC/KofKQlZ1j1
         GLO2Iz9Dla1FF2QbthiQiHBfGE1CjfjSOxoWIGhNA+QUfS9CRotDzZVs5/hD4H3W3DFn
         XrXSE7OE7fj93+CbYupVGyBNZax4cFIq+zVDkh4T6ETrx2BPSlFkBBQNZfQF+n7MCrN4
         xgL+tzA4D0ylmn9T4ABM+eVWMv38dCMLOSCFDMU0oOR5Iyp+pM44BbKgo7D1LOzPg0Pq
         ieMQ==
X-Gm-Message-State: AOAM531qJc7vAHtfvrDDJq9qLdLj8MeqY3ozPt186TGTp8Bs7HpJ16kL
        VGA8EvFI0wqNBgp1SdsmPIkX/fPCS4rk4N0UnUbnGY81xcI=
X-Google-Smtp-Source: ABdhPJw7rifWiraCKDisMMtwfhzfhSSUEzk6UZkGaSDEQ9v2SD4J/7mMqL1Gdv/j4APtHu5Ifpwdpn20zoEoTGYflcU=
X-Received: by 2002:a19:e05d:: with SMTP id g29mr35015008lfj.217.1594192997140;
 Wed, 08 Jul 2020 00:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133345.2232932-1-lee.jones@linaro.org> <20200630133345.2232932-11-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-11-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:23:06 +0200
Message-ID: <CACRpkdZWeJ=aVR7F2_aLYe-P7ZWGJkSQrcfVUL9vBf8C1nxWfw@mail.gmail.com>
Subject: Re: [PATCH 10/10] gpio: gpio-mlxbf2.c: Provide __releases()
 annotation to stop confusing Sparse
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Asmaa Mnebhi <Asmaa@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 3:34 PM Lee Jones <lee.jones@linaro.org> wrote:

> Sparse cannot peer into other functions to see when and if locks are
> acquired and released, thus it simply warns that a 'context imbalance'
> is detected instead.  Let's be kind to Sparse and let it know that
> this behaviour is intentional.
>
>  drivers/gpio/gpio-mlxbf2.c:125:12: warning: context imbalance in 'mlxbf2_gpio_lock_acquire' - different lock contexts for basic block
>  drivers/gpio/gpio-mlxbf2.c:151:13: warning: context imbalance in 'mlxbf2_gpio_lock_release' - unexpected unlock
>
> Cc: Asmaa Mnebhi <Asmaa@mellanox.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied!

Yours,
Linus Walleij
