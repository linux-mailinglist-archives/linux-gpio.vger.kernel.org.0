Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 460224BBF9F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Feb 2022 19:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbiBRSgW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 13:36:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239303AbiBRSgW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 13:36:22 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7479268365
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 10:36:04 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id q17so17013447edd.4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SBuYtg+wc+/8fAJ0XvEeFcz7NuxQGO1oTcu3WliGN2A=;
        b=0+Gq3za39e60Vdr2B7bpDwvXuhde1fx78TghC8ScbJ79icNjSwmlwSBV35U0S5Ml8Q
         wxd756ceLTICaXTIqyPze9S+ljkWpBDMrMmALWH5sl4iNGM0I0AJTNL1yduCTOuHxC0L
         UDND4AkK7V9+OzvxQ/piU52z7eJvrZ14NhPgv47qa3XyWomjDGdfnZuu66V24ZWMakWE
         dNIps/LR8loLNXJ+fiKDdvgzIJBAoCCUpGZSBh4utjlAzp+FWH5AAClRom8wcj1qg2j6
         m6kZLO2egR3fXwUFpLxRlZvn/sH2RiZQpcvOZu8UgOVo7wI6+T8CkmweOsNyPAUNajlQ
         Nd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SBuYtg+wc+/8fAJ0XvEeFcz7NuxQGO1oTcu3WliGN2A=;
        b=yQ8UJvcygftayFd006esTJPn2EjbvWjOg7+0o3hl6VBs16e16NcACDixGiACr65DLj
         /kW6q6i0pfshxWWpkpRiX37o1QhPal4ydndTcI23s15hLhhhF0vhSlzj7BkYmh4SxsER
         M4D+QH/X5tFDDA8NPLzQwvAKnzEycYTCwmtnbcCSqP1Wruka7biiwpeO2DXnhCH8WOsb
         L+AzRltxk9SSNSVOWgBhe6b5ubuAq9Kdh+RxoSYhOoGUya3Q0ZDJrfUBfH9uRkXV9t7w
         PtZIMexdo+egJAPx4Dd3RGFRUgsjCCX1cbjuBNhJQ3WNd+dqznNm1ORf94ByF60KoflO
         W2Tw==
X-Gm-Message-State: AOAM533agXe8seZqb0zryYlixHKpPsdK6SNjDvALTu0BMwnOjaEvz9tl
        TtQd8D4bSska8ceCMn+RReUaTEGgA/qfw7DrKhY9RqF+ROQ=
X-Google-Smtp-Source: ABdhPJwA10J9zxPphXOei9WF47VzEir28/qPCjK4NCcMKlM819wuQ8JWYkMyBEREajk+QHyPVM+f1+PV9ZNnoIa1u1c=
X-Received: by 2002:a05:6402:5194:b0:409:97ec:3bdc with SMTP id
 q20-20020a056402519400b0040997ec3bdcmr9771402edd.314.1645209363475; Fri, 18
 Feb 2022 10:36:03 -0800 (PST)
MIME-Version: 1.0
References: <20220202123248.36955-1-joel@jms.id.au>
In-Reply-To: <20220202123248.36955-1-joel@jms.id.au>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Feb 2022 19:35:52 +0100
Message-ID: <CAMRc=MeaJ4M6WuvB1Shfa5=y72WpKPWe5YYx_mu6tc9d9byCCA@mail.gmail.com>
Subject: Re: [libgpiod PATCH] core: Fix gpiod_line_bulk_reset type
To:     Joel Stanley <joel@jms.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 2, 2022 at 1:33 PM Joel Stanley <joel@jms.id.au> wrote:
>
> bulk->lines is an array of pointers, so it doesn't matter which pointer
> type we specify to sizeof(). As it's a struct gpiod_line *, it would
> make sense to use that.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>
> Alternately, we could make this sizeof(*bulk->lines).
>
>  lib/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/core.c b/lib/core.c
> index 2e7ee4b5b896..6ef09baec0f5 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -117,7 +117,7 @@ GPIOD_API struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
>  GPIOD_API void gpiod_line_bulk_reset(struct gpiod_line_bulk *bulk)
>  {
>         bulk->num_lines = 0;
> -       memset(bulk->lines, 0, bulk->max_lines * sizeof(struct line *));
> +       memset(bulk->lines, 0, bulk->max_lines * sizeof(struct gpiod_line *));
>  }
>
>  GPIOD_API void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk)
> --
> 2.34.1
>

Applied, thanks!

Bart
