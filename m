Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE42172E655
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 16:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237019AbjFMOxT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 10:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241182AbjFMOxR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 10:53:17 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D591984
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 07:53:16 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-43f44f5f8f2so808137.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686667995; x=1689259995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj9On63tZGT4xZHZRbn4kNAEZXg6WSSzte0QQ5DFG5Y=;
        b=3xz+2W3O1cEmUosWRClgJqLxl0RaLvVadqpzTPvT27Bjy1/yeTJfSOMsG0D7X0iH5o
         KzX/+z8/VC+rShQubEE/VWKrIyoN8QvzBgqS0+P+gzuMDwG2uuiMKQNdJ2eTNqYu+MaU
         P+wY2VwAJRMgCg+VbM31WFoOirbEbUKbIVp99SgYmsgjUjHp/9PlvRgETuYgt7l4pIrw
         lpcgVQIqnHllPbvDsAbALV3GDuBLMOQT0rpRWdnghItx3SNqTwglIa2ZAFhANA6IrrAQ
         HUA8KJNWZZ+7RJl7qtzwp22HsQazZ2H6FahZGeNmNAzxVORq2tbBkfFGiqOhiXscImN7
         jHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686667995; x=1689259995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj9On63tZGT4xZHZRbn4kNAEZXg6WSSzte0QQ5DFG5Y=;
        b=NzixELzFsLZYFcJV36o8RyEyEsxqLl2O5jMlOzmL46QodBn7lDr+BObj9BOAobc+Ko
         CVUs9HhKLXgFlvdcLuVwZGWPgTUazvCHo799C/WWWYGg6iLMY0bQhLC1EjSI7+hGgp+b
         tQMZ7tADX1V0KKwvq5YZ5JzyLu4iovJxxbkSUad+6mMdc8alOOau/uZQJLUJ5GizgPo+
         +PHcQ5qjThgCETKkw+maUC8aepNmK3ZST6jei2hm+OgwLtOtxHKFhs5smokzN9HqADSn
         ABWRDnoD7hA4nG6L9N+i/YDmzI670mbw8GT3uJqgkXhpW7DUJnIsyMPwRxyVZev1V536
         X2vA==
X-Gm-Message-State: AC+VfDyzA7GUhIQAkvNtuLbHbVSnDp9VQ3hKDWp2TOgyEXbAX15vv1kQ
        sk4CPRiGpl6eIVTq1R0YKmhlp+H9u5TI3kWu+5EGEQ==
X-Google-Smtp-Source: ACHHUZ756bnFHTg62RATpM6wA8I/VVqR/uhiSiA71IFDFVJY4JyUcDi5z39sBzm7jpDc1KvVUBsrTNtF6uxgL2g4exY=
X-Received: by 2002:a05:6102:3a71:b0:43b:3e78:9886 with SMTP id
 bf17-20020a0561023a7100b0043b3e789886mr4214600vsb.26.1686667995404; Tue, 13
 Jun 2023 07:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230605125411.60378-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230605125411.60378-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Jun 2023 16:53:04 +0200
Message-ID: <CAMRc=Mcg62aoeiwG_3aUAGqL9MeoYjWvL4mxRTEPUPw3RbAUjw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: Remove unused gpio_cansleep()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 5, 2023 at 2:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There is not a single user in the entire kernel of this deprecated API,
> kill it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
