Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0A84B1972
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 00:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345656AbiBJX3N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 18:29:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345665AbiBJX3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 18:29:12 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE93115A
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 15:29:13 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id x136so18260683ybe.11
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 15:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bDPR0AeTxe7a/e90UGeXdtJUMtsUmDzAKp7kmzt3Fms=;
        b=FKaIO7ke31u0dDGXqL1B/WHPoYALQGp0PvwHenK3qpKZkhEARGZ2CBCaOreq7+A52o
         WNb/xGV8X6HgeueQlNwV0LpoH7sNgkhQ+R3QUYl9Ka6YUaJh4eMzldyVHL5DKx8033Kr
         UNAvyfa3pxaB/e8+gbIE2FP3G676NtRlw0V57AjN/whz1iftIy93HrL/6r4o4zXzzoaN
         RTUV6DV7C/YQXQTQEPpA2chH51s0fdpd66ngY0LNAIeTgM06fNxtJQNsVJFakVDNuVq6
         xpOgxOUd+XgcNZcpITZEI3UYsUv0SZgPUzzLIW8OzUYB2r79vyFFLj+7x/UVGppFbwTo
         ijjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bDPR0AeTxe7a/e90UGeXdtJUMtsUmDzAKp7kmzt3Fms=;
        b=npK5VBWYSq6XuwEz5T4kiUwLJSeJM0YLc9QX64d/TCHXbF+cL9agYooAWMCwJ9fcgp
         r0Qmm66NVm5cmF9/8yqvIc5gZdYmpGDexNF6ryvFThc6FdMxZS2XV+jqUYVGlNlrmQpr
         CzNm4J2IXkysraHKTdsHGYfTPZt7+do8enBSvkyq12HdLG++PM9uzpG74Nt+YDDEyPw0
         qjnNcLJTSnlmUcH3dcLzqa/aVEl+AwSihRwp7f1koQKNeMWkwUP23DkjxfbYXVs1Fy4A
         R+nf7vOiOwcBT/nT3xspR/hwXehS1fb8t/T2+htGuiytzYVwYVKobRvUZN7jJPhYryMT
         ZDhQ==
X-Gm-Message-State: AOAM532BqNCHPhVByLa7kiDo1nSliCZEGLi4FeVPpohuUAzgrBwivT7v
        f1plIJbtOapt2Bh0YfTb1cRi6rCgV6mvkKDV+/Lfjw==
X-Google-Smtp-Source: ABdhPJxX/iYRi7hUiyZNbRc4Y+/bsvki6LAWWVC3W44vcjE/bJpz3qx3z2RTxOixioEtg7KiCBWpfMiZEnQ/hG7qSR4=
X-Received: by 2002:a25:103:: with SMTP id 3mr9215973ybb.110.1644535752591;
 Thu, 10 Feb 2022 15:29:12 -0800 (PST)
MIME-Version: 1.0
References: <20220209162607.1118325-1-maz@kernel.org> <20220209162607.1118325-8-maz@kernel.org>
In-Reply-To: <20220209162607.1118325-8-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 00:29:01 +0100
Message-ID: <CACRpkdZOmdXb84OQVsXv-Bbi2dBCTQ=-nSrCcCy-tDUhvhQAtw@mail.gmail.com>
Subject: Re: [PATCH 07/10] irqchip/versatile-fpga: Switch to dynamic chip name output
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 9, 2022 at 5:26 PM Marc Zyngier <maz@kernel.org> wrote:

> Move the name output to the relevant callback, which allows us
> some nice cleanups (mostly owing to the fact that the driver is
> now DT only.
>
> We also drop a random include directive from the ftintc010 driver.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

BTW nice cleanup.

Yours,
Linus Walleij
