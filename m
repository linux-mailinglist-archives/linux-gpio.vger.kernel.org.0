Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2FE8180F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfHELWF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:22:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38515 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfHELWF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:22:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so78972884ljg.5
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4I7HQUzLg54lQgNOoG7lv5acdMfxGmf2zfBCM1oNE/0=;
        b=kJNgTfZMaKn6TTMOFPead6v6yGgAI32EWQkZDbKiBwGAwjsol9HjziurVVVeirxM/K
         2V8gqYMpnSlFHb5II2bLAW5QAwLrk81iLN31TauQ+Rv7lQYYjp3+dxhxWrno1/7H8T7d
         orucJ4h1JxTkaoq8jkFUVWP2RlYjamDWxjuzziPd7J8dpMwyl1g0yX5m11+8bbxfvP+u
         bEpuj7WvvCQ+O3DH+hbURzr7jWukVLG7BXJ3ZusyDW6qx8ZBcHXYw1P9qjlz+9hU+eMB
         3ziMfQ6ZZvCtdV0Wipmo53Bs3zCSBljIrCFhiXkuBA5DI+y82Qn0t30gY+N81iLfD1+J
         Jxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4I7HQUzLg54lQgNOoG7lv5acdMfxGmf2zfBCM1oNE/0=;
        b=sJKiQKQ0Fkr6o5TspncWEJPX6RKT4gdmctKq6rcXGdfpO4n9PQ9WaascFYXKARewVG
         rMWs5DbnmNfvBrDRpXkqsxdn7yVSw9IJLRrk/gnL9MJGEVhRhZD8oHTWpYFEDlGg0ga3
         kE55DaMiqUtr31sH1VRhXw3u7xqEdn/X3isD/J2PBJhr8pI7O34Prqck71SR6qcMuOBg
         jtKJxvxU2XvzmDSNhe2W9PA5n5Lnz0a9xwO7DF4QYN4IWb1Q4kitogZzhhv5cxnfGFiV
         U56hGAnrfIR0i8moHavqnuS4nrJS7PfSZ075t9bcwdThzJitaurtxm+gkVYUL+tSkzB2
         UxdQ==
X-Gm-Message-State: APjAAAWYhXocd/b4/OI6lLaJX84MKvUHtNmQU7gBE46GuoXwYyW1DWWX
        Jke/F0rSsi3fatROeEbCMKWK03dHnQxDg/kwDFQAJQ==
X-Google-Smtp-Source: APXvYqxB+/B4tIr8qhrPO4eeWRecgH4quPXH5oIsTvpDO6GilYVnzK/IWqZawWQcrqK8hwD0P0EJ4mfCDrr/N2cg260=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr14964936ljm.180.1565004123132;
 Mon, 05 Aug 2019 04:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com> <1564465410-9165-6-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1564465410-9165-6-git-send-email-hayashi.kunihiko@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:21:52 +0200
Message-ID: <CACRpkdYeJwVCfPW3duVspnBFsyTbFu8kLmr84xv0HHiF_FSxsw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] pinctrl: uniphier: Fix Pro5 SD pin-mux setting
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

> SD uses the following pins starting from 247:
>     SDCD, SDWP, SDVOLC, SDCLK, SDCMD, SDDAT{0,1,2,3}
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
