Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC72332BB4C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236749AbhCCMVa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842977AbhCCKXQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 05:23:16 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5ECC0698C8
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 01:08:15 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id k12so18640400ljg.9
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 01:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VgVOuS1QdOahuh5eYdd3kUCTER6wTGX5ASCqQ/qR98c=;
        b=PV84WwDH6AoIAOjPzcHF9gE4Neg+FF/n1iEVa9iM65O+VfmQa9SUJspvze3Ds0xmtY
         VNut1Zk3DzlViqxwSvsvuf2JVU9tvSiu8Jd7xGnmvLBgUU3puYPJhikl0UX+4XXieKWa
         0rBqqTyvMMomXbLELCv8FgnG/eoUUWmsOtdry2CoDH+WMqGh6PqtEV4hXY+zKsXY4MnH
         jlaX4DJR0JZO3wuG0cuLJAjfoZFo9/JgjIpSy3d5HhWgLztRgRmdt/Tf3ka3ih1qDVBg
         0Lfnm/rCtgSa17A7JRAqFsZsNDEhZYxVttvZ2/NEaXX+V2IObPQuwhqk1B/N3edNREZt
         vxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VgVOuS1QdOahuh5eYdd3kUCTER6wTGX5ASCqQ/qR98c=;
        b=Eu1rxPASYhvw4iksCFMtc6IlPn6IGH1YJyjTjT5aEgGCM6vK8Z3mu/WJy0BUf5pPpZ
         qyS0moXCmuvCHLdzav2wueSLagzjmr7j9SKZN6z+gEE86zGhjmQLbiUMxacpi0Q5GgV6
         DcGtngle37gGKq7pbL+VdSPl3WoledtkWp2mJvZkAdQSGwsPYzXl9rCXy+1wlQhKW/ZS
         Shu8KEuggalTUccIGM9U9/npbMjTxYqIvkucmilOn/FHU0PacrI+jK+18qHmO2umnQYS
         MDxT2B5vIiofG65LtD5VhMDe1MG4DIY0HIURxSAXB74KFrYXowY9GKJyUmPIgpeTHEWa
         u1uQ==
X-Gm-Message-State: AOAM531YU/9ze6JbQnCWlbm9sL/IySOywji2+OGT+dohGROB5M+JVF6U
        XO4SqjOdPvjsLsEl08z3tU4g4ZJriAmmJ42GyKKF6Q==
X-Google-Smtp-Source: ABdhPJzxigEaNt73mce53qjrn+MUEA/hhuJIqtZPEfomrycZI5NTqHmk7gTM6ml+qt1aKlxGUv4AZijNTpYhNfnk8J0=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr1351194ljc.200.1614762493875;
 Wed, 03 Mar 2021 01:08:13 -0800 (PST)
MIME-Version: 1.0
References: <1614303297-24178-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1614303297-24178-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Mar 2021 10:08:03 +0100
Message-ID: <CACRpkdbC9FZgj-VkZ3hMuKCEsFVfYoBm-OWG2WK2WbubmK=ALw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: ingenic: add missing call to of_node_put()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 26, 2021 at 2:35 AM Yang Li <yang.lee@linux.alibaba.com> wrote:

> In one of the error paths of the for_each_child_of_node() loop in
> ingenic_gpio_probe, add missing call to of_node_put().
>
> Fix the following coccicheck warning:
> ./drivers/pinctrl/pinctrl-ingenic.c:2485:1-23: WARNING: Function
> "for_each_child_of_node" should have of_node_put() before return around
> line 2489.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Oops applied this rather than v1.

Yours,
Linus Walleij
