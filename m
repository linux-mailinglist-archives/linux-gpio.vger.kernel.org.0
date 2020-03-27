Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F91819554E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 11:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgC0KbS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 06:31:18 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43652 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgC0KbS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 06:31:18 -0400
Received: by mail-lj1-f193.google.com with SMTP id g27so9593432ljn.10
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y9GPFegNFppAtG8VfOK1hzN6DX1neujiFhmSroslZ3A=;
        b=v8SnBAISUhe4O2X68nvq2mTQ4IESHbhhK/DdVTGF6QQpxj+HBRN/yyyodYhymC+PzS
         JAFdSEC2fpQdWWwymmeF4F7Gv6hDx0LMnRAoHX2Hv/10PnazJ3ZE2H5l++8BZLS7G864
         MDArlHjA1tW1RQcDzi8mNdDB6rwpORj2r3S1sxgesBj3TttPQBwKjY6oDCQRmwRnomHt
         T+5YUciUeMpRSj/VsI0hGrOMhNfaVUdroln9DIKVTKn7ACGvcu+rQF/w6717o6nKyw7s
         +K1ZRkdSA3UaQo5WtepoU2x8h1WD6bBW87YeTPBJPZ/8OeN/4SKFC77CrK09NYv4o46P
         2tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y9GPFegNFppAtG8VfOK1hzN6DX1neujiFhmSroslZ3A=;
        b=pfH9/wSD2ijJXPlpu80CAnVnGktnWYo8g2Ur6Xg5BOblRNanQslaIXIj5iNOlhQrPt
         2LDlYg+FkFnyNTWLmQTLvPnTjdXU7Q7Dp3D9hg73rMdPxubSBQsOECqnSE9Z00Ekpi2D
         KaSIdD7uRE6s8eRCUJjQTIRLkAGjq8Tc9t20sdZf7b3rssgakI2+4G4mnv8yI/1YIlVG
         ky4Ex2GS26WRKrJ1N1ra5VcoGBKJ/L206iUp//fL7Ah6I5dXc4MbHeMqLKMNpoUxgy4X
         hlr7Xc19ce26wO59/BAk+Ars/FjDRoDaxYL8QRAdtakV6LEfheYbSKCP+N5f8dW7yuNT
         otvw==
X-Gm-Message-State: ANhLgQ0jBxcVYQJmwaKchO1Mr79TpwnRWR8ymPWLbkc1N7vAUmGP/tZH
        GLaia9N1PAtMYAzILnXsEA2i2pCiEnuhFKBrlLhBfw==
X-Google-Smtp-Source: ADFU+vvzNuB6yrUNJcqv0peX2lxUzuEUOGbmXMaFpa4JyDohIZuKl0tKEbyR5jYlOofIttkCHl7I8ntnC39UZAJQJd4=
X-Received: by 2002:a05:651c:445:: with SMTP id g5mr7734981ljg.125.1585305074115;
 Fri, 27 Mar 2020 03:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200311090644.20287-1-tiwai@suse.de>
In-Reply-To: <20200311090644.20287-1-tiwai@suse.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:31:03 +0100
Message-ID: <CACRpkdYBQ4tqy8Ji6rMwkAjOyx9zZFb-CYyYdLAfkDg3c+iPTw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Use scnprintf() for avoiding potential
 buffer overflow
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 11, 2020 at 10:06 AM Takashi Iwai <tiwai@suse.de> wrote:

> Since snprintf() returns the would-be-output size instead of the
> actual output size, the succeeding calls may go beyond the given
> buffer limit.  Fix it by replacing with scnprintf().
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

No reaction from maintainers so patch applied.

Yours,
Linus Walleij
