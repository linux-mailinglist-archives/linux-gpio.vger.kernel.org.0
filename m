Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7375BE1B9
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Sep 2022 11:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbiITJRw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Sep 2022 05:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbiITJRs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2022 05:17:48 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED21B65240
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 02:17:45 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id r18so4546699eja.11
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=B5wkG5cCTLSCOD1hkwpANn7XhcVr+PVomXGQIyaaIyQ=;
        b=ryQi6XdjOVX2wHjnL9xEakuLN61t6K8UrMqFOsKOpk0NxuVz2un399Jj/sMamNZm1c
         upcCO0xQLM0x0H9mfPipEInoxmL0nlntkW3aRYu0mo1vE+PImucfa99tCqsv/HvmoP2h
         XH3rEFlGgq6JlQFptTCmZRBTJoMWt30/cAoy4kozXqAvlHJi0zHVRXO5OuAW+kqWTdXj
         VygVDrLegzwrf6bNDwil2BrH8otV/x5eTsuvad9TcXM+GcWR5fGNVhguYdRcCI5hJtbg
         VdnIC0dpkwya52PwL0QyEcJdbwfVfn87iIsksqVY0c12N2UHuRhAk2mfRERVts1BcGGP
         5MxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=B5wkG5cCTLSCOD1hkwpANn7XhcVr+PVomXGQIyaaIyQ=;
        b=y4eHwVrPR6IK0u1bRllwUdN8lpOURodtTbWAOrW2ObELuU1LMGm8LJHRJ7amvsGVLb
         U1WvZNUWKrwswGd3NzWxkdjAisD83sbJCB4ryeDCAU7ujSWgvd6k4N/25JER1g1H0iYW
         5JNmXrhsuhSQq+aFIgVCdihKO7FUQ4qz9t92KlNffkhpC5la7dywVA3gD68F3eSL+ADJ
         3dvbpx6rNiBiI2Ff7iHaNDvBR5FCkqgBQDYFcViVui/gVz5VfUprpoVHQFZ6fXhxehq4
         ykEYOvi8nWZgL0WghM60RerAi4PDwfVXzAWY2n9Yns+Pcvdu22USUorni+anlgwSgtUd
         GnxQ==
X-Gm-Message-State: ACrzQf0j0u0jWofNnCMC9tM5T3XrrzJFflezAQ1scMDzEypn/jfKj1Gl
        KNrMgebUs4D1RtNI2S6VzZRsAC2nXMbLahZnCNvw/fgv+LSXCQ==
X-Google-Smtp-Source: AMsMyM70cbrgYu7SUa98V8Nc72BUPxUkXForS3z7o2ooNUgp5SdIUYqGzsOq37w2Z2mlcDT/qNxbfwO4DGLzquUXYzk=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr16336219ejs.190.1663665464102; Tue, 20
 Sep 2022 02:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220917122015.1893880-1-yangyingliang@huawei.com>
In-Reply-To: <20220917122015.1893880-1-yangyingliang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Sep 2022 11:17:32 +0200
Message-ID: <CACRpkdYvsyJur2-kDAC2w2HOiRk4ZPBN+FBv3=Zrg6soOdHfLw@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: stm32: Switch to use dev_err_probe() helper
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com,
        fabien.dessenne@foss.st.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 17, 2022 at 2:13 PM Yang Yingliang <yangyingliang@huawei.com> wrote:

> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Patch applied as obviously correct. Thanks!

Yours,
Linus Walleij
