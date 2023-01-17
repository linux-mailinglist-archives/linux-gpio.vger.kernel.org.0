Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A408166DE68
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 14:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236966AbjAQNMh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 08:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236997AbjAQNMg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 08:12:36 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B9B360A7
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 05:12:33 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-4c24993965eso414801847b3.12
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 05:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=20fmAC0ZlUwS0WGm8jsJpzevdaSRxhLT1q2VH+pp97w=;
        b=vuPcK3dDABh+jUyxpP8ZlvvlP2TjJ3GvFZOZg+UojhzUCSbeu0sbINK1uq6WfKOmab
         ctgkWUnt7Xswkq/nBZnUQ6FkDG9sAdM6b6XgtCw4BBLz8WBX33aizIGEbLeTdSl4/Wcl
         d/mqmnoc7tP6F4rWsSbtUqut82HAWhr7lHyNeKRIR0du0zp33VBJzrEnfWUPrCLbF2xf
         hC0iirnkXp8uCO0Ms5+TjSqD2kheRw9w3ywLzlWcX/NGfPX9ipj/pFYstvmlhBbWmisr
         gSPoyuEahDLFz4w3XDyChAvhFC3b5v7DdJb09lZjs+YtaaXZM9kVkwS0K/KuvDt3sH7w
         op+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20fmAC0ZlUwS0WGm8jsJpzevdaSRxhLT1q2VH+pp97w=;
        b=EeyilNUDPdK98ab/GE2sFf8Tr2CNxv7txJyvIgWNULnRd5B3Yo6aPlY0ZZrQyTr1uJ
         ItSmajYz4nNb1Ij3rfu44bQH2nQyHqVR1lKGcHB53JRGXUuzURppeuQO0KoyJttyro2s
         fGZxDqWLH3yzcHdaMfQcZijAPHMZJlGchtyIfqa0hXip4XmO/XAuNkLr1TYKCQYNCtkp
         0oe9ZAunnEQgWu7hc0MfTye04/Bx9eZ/MMq82daDGnFHpFRN1LIB/0fsm13ZePTkjhI8
         7TGAOF4p4hCb/QXrkOpRa+1elqAQc6aRdR6zQ2bSLmOn46sh1EyqWXOhUpjrJs+dJFO3
         2dmQ==
X-Gm-Message-State: AFqh2krOmsZ2nOsg2zYaRGMjT6gzASO4k3UxtDMAtYoY6E0aVRx6VCvQ
        tlJwgPdTgGGZm9jLfmR4caYH2aTxT9yOwv+7xNDpww==
X-Google-Smtp-Source: AMrXdXuq8BnfQd8hwGrg05kolOybbliFbKMUakN4KXCF8wWUn7vN9ft3/xF5J5YD8FcWWHD6jNnfeb6hb+9Jaea4LFk=
X-Received: by 2002:a81:6dc1:0:b0:36a:de9d:825e with SMTP id
 i184-20020a816dc1000000b0036ade9d825emr365156ywc.477.1673961152876; Tue, 17
 Jan 2023 05:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20230116124704.30470-1-andriy.shevchenko@linux.intel.com> <20230116124704.30470-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230116124704.30470-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Jan 2023 14:12:21 +0100
Message-ID: <CACRpkdbQ4S9Dp0_CEmWH8jbjOPedBo4-FP3YH2h6R-HRNn-A_g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpio: pcf857x: Drop unneeded explicit casting
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 1:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The s32 is compatible with int, no need to cast.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
