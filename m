Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB07438C04
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 23:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhJXVMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 17:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbhJXVMT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 17:12:19 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56759C061764
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 14:09:58 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id o26so9515307ljj.2
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 14:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vFAdDSdKatUr6JRjcKkr/+bpZM+7j83T9fyuwg8k+Z4=;
        b=FWQY4cVf6pREKtaWH9QI9Aocz2xs8NTJoPWlEjVmb3AS15+BUGbgcAKXNGlnzIC6aK
         upzWRuWmugvFpXalI8IfMtrdD2TjY3eWYqF7oMkjJu0FgVZS+FbBHeDLbF5cn5dAmjYD
         cz9RhbsczeqEkNVyFRGqMVTyZrvjzvb/O3GhJP4U5wYkwLyvIdp2Sgac9A9F/8mH1clq
         bj5Hrvht+khwaXSO6LzgnfTeanwH1DS/lhokaWDnue2/OIdbqb/zlrAQwIbzb/R3sQnw
         PLtd7l7QQ6t+lbbYl+mU4gNPOA6qpKIvSE7JcKfq61BJ77iW+ThEqvaHKlaasWulcowV
         i3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vFAdDSdKatUr6JRjcKkr/+bpZM+7j83T9fyuwg8k+Z4=;
        b=eEChtAikBZrK8OQxqMGHOIlUv4RvtjUYtkqS8vdQRF5kiA5TS63XqjrKV8TfJEh1T9
         H1Us9CDHfIKbdPp/0+C+3Jpqqiv/CLl7d0y2DiAGVUwWoJ1kg/nlVklZ8ktblFBttomB
         sZuHqAguk5d3t981Aw5UoaZ7hsFWJ3A6MjNnUqyhEkWbgkde1C0aTFEGXHZxLnPjXCF0
         i8wcERwL5l7CZ3Ue4KKEPxzB9HOf94nXxkjlW7riSmug7zqY+vz066o2XZzmMsYESUQD
         HGj7IUcJ8R15mt7uCXZdLr1TqsZVbG1LPNkD+oTa5XfUtnbBUZ53RszjeW9NIDDcuDYq
         wm+Q==
X-Gm-Message-State: AOAM531Qbrv6gouvWZcBd+70tUcTXm/NdCUOSoVRjbMWXVJoJLYaScz/
        DiR3gHsR4hiQ0tNeU5XtKXBvoYVwsXfhY/+sMN6TLA==
X-Google-Smtp-Source: ABdhPJxKA5zxWB6X10wDcO3IwJzTWj31ZG/+9qs1bK3p713Bu71+iyIOOHDYSCN+E1PT43P/8dj9+yHQs5UfeIlkPIg=
X-Received: by 2002:a05:651c:111:: with SMTP id a17mr14278890ljb.145.1635109796637;
 Sun, 24 Oct 2021 14:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211018112201.25424-1-noralf@tronnes.org>
In-Reply-To: <20211018112201.25424-1-noralf@tronnes.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 23:09:45 +0200
Message-ID: <CACRpkdZQSB+McOGK9HZUNAr2p+FX=6ddbY=5-sQ8difh1pEqGg@mail.gmail.com>
Subject: Re: [PATCH] gpio: dln2: Fix interrupts when replugging the device
To:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        stable <stable@vger.kernel.org>,
        Daniel Baluta <daniel.baluta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 18, 2021 at 1:23 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:

> When replugging the device the following message shows up:
>
> gpio gpiochip2: (dln2): detected irqchip that is shared with multiple gpi=
ochips: please fix the driver.
>
> This also has the effect that interrupts won't work.
> The same problem would also show up if multiple devices where plugged in.
>
> Fix this by allocating the irq_chip data structure per instance like othe=
r
> drivers do.
>
> I don't know when this problem appeared, but it is present in 5.10.
>
> Cc: <stable@vger.kernel.org> # 5.10+
> Cc: Daniel Baluta <daniel.baluta@gmail.com>
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
