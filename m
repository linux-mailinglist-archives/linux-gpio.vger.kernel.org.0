Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6762F81801
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfHELST (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:18:19 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35241 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHELSQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:18:16 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so79039896ljh.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pTrdNULqRQePZooec8hzYMuIdhWzshDsgdUne7v9Rpw=;
        b=HfMDJKbibOLBUBs34DEUtHqcUBsW8mIlsJ4cc8eYz6VcbQmKPZvnH/qVxN79tm1G08
         bEjAhCBkfH4Nj/pWLyZMs29VsnmVCV9q4O5CrlHx7hESCejGeUF5Y2ycoW+s1yhIrQBq
         sYcAbdXAidoCi9RTvz3gvMMZEzbhDFaae9gYrqA3JyeVq4vtDIb4kw6dDCyCZLt70BJX
         HGEx7Z65iLiegnTNg2lGymGYbDDRjkalIgzSel+z9gtWuD/MpLa88cjXdTRAOQM7AfOl
         FnEOH5AXGz8ex15jR2XnRA1OsQJoagE/0AUdvuplwCjEYYFrZDA5fYM4BxZM/aH/zXSs
         wMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pTrdNULqRQePZooec8hzYMuIdhWzshDsgdUne7v9Rpw=;
        b=rG7ONFZfeVvlMEnmQZG3fyOWpDaUs+qamGXeC7Xls/Qib0/7A2CdFdBK8JxNnbuPbS
         qiCjGlwALG5d+XAPoTvWThOUo29Goq+NtCF7/gtsfxLZIFsTOp2Ztd17py8okwKerq5z
         D31ReUt1UICAwIaJ6pYNuARpkxiqaG5UXSF0aUC3OBZYXLTbG9sqGZXRQDpKJiwxPnjY
         nxEO17WXSl+ZQb8DijQuPTtg44keO/nIgonkpRQWnSW4CHzodcJycNBQ3Svr8E1r/Dy8
         4hMEMXol+Tj1GnpTLbpNJNaWmECq6+CWgGGGdMlGEPgvcw5cl/0Wn4CbrUL1/grdU+h4
         RsCQ==
X-Gm-Message-State: APjAAAWi+xgYs5SC300NP5G+u/1/acI7qzAmSYE1/6aWIlX2kPCHOm63
        EQ7nqVckUNOkjS7t7fb2isSj+ZcOXX5Q9jdA5kTw+g==
X-Google-Smtp-Source: APXvYqyLXiSKJTl98Lkgl0Ja3jEwM+BGOX7bwjIKoiganUjSPKjHOrR2xjbwuvFB38NS1GCnOdkwwVZ1OFVgw843jm4=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16561733ljs.54.1565003894943;
 Mon, 05 Aug 2019 04:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com> <1564465410-9165-2-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1564465410-9165-2-git-send-email-hayashi.kunihiko@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:18:03 +0200
Message-ID: <CACRpkdbt63WrZszChi25H+mxrHneKFHbakiYYskCLSXO=A9rkQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: uniphier: Separate modem group from UART
 ctsrts group
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

> It depends on the board implementation whether to have each pins of
> CTS/RTS, and others for modem. So it is necessary to divide current
> uart_ctsrts group into uart_ctsrts and uart_modem groups.
>
> Since the number of implemented pins for modem differs depending
> on SoC, each uart_modem group also has a different number of pins.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Patch applied with Masahiro's ACK.

Yours,
Linus Walleij
