Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39C3432029
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 19:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfFARfX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 13:35:23 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40633 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfFARfX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 13:35:23 -0400
Received: by mail-lj1-f196.google.com with SMTP id q62so12534631ljq.7
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 10:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=owmhC4nkQ++0XWcQKeCbAiLKodtwVwoOL0lLVZVcgyE=;
        b=WerUmUvFuVb1ad6IAGBDRNrocbnRRe/ludsVjfZCo7EVt4en/Ja8o70U0DMLbhvG20
         sk9Ry7wH0dKBjHUAuIMonGzsi/O5gR0QAf34QQl+i4YRH5jyZUcXmHYnsUGS6KHDbHM9
         DJjELC2evjoStf0LYeAFVEfWL0dnLm88pVHlmUiLBTUk0U8JLPkxjpxzujDTTKXI2AIp
         nEj5ui2QIbFv5tqVv/BrJi5wzVULfQ8NIpuDZhRNJkWG57ZMXOwo37eDsa2K3tlQzGo9
         6EEmeBbimUfiJ+R/kstgGxrxMYMv7Xo9vBZRhNAe63uDyH0exAXY2I7sEBevheD9mKAZ
         N/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=owmhC4nkQ++0XWcQKeCbAiLKodtwVwoOL0lLVZVcgyE=;
        b=IH/WCPNW3J8dTxCDv/jTGjuDWCcvViBOFJBHJFOKrgQBk8MkOJ7VhTaDjHuZ56LWux
         Sch5ZflbCdVl901Jjoanp6Zr+c8XReoW8BRWNd10qsX4EsmbkStY/r/pbNkdQDihrfbP
         0p+R/YffdpoyqmgMm6qL0CulGbVlHhByvsNL3DbU79LhBef7e0hwv5+YKbFYSIH3UP+J
         fPEEMxKC88QU38e8JzcEFrB9V2Fg1nBonLiW31HyN4+YT3235QqQ7SX96RYUt7wFlGj7
         wohgHx9gMR267btb385rdxZlUA7zls0xtXdTZeDErEQOjV6+zkI7y5Y6c1/UjfxNpgS4
         lCcg==
X-Gm-Message-State: APjAAAX1hYEnrtAobToF5zbOYGZ0ye0pIYSTQ//X0pF4QdND3Tc7u5Xk
        FrJ/8ng+/mLigab8oYtWwo39XOOq6XqSqrgmZKBUQg==
X-Google-Smtp-Source: APXvYqzq9gTWZsAaPSchU/CdBc50ntEnexEA2Elo8kyp/1cSgd9LzQr3i7TrIBqh5qaIoJg1bUhCfWWkTV+Bw7CC2tY=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr289291lje.46.1559410521088;
 Sat, 01 Jun 2019 10:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190520144108.3787-1-narmstrong@baylibre.com>
In-Reply-To: <20190520144108.3787-1-narmstrong@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:35:09 +0200
Message-ID: <CACRpkdZ6PBMPDie4RyuPfzfhs3W5XunZMqa6cG4bg7+kEhUegg@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: meson: gpio: update with SPDX Licence identifier
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 20, 2019 at 4:41 PM Neil Armstrong <narmstrong@baylibre.com> wrote:

> Update the SPDX Licence identifier for the Amlogic Pinctrl drivers and
> the corresponding GPIO dt-bindings headers.
>
> Neil Armstrong (5):

All 5 patches applied, I took a quick look in mainline and it appears those
files were not hit by the large scripted conversions to SPDX that tglx did
recently.

Yours,
Linus Walleij
