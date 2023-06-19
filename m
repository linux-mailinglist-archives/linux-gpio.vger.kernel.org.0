Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54E8D735788
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 15:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjFSNBe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 09:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjFSNBb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 09:01:31 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F5DE7D
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 06:01:19 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4718bc88afdso1234774e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687179679; x=1689771679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOOoSS+F0a2RdMkqm6GJBrGXPR5DaWdsNr0kGMMs4Bw=;
        b=OB3K3a9ApKPYdKLzEKgj+0sANB6yFN5fyA2ZQ5yXfulJc9FMwylO48yycbNNORDKwW
         YGm9vup9enufN5JJHX6FinTz4XpFVigEWZ7lguoNIEfAaiLtdHBsJRjw3dKrNslJ3MkV
         GgjynCEESy9hOunZFqpFCKAzNuXHLvOl/n+Ye9XF/oodN4WDUimFE7q5BYkPlMHLZsmP
         bzJwUMwYiVHgazw5f0cQJSqWsm4GrILgUoOMHP13AHtVviK2nY+VZHKKloN649LaQMYD
         VsRokbRY8e6j9oKPae8PPCMUgKznOckD+LHgxpB7ObGqpGoJHUeoTlVLWfF2ox76J+rm
         XsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687179679; x=1689771679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOOoSS+F0a2RdMkqm6GJBrGXPR5DaWdsNr0kGMMs4Bw=;
        b=lbZFYM+eBZDsyXoa3PyX4S2poQJOyqOym86mlUFGbi+Y3b6uhPXNe+0alp5D/Vwv6a
         OMJiSGoHCKrYOnOz97Cv6LEhj6BuUKHa6p6Gg0wb98vZ2op79sjOFbzMKRJBnBHU7E76
         4ZWarBn0THbLpoOVVXlhY7Sy1Fr/O/8EmBBz76KX0K2WxAs0W059O1mwezAjrSWovdUg
         IgzP5HamKy19sJ9mtSGzR+KDCWV9BWbgkqTOslk0J7wYTBq2aqBRe+c8NAky1+qR8Juj
         VPSUNJ1kIMpVEqxmzSQYa+mMxzp5xqBFlJceqUU5iW1nYW4Aik5MtH3SFoJDqxKbbaM+
         8cDQ==
X-Gm-Message-State: AC+VfDw4XEjBrAGT9yOjMuiyQHF3WZdlIsE4MA3l5uL6+j7T55s60udT
        T6XudDqVPKwqRJfClcsCx0EDAdszyMT/cXFU5oVtuQ==
X-Google-Smtp-Source: ACHHUZ5zM9XHtakKxyFSDb4NdBBVpJlXIrmV5Jzbs7XjYL8/AvTVYGd3lv+B7bY+b0R5GUnt7vbhKgEf4wVb2JOSWkw=
X-Received: by 2002:a1f:641d:0:b0:457:56a4:19e7 with SMTP id
 y29-20020a1f641d000000b0045756a419e7mr2192721vkb.0.1687179678927; Mon, 19 Jun
 2023 06:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230616135313.76338-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230616135313.76338-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 19 Jun 2023 15:01:08 +0200
Message-ID: <CAMRc=Md28NqUudp38yZZx1vqvyxXQ=-zaP-Wzo2dy2mbBrfB8Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Drop unused domain_ops memeber of GPIO
 IRQ chip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
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

On Fri, Jun 16, 2023 at 3:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> It seems there is no driver that requires custom IRQ chip
> domain options. Drop the member and respective code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
