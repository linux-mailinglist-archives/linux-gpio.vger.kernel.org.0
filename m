Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECC455701C7
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 14:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbiGKML1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 08:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbiGKMLW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 08:11:22 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D114C612
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 05:11:19 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3137316bb69so46334227b3.10
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BgDGubWi1cWBp+dpCoifPHQpsWok1yMug5l0DJZVuMg=;
        b=AWq/y1cZ7co9w9SottxwtSovYU5UA4yE9vShFw9Aet+krKVobiZAv9X5J+oVmTSrHI
         GrZcs6fcKtztVPpPSCdLrUJlGDNK/WDGcCFaGlz5aAD4/0viCB3PQUk1bT9w+l7io1Cr
         vH10KFlKsLonFZPuF6YFCjVzJZpyNGyEcOAFogiSWPZMrUPvDPFodR+I+kfhwQjR9nOX
         cvlrGN/D7i5qhPvtR0MAwp7zlbg1uvpOsXxbWCeY2v6lj5wqQPOlx+NKi41Ka36+Oawq
         T5Bylo3L6tiF00TQ/QsFtjqm3iYUAiM/weSVBwT3xB8OhGUOB9qdinHiZVEUGTay6cK5
         wQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BgDGubWi1cWBp+dpCoifPHQpsWok1yMug5l0DJZVuMg=;
        b=HotKG1FWhkUL9O4UGPP5VqDK7/89pzi+a7RffU72/E/7ZZofTJ6RJeZgKGaObQxC8J
         w+UBF8aZM5W1eu/oud/N6m9BHjRcd38plv9nWW2p2XnXeifOq6pMAFaD80Qs0qw4ccSr
         r6+LHexNEAdvz7YloGQL7JEbFa78RCyEUGlglPW1Lobnc5yk04tmcHuKaI46oCTd2VRK
         TYHoVe4sxTFdZndYoS09dBdkAx2jFe7O9LVVMYcbriUSTcifihvhSN+m1TY/d0XbeFEX
         klre4WeyTAsy0lzKnd05tRUQTi767YXCyFEA1oJ5sMoKmoiCi9hQySXN2uGKkV41pRcD
         1GIA==
X-Gm-Message-State: AJIora+0c2OrGzZkUT36ayO3l5wzfrnaBGt6Ojc/lTCQKx9NgNxQE5mC
        fL/1Y+9eMfZJO9fiNp58nYzDZD+RjlctFK9Fp5KAMQ==
X-Google-Smtp-Source: AGRyM1vp7xgLdsfGLBD68lbN205z6Q99ouqJKCW7hfi4Kij6p7GkfVGe9T6RGOkygbujMUZyE90hQxj/6M3slj2XDC8=
X-Received: by 2002:a81:cc4:0:b0:31c:839c:7e27 with SMTP id
 187-20020a810cc4000000b0031c839c7e27mr19420047ywm.151.1657541478797; Mon, 11
 Jul 2022 05:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220704091313.277567-1-windhl@126.com> <CACRpkdZWEC2jtCk0Xjcq9HOWAbSQvqU7EQiwhbg2bJCVjy+WbQ@mail.gmail.com>
 <7f16a40d.774f.181d3aa58e5.Coremail.windhl@126.com>
In-Reply-To: <7f16a40d.774f.181d3aa58e5.Coremail.windhl@126.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 14:11:07 +0200
Message-ID: <CACRpkdaJ78kmTNqnP729R=iUhwORnK74jptRN94XOnHP5kEZSg@mail.gmail.com>
Subject: Re: Re: [PATCH] gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
To:     Liang He <windhl@126.com>
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 6, 2022 at 3:19 PM Liang He <windhl@126.com> wrote:

> At 2022-07-06 20:47:08, "Linus Walleij" <linus.walleij@linaro.org> wrote:
> Second, while I would like very much to make a bigger change, it will need
> days for me to learn the whole semantic of the source code as now I only have learned
> the semantic of OF APIs and can only make a small step to decide if there is a refcount bug.
>
> But now, should I re-post this patch with the above commit log you suggested or do more
> things after I can?

Sure no problem, just post it!

Yours,
Linus Walleij
