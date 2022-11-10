Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED12624160
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 12:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiKJL1q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 06:27:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbiKJL1o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 06:27:44 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EDA70564
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 03:27:41 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ud5so4209156ejc.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 03:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FDOhCa2fbmtlMq402EaRzAG0RBf/CQ3BIKcmBt22h0M=;
        b=Z5NrMVHPWh6l7ag5/IEXS054QX0ei5YkzBJVcqQEv7G8RV5xmPDumI40oJDdsYtHEY
         aCwehsup6XFtD5uOg1i4I1FciJpS5KzuUAvsbBksTznYaoHyCebhGkdCyUUp3cqTHQu1
         SzwUVSr6QjBqUWEzyQotDAhIh62CNsYhv212blljrr/KEbnkiTtpbxcHQcn97lK5MDsx
         09BRiQRZdnH0of5bolZ3nSyy0PV+axpFH0GJe6pNmNdIl+SXtX1UzcXFeP86/aext1Gq
         zH7spl5Z2RGX11oI+eLIaBCizL5y1gRC/LvbN3vk9nNLPx/IqzS5kodRP22XEUsFy81V
         Q8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDOhCa2fbmtlMq402EaRzAG0RBf/CQ3BIKcmBt22h0M=;
        b=xz3CCPdm2YQ9b6uZ4BdwtDNjwCC9aI8GnKM+zma6QuSfKVcLLiQ+htgU2Kx+FLvKl8
         UztQOZ0y3Ce6jFR0dNDYgZpHgwGkyUIIl1QfSPmdKQU0wesGmijyz3lQTDMPM5Jd6sFD
         JiPWekomKh+Mi50ktex47g2GEOEMKP1nQLjiP4M8gmwORg3QpM6r8xCuTS7qsvnmBCCG
         6oVSEFyjjDj9ajfI/9Z9+r5Yty/952k6UaeKladyaEr3Y0BRDpE0TSnPnKEFXJyC4KUH
         xa6UJyYTAb5h2d57GCHhaXLQcC26oGtfoCp2ZfUdPyRWt32KHB3vPiznvT8tegrpuxO9
         Gi8w==
X-Gm-Message-State: ACrzQf2W4icMM9ENHhUPG4qyWQAvJdIFiL9z2KtaRTdZEQA6YdH5zUaO
        /Nwedjyv2mQXiXwJxMZwnWoeC9UTEj48Jt6GX9i0HQ==
X-Google-Smtp-Source: AMsMyM4Na74lVmM6zqmZXEP6FLXgpsuYBTAjYc3v0PSHSoOMbV09EBeV7e6Qwzqyrnq5Nyw29MIQLCb5zIKtkiLvUQM=
X-Received: by 2002:a17:906:3394:b0:78e:11ea:8528 with SMTP id
 v20-20020a170906339400b0078e11ea8528mr2649768eja.190.1668079660174; Thu, 10
 Nov 2022 03:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20221110082056.2014898-1-zengheng4@huawei.com>
In-Reply-To: <20221110082056.2014898-1-zengheng4@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Nov 2022 12:27:29 +0100
Message-ID: <CACRpkdZQiTzLiP5ObRxp6bU=jFnJUFKS6_itSDwtn41x9-2+mQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: devicetree: fix null pointer dereferencing in pinctrl_dt_to_map
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     dong.aisheng@linaro.org, swarren@wwwdotorg.org,
        linux-gpio@vger.kernel.org, liwei391@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 10, 2022 at 9:22 AM Zeng Heng <zengheng4@huawei.com> wrote:

> Here is the BUG report by KASAN about null pointer dereference:
>
> BUG: KASAN: null-ptr-deref in strcmp+0x2e/0x50
> Read of size 1 at addr 0000000000000000 by task python3/2640
> Call Trace:
>  strcmp
>  __of_find_property
>  of_find_property
>  pinctrl_dt_to_map
>
> kasprintf() would return NULL pointer when kmalloc() fail to allocate.
> So directly return ENOMEM, if kasprintf() return NULL pointer.
>
> Fixes: 57291ce295c0 ("pinctrl: core device tree mapping table parsing support")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>

Patch applied for fixes.

Interesting that you managed to locate this using *kasan* of all
things, it kind of requires that you manage to run out of memory
exactly at this time...

Yours,
Linus Walleij
