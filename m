Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA9B64154E
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 10:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiLCJfP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 04:35:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiLCJfN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 04:35:13 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C1218E08
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 01:35:12 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id o127so8779170yba.5
        for <linux-gpio@vger.kernel.org>; Sat, 03 Dec 2022 01:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtrfFxLIH+KLlkwI+VYMEBrcCrDD9/VNajjGq7Nb1f4=;
        b=NVmWpl3QjoGFtPR4rDJHOoTnQYlO5GHybiR2vphJYM1XpTVLpHIkfNd2wQZ6LtTDp3
         vCvrQCjnj9qWcOUXMSnMba6qcboV+zVLK3NJR5d9ual0qeT9hFnC0cr/ZoenLJCQDycB
         p348AQq44S7N6fLPCPX3KjLf+xwnx20E6CFXhM6+kKwLAHnpoGlM8n45DKJFElO2gAWI
         kRGptrIyJYXUwPpGrUcr/QgSQBJ7v9ZdwH6O2xsjvLmdOt80D+J3VEfQfhwfnlP45/uu
         xCyle3Pbhdwg/TgcmeZ2gOY+XDtq3eouP6TBaOXcquCaXuVGam+xqsEMSmtcuhfzJCEq
         n+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtrfFxLIH+KLlkwI+VYMEBrcCrDD9/VNajjGq7Nb1f4=;
        b=q2YB3xf5nb9hEVKZmukbFGepfIen3gwRkM3HXC9Er3jbzZpd9Qqr443aTAkYIrEyn6
         hZJiVzQ+MTpyQuxpkV7GJanlyd0/nKR4/IPDH2zXOPlkEqGyhXqIj1iY50Gvh5elb/dG
         PFIv2tU5jbzynpcIIwiYqCLarBStETJw/d1u/Wwb8r9FSm6GnbEzDR5spxBJp54rVzMI
         dwmDz5J6lX1//KxQkEDjpcBFrRfa/mhoREGBJ+rN5Nko90tygbHzduf8m7XsdcSVStgG
         +Sw3zaTDVlU43A26XKxOzFMY1gAq+zQn+gGYdqV51xZ17FfBs/BKnGfqNYLxfjstJm7s
         XLwQ==
X-Gm-Message-State: ANoB5pkFChmRQ/+34bEfPv+xXsdjYdE2Dn0CyjdFH/0Fp4+BehpKuqDx
        2DChXLAjP8EzYqlFyefwTdj+B65Rfk6GZTX4xIwYVQ==
X-Google-Smtp-Source: AA0mqf5lBr0i9TGCKJKQdl+c9tGgeapNQTrWM8pNJ2m+aX5ucbgHP6s/tq92nHKFL7pOBCILVQLukaUFbCxSZ2MnAf0=
X-Received: by 2002:a25:c7cb:0:b0:6fc:834c:9c89 with SMTP id
 w194-20020a25c7cb000000b006fc834c9c89mr8728927ybe.43.1670060111875; Sat, 03
 Dec 2022 01:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com> <20221130155519.20362-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221130155519.20362-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 10:35:00 +0100
Message-ID: <CACRpkdbhavSEFUiqEDO1cJXzmiQ8iHE25ciEt=c8NY-SQLAhow@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] Documentation: gpio: Replace leading TABs by
 spaces in the code blocks
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Hans de Goede <hdegoede@redhat.com>
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

On Wed, Nov 30, 2022 at 4:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The code blocks are indented with two spaces, if the leading TAB
> is occurred the syntax highlighting might be broken in some editors.
> To prevent that unify all code blocks by using spaces instead of
> leading TAB(s).
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
