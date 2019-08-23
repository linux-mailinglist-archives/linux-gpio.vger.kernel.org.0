Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E379ABCE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 11:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389324AbfHWJtA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 05:49:00 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37520 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389129AbfHWJtA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 05:49:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id t14so8309098lji.4
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 02:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIj5J3GC6fJ/z8+TZRbG+UFUp/TNBUYk41ueKujFuvY=;
        b=rX/SkVUPR5Xkum4I8dMllwZbXC1J8GqzVGhKQLmtAJGWXvHSayB4J0ZHclIAfzhS/1
         f0SOPcPZRdLEPalAWtVSzoFv/JBIY5IrmsWallBDJse86OTX+RAC1RxImtwA9g/3FseR
         Ucf8GyfUKVXrrySMNJ0T1f6zafGxlaJ4ddQUtq+lpBQryywv+xWaFS68YCwCu4ptDgFu
         f+zVa5bWK7uS2ueRpQGIRJs1XiUs/ebTCCTf8W3YdbpnZU0ENFuBRkwenmakiWoj4mX5
         6mAZx1bSxP8v0O1GioXeSCbuTTjoJZU/vX8bEvt+corLyRnOVu7o9u61v6P3w6BxR1dP
         cjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIj5J3GC6fJ/z8+TZRbG+UFUp/TNBUYk41ueKujFuvY=;
        b=EzdRribBDHgnSslzfsGpaz/SGhcTV0bbdkZoWJj9jsSRw8boQJnyKdPxE/9je+IEBh
         vx6aDChe+JwcoeirpVKx9oZSw2esr3tgGe0EDbv+wQoKYNebpEtTxi1xY37/sUiUEXDc
         o8NLW39BCwmz2DlnQ0vrbG6rA1skxD9pOdfL2h6SlXx57OMHfyrb2U6KwkjcBwGpoMzM
         2upg8JNRjsLg/fFUqM1/7yYJsb5f8dP05ZRVnsAcxrZgt7mcoVhRL6JK3BRhjyErcIaa
         97fMOBt7YlDJ2PROGJHDYgPlX++Npkzs9KiWef54OGat3AF7A3J/+BRlTou/uH8zCbAy
         ScCQ==
X-Gm-Message-State: APjAAAXIu5eCrBp07GipBbQ22wRw0xvrkrTQ8+vj5cOMaivRm+iBjtKc
        OJ8V2FEIM5NEGujy53tLmHeobktLrppcBago1ssccA==
X-Google-Smtp-Source: APXvYqzzgizcf1hEzZp0DPeYQ5HNGJre4pFWBphhjTNGc0lG4u7yjHgyy1zrsnB2xD/LzIjtVs5fBSj61nDdBgIULiM=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr2407466lji.37.1566553738017;
 Fri, 23 Aug 2019 02:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190815060718.3286-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190815060718.3286-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 11:48:46 +0200
Message-ID: <CACRpkdYsM=R5Du8bLCWxwxjQvVhH=hGAn7DwUMfdLk_3Ytg9wQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: meson: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 15, 2019 at 8:07 AM Nishka Dasgupta
<nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied with Neil's ACK.

Yours,
Linus Walleij
