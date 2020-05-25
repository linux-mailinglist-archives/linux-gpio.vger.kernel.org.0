Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022A11E09B2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389330AbgEYJHp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389329AbgEYJHo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:07:44 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45412C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:07:44 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x22so10125064lfd.4
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o89YSgHgcTaBTFg8kSTEtu5uSTSya1YFzL9l/HGPI9U=;
        b=YlN12nX1NHZPKLk7yt+0r9zb+2BjRNJtbaz++sXUiesxUslZFemNMfuuSkIemfbRT3
         IQXkU+BAHxfljUVwI9ADCeWwrlqIuqjlYZ4DQJ5UqtxtknIsqWuVXMzmM9tdQeKVQIuQ
         U/uO4t8vUdzGuA9tqbhOIGzW3cMHMh2bv9R/bWSdrvrOAa0t6KvWZUtMJqn4tqzvpD0T
         GirZ/je/NTvM2Ny7J0C/lkSOj3pRY+Gey/bt0DsSoCBs+p3AOGoU9pZ4kcXoMhtsOp++
         JMa1mcq3XNbgMyxcHgOsBc0s8/Yig3k9ZVt4klCu2i3JIq585F+Sj/UdmjuAPEPizM6F
         +2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o89YSgHgcTaBTFg8kSTEtu5uSTSya1YFzL9l/HGPI9U=;
        b=eBMJnScMXDrfxSnzBse7DmBLM1ZX/UkbkWogCljmZEmmn0d2sm2v9cLAs7XfSyBz0q
         aBu7YxiJt6aQImjUfTNBma/n7PxRZaXpFnntloXR9JP0yqmPk6R0QMcC3A71KhgL2yXo
         htOybMNAmSOgAtbjoYGiGSK0cagJs95fizkmO7r9bzevj42C0BZqG+viIXRIioFIWq5w
         /TPTdagGP+qTO0NY47P6lwAwezDhMiYmhrk3fO1yY5PbQBk9ATz5iXQD4+pEm1NKcC++
         hWmDxLOfGk4UIf0DC7/0w+Bg+8MMxN7CgtoXmWReNbSpWFrizkV9IOqCMFdW0mAuyzrx
         JTVg==
X-Gm-Message-State: AOAM5327qqugCyc8Envij2kqlGI1kN1MmYTNjpIaSZDXGuqxuVy7onou
        fXr1rEI0Sz9hfrXP+NLlQ9GrzEFkHw2atWXHbHIo3A==
X-Google-Smtp-Source: ABdhPJy/AT6zyTak59N1xLSdRb6XGMmAHYxOO0NNAMXkgOgnxXyfRzG0yc0Un0CFMckQadJrKzvg9uMwEmTjdAIbnMQ=
X-Received: by 2002:a19:be87:: with SMTP id o129mr10368301lff.217.1590397662771;
 Mon, 25 May 2020 02:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200520120955.68427-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200520120955.68427-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:07:32 +0200
Message-ID: <CACRpkdZ_sL9Fe8AfU+tQxUF_iHZNBU=AUq01-y30AfpW=PqLkA@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Fix file name for DesignWare GPIO DT schema
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 20, 2020 at 2:10 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The commit 657a06df993c
>   ("dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema")
> missed MAINTAINERS update.
>
> Fixes: 657a06df993c ("dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema")
> Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Serge's review tag.

Yours,
Linus Walleij
