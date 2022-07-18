Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73CE5577E95
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 11:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbiGRJ11 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 05:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233663AbiGRJ11 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 05:27:27 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32A319C11
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:27:25 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id ez10so20052590ejc.13
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+icv+IJ1TJ8/3xu2M4sP7/7AeCsZ4gFWLPwS5u9SNFg=;
        b=agRDU6yWNC6T3uQoKsXpznz1Nlk4E3NowXCVh5Op296iiyVx9blby60QuJ42Nh8nGJ
         23rlSGHxc2W2PI/uZQGe4hex0YLlie2DBijssE75xA67XCP59AOl0IWMf0JJse8KtbAn
         yjrwOUftMzLC4TAXDzV1JUNGEvxK7pZPPZp5F4UIO/MA2N6ugLyx+gdb1bbDCDVvOz9O
         n2FaZm4mUbuet201w1dpS00dzTpJLSqh6BbIngIAyrowzsCKOsU+pF2XucMpHq7wf9p0
         nVXMwkcMN7uzxLKEB34PGkDsRJX7uMnhIR4HBDUBzqgt4rswVc55NvgQGLF+0CY8I/9m
         yEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+icv+IJ1TJ8/3xu2M4sP7/7AeCsZ4gFWLPwS5u9SNFg=;
        b=7cZ+5V8qJ/WmRbV3XwYbYg4HsWI5V5ICsPhdRyxrrVHyOqtcAgVahTuGWJgdZt5mje
         XHaupSVDAfWxiw1s9DDoRV+GgILAJFG5yKysEbUjUGv4+qzba94LQduLWAmq0/rnQFnl
         WwW8VUZ12sCfHob+8OACPeWV4/iWO/0BSONigU0VBbLjZFUw0Z7dHa/2Q8eEDwOZMj2k
         guUSx5L7zd/UoKxplcB42jFvMoVRGm/vZ9bOM9xZYou6heFNsWPQ+F56xLB7v03H80vx
         PuvNSQPZoFqbqPPT4zpMIqZnI80567+NQE89FwZ4SVQu6U9y8SezxVWxfOiJI66H1ehR
         ljKQ==
X-Gm-Message-State: AJIora+U+MsBieSg4nJhf91DRIhPy+b1ODKWG2Vll70YLLXUKkqG5/dQ
        oFW/Gl+mC+M5Hnz+rXzdaZeYjud8ZoUtSslDcVJmIA==
X-Google-Smtp-Source: AGRyM1v9fKqHGAElZYf1oxl9ZazBcWXcPQYo3vM7TuEExHTjtodpQSuuSmWiB9RLuNbqmAQ/SAwEJa2Rnxa/BDvJ3cY=
X-Received: by 2002:a17:907:9612:b0:72e:56bd:2b9a with SMTP id
 gb18-20020a170907961200b0072e56bd2b9amr21685288ejc.526.1658136444582; Mon, 18
 Jul 2022 02:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220713013721.68879-1-warthog618@gmail.com> <20220713013721.68879-2-warthog618@gmail.com>
In-Reply-To: <20220713013721.68879-2-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:27:13 +0200
Message-ID: <CACRpkdaO9VWH4nsxseY9==wUVb6M+q+AVKEd951GJ_KGV_FJVA@mail.gmail.com>
Subject: Re: [PATCH 1/6] gpiolib: cdev: simplify linereq_free
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl, dipenp@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 13, 2022 at 3:37 AM Kent Gibson <warthog618@gmail.com> wrote:

> The edge detector is only ever started after the line desc has been
> determined, so move edge_detector_stop() inside the line desc check,
> and merge the two checked regions into one.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
