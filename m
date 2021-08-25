Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AB13F7497
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Aug 2021 13:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240216AbhHYLvQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Aug 2021 07:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239331AbhHYLvP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Aug 2021 07:51:15 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248B1C0613C1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Aug 2021 04:50:30 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d2so19540999qto.6
        for <linux-gpio@vger.kernel.org>; Wed, 25 Aug 2021 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qCJ85EGARublB/DPvAvE10PnE4a7leOnf3RaeUHyVEw=;
        b=LbgNAJLQqHwAL5o3fCfBl02muzZ1EDYGsw9kaLlV5AIpxM304WhNYiKrtPyriOVTJ0
         vR/ZYlWUBsRvQJGduZnAr6glcn9UK60ie6/B3hYHNHjMHqwJe2etGZeqHSD8YavpfS4X
         ck6aIrtwSrsy6FHdMefOTvN2PFyEhkk53ZCfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qCJ85EGARublB/DPvAvE10PnE4a7leOnf3RaeUHyVEw=;
        b=DaOxizV3RbhYvkZ8+3ZADm3rFsXsrBGuphQNb4xD4G3kK3Wkbh05JfrlpUMdzbLWWK
         2rKFDLiJK51jZw/eg/2Eda1z4rXcBsliUx3wQidmjzGgrYrNxNzZuM36SZrYGe5djp2V
         JITiSx+aMYJ9Qu1A7yOC4/EC5wdVIgjzWj00AptbP5SdjZQ9Zfs2WkRmNsnxbmYVpQJq
         +9efN0QoGCfgJDHW1hoNMMXxeU1YtJsJgL1uyJzBjB5XvpWaT6PDvYhVDehESyCYAELE
         7Wwq00Hxuig3tcpbjtjHq8KxDusjh9cxKpMqv20Sj8d532F7x/fls3jdTYpjlqLJVqIE
         JAUw==
X-Gm-Message-State: AOAM533Cv0UfKGf0pZ/QYsDxToBoGudRG9UdoDm6jePtPomzLBXg7i+o
        RUnxIwWWdF5/Y9wahhSe/tDGxjipLe8yR6HVDnjlGg==
X-Google-Smtp-Source: ABdhPJxpqXw6fKZPDYAWX50CG23urulDwyDXfcLlrB94FwnQrKdRN9La8xXFxfd9Pqw4CB14ACowRv7d8m7fucB7vZg=
X-Received: by 2002:ac8:7ee4:: with SMTP id r4mr7602882qtc.148.1629892229184;
 Wed, 25 Aug 2021 04:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210717045627.1739959-1-daniel@0x0f.com> <CACRpkdbE+_DJFhBCmtz5JwJupf7QkkWZhXrgf1KG_3rPqvEm0w@mail.gmail.com>
In-Reply-To: <CACRpkdbE+_DJFhBCmtz5JwJupf7QkkWZhXrgf1KG_3rPqvEm0w@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 25 Aug 2021 20:50:18 +0900
Message-ID: <CAFr9PXmFHanrx4Frg3hQwo-RbAY-UXxC=FOAj++cshSHa99z3g@mail.gmail.com>
Subject: Re: [PATCH 00/10] gpio: msc313: Add gpio support for ssd20xd
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+ Bartosz

Hi Linus, Bartosz,

On Fri, 30 Jul 2021 at 19:12, Linus Walleij <linus.walleij@linaro.org> wrote:
> I suppose Bartosz can just merge the 4 first patches into the
> GPIO tree and you can take the rest into the SoC tree?
>
> Yours,
> Linus Walleij

I just noticed I hadn't to'd Bartosz about these. Is there anything I
need to do for the first patches?

Cheers,

Daniel
