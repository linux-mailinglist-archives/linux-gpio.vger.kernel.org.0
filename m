Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD31816A5
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbfHEKPX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:15:23 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33955 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEKPW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:15:22 -0400
Received: by mail-lj1-f193.google.com with SMTP id p17so78830179ljg.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EVUakBz4HVrBvU5WozBP9zRGYaZ2u063yCbTr8IH9wg=;
        b=h7hSXRNhw+BgWJVjsm3CUTt+gZ14IRMN5LjwbEypK2d6eMw0PVs2ntw/YUTNTo6K5c
         YvYdlQu43bwvSdSCHbk9ALOWXZGSYh2Z6De9g/Su7n1CVvElbTYf5Sk4V3CWU/t6arn5
         QL5v+l4NitaSIZfsmJrgpY7tfjio4lzr/M6up+lXW9V3Ps9ZuOirB94gxrz8x1FG8GQs
         RttJ3Vra50Bu2sxlntxYoVh4k7IcugIs4VJCZaH9TonMZSuJSrbdbZTXGgz+gcjtPoyh
         AP/Ox8IvhETub7PSCfZSGGX1tuRPisg0IWmhPaXV0jTRZ/ydreArtzV03pszTkbXybr9
         hJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EVUakBz4HVrBvU5WozBP9zRGYaZ2u063yCbTr8IH9wg=;
        b=eu5OMjPM1tswEQz4VfLmMo4da6Mo492aSJAGM2fTNCxGjbyoijB7VQzqlqkRWgcbGy
         DnpMlQrLt272ODWbwuoCj9hHKWfZb3qssCpKxdzbQPMDqTCZDMZxlDXsya5YNMJ7R/Ow
         0pJ8+b34Wk6VYRdhM5mXiTIbIaYxgi7VP5mO/OGXkWioW/wJ5Fdox7XoxjmzWYHIKznB
         ab2WA2AE8aecEmKpD1dbXTjaleS0oRq05KxiWjS06Yv8YD5lBJcZa6OtBNwk/t8bbgcK
         yEOQxtFAGC/+Sv8btrVPlQXjj3CImM0G8s9AcXX6966lyaAH3nMM9bWnYsttW8qHsmCK
         OPPg==
X-Gm-Message-State: APjAAAXmwO+z9PDLpGPG7u12aFOlTiFJwYGicO1zTnF+7xavjgXr5ezW
        KiBf+7jNRgamqquiU4md7R9c8/f9+x0Xyk9D1bqf/A==
X-Google-Smtp-Source: APXvYqySHuR6d+bEQrsbTHzEENtYOVUi+8awDm/vDpXZ3zt3zWFIJstQGj1Z5v+QGxwqmgpUNdelEqXuxOip7mnqSPc=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr9719149ljg.62.1565000120908;
 Mon, 05 Aug 2019 03:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <1564053416-32192-1-git-send-email-amelie.delaunay@st.com>
In-Reply-To: <1564053416-32192-1-git-send-email-amelie.delaunay@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:15:09 +0200
Message-ID: <CACRpkdbeTQE1SGFeU0NQzgYxz_rjA_6Lw=3WLmeAF7pyEw7aLA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stmfx: update pinconf settings
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 25, 2019 at 1:16 PM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> From: Alexandre Torgue <alexandre.torgue@st.com>
>
> According to the following tab (coming from STMFX datasheet), updates
> have to done in stmfx_pinconf_set function:
>
> -"type" has to be set when "bias" is configured as "pull-up or pull-down"
> -PIN_CONFIG_DRIVE_PUSH_PULL should only be used when gpio is configured as
>  output. There is so no need to check direction.
>
> DIR | TYPE | PUPD | MFX GPIO configuration
> ----|------|------|---------------------------------------------------
> 1   | 1    | 1    | OUTPUT open drain with internal pull-up resistor
> ----|------|------|---------------------------------------------------
> 1   | 1    | 0    | OUTPUT open drain with internal pull-down resistor
> ----|------|------|---------------------------------------------------
> 1   | 0    | 0/1  | OUTPUT push pull no pull
> ----|------|------|---------------------------------------------------
> 0   | 1    | 1    | INPUT with internal pull-up resistor
> ----|------|------|---------------------------------------------------
> 0   | 1    | 0    | INPUT with internal pull-down resistor
> ----|------|------|---------------------------------------------------
> 0   | 0    | 1    | INPUT floating
> ----|------|------|---------------------------------------------------
> 0   | 0    | 0    | analog (GPIO not used, default setting)
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Patch applied.

Yours,
Linus Walleij
