Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C12B81805
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbfHELT0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:19:26 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39887 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHELT0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:19:26 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so3856815lfn.6
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=If2p5MuMUgWrpA5iJZhIZ1wfyNa+k0/qK9QG1U50VmA=;
        b=zYcNBvOER7QkOzaZlD5YxYF00/Rtk5gIixj755hN9Pa8PENH1orP4d6NbSMAfr2E1e
         hkVLaoLERziQ0B2dtVD/yIOByDsXQRCoyRcNCggfpm/yT9tpDp26F8bPOcydeY4SVsf1
         EEKJgr8ObbogXKe/+9rzRscnPoZBPWF6HFHa+aiP9TmLLtYI2v8GxKvFDRK9BakbyZ6t
         8cCiNqBgiFT52eNbSCYYGuJLlxVpnKLhM5nQmIaoyylgsplUm9/1oGv9GF6G6VCL32y5
         JVtg8HCpgVrsBuxGQyw5WBG7x3WgEY/S7ZXh8BUd7KYzyc66AahKtyHL//L2ErYuDsHj
         rt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=If2p5MuMUgWrpA5iJZhIZ1wfyNa+k0/qK9QG1U50VmA=;
        b=GhD4abyWWKfB7jr7IW/naYs/mHkjA7lh9JneMC3o8sR/6zXUoxLiT5ojfp4S7omks5
         fJwmT8gAQ0h8bh87P1RFAa845UvXgDGG2aiq0bHpgCCJIEioT9msPbkZo6dl+kUCMXnJ
         AoMNIYHredlVrpSNC6J2hO7n5yx8r3LBypXFgadtjDp+ov8BM9VEd9IWkhd7I4oGvpPQ
         WruMw0a1Amfb3i0oubJCs0ldbBlmXcQqAjQGZkuwR6ZVjQGBLt1xCvuFmnAyBlmKyDvm
         Dy4EPDfRPwYwBWvUGNJECCu7ozOSjQeIwcQpako/MZf60y+JqOJ+c/6x4HiZE/alWDFG
         eQxg==
X-Gm-Message-State: APjAAAVhOj13ML+Iz5pGlDyWQutfV6tvCAn4GJff3KqB+UDFdnsmxFFb
        qIa4CSgZrONM7U/EJ/86T7ZECjBZb8LrxHRhZZT/FQ==
X-Google-Smtp-Source: APXvYqxHgbLLB4QzzgK73ltagK7gUx7fz6MICytm9/FkLAF84pKeZp2qo9z7oTMZ3EQfBRWhVJIiLc0VENYNGP67YAg=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr1510773lfq.152.1565003964027;
 Mon, 05 Aug 2019 04:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com> <1564465410-9165-3-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1564465410-9165-3-git-send-email-hayashi.kunihiko@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:19:12 +0200
Message-ID: <CACRpkdaNFz_S0MV1SSr_yiC3gAAQ3vsT0KQY1BgJ1riyFhxrOA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: uniphier: Add another audio I/O pin-mux
 settings for LD20
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 30, 2019 at 7:43 AM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:

> This adds support for pinmux settings of aout1b group. This group includes
> audio I/O signals derived from xirq pins, and it is equivalent to "aout1"
> in functionality.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Patch applied with Masahiro's ACK.

Yours,
Linus Walleij
