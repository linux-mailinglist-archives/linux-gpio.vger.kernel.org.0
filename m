Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086366026E7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 10:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiJRIaF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 04:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbiJRI3o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 04:29:44 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BF35FE9
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:29:27 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id fy4so30396559ejc.5
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8IByHaHtnVLqDqCobgtQW0YAS3jK6ArSiZSVSG022Ng=;
        b=kjLX0HvVbZn5XMaSukgq2uBmzJ9GGugFPSCWoBZQi1oEXTl54W5Vgp12I0Qm6zq5hi
         lgZiY/nKUp6q/c5iJWk6HCpy1t+YIleB7uGl12qdybg5F0R6BPLNZmWYwniIlyl800Ky
         WgVwAzcaEWCc4HCqKVrZYA0HKjf+1pxvz85PgwClmsA2kporgsRwnhz6Ab4hbGG/+wrG
         SO8E7GPg5ZsmUU6WQwQvm47v6le2N1VerB274Wn7THn5ZkCz6dNwe1TtZOYoMrDN9rrn
         VrwSqx+NJEca0+YZsJAwdiTkykTP6dem/xrUcx8bsEK3jZXnEZd5PWTFdJQgSkkJzPp/
         zy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IByHaHtnVLqDqCobgtQW0YAS3jK6ArSiZSVSG022Ng=;
        b=3hT9eWwEp79+JUlqVDKY939P5zu7yjGSwdzKEOW6vindU9AOCAmbvYsyU/gDwrp1fO
         26msYmo6kn2jLZmDguSS3jsKZ2ECzVX3s71hHtFeysOeOhSPFEfsQtbKDUqCH7xroQhT
         crBaLuEDehvhMcfeQhz0ofJ1HeV5tG9Z5Myxp1hiJ2TppVKFD7toy6RvuU2ylRqyg4Xl
         E35z0sY14WtQp3u8Qe/rG7lHk7vbjDLS/6Lx8SHs6Fp3shDCFx7u69AMDaMqkucFmoTm
         4lyZKHUd+chEWMpefYl5WU5Fl0Nox+b+tdS+4kmqygbKTW0XdjCSSZgysIcWfvPbSi0l
         KzpA==
X-Gm-Message-State: ACrzQf2QpBKlubtH+D16P0abf1FXS7BPo1dU6Zv4AG2o3FuaOzlUUN5m
        oH8UXt4knLKZ9sSUC7rbknssVUTtBxTsFkcEu+KAwg==
X-Google-Smtp-Source: AMsMyM7fG+F2r9yDirnal4Fn7D3BtLBivEvw4ZY1xlJvCIyKxCcfqNytkaA6t1nEGhqmDhOD9vtXqDw/V5KCXgpC2hE=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr1367406ejc.690.1666081764467; Tue, 18
 Oct 2022 01:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221017170600.88480-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221017170600.88480-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Oct 2022 10:29:13 +0200
Message-ID: <CACRpkdbNkPG5KsB47jByseDh=nOt+J2eE_nh5EJqRLAPDp8v8A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: exar: Allow IO port access
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Gray <william.gray@linaro.org>
Cc:     Qingtao Cao <qingtao.cao.au@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 7:05 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It's possible that PCI device can provide an IO port resource for
> the device. regmap MMIO currently uses MMIO by default. With an
> additional flag we enable support for IO port accesses.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks clever to me!
Acked-by: Linus Walleij <linus.walleij@linaro.org>
I would let William have a look at it as well, as he's worked extensively
with port-mapped I/O.

Yours,
Linus Walleij
