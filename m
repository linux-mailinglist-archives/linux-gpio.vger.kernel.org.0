Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D97466DE9D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 14:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237122AbjAQNSD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 08:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237125AbjAQNRm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 08:17:42 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8C24C07
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 05:17:34 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-4c131bede4bso421410897b3.5
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 05:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bUJBsht1LCslMFYdFKdEQEWjO6qOnqb0dKRr7V+rz1s=;
        b=uH657sJ96vyYmomeeAy9rjbmKABv8Mt7N2OJToJoDYNjELfnltO/kVT/5ai5qdsiOR
         Wxpi811dWS8nwDf5BgU1qNX/nDtzdjRHues5ANdJu62dibPkiY8W5qj9WZtkkvMcqhSq
         akODpqd2dRsn+U4lq8rHmQ4y2yn76tX/TWr46xktzxmHK1CnX+a8jhCUP6uyP9f6lrSC
         xe9r06s9KOocdu+7xaqfVLWDdSX+Ao+JtZ6SzAt4v6vw+6QhkUkuUmfIC7FPORvMWTdE
         GeKXCbOc+VvtzoKqiLvoRA6GwEf1qIV4NOZhF+HCVZ6YGJmY3/BpaRsUvOt5YPR0mqZR
         Nhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUJBsht1LCslMFYdFKdEQEWjO6qOnqb0dKRr7V+rz1s=;
        b=LKzbbdQsXlxA3ePsh8uMgiVFVKXULPilgjjzF4OVf+9PEpjaQ1Wj8JXV0gEFRILz20
         avZXfPCgopn8Mp/97qoXS5Gs4PxWToWYayEy4hljR4bNRfq+6Ob15x796O3ciPyfV7i1
         QJyJveCOrQ0ypIVWI1/+Nrginqaym4dNdE3z28es1gc4rcWB4T6gt8uYyYravFtY25fj
         8J4TMUJICAwiZCgESJej2jGFowszyDvYaFqn9koWZGcEPGNFMxwhD+QZFpmJqEE8joiS
         aPB7S4D4KzIDfs19v5FgwGyHShpzad3wmXaGxRcftIM3AWSIwiYIgclaj9uVfBjXc/DD
         32Mw==
X-Gm-Message-State: AFqh2kp8xGeP7dOFSPWQ8nAwrX+P0EzhO6ByQjEIjPdO9/1vmYQmvoiH
        lhFk41Mj7pW8tEgBSYbTRuNn9xDzZN+wMmpM+CcW4ImuKiDr6g==
X-Google-Smtp-Source: AMrXdXvCau06WdWXAr4lq44sOWKLJC6ryOzfbmLnbjwTbwgo3Cks2NTb/dw9TZi45VpxAg/KejdNFI+rymFMe9uTbhA=
X-Received: by 2002:a81:9b14:0:b0:4dd:ff06:1358 with SMTP id
 s20-20020a819b14000000b004ddff061358mr413851ywg.488.1673961454031; Tue, 17
 Jan 2023 05:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20230110084636.1141740-1-jonas@kwiboo.se>
In-Reply-To: <20230110084636.1141740-1-jonas@kwiboo.se>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Jan 2023 14:17:22 +0100
Message-ID: <CACRpkdbJvTB5VeyfM7gruB3MrDMXNo3XezmcVyZGH0Vro=kVTQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: fix mux route data for rk3568
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 10, 2023 at 9:46 AM Jonas Karlman <jonas@kwiboo.se> wrote:

> IO mux selection is configured in PMU_GRF_SOC_CON4 and GRF_IOFUNC_SEL0-5
> regs on RK3568. pwm0-2 is configured in PMU_GRF reg and the rest is
> configured in GRF_IOFUNC regs according to TRM [1].
>
> Update mux route data to reflect this and use proper detection pin for
> UART1 IO mux M1.
>
> This fixes HDMITX IO mux M1 selection and makes it possible to enable
> HDMI CEC on my Radxa ROCK 3 Model A v1.31 board.
>
> [1] http://opensource.rock-chips.com/images/2/26/Rockchip_RK3568_TRM_Part1_V1.3-20220930P.PDF
>
> Fixes: c0dadc0e47a8 ("pinctrl: rockchip: add support for rk3568")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Patch applied for fixes!

Yours,
Linus Walleij
