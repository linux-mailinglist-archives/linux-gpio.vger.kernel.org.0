Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2162C55EDB2
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 21:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbiF1TP0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 15:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238140AbiF1TO5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 15:14:57 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BEF12A8E
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 12:14:22 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-31772f8495fso127184827b3.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 12:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dCJiF+i7oMhpixuqeUOxmAbN9dCp+ZiC9T91x1P0jyg=;
        b=UcmpfdCIUL+XnaGR54E3gx4tBqUBIm/hd+zsjyROR1SDXci05vt3l3oEev8SJxr9/M
         0z4au7nbXLdvlML+BZWnERMOzbKATZT9ZHV49JjdISfV34hBch5w0jvRIwvW6RMg/Wrv
         p+th/YwxmVp38iFj03DGUsyVhQ+YblrQDo//VKJXiXKkDwR6Y7fdmOf6Q1lcvso3hrDa
         cqVqyvu9tgWy3clj31fD9mvcwA266rILzPOWhNH3Jz0IcvGXFqFOQNGzsYfMW5GsXwf1
         bOs/dBJgS5FRm2gf36d+mEWXCb4dksPGpSPjMWSZRomqR2YgthNXk4Imsc6JpGiKAZfZ
         a5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dCJiF+i7oMhpixuqeUOxmAbN9dCp+ZiC9T91x1P0jyg=;
        b=YL8SwJnmq+UVxP5pA1pwhzyF12GRRLLhvoF9MrOVP7GUZkqJNMD1P2puK/UXN0+YWG
         jLGBNUMWENIx4ZnJSGAdx0IYT+wUxt3WXjef+eyXxEdRZoefFIk2w/bn8289uHypSrWX
         nn/53txFD5mNdGMWMnBTYZz6CvSSBkmEtAEIuYhgIm9xyIskAHlDTuEvBAxETttqyUxa
         uUvtZl3ftthlW10svJbsDes4f+fWu7Aw+Albg0313lsYq8hmKa0xgr0lmtjr/x0+1GLQ
         eP01xASJ0IDUCG2EOT4xLn9DAZRzCYAwUEV2WhLi7/6G116pm3TUXcxHknS2QDTu/AKE
         fmhg==
X-Gm-Message-State: AJIora/UJdBUes1qLyKOP3Tz+HsIdMLFtnGdFhmy7Ch5YbElPvtm5PBV
        LP1UQm+WtVHTYwiURdTN1EU5lGQq6vXmI9hmX1EdrgPyHEiRVw==
X-Google-Smtp-Source: AGRyM1vWYEijEnjqC/4dMlrfMC7czMUTBuMKr7YxWeGSu1wm6YPLQpQqnp6eFSFCCsFQVDkrt7hnyqkUdCqlt4ElNvY=
X-Received: by 2002:a81:468b:0:b0:318:4cac:6576 with SMTP id
 t133-20020a81468b000000b003184cac6576mr22597597ywa.277.1656443662151; Tue, 28
 Jun 2022 12:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1656426829-1008-3-git-send-email-shubhrajyoti.datta@xilinx.com>
In-Reply-To: <1656426829-1008-3-git-send-email-shubhrajyoti.datta@xilinx.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 28 Jun 2022 21:13:44 +0200
Message-ID: <CAHp75Ve5f+fO29=FwGC=LxYsYj=sKRrW6LYav3gx0yK7rx-uXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add support for SLG7XL45106 I2C GPO expander
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, git@amd.com,
        git <git@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 4:35 PM Shubhrajyoti Datta
<shubhrajyoti.datta@xilinx.com> wrote:
>
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>
> Dialog semiconductors SLG7XL45106 is an 8-bit I2C GPO expander.
> The output port is controlled by a data byte with register
> address.

1/ Have you checked if there is a driver that sounds very similar to
this already upstream?
2/ Have you tried to use gpio-regmap? Why can it not be used?

...

> +struct slg7xl45106 {
> +       struct gpio_chip chip;

> +       struct mutex lock;      /* To protect writes */

If you switch to regmap I believe this entire struct will be gone completely.

> +};

-- 
With Best Regards,
Andy Shevchenko
