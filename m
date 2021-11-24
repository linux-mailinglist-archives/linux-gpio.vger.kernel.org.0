Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104B745C724
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 15:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356093AbhKXOXk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 09:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356192AbhKXOXP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 09:23:15 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760C5C125621
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 04:49:07 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id v1so9945803edx.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 04:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y20/1fNI0KyXaXs0cDKjMiW+8AcpeeOZCZyIy4HTxew=;
        b=QWr1PwEG/EADEtJyNuAGgukP9TFolNnrcuwsHJZNQMYqnBXZx7f2XagUqNdKr0mIoQ
         A+ouXtJ9i7ZT+9fYsDUcII/DKdRARKmtvcOG1kmQvXw4/P6Yo4aCxxn5Ih7tRr96C2sf
         CsW3RQoGcK9SHFi26pns6ytEKoORprMUm3N4KzwbGx9MceFZMR5kZMZdw1RKHT8M+a31
         9KnM15yguo0Kuz0FuCL+yKn+/rIutqNJjjnzcseEtp2SoqgjAVva9DpDBDrTrtwpu0/S
         UTSlChU1HJY8OeKRjx9glKGWxJepO636z76PQQE7kCvr+Uxrmf8Y0mtWeA1mklLF8MMo
         0wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y20/1fNI0KyXaXs0cDKjMiW+8AcpeeOZCZyIy4HTxew=;
        b=nG0kzL8UMRMguupweZRfbvbJwQk7KrxiY8HdMRdY/WtZYcli2MvYRV24EozPrbtOEj
         Lt9R66tSmH3wKc3OgHIE72vfw66KCAmLuxmC/6To6YvROm1ZUiWJZXTnSH/8rP9w0YGx
         iZa4F4dXlxzCsU5qPFoLbcG/rbdkP3fI8f5uJdFKXkMd8gdz6MKtccQxQAJXMHbb8dUq
         7umlMuod0AdY1PMPhoOgVo4+maHBztDG5IpJNYHfd0SRTzB6sbmuqGjcNpjIHviROeS4
         2nDAmfThyKFpU9zRifu6uXGXXGAM7Hhc4FqcsoOn/7f23C7W2kwVuYHc4a2mHS6V044X
         /ZJA==
X-Gm-Message-State: AOAM532UFURxzKBi30Jal+en+YokOYwmI3kvpw63u/zkhzd4/tuolXqU
        xVJAX3c800w4hvHMavjsiWCzhReT7xnVx5kUQ6tlFg==
X-Google-Smtp-Source: ABdhPJzTYyVftaV4BFYMlLiX1+O0OX4hovqL5nPKZA/1gazZYJqzC88C0uialiBMArI7+/Fj+g4nyCh9wLoMCoB2LrI=
X-Received: by 2002:a17:907:9847:: with SMTP id jj7mr19421387ejc.508.1637758146037;
 Wed, 24 Nov 2021 04:49:06 -0800 (PST)
MIME-Version: 1.0
References: <20211112130152.3682556-1-thierry.reding@gmail.com> <20211112130152.3682556-2-thierry.reding@gmail.com>
In-Reply-To: <20211112130152.3682556-2-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 24 Nov 2021 13:48:55 +0100
Message-ID: <CAMRc=McFDS=_Dwkc1V6tq5xsOLyT+u_4uCVGFFeMFbdYNn46bA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: gpio: tegra186: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 12, 2021 at 2:02 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Convert the Tegra186 GPIO controller device tree bindings from free-form
> text format to json-schema.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

As it's an entire conversion into yaml - would you mind Cc'in Rob
Herring for his review?

Bart
