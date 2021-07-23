Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277E13D385F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 12:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbhGWJbk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 05:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhGWJbj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 05:31:39 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF1FC061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 03:12:13 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id l4so1069242ljq.4
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B4bwf42yr7JDyD4QQpqpl0rLmj1/xri03U/Voi5h7Ew=;
        b=peTla0gSTFhnVjVhA6ibtdFo8P7M/kG7BRP+BtNEFAJz96D+UHUw04tth7jgCdNTYN
         AC/64uRJ8gYJMc06has4Fk0vOK6hMoEdf37DkY/8sSaRwJzVptA7HGTw6D6Bf1yB1XCU
         gTjWDOi6QuacsIF+7O0U1ZlC41IKVanMdaYcO7gso3gJhsPce+CplWyxuGwKmlsL0djW
         7Rcp3yReyaQgufzISXrn9795+YgorFmgtrffXOwaeHgTPRmkkboSve/VseQBYkos9CMB
         la/cugeM9jaXwyyza3dbwrnQIoGH8PFVXail0TR4eSnfOotbk6/y4loFWJMQhh/fx1RT
         Hw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B4bwf42yr7JDyD4QQpqpl0rLmj1/xri03U/Voi5h7Ew=;
        b=Exec/wrvt+r9uOallpcME6JL9/jvOIbwPWe4SGTvckVNVU6RbLLZMD+iZG6xStcrQS
         szj0yEmfp5M6ewbfzQedpM5SA3rT0uSWVdxM9Vs9cJyvPkCD05qyFcCmOTz1TWV8kLj+
         4jQIP5vSpk991p1AUnNG5KnALv7gl2MVSdbM/l/peEd64C18w9YQKnk83dbF0ZRRhbcK
         vBgzeD9Qeyjc6vtymlAJ5/Zys/fELTV5hq2OL6RNN9bSMDv6VOH8lG5kLtfpBaQNUskl
         GysEdTQaGa3gQEECe5t8PVzI82ZTOR0HMbJMQctc5oJMsuartNBrbBCcQTsjevR97trg
         td9Q==
X-Gm-Message-State: AOAM530wyH+Ehk9IQnWqISLXX09OZmGtA+eKCfVbA8mLkK00ZWXup0B7
        TBsY0nYLxnjFtSNUGc+c4+9AFHzyRvP8G/Rr2Mg9dBx3eG4=
X-Google-Smtp-Source: ABdhPJylc9c6SpsywKJ/yFhTDF0kUIitWITuqrjcrNfQBURMum1nGZWrRp3Xl5aC1FVq+/EwI8LrgxA6/CtZ68PMwnk=
X-Received: by 2002:a2e:908d:: with SMTP id l13mr2745778ljg.467.1627035131719;
 Fri, 23 Jul 2021 03:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210618062449.1067106-1-jay.xu@rock-chips.com> <20210618062918.1067557-1-jay.xu@rock-chips.com>
In-Reply-To: <20210618062918.1067557-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 12:12:00 +0200
Message-ID: <CACRpkda+DMr_VvRuhHVF2KuQ8sO0nsiAKLgr2tD+vsD7=1CzJA@mail.gmail.com>
Subject: Re: [PATCH 9/9] pinctrl/rockchip: drop the gpio related codes
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 18, 2021 at 8:29 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> With the patch to separate the gpio driver from the pinctrl driver, now
> the pinctrl-rockchip can drop the gpio related codes now.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
(...)

>  #include <linux/bitops.h>
> -#include <linux/gpio/driver.h>
> -#include <linux/of_device.h>
> +#include <linux/gpio.h>

This is wrong. Do not introduce new users of <linux/gpio.h>.

I don't want to delay the merge of the patch set because it has
taken long enough as it is but  please submit a patch removing
include <linux/gpio.h>.

You either need <linux/gpio/driver.h> or <linux/gpio/consumer.h>
or both, or <linux/gpio.h> is just exploited to get other includes
then figure out which ones.

Yours,
Linus Walleij
