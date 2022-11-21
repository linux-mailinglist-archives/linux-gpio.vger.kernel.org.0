Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2100A6323E2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 14:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiKUNhR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 08:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbiKUNgu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 08:36:50 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B69C4941
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 05:36:47 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id f201so13572460yba.12
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 05:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7fETgmcg+RZComtgQK4VwfLsjYwDPSbBGi7QkQgS63M=;
        b=LgTESlEs9kToX/T0EAmm3YEataEKQTY6/rVzfeOL26hCaO0wGF6F6n6D4JElc8z7Of
         sOQBcg3tHIClk/OC72lCdNPyDk87eyNNMw+VtsQclxzechHDagZsuHbJ4NgyCR9+d6CW
         yGjN+Of3fewohlDiHN5l6BFFBNtUC7FeHJAYldH43t694E4cTAwVi0XElCBzq6GL3hUz
         /9aoYJlhpl1JncmfZJTkLVsypQn1GA2HXtZSS8OCGrbtub+ExLPoxzqD47CkaIDzJZcA
         tTXX/WWcXtDZLkO1If1IJ+jplONoaBx4W3Cx7ml7bbzv8KaPFbJD7YM+Bm2jaWBbjEUG
         8zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fETgmcg+RZComtgQK4VwfLsjYwDPSbBGi7QkQgS63M=;
        b=djhQ3i4ny3qIwsC/rDCE/uq2hkIBGUGLGWsNZ+4BTr4OjPZYH6EmXAOAa2+lkK7J2I
         CkgKNljsS/EUZEBchcVa/XJYKpU/1ByvbxB3alVD0F3Owz7VM8euWUkvxdEvERAhwR/8
         K6RbITALwQFccI9g6Kew8vgHegsNA2k7ke7Kq+OHm1509K3VpJFEU11fBUsyUacB5jSW
         fcBC76KDFvUj4ZK/SwZ4M47hbRi9rX6K4cbhYsuURcdTYmjXd6LfFOQOwHYEsBqzi5DN
         LNDiYQk7IIgHDiOGT0mt7JRa5QbgC77eYmS4p1Sk/94N90+LlXqqSPU3R3+1kvPO7WGv
         zS7g==
X-Gm-Message-State: ANoB5pmYKfYqEG/QnHuxSX/x9CScOpQ28Gsx0A/M9w74l9kMmiNnU3au
        sgFBqv6w6onobg1/gG24KPlEqdglE3Zm5/c5DgnmURoCJD8=
X-Google-Smtp-Source: AA0mqf57H3TO9gZIjfO4a+5v5wlwnlsXcU4w0wfFyEkE0W+ApaZ6mcQuJrZnYvZNfAXNLxOMMQKfDP5zl7cFfFTYcgI=
X-Received: by 2002:a25:1843:0:b0:6dc:b9ec:7c87 with SMTP id
 64-20020a251843000000b006dcb9ec7c87mr590091yby.322.1669037806948; Mon, 21 Nov
 2022 05:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20221121132608.230645-1-renzhijie2@huawei.com>
In-Reply-To: <20221121132608.230645-1-renzhijie2@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Nov 2022 14:36:34 +0100
Message-ID: <CACRpkdb9Aw-8wXUFYnBy_LOpuTeB2RpnUB+QwWQiZ9R6BcwbGw@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: pinctrl-loongson2: fix Kconfig dependency
To:     Ren Zhijie <renzhijie2@huawei.com>
Cc:     zhanghongchen@loongson.cn, zhuyinbo@loongson.cn,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        yusongping@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 21, 2022 at 2:31 PM Ren Zhijie <renzhijie2@huawei.com> wrote:

> If CONFIG_PINCTRL_LOONGSON2=y and CONFIG_OF is not set,
> gcc complained about undefined reference:
>
> drivers/pinctrl/pinctrl-loongson2.o: In function `pinconf_generic_dt_node_to_map_all':
> pinctrl-loongson2.c:(.text+0x1c4): undefined reference to
> `pinconf_generic_dt_node_to_map'
>
> To fix this error, add depends on OF to
> config PINCTRL_LOONGSON2.
>
> Fixes: f73f88acbc18 ("pinctrl: pinctrl-loongson2: add pinctrl driver support")
> Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>

Patch applied!

Yours,
Linus Walleij
