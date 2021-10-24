Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B86F438C9E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 01:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhJXXwe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 19:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbhJXXwc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 19:52:32 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47783C061745
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 16:50:11 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u5so8789450ljo.8
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 16:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d5wxYLF9PyUjqsBM53BvGX8jmR3Qfyb3lLJrySvPpVk=;
        b=e8dY+ZHzPYVRSJ/IgO+HF9382SWD1+jihB2m3ZRUEH9RYliEsXiOxG2dKT88YKbeLx
         cYz38nmzeIdAmPBd2aGI9jGWyEHJhVjSQe9qTYn0cCVGgEcIpSdnq6UsHaeQZUgAOf20
         BIDE0BZ5ZD26Hm68Cn4DUZAWcEWxFv7+fR/Unr2b3PLxtj8dE8kHicnJ/nGFgkM4DsCA
         bTbiSiO1+SgnP+9tMsWk7vHCjGsiQveq35sMjshMPzy+gkeAIv9bpqsWxLvVHWToRuok
         QYAEO9mViDMpLSlv+9HN+Udlql11u8omlG3hwEgBjQzM0a5jafdXbwoWuIyccdIBlymo
         sD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d5wxYLF9PyUjqsBM53BvGX8jmR3Qfyb3lLJrySvPpVk=;
        b=ou6Wj3KjfnIs9E6RLxnnCKzfI4itWvmfyHIe1HUmJxtPc4w/NpDu9rn24IAubgFQH9
         uakxw4rfoMek/A+6kjFRljWbeli42584rfnXQi3vuics960v1vtxEurety9V9BywBBlU
         yk7AhnXYXWFPn/cl5+tH1y9ui9guObMQ5YKNmEHKuapnpLB1ktr6hXUD+Li1UbPLQxC3
         wcjkIzymoP2bax1C/2tAFWQ8CU7CIn30t9aTQibn/qFV4eZlNr1k2zmHA5RrgqML6HRY
         atPsbd4N7YJnVSJjj0wvMZO8zevzI6qnLIQ+dzTei4csyIcMmYozHyKJKhJY87qCTzaz
         p/uA==
X-Gm-Message-State: AOAM53131U9fRmxaeaDZkvAZvXoDAYeM3aLBn237jWhUo8Uoohj5S/3D
        W48lv36UYnRcFzeFIcF0D0vGOdWkKNakXwZoV9qZ1Q==
X-Google-Smtp-Source: ABdhPJyTFFbK9uXT4v43P3pVLHBTDYl9Cv7fUmmS6SOKNhUnff2wAIlcs2BFsQLMfPQcvqliiTmBcboB9gLqANx8qb0=
X-Received: by 2002:a2e:9c0b:: with SMTP id s11mr15519693lji.259.1635119409696;
 Sun, 24 Oct 2021 16:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211014123342.174711-1-jonas.gorski@gmail.com>
In-Reply-To: <20211014123342.174711-1-jonas.gorski@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Oct 2021 01:49:58 +0200
Message-ID: <CACRpkdYupqjOKswevxcj4hd2mUFMa=hke-ZeDGsv2NHX4ua4SQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: xgs-iproc: fix parsing of ngpios property
To:     Jonas Gorski <jonas.gorski@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 14, 2021 at 2:33 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:

> of_property_read_u32 returns 0 on success, not true, so we need to
> invert the check to actually take over the provided ngpio value.
>
> Fixes: 6a41b6c5fc20 ("gpio: Add xgs-iproc driver")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
