Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 579A567B11A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 12:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbjAYLYR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 06:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235273AbjAYLYA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 06:24:00 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69419EC6
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:23:46 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id jr19so14374021qtb.7
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9frWsFFsrjAwL+/IG49FscE/wzSYg9GSLtcUyfXfbSI=;
        b=PU5WzNnFvtEI3qXO3hrTGkppbAexrgT7/N2pebgUlUQgONuJEK3xCSH18YqpBVA1UG
         fy+oo1pExjfFIfPeI57U/p3xJbk64rlZZIXnJn8H93qIEh5mL/ybiaeXt2dNtAymWQv7
         ackG4NM1yE5XYsfZCy4KTYLytwdQDjTl8agflQCNpzP8z7++gvOGeaGiZVB5yoUxPsWk
         sfHAlnFDIJVvDyMk+G78XKG02GtdWxdf1GusMZq9R2J1YV+mianEERPR8M0cc/9BYrTT
         iwXRPG9D8wnwAQG8ANiJnBzOeUlPaFpCWLWl+0Yx4tLYv/3uULen3DKaVfSbzYvbOVF9
         WNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9frWsFFsrjAwL+/IG49FscE/wzSYg9GSLtcUyfXfbSI=;
        b=STxw26v4WuetWfIYA38aTaxE52MgZJQM+63h9uWEP5+/9heYNFoqCPA5SSUHWqNbzN
         p0HwYy3/NSv1zatDDHsmVMdbm2Zv0tYq4CjagakuOrqkB+JrHga9+LIsiQMmKKgzO7yg
         rJBf58LnWkZQ/t8EQw92ciOn+ij5y+D2Ph8oBosF/uUzyzHRYLJBP14Ygk7RMsH3/6ph
         Wkc4lKY9vWwEmlVQAuz/xa+HX+RNK/3fnWBdxP+wqWwVjNyD1LciWx3U+oeYTIvrle9K
         tF0UHZnZyRdUmZzumntb0yQu+lmr2UCl89A4N9Kn4uHZgEI/EWkX03VHM71RRlpNTsXu
         skQw==
X-Gm-Message-State: AFqh2kr/7ZgFaD09/FpDj0S0z/GmhLOhRzJk9cvfV5RDM/muE5jyXPj0
        E89uoUFodc8ZXTOVxx9wuhRse5N33nG8t8NUXKA=
X-Google-Smtp-Source: AMrXdXvdq7jEVF3YJXkkcFE1EdG/rY2IsbHpApHYrXLQiSbLYUVAnsj9lPnBRCnVmgT4cxC34fFFYbTu39t2ALPZzHA=
X-Received: by 2002:a05:622a:4209:b0:3b1:328c:ff11 with SMTP id
 cp9-20020a05622a420900b003b1328cff11mr837004qtb.195.1674645825750; Wed, 25
 Jan 2023 03:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20230125110547.18093-1-hdegoede@redhat.com> <20230125110547.18093-2-hdegoede@redhat.com>
In-Reply-To: <20230125110547.18093-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 25 Jan 2023 13:23:09 +0200
Message-ID: <CAHp75Vd22k70oiQ4ygmYrGiC_cdb6NrqtHzV+q2j=Yu3VXj00g@mail.gmail.com>
Subject: Re: [PATCH v2 resend 1/2] gpio: tps68470: Fix tps68470_gpio_get()
 reading from the wrong register
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2023 at 1:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
> so that the actual value of the pin is read, rather than the value the pin
> would output when put in output mode.

It really depends. I think it's a wrong perception and brings nothing
to software. If we output, we know what we program, so reading back
returns us what we _assume_ should be on the pin under normal
circumstances. The difference is OD/OS/OE/OC cases where we output
only one possible value.

> Fixes: 275b13a65547 ("gpio: Add support for TPS68470 GPIOs")

Is it really fixing anything? Can we have more?

P.S. Before doing this, I would have a clarification in the
documentation. Sorry that I have had no time to respond to my series
regarding that. But it seems we have a strong disagreement in the
area.

-- 
With Best Regards,
Andy Shevchenko
