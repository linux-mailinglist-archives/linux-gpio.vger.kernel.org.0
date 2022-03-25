Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D664E7C9C
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Mar 2022 01:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbiCYUR1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Mar 2022 16:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbiCYUR0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Mar 2022 16:17:26 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9EBB54
        for <linux-gpio@vger.kernel.org>; Fri, 25 Mar 2022 13:15:51 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2e6650cde1bso94012777b3.12
        for <linux-gpio@vger.kernel.org>; Fri, 25 Mar 2022 13:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vtp7+nDUHbkUKPJ586tHhPQHIGkVxn40OpnwYxUR31I=;
        b=etfZ2To2AkmbDwdMb4CemT9IGY7lkeRqGgVivTwjfOQJoN9U9bZ5skarGYOO2Oq8I0
         W85wxZ8MPSLmLidAYZCd3XG0GDfGOSJKpINCippQRZGUf7Nv9cZTqf84DSWa+YPREmgF
         jJqjj7mlo2YiKvw3yAeMF21Nuy5X7hyehxeuuPotXyAenAXf0nNM4RHRLc8YQTULVjPA
         FqvoJtQBRtjgVLv8zsO/m3D+DMyKzHyOdMJjXEHhIrWlkoWzla+aDSLA07y0aDgRaEER
         CNMkNERYLMkcuoRK5l4y2xUCEszmqCFGPSwPFGBQV9Ds1A1YLeewOIjQAM+4kGkM0z4M
         IPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vtp7+nDUHbkUKPJ586tHhPQHIGkVxn40OpnwYxUR31I=;
        b=Is+w92o+JaJgY9F+KVEwAHPjHasSYwFpip6wEVru2U8NkbINQpaFn4oH6Q8fG+cj80
         88p2SBGLeUONdX/bqbEHaIQ9w1BLMtJM3d8vHeUBYEyKcNb/CIxbqeQlGnW+vOe1HiEN
         ZdwEoi3buCilor5a0ochPmFxZvuuJwd750Cnv85QzFsgvymLNXjxkI2mBy3TYbmwTN9G
         Jh3oNhdPSlLm7okzOhC7pr3d3w/akXZAk1QPFGhS09yTC0pDfCJlsXXTAFzWPme+YhOK
         6jWrkocNj4Y6nDOyZgZpT5AetOXKrZETbpZ1J51xRDS/axZvJ+Ba9fHBTLf1lUW7xhtI
         wDcA==
X-Gm-Message-State: AOAM531TZp6NaaW9CdndRyptQBZj+v7ht3w1sRslHokzleITRBklrvXW
        Dh5Ohyv2bCg7n4jHmeqsHBPGyyjxi8mP5V1Az20ruOSuthU=
X-Google-Smtp-Source: ABdhPJx9wqjoJz3ZPG5WcmFuaeeOXO7mos5GYyBTpymriLoOeZj41vkwrTWS/8NtQ2pgHGEGQWw5VikpO324lYovgig=
X-Received: by 2002:a81:1182:0:b0:2dc:4e58:da41 with SMTP id
 124-20020a811182000000b002dc4e58da41mr12592447ywr.268.1648239351038; Fri, 25
 Mar 2022 13:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220325074450.3228840-1-zhengbin13@huawei.com>
In-Reply-To: <20220325074450.3228840-1-zhengbin13@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Mar 2022 21:15:39 +0100
Message-ID: <CACRpkdYHKq+aSHzm6wG3ETwob69gmmjFT5UV7EXL0rDxe4ZQ=Q@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: nuvoton: wpcm450: Fix build error without OF
To:     Zheng Bin <zhengbin13@huawei.com>
Cc:     j.neuschaefer@gmx.net, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, tangyizhou@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 25, 2022 at 8:30 AM Zheng Bin <zhengbin13@huawei.com> wrote:

> If OF is not set, bulding fails:
>
> drivers/pinctrl/nuvoton/pinctrl-wpcm450.o: In function `wpcm450_dt_node_to_map':
> pinctrl-wpcm450.c:(.text+0x404): undefined reference to `pinconf_generic_dt_node_to_map'
>
> Make PINCTRL_WPCM450 depends on OF to fix this.
>
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>

Patch applied, thanks for fixing this so quickly Zheng!

Yours,
Linus Walleij
