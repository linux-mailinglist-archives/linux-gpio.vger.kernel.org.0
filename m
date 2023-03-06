Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC386AC0B0
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 14:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjCFNVj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 08:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjCFNVi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 08:21:38 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4382D2E0FB
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 05:21:08 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id k23so8018333ybk.13
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 05:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678108867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zG8PAsk5iQpv4ooSAO30iwBH3h8edixexdethfVkxcw=;
        b=Q9jQcBLYmgbMH/VoiFAQ4x7ARre4GTiZx6sBeohZ/lI/912p1ak6YCLj4e2GWZUB8j
         sEq+L5afWSj/RYULQSXz6b+o2JnXBeckQbgZX9jdT+EnRUky6uOiXZ/o1Dfb6YMC7e3n
         Xz/oJHcdb+wf5vKSEgsv2IuD5DEwK4kIGLMTlFEM9N1qSGMg2rK2PpSCYfJXRCirpmyR
         rwtFtlx2Gmy4xe6kqLocmvhRg2PAIvna/AXd8G/NQgBFEXdz2fLdxWqALC6DYLSNKqnV
         lZV8wMb7qpk9UhlpTWb93avamCcZnPvkITNE3WnUvnTqRJ2iEc8alx6pHdZfGH6iXLio
         QOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678108867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zG8PAsk5iQpv4ooSAO30iwBH3h8edixexdethfVkxcw=;
        b=4hYI2k770dIRGeAtYE02DMHqUXyvCrbHqFazs0gm15SRKr6n8JPCX2u23ky9kK6RIU
         DbfOYhiEO7SRSYzN7fUb+LVqYGrLIr+ieO67ot3JTfuI1iOt5m7TwnnA72cV3DoZjsR/
         ultdTN4XQpZ5mNYpDrv4X3oUju3Lgr+07fikpIinrKATxrWbnklvVB2UzIkeIlShyF6G
         Qd0fLHXOApk+LyT6vhV0Jg0tM0ucpie9LvZqX9S4Ey0SLOa8pF4CKRzIA/r8zdE0jSSq
         +PV7b9MRB/5r+EBLc60QR3GnGf6k189pwv65hBKdHcspVTmGK7a/ImvEhgsOYjUsn4qr
         hXLw==
X-Gm-Message-State: AO0yUKVK4te9ehaDd5Il6AaDvYDAk83XAKwfBpIZM2yOmdlD4WqdZneB
        TQcsyue7sNVS+5dz9ZCe1wOlN6913pivkvkaBEEYTA==
X-Google-Smtp-Source: AK7set9A6CQZnT/dfz7U4hlA9VvtXvYSBqDcRDzjO5o9BsU1ZkSjNPqi6wVSVWLnvQZXhEVVQs/0dRAlC/m4WrS4XoA=
X-Received: by 2002:a25:9281:0:b0:b0a:7108:71e9 with SMTP id
 y1-20020a259281000000b00b0a710871e9mr2231178ybl.4.1678108867432; Mon, 06 Mar
 2023 05:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20230216-gpio-at91-immutable-v1-0-44f52f148ab9@kernel.org> <20230216-gpio-at91-immutable-v1-1-44f52f148ab9@kernel.org>
In-Reply-To: <20230216-gpio-at91-immutable-v1-1-44f52f148ab9@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 14:20:56 +0100
Message-ID: <CACRpkdbeVw1vBikYi3RimOO8K-KKLOpO=9O_yZFBt4oORi=Wgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: at91: Make the irqchip immutable
To:     Mark Brown <broonie@kernel.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 16, 2023 at 4:49 PM Mark Brown <broonie@kernel.org> wrote:

> To help gpiolib not fiddle around with the internals of the irqchip
> flag the chip as immutable, adding the calls into the gpiolib core
> required to do so.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

1) I'm impressed that you're using AT91 hardware

2) Can you respin this on top of my pinctrl devel branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
There are some Andy-cleanups already queued for AT91 so I am a bit
worried of collisions. (If you feel confident they are orthogonal just
use v6.3-rc1)

Yours,
Linus Walleij
