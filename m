Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5AD181809
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbfHELUN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:20:13 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46698 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHELUN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:20:13 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so79111262ljg.13
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=00opSjOUCt0nvHWrKUPJCC41uhCnbdAiE9Dvugabrgg=;
        b=bKtNIrao0IXWWGBcvE4CzCrr4sVoZERR4ON2NQ9OUZd3DlWEt0fbTvltfQc1fMItqO
         dsQMVhVznXe3BOPo/GY76BB+5MNqtZkga02sTaQ1B9i+FDp2i8IVn3oylXOL0YnNg/Xx
         kXJTbNyAfPcmDFWDUK+uXMPNY57GC1r8KIvEV9S4hJeXwQntlX9Gnc/yt0P3ZyAAyTM4
         EjnF26ghh5wVcfspBsS5Nx1tkhSHjb9v0fLoe6I1eAIPHzcb9esskISaj29AdtLbs96n
         bZXyOLAt6BOM/GcX02aJ7dOZ4K3EWGLWaZqArERR5HDprK7lppQ3olXrPFh6KSoN1lOd
         4nDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=00opSjOUCt0nvHWrKUPJCC41uhCnbdAiE9Dvugabrgg=;
        b=gcov2JtD32Z3CwET7wl9J2AIPvskla+JO7f9ihceD156RhFwYo0BnIzuRdUa72+res
         //cjiRnHiDco6w0reewck2qvoUIBjIpBWqpLNEJyeKWhAINOUkGvwYZU9MkFRpFDVFkz
         H6RESFiYjk+vvq21+WRR9qBUO7wphJxejR3KdP/AA8elJ2FvQaiHdSDkIuN3Sv+6YorG
         EtMOZwOztqIrX5HGXT9BWiYjuiZV3dmOZKr7Qhr5gvsDzKHE+ZBujoQEB3acdeurTjnv
         Q9K1Oo+m+380UR/+lhwKCWrXDK1cv/Q7l8WsOIBL3Ze3Wb0ly+BOMORzqOrWVEk4WuRj
         ST5Q==
X-Gm-Message-State: APjAAAVNpTmIFYOE/H8PsxKElrmB8PVAU+ztE61Dp5EwwrVR/QBSp33v
        kDZ89MnLGX1zxlla6MsYBNSZCPlNFO5mSBkebMlUUw==
X-Google-Smtp-Source: APXvYqxNKcddtNY/mJyk1N0KVe71/UAx4m9nnhShPcFo6aRkA1Y7BWTouzWMllsjsG48s3b89d8KGfW8kMTL85j8Ycc=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr47728ljg.37.1565004011463;
 Mon, 05 Aug 2019 04:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com> <1564465410-9165-4-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1564465410-9165-4-git-send-email-hayashi.kunihiko@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:20:00 +0200
Message-ID: <CACRpkdb4xvUROYncrF4b+8t26A_8q3OEH9XD_tS51B6Z9Yc+tg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: uniphier: Add 5th LD20 MPEG2-TS input
 pin-mux setting
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

> The 5th serial TS interface uses the following pins:
>   hscin4_s: PCA[11-14]
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
