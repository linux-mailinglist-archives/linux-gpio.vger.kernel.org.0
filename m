Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7FA482F98
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 10:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbiACJqh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 04:46:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiACJqh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 04:46:37 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A159CC061761
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jan 2022 01:46:36 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id w16so133814101edc.11
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 01:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ea7xf5nC6yWPyNoj7Bhkp/1I/wIuopHPZ7n5fRnCZOc=;
        b=DSmgIoTI7UD5K3GUSguW6HZxXH4bWaqIF4bTLO2X3FnCpEQlw0YpdTusd/Snw2e35p
         R7EWIoOlSWuZmA/OakgyJvBe8bCeM09bR2BMSE/wm647reT+jWISp6V8kDBzjhKGt9N0
         TMjjNnVUafa5mJtIGwRrsm2Q3W5KQGiygwZG5OjayxZ9/ykkkGRJP3RYjkdyZ6+EO7YN
         IKMuBK0/HWQPNYjcVreyaMXvRK56AQi/IM1gFDJFmEXsEmvAhAgeG3s4nPJ69BG5Ltg4
         +uSrsNhEUj3K5Zw/sIBfE4LEiA6ZlxlgZUAy3wUbRKb+52x51irbwMNcnDAkIsIGO+ZO
         4A/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ea7xf5nC6yWPyNoj7Bhkp/1I/wIuopHPZ7n5fRnCZOc=;
        b=zGAz14oynyHfNrR8GdViK7Djumtk51oT7DT5hwRWrbuDBMlD899jyxdixNPpMrgXnp
         8BuFTyYbocsZd5i9rOT+I6ww93rEq03HxmoDyRvMk62RwVuRmRwwlsBS7O0+gQN6+TjQ
         GWcwW9f/viDU/cpTXkSs02Ls6NpxTDjgLib7WjsfbZL2es34JMQHj3vqKVkCH3102VmT
         25qApipxjjEjgj20K/CGtFZmJfrwiRbJuwg28yT64LK67QLNLjIfk627LvhdclCZhq1p
         0ZXRAerxd9fTi3d6e3pCvNyJE2fb0PWI1Ce+bjNeJIMHHYN/4f/R/WDVh6AkkUzTtNdb
         k6rQ==
X-Gm-Message-State: AOAM530imKm+Zyjrn3CgEEZbzH6ecbTD4owv00NxEZM1+e4liVrvnSc9
        t7wROXpM+JY1sqkhvdZ6PEeSUsfOH1py5pbXqEkvRQ==
X-Google-Smtp-Source: ABdhPJzdvGQ86fajGJoJNUFdVLwTKrDtzW8oaNzfZearDyUR/deCOVyJl1cycKsO53HVPMnOUtY0MV97D0XMgs48ATQ=
X-Received: by 2002:a17:906:3513:: with SMTP id r19mr36607273eja.734.1641203195256;
 Mon, 03 Jan 2022 01:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20220102155653.42165-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220102155653.42165-1-krzysztof.kozlowski@canonical.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 3 Jan 2022 10:46:24 +0100
Message-ID: <CAMRc=MdDB+FrN+08OY+Qq+bD5cPtXOJeFMKymhnGRNPrvgT-8Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: samsung: drop unused bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 2, 2022 at 4:57 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> The commit 6c56c6cd8031 ("gpio: samsung: Drop support for Exynos SoCs")
> removed support for the Samsung Exynos SoC in lrgacy GPIO driver, since
> it was moved to new pinctrl driver.  Remove old, unused bindings.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Applied, thanks!

Bart
