Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1BE78240
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 01:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfG1XIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 19:08:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43283 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfG1XIF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 19:08:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id y17so32118239ljk.10
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 16:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O9XQGnluX2xcbDyPaZOiLCfhELVR6ARk9hMIDpP13vM=;
        b=jKcqI13c9E5QyILvaIYgYgRYmaryyYWNEbMQEoOKb37DRDPRNOQ/CmltyhtMOQ2HUS
         fBQywfQcaDwy5p9rj+8V2NNg7KBeis8WehmdgqEW5Hu1ZeboAzu3lDjxHdXHxBbTO7Lx
         wDKj4rAWrziNOZnQyYVQ+4zZKDCfxpONMitQU1nbGcWG7h8+KNIx8WxymkjFgV4uMLNV
         gTq+TsDheRts+0kwZ1pF2AWFFE33LUDfPgNcsfFAF4eoov8vIDeqAwwx4d45q4mUQi9d
         67ctbyLdpbL1YoTtScBd8ekPRHh5pa/7kIj+wl9FXlgCXSCG/6KI47rzPNoSFd7zFwFY
         KPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O9XQGnluX2xcbDyPaZOiLCfhELVR6ARk9hMIDpP13vM=;
        b=XWmCx+0/WMPCN57vwl41/y9A47Iyzeu2DPvVt6RG7DHfMSpWce32yUj98r4uuNB4fW
         +ci5YmTplHmJXKjqvW8gqmIwOgEKOF0kI9+KfnRv+898FI886lwVNqtbJPFzRIeiy/Bo
         96fej6czNbuAcM9iffLb9UQfi9NbzNerQy30NC+Z8nOGhXC5bgoHBIGThFyNiKdItBuU
         t7BH+WU30IIPF0dTnuQBo5ir2PxovflEl9qHTxVD+2u3rn44y3SgP7NzynqcjhBeJFkY
         JWkSS4bgajIAj7gkKuymbPfO/pY7KMJoqiZStYJPpPAfITzeKos6//OxQ+a/TBmcqm6+
         w+Fg==
X-Gm-Message-State: APjAAAV4SVF3HnavobwE8whWR5qaJLLlb0uogKA7l9LesAdtXWuLtqEE
        BazwF9lzG5kWDcZfoLXpPl46zaHb1fRxgnszDBsrpg==
X-Google-Smtp-Source: APXvYqwEW1LqfjiyoWnevFQ68/gbc/RdODkVK1fGIl+hP12fx7TSPrM4zpDWzDWByLH4DWsTBNenxT7LE1B+MwCRLes=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr56865504ljj.108.1564355283784;
 Sun, 28 Jul 2019 16:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 01:07:52 +0200
Message-ID: <CACRpkdayG1yvCewxRwi3BD-EM-NTXPS80Z5T0WONM3m2u_Yxcg@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: uniphier: Add some improvements and new settings
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

On Tue, Jul 9, 2019 at 12:29 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:

> This series adds some improvements and new settings for pin-mux.
>
> Kunihiko Hayashi (5):
>   pinctrl: uniphier: Separate modem group from UART ctsrts group
>   pinctrl: uniphier: Add another audio I/O pin-mux settings for LD20
>   pinctrl: uniphier: Add 4th LD20 MPEG2-TS input pin-mux setting
>   pinctrl: uniphier: Add Pro5 PCIe pin-mux settings
>   pinctrl: uniphier: Fix Pro5 SD pin-mux setting

Looks fine to me.

Masahiro, can I have your ACK/review on these patches?

Yours,
Linus Walleij
