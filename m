Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817A51E0AB8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389594AbgEYJgs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388437AbgEYJgs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:36:48 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC40C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:36:46 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id c12so3504224qtq.11
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RrCJYv2CMkjmXgxh4luY1jGTleOro3sZ8PAwMM7JZE8=;
        b=fuRxqLaU5g8a+KV52JfO8iIc6Dpzv7xH8zEcUSQ/EPvQBP7xuZujlB1Zqe487JQ3Kq
         07LoVBHsy1UXVK+h1466jj5fLf4k0US9SOPw/xkahZeYDz6NXGm5hSOhNSrUBtmqhLWK
         KpGTM4RgelTirb7PDz/hSax3IAD2wQczpkOEfKXlM0XO/X+ySXMhXr8sWjHil9VXwp4a
         gjc6rD/Jhv2tYnFrfXg8taOWar/FQPrbAQeQRe+RXkie2tW8wVIJTOK74bsrPbGDoPrG
         lezjk7vKK6+6lpnEOFAUY+wGVeHzj2KdWfnZ/xg9pSOhTX2lpNrlKoV/wVcAJES3+lOl
         9t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RrCJYv2CMkjmXgxh4luY1jGTleOro3sZ8PAwMM7JZE8=;
        b=AxViy/GRwjYRy6eDLI7+7ntlpWxz87GlmYayR7ymZ4nklQneyd9CYsCT+v2i5Fclo4
         ALt8FkuCZkzAyxy+t2pOuE6xjhV+QkIEkSoby5AzP4L6X7qiZLth7n73vk5h0YrwLQyC
         yRlOr/kqdI2DStLh8P9HbklSlC5NfPZYBM+2SK85csG0qopHedx/KgzNr5erLIqSto6h
         P4DBJayjlAKz/Gvac3OW0HjNorROE+wzWA1McbD2JtrzHj+HJQlvBwmYssjQexxjVMBD
         tinF2fVxwu6d1i4ec9kSaZYQ6qAG5AT8uz3GYv7uwXtVPqFXW2r3Wh+cBJydJ9n2OpXJ
         OJGw==
X-Gm-Message-State: AOAM532D4gNd0hwIbVgqEUElQKtaEqusexOG00AQ/LjBwidSedGf2WHH
        fV6CYEe7T9AB5OjnPcNcI+MdFI4U9qnE4QRvqmjRfbbo
X-Google-Smtp-Source: ABdhPJxH6RRcuaHYqO3WxxeIfwE81GyLqMO/ChAPMvFcbjmN7sgsVd4B4nKXJegt6FTlMqeYNykQPLynPcScd/lVDDo=
X-Received: by 2002:aed:257c:: with SMTP id w57mr26966940qtc.208.1590399406112;
 Mon, 25 May 2020 02:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590017578.git.syednwaris@gmail.com>
In-Reply-To: <cover.1590017578.git.syednwaris@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 May 2020 11:36:35 +0200
Message-ID: <CAMpxmJUrC270rgWcADYruqA_qVeh9-N8mCVPWgJkL-8kU2bO1A@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Introduce the for_each_set_clump macro
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>, rrichter@marvell.com,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-arch@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-pm <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 24 maj 2020 o 07:00 Syed Nayyar Waris <syednwaris@gmail.com> napisa=
=C5=82(a):
>
> Hello Linus,
>
> Since this patchset primarily affects GPIO drivers, would you like
> to pick it up through your GPIO tree?
>
> This patchset introduces a new generic version of for_each_set_clump.
> The previous version of for_each_set_clump8 used a fixed size 8-bit
> clump, but the new generic version can work with clump of any size but
> less than or equal to BITS_PER_LONG. The patchset utilizes the new macro
> in several GPIO drivers.
>
> The earlier 8-bit for_each_set_clump8 facilitated a
> for-loop syntax that iterates over a memory region entire groups of set
> bits at a time.
>

The GPIO part looks good to me. Linus: how do we go about merging it
given the bitops dependency?

Bart
