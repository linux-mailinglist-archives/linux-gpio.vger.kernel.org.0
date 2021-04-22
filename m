Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C15B367618
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 02:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbhDVANW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 20:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235318AbhDVANW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 20:13:22 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C85BC06174A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 17:12:48 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l22so42394676ljc.9
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 17:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r3vArZ++B0gjt3Lfyq+dn2ivL89SFulsqFjWL77gtAQ=;
        b=OhOCqx4fKCC9TcMfQEQuJ0w0dewkmHNpl0MwvW6hOf90zBQo9QoRV2wsZXdeinjn7d
         daq3aVrVZWw75Qs2kZxYxt95TgbGPrx7vUtGd9eyA3TVLJdynUz77xFFl7npJiCEtAnf
         zd5eBPB+WhEks8TiQ6KcoxzeMp9UmsWP91YUYKlrcloRPqmc5xGbY1Su8JzDCUjsnoeo
         mrOXgyGAYOmJ6sviXZpkcfmlOBC/qA2KdGEv2HBzidYxBwT0FwtNUJvYTcfQU7ZOFft/
         CIrj5v6dMhCYJxYNBuwy3yveMvgv/pP4fy/+1mYwrK2JKM3AbX9SCJoyZtsZtS2ZGJ/n
         c4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r3vArZ++B0gjt3Lfyq+dn2ivL89SFulsqFjWL77gtAQ=;
        b=R43ULSKs8RS7UCSFFQM5MPxXKlMOtv3hN9FJzlOh4VMm/Rn2TeTvJ0NT7RJ6tLiz9h
         owXM/TigPDTGQ5GFsFQQCNCBosMNoE8OSdViZPJxxbUYR6mvdf+NlfzlQs174/ugRPwW
         8bU0xo4QAOl0Mu8EqDRrsO9bPLq4+GAiiSUaHBDMwIrMSGleRFjSvy/2eZkhM8mWS4PD
         xm9VUsoFNTrOQFE0XI3fPKZ0T/BL51wXseAxmT6t65XatCsAqTQFm/NRh1k2ykBdQUC1
         xaGZ9/KBwdzZGCXuFaSpdWc/SQnDwWKR3BH5Q8Hplls5nNPHzPPM38kDWWkDbCFtUKAT
         DQsA==
X-Gm-Message-State: AOAM5329rXc524OmsjaLRvs3eZmF0CoSJau75AqzYi1BUmbsEuOq2n1V
        iwt7DzgJlg1oUTaQMX0QMqWH0SSezvzBcn7zvcvtYg==
X-Google-Smtp-Source: ABdhPJzl/ONTOL5R/6Bp5wFCcJc5a8gHSlaCis5pvG8XWehl3XqSatjYVeMsHeT9yG6zRYsAIkdNVIWy4bcaymzLSYI=
X-Received: by 2002:a2e:a369:: with SMTP id i9mr549064ljn.273.1619050367031;
 Wed, 21 Apr 2021 17:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210420090727.1246116-1-jay.xu@rock-chips.com> <20210420091240.1246429-1-jay.xu@rock-chips.com>
In-Reply-To: <20210420091240.1246429-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 02:12:36 +0200
Message-ID: <CACRpkdZBCMygPoW+rY83nc7OrdEWaEyuoqzSsJ=t+mGvYroxNg@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: rockchip: do coding style for mux route struct
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Tao Huang <huangtao@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 20, 2021 at 11:12 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> The mux route tables take many lines for each SoC, and it will be more
> instances for newly SoC, that makes the file size increase larger.
>
> This patch only do coding style for mux route struct, by adding a new
> definition and replace the structs by script which supplied by
> huangtao@rock-chips.com
>
> sed -i -e "
> /static struct rockchip_mux_route_data /bcheck
> b
> :append-next-line
> N
> :check
> /^[^;]*$/bappend-next-line
> s/[[:blank:]]*.bank_num = \([[:digit:]]*,\)\n/\tRK_MUXROUTE_SAME(\1/g
> s/[[:blank:]]*.pin =[[:blank:]]*0,\n/ RK_PA0,/g
> s/[[:blank:]]*.pin =[[:blank:]]*1,\n/ RK_PA1,/g
> s/[[:blank:]]*.pin =[[:blank:]]*2,\n/ RK_PA2,/g
> s/[[:blank:]]*.pin =[[:blank:]]*3,\n/ RK_PA3,/g
> s/[[:blank:]]*.pin =[[:blank:]]*4,\n/ RK_PA4,/g
> s/[[:blank:]]*.pin =[[:blank:]]*5,\n/ RK_PA5,/g
> s/[[:blank:]]*.pin =[[:blank:]]*6,\n/ RK_PA6,/g
> s/[[:blank:]]*.pin =[[:blank:]]*7,\n/ RK_PA7,/g
> s/[[:blank:]]*.pin =[[:blank:]]*8,\n/ RK_PB0,/g
> s/[[:blank:]]*.pin =[[:blank:]]*9,\n/ RK_PB1,/g
> s/[[:blank:]]*.pin =[[:blank:]]*10,\n/ RK_PB2,/g
> s/[[:blank:]]*.pin =[[:blank:]]*11,\n/ RK_PB3,/g
> s/[[:blank:]]*.pin =[[:blank:]]*12,\n/ RK_PB4,/g
> s/[[:blank:]]*.pin =[[:blank:]]*13,\n/ RK_PB5,/g
> s/[[:blank:]]*.pin =[[:blank:]]*14,\n/ RK_PB6,/g
> s/[[:blank:]]*.pin =[[:blank:]]*15,\n/ RK_PB7,/g
> s/[[:blank:]]*.pin =[[:blank:]]*16,\n/ RK_PC0,/g
> s/[[:blank:]]*.pin =[[:blank:]]*17,\n/ RK_PC1,/g
> s/[[:blank:]]*.pin =[[:blank:]]*18,\n/ RK_PC2,/g
> s/[[:blank:]]*.pin =[[:blank:]]*19,\n/ RK_PC3,/g
> s/[[:blank:]]*.pin =[[:blank:]]*20,\n/ RK_PC4,/g
> s/[[:blank:]]*.pin =[[:blank:]]*21,\n/ RK_PC5,/g
> s/[[:blank:]]*.pin =[[:blank:]]*22,\n/ RK_PC6,/g
> s/[[:blank:]]*.pin =[[:blank:]]*23,\n/ RK_PC7,/g
> s/[[:blank:]]*.pin =[[:blank:]]*24,\n/ RK_PD0,/g
> s/[[:blank:]]*.pin =[[:blank:]]*25,\n/ RK_PD1,/g
> s/[[:blank:]]*.pin =[[:blank:]]*26,\n/ RK_PD2,/g
> s/[[:blank:]]*.pin =[[:blank:]]*27,\n/ RK_PD3,/g
> s/[[:blank:]]*.pin =[[:blank:]]*28,\n/ RK_PD4,/g
> s/[[:blank:]]*.pin =[[:blank:]]*29,\n/ RK_PD5,/g
> s/[[:blank:]]*.pin =[[:blank:]]*30,\n/ RK_PD6,/g
> s/[[:blank:]]*.pin =[[:blank:]]*31,\n/ RK_PD7,/g
> s/[[:blank:]]*.func = \([[:digit:]]*,\)\n/ \1/g
> s/[[:blank:]]*.route_location =[[:blank:]]*\([[:print:]]*,\)\n//g
> s/[[:blank:]]*.route_offset = \(0x[[:xdigit:]]*,\)\n/ \1/g
> s/[[:blank:]]*.route_val =[[:blank:]]*\([[:print:]]*\),\n/ \1),/g
> s/\t{\n//g
> s/\t}, {\n//g
> s/\t},//g
> s/[[:blank:]]*\(\/\*[[:print:]]*\*\/\)\n[[:blank:]]*RK_MUXROUTE_SAME(\([[:print:]]*\)),\n/\tRK_MUXROUTE_SAME(\2), \1\n/g
> s/[[:blank:]]*\(\/\*[[:print:]]*\*\/\)\n[[:blank:]]*RK_MUXROUTE_SAME(\([[:print:]]*\)),/\tRK_MUXROUTE_SAME(\2), \1\n/g
> " drivers/pinctrl/pinctrl-rockchip.c
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
> v3:
>  - remove change-id

This v3 applied, I had to do some fuzzing, hope it worked!

Yours,
Linus Walleij
