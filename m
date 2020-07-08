Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D633218B43
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 17:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730212AbgGHPbj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 11:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730028AbgGHPbj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 11:31:39 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDF4C061A0B;
        Wed,  8 Jul 2020 08:31:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t15so1338755pjq.5;
        Wed, 08 Jul 2020 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LzR6bNS3es5BR2FNzW3ovn2no7NK67EmH/jPCzWB6jA=;
        b=RTZ1+SlRAGVheT04dg2T8uVO/mFrI9iTYSIZOGs8YnTLKq0ZYc/Czzojsybua2JFX3
         LYIRhuMTw1XlVh6mfifTeH8amY3grL2gGByOD3gV1PYV9nTdegeL/7YDhb6NByg971Ht
         Wm9zQdKxBPTk0XY1YlNUwFHy6QMUmdRuLDMeW4q3ufWPG+8AAD5hqrmY1EGOfoaxx/0c
         mgn1RmUduPwW1AFoujNJ0JmpB6Vti4BkB/Ka9aD1b+ABGqRVnsM9CA2ODRWeoImaxjkn
         VoSdxKzQJqkcTERqR2MXBA/VO3l8oaVMmsMY/TTtSlkcartmVxUL36gPtCnuQjcJK2An
         3c8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LzR6bNS3es5BR2FNzW3ovn2no7NK67EmH/jPCzWB6jA=;
        b=lBZ3C4toACYYAolqq7+Ge+djKWbC8wpaBJVkRBlyoPr4uZhy8+SAJSdudndmIwfBOu
         icWroQ1rhzVjRW5V8KcN3RSp3oqY94xlX4bsd+Bumb+cW+M1ustB7EdlQzwdps9YB0Cc
         bf3wGMJqlLLNYUqhQw+UTt0thiBoKtqmfTzQl3JRXh1qdD8295bJFGH1NZgrzBAXT/D3
         8H4+Hs8MpR/Wxg5Xcat5ChgepxlvguCgxSCTjaaIJNnfuFQ0Vu6S4ygjBFyUopvCkZFT
         XA90eIBPNaDJLC52lI8uM8/Sj4a90Xo4I/EW+KioQMX4G7G1Kxu/+n1wiS9sIZTyKNYf
         W+ew==
X-Gm-Message-State: AOAM531bprUfEfGIbEjSjHXxe3RUFaOR4jMwTkf5dwWg5Ofc7cuPyKCY
        kORPziKgNacvcBMLKuxe1iHr2vmcIQRla2p8JKs=
X-Google-Smtp-Source: ABdhPJxN8wtK8+kgM4+/skSv3hXWT5KdYqtcM4dACp79z6/jzvb2flNOzY53zm5ABOZiwrCx1GLJiIbFtjphAxYsWmg=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr10068819pjb.181.1594222298428;
 Wed, 08 Jul 2020 08:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-5-digetx@gmail.com>
 <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA@mail.gmail.com>
 <68df4805-daf9-91c5-d755-53abc8823654@gmail.com> <CAHp75VcEqTJxPj1pETC9eUsZCLwpv8tyZ7EjKvzzJTQ4wfKJyg@mail.gmail.com>
 <d39caa8f-816c-5d4d-6f54-99baea3e0d5a@gmail.com>
In-Reply-To: <d39caa8f-816c-5d4d-6f54-99baea3e0d5a@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jul 2020 18:31:21 +0300
Message-ID: <CAHp75VcsvvsmcW_hSRv-mg3v5Z_7c0S-r7WNVOVi-70dE_LvmQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpio: max77620: Don't handle disabled interrupts
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 1:54 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 08.07.2020 13:11, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

...

> It should be unnecessary since we now see that the handle_nested_irq()
> checks whether interrupt was requested and if it wasn't, then particular
> GPIO interrupt will be treated as spurious [1]. The pending =3D=3D 0
> condition is an extreme case, I don't think that there is a need to
> optimize it without any good reason.
>
> [1] https://elixir.bootlin.com/linux/v5.8-rc3/source/kernel/irq/chip.c#L4=
85
>
> Hence it should be better to drop this patch.

Fine with me, thanks!

--=20
With Best Regards,
Andy Shevchenko
