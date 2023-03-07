Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1946AE028
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 14:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjCGNRl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 08:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjCGNRY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 08:17:24 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB34449B
        for <linux-gpio@vger.kernel.org>; Tue,  7 Mar 2023 05:16:16 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-536bbef1c5eso243657557b3.9
        for <linux-gpio@vger.kernel.org>; Tue, 07 Mar 2023 05:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Uxn0cNzKg3IdpeIXpX8JLumKXlXJ+TqZJT/uzTVj7Q=;
        b=Vg/2SyndYUUT1/bizpNJJuIOKVKS9UaiSMtPseK47JrBVp8tAmAveZkiH70JMqp8OR
         /zbu8hnz5blblx4AWGY+tNhHdrHmXDCZgKUNX+hJvn2s/v8ZBzgQM1d0AXwL7xvmEf3E
         yzHia0kDg1A7z0I+toBIUS40yOBSNK4k29yZOlq6oRDtvmw/0V0i1UbMv+mXge6ZaYG6
         t8n1YcR/NAhSTe8V8cWdwKN5gUpaHjKUV+6+Cs9ZDU7PUG1XRFBv6XttlbnWN6o0XL97
         MsnxAF3RCIv82JGTSArPvcpwyf7DzvW7LrhtkDuKfcMT2+MsdJevD1jYaTChT/hJyPHz
         sjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Uxn0cNzKg3IdpeIXpX8JLumKXlXJ+TqZJT/uzTVj7Q=;
        b=77XlHd+NtvsDq5HlFmzM1cAkIyCGOzCQCadr+j6UtWJNESWqsybAhHAekqz2gvBv1z
         eCqqRO9ibdBLNgS5GVOVthGF6OTCqWEGVspHiEhAB6l7tZVNNJeP1jLRWThASlALzUxN
         nxwIHYTr5y2xeAxzGKvvmNwK2pEAs0LR0AS638Bm92OEQX/XZkXmmmwSetYsYufu8e6A
         L0prCoVh+gX88UjGSSiwI0rMka4dT3v8GwGjqib6eT6j9i8tY+KEZgU6FUwFyerRH9ih
         N6hMqvXYxJro07O1qbw6apW3pmqEwflpZV0Uhn0I/7g4ZjyIIB1ioea3BaDZx2uL4EmL
         RMxg==
X-Gm-Message-State: AO0yUKWNksZvOH8wzYc29dEyiVkWIVAoC/r4ustmMREGvLYd+ramxysi
        yk/ONiW1Xw/InBcIQH7aP+o8vOdXakMnLEuVu2kltA==
X-Google-Smtp-Source: AK7set86eepmm0vjiIV7tN+3hkZpHUYxpw5AFKmEZJiJUhm/4yr6PFBGWQOo6BwwZH8chr3EYo0rp7wLQ0742szdGnA=
X-Received: by 2002:a81:431e:0:b0:533:8080:16ee with SMTP id
 q30-20020a81431e000000b00533808016eemr9280837ywa.10.1678194970675; Tue, 07
 Mar 2023 05:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20230302072132.1051590-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20230302072132.1051590-1-linux@rasmusvillemoes.dk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 14:15:59 +0100
Message-ID: <CACRpkdZyTkQ1-WpU2c2ZRDxdGZhAdu5266k167WDuiE8YOLTqA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: remove generic pin config core support
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 2, 2023 at 8:21 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:

> No instance of "struct imx_pinctrl_soc_info" sets '.generic_pinconf =
> true', so all of this is effectively dead code.
>
> To make it easier to understand the actual code, remove all the unused
> cruft. This effectively reverts a5cadbbb081c ("pinctrl: imx: add
> generic pin config core support").
>
> It was only in use by a single SOC (imx7ulp) for a few releases, and
> the commit message of dbffda08f0e9 ("pinctrl: fsl: imx7ulp: change to
> use imx legacy binding") suggests that it won't be used in the
> future. Certainly no new user has appeared in 20+ releases, and should
> the need arise, this can be dug out of git history again.
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Patch applied.

Yours,
Linus Walleij
