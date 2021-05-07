Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B32D376BB7
	for <lists+linux-gpio@lfdr.de>; Fri,  7 May 2021 23:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbhEGV1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 May 2021 17:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbhEGV1X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 May 2021 17:27:23 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF9DC061761
        for <linux-gpio@vger.kernel.org>; Fri,  7 May 2021 14:26:22 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b21so13282364ljf.11
        for <linux-gpio@vger.kernel.org>; Fri, 07 May 2021 14:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XG0TLyszi1cmh23fmH0mhN2WgCliBgRLG2x6Fui/g3w=;
        b=hodjiOCfhaug0X3p4IQrL+WcbBvdiThSPchin6eJxMJ2dt0+Me5jQvoBuO67weHHYO
         fBwbLAHWSc9YUyFTQBloGw9B711VjCdTmpXZuh+/yia7xVM6xvl3x2mDefdrS3xYtcO1
         oIetrSG0llXe8YfcymcicYd6DR4droaELRHIVQbG6772pm9JUeoevm+ZO0H1yUzrt5HW
         rnOFfBTK72QJF83XqkEEv2/X8bCQzubEAFkLHQwwbVWpETkA3QYN3MmHGCN2KEYdhjBT
         AfAbjC9daNgoeNwLXGtKfJOeza28WvCd2mk4UQ+0d2i6U3BNsJ7zrcX5TmU3Tl+hAWUi
         nyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XG0TLyszi1cmh23fmH0mhN2WgCliBgRLG2x6Fui/g3w=;
        b=nNwUuTnQ24jZ7WfELPmwlNhnTkwmMICg/brARvRKfSusPGOFgnpDLrtWn+WUr/ft2p
         msJPff2/0KvvvF2RyG4ekR4qJR7pVOIi/QmGYZcZ+ocIE7RogYPqU4TbaWxvdG9JbzzA
         zSeLb74AzLcidcHbn7USfvbJzRcfM9BA+YpqkLWD7FPpN/LvzME3P815p/jAUqeDSVuU
         tO68gx/4TbR2rkrIvo8zsEjJg2zB5NDH9PSKMdJHH4lsGy5JlpgdS7WfRAUB0Ef3hA8f
         r+Bjtf/5lf2RnYxvbRoEeSeZnDcgcDhtj24QlHq7oWr+Ufv+1WsQjobskhWvyq4k1q3e
         vnRQ==
X-Gm-Message-State: AOAM532s/mpv6qkqeG6ReDPekWaztNWaoPTtzZmkV5+bLXeb9df0WXLV
        gqzqxbB7a3GhtCJObvaPK33fdpEFKwvhljsZX5IO1w==
X-Google-Smtp-Source: ABdhPJy3z0qWS5Sneh44i6pk2oO3OOciepj+d38iIgI70000KRkNiArXJwFb6hKxgj5G3aVCUF/o8itqFyKwsM+AULo=
X-Received: by 2002:a2e:2e12:: with SMTP id u18mr9286103lju.200.1620422781142;
 Fri, 07 May 2021 14:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210505134028.13431-1-jbx6244@gmail.com> <20210505134028.13431-2-jbx6244@gmail.com>
In-Reply-To: <20210505134028.13431-2-jbx6244@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 May 2021 23:26:09 +0200
Message-ID: <CACRpkdZZ-FZn6Q3w6g=FayOzpUW4ZfenQ9Oxe0+Co2RyYpTZLA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: convert rk3328-grf-gpio.txt to YAML
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        David Wu <david.wu@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Tao Huang <huangtao@rock-chips.com>, cl@rock-chips.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 5, 2021 at 3:40 PM Johan Jonker <jbx6244@gmail.com> wrote:

> Current dts files with RK3328 GRF 'gpio' nodes are manually verified.
> In order to automate this process rk3328-grf-gpio.txt has to be
> converted to YAML.
>
> Rename 'grf-gpio' nodename to 'gpio'.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
