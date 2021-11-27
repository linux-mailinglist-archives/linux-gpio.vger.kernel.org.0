Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DB845FB55
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 02:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348743AbhK0Bl5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 20:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349307AbhK0Bj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 20:39:57 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC6AC061A29
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 17:23:38 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id t23so21952994oiw.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 17:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nmPpjX5vxZythQHSN3ZYM9P1fEx6dDehCsb3F+bXRb0=;
        b=FMMjUxzCdRITY8XL9MLWwxJJ30/1shXsIp1YiDwUVbvj+6bJJJdz4yyC7Dlo2sAoI7
         jvAtDNQYX6tSWsdzy2iQIzVzsF0PyRf5P+C70DS+ErjXollS8Vqed+LzvGi7ixGtZG+X
         1AK+6iNlquHAul9NkIlC/j0ENdv9GifpVmlDNcN6KNyV5MGiLB/0olEgVBK5r5o9kZMm
         mibBWAZ7Tfg1GBrGRxt9Q+zGuJziayyWWOFgjRxnZIa5t2k+uNJQkO2fQzVe04tVDV6o
         F9gq4b2qb+HSwFI7QSK/66pyAx5CMv7z8oOWj/InmWGZbR8CxliYxGCwZdxNq61trJH5
         Aaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nmPpjX5vxZythQHSN3ZYM9P1fEx6dDehCsb3F+bXRb0=;
        b=ZAFFsCEICkUjnFPQnp5n3vGLIbpOeLUvrz09AzocodVO2aRnQiOhOaYf21OCCyNyOi
         WQ+pWypajEpI0o1dtelCKWN//ZscTpod7RnCUHHs79sB4eBUoP8uP+W9+PR9divDX0yR
         cqb3/A7FvohzViubIPuNeTkGyyr0Lq0mCZ+wU/PWHH0AX6H+xehLlTEZkJo85wh06sOh
         FWsP7Mq+tthvQ2QHJFTUM9jzd7tTORnJkOdOaQqrbFKtxjJqS7Z+7spaRlJ13NceuQfC
         StE4cOsue7zIuTXaN4GKjIyZmUCmWkD6HJFn8j/nKFNn5scrFScIq/iA/HJd+kTh2Lg0
         pDpQ==
X-Gm-Message-State: AOAM532Uildmg+FNlHj4LrWxA6hLBUPZclfzi0TUOiedtYp4b5kbxI3B
        u3vxQsSbxLCa3LqQuu5XjDIQChB3s61hj2w/69cGng==
X-Google-Smtp-Source: ABdhPJy2JhWxc3KCImcoU3ojXzTjcgzYugkcLGTLd8fi08uQ0xBP3cQZO/36PkNO0jHlChRWHPiuAikLlBmDUqxD/88=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr26924395oih.162.1637976218346;
 Fri, 26 Nov 2021 17:23:38 -0800 (PST)
MIME-Version: 1.0
References: <20211126160219.674665-1-demonsingur@gmail.com> <20211126160219.674665-3-demonsingur@gmail.com>
In-Reply-To: <20211126160219.674665-3-demonsingur@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 27 Nov 2021 02:23:26 +0100
Message-ID: <CACRpkdY6gCz3X_DWUj+BZEeMYGHN3T2ty5Kq7_W+Hq3jgjaKjw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: iio: add AD74413R
To:     Cosmin Tanislav <demonsingur@gmail.com>
Cc:     cosmin.tanislav@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 26, 2021 at 5:03 PM Cosmin Tanislav <demonsingur@gmail.com> wrote:

> +  adi,rsense-resistance-ohms:
> +    description:
> +      RSense resistance values in Ohms.

This description is very terse. If it is existing for the same purpose as
shunt-resistor-micro-ohms in
Documentation/devicetree/bindings/iio/afe/current-sense-shunt.yaml
then you should just recycle the standard binding
shunt-resistor-micro-ohms instead of inventing this custom one.

Yours,
Linus Walleij
