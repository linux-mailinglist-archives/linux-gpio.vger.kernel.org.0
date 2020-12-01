Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396D82CB07C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 23:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgLAWy6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 17:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgLAWy6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 17:54:58 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CAFC0613CF
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 14:54:17 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id u18so8036914lfd.9
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 14:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=45I+KRWHBK+Vr07RlSXVPasVxsr9ozqxGBN8hOtxRDU=;
        b=TUmUE3F+1aJGQ/P3nVATcrDL5cUtvZRcLeXCMbSwq3qYojsQDpL98VKqqFBl6icIQw
         GOxhQfUii3s+vUPUHct7fnMD+vWP69eVfuUhD3cp1rgLXdzqYvDgABJThnsYucrQZRHE
         0lRu958V4xe8/hmw17iWcqWQvfdUe8k1rq/0QFJYaMlwF4xIl1cceC8KGObWWjW9BEnU
         q+X4z/vLDDAzTzFty2jFX35ytAj4TYwSWFoJ2F72E9aWsaLI3HuRTVe2my2x/DOuGl54
         dET+AcfDi8HU84Z9CEd7AmyPpbVZE0aVvpIb9ah9JyRZqRmAc+i2i0Bemnv0nbZaehc1
         +iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=45I+KRWHBK+Vr07RlSXVPasVxsr9ozqxGBN8hOtxRDU=;
        b=iN+Si5FLLgv6bq+7w3frUjeWZs6ht8KwzuwnsONBoldY4GTFn3Te/qzp2zrfkFDHf7
         2Q+ThL7uI42A4KpdfjV5/ZlUxXzzlqLf2QLw4bsibFXfV1ZxFxzTBNvbjG4kuzJdx3OP
         wk3R63HcuH11wHOwqfa45xQxNxy+2rqSexMlFLDNZ+yZaKB+aWNNAc92k1BLPRpfKi6l
         2gvsgzMhwKVww9+YNtQo5sNc9Jw2LHvwmi4EmcwuBQ9on4w6tBb3FHLGEXJvEjJWjykt
         mdRwch2ccHf4lvI/JLXYlz4FCUtIST8R0asjOU8VS5yjyBWqIGzaUQBBQQHm4tWx7wtO
         7BKg==
X-Gm-Message-State: AOAM530EAXwe1UBUNOwYNtgQ9KwE66vOff64fLydsHLBZqyelkgje78O
        biIihF5k3zmFhZ4/EwtEdhCg0vKtAx3miWVLMMJBgA==
X-Google-Smtp-Source: ABdhPJxUqueuUaPCq+IKxWlkCkvRIEkV0PoS/X0pg5bjz8xSrPI0GnkXI/YA5nIiLtt4Jo2dMrQ+2n8GKbyvf7kl0QI=
X-Received: by 2002:ac2:4578:: with SMTP id k24mr2225682lfm.502.1606863256350;
 Tue, 01 Dec 2020 14:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20201127134304.79252-1-geert@linux-m68k.org>
In-Reply-To: <20201127134304.79252-1-geert@linux-m68k.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Dec 2020 23:54:05 +0100
Message-ID: <CACRpkdabsDER3_OxmLg4g8fjU7eOVFQDit=A5OKqPL_QLyTyMA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.11 (take two)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 27, 2020 at 2:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> The following changes since commit d4aac7d439c2d9307cb5137fc285464a36978107:
>
>   pinctrl: renesas: Constify sh73a0_vccq_mc0_ops (2020-11-13 15:37:41 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.11-tag2
>
> for you to fetch changes up to 7ba4a9591a8ac058bf976485975f78128c273800:
>
>   pinctrl: renesas: Fix fall-through warnings for Clang (2020-11-23 09:47:28 +0100)

Pulled in for v5.11!

Thanks!
LInus Walleij
