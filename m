Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEB90168067
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 15:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbgBUOhW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 09:37:22 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37085 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbgBUOhV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 09:37:21 -0500
Received: by mail-lf1-f68.google.com with SMTP id b15so1658954lfc.4
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I7mTmKB1Y25U0g4q3RoTli21LYId0oXzN7cSDlfaxGU=;
        b=J4LtiqICrcN1d1FVgUAW+f6vnzA520FQfsoVgKLyplCBIVY6LTQd0ghkLG9rNIifNR
         Y4Yl8HIYrnw5JV5SphEUVgGMWU15R3N6kivbt95EfiN+JdzaGVX6zzpNX3qX9CZXcf4E
         LYEjgEWi509SQIo8PlmMGsKVCtbweF5z92tDm08Ve+SXthMI17jFi55+CysFV+3yZjI2
         7Gs1cGYR4yz7uKBhsfeGTLtR1Qb4qG6i5iUJ/RotNNXzByhhQe9y80JDZfMOOPN5GDyh
         /eVeBYbLLYtgVj8NCBseh4C6efBuUTSQ72KFG2IHQYjM0KMawg6SxUSf3koWkFnGVCuU
         r6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7mTmKB1Y25U0g4q3RoTli21LYId0oXzN7cSDlfaxGU=;
        b=mt4m4W9tkuYtLGb22zsmARPL3FrXqXXZZ8RVCEnsDuGlf5dLzl4bAh5/gJIxdeIH1A
         6qPH3UYtQf6+dLQdVmrWSjw/IUxGRLrh2h9U13YF+uSAQ0eLnOf4IFkfQ0laJS4hzaFI
         Q+rq/NjlulO1E5ur8RTZULfsaaag2yMr8fKk8/m4vQQJGGYPXMl0+/b+mlZb/9PlOLAN
         NTPGWk82n6mgsHyeglINHxOQIK0uAkwWmfTe/um2F1Plj/DY1f4zb3MqQqoaEu2eZXwO
         MJ/yeCaFJKAWV5N/KYbJihT6UnHucrHLOqsLSdGbCJtR55yCa0bbbHTL8wz3Q5Mejtcm
         ZHhA==
X-Gm-Message-State: APjAAAUtFQQ8vSWDAeFJ+PG4g28bzFL/G67JrMIw8o9R59y7vcwsqdQw
        +zcFAYbom8ltzsuUNJ0YN32QozyE6HjAOAkt5ToXMFF6cds=
X-Google-Smtp-Source: APXvYqyAWnLDYIxOg7JWzArkYp1QAJB8O//RA7y+f9fkdXf46018OkIiEEmlg593NgXDxY3ewyKPZHYklLUJa00pt3k=
X-Received: by 2002:a19:5e1d:: with SMTP id s29mr20173445lfb.21.1582295838433;
 Fri, 21 Feb 2020 06:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20200217185437.GA20901@embeddedor>
In-Reply-To: <20200217185437.GA20901@embeddedor>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:37:07 +0100
Message-ID: <CACRpkdaJHQoZZCK0tJVb5Ntxsg+gr1FcHwtdxjQEHo=ZiKkxAQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: uniphier: Replace zero-length array with
 flexible-array member
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 17, 2020 at 7:51 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch applied with Masahiro's ACK.

Yours,
Linus Walleij
