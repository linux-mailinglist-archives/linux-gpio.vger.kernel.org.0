Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6363F74D189
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jul 2023 11:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbjGJJdM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jul 2023 05:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbjGJJc2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jul 2023 05:32:28 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720D1B1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jul 2023 02:31:02 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7943be26e84so1292010241.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jul 2023 02:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688981461; x=1691573461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Xi+JZ3d5l4IyEvep5re0u/IjNg3c0U7NsZlfAOTxmg=;
        b=bLNvqPCgiD+AaOE7k+wYF5DCm001b5gOP8FAp7urBI6j0ppB/EKV1e2qksEGI/+wnj
         grmQQ5XFRTWeYRCRjgjrI7NPrzStNJ2gLhWtD7UPOFJV8vJCCDZmhXKulx6v6b1BZbzb
         F7KKFcZL1qpeveqJ7f+l/k8otjqtR33sC/HWVI48tnRSGSDjDS3xjZ094HTcCTLBA/Y1
         4poeBTHnNBBpR3xyTxrzsERHFsTTgFAkb74if0d18A95A9V6a2EJBziUCRe00JTLW5hW
         hAtQjQ6qjKRZAlxHMdpGKn+i22a97SY8+PUgeameKVxGqkk2otzOjEGkurUQlTirP57x
         QgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688981461; x=1691573461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xi+JZ3d5l4IyEvep5re0u/IjNg3c0U7NsZlfAOTxmg=;
        b=L5Z1AfxUl4FhunOGcCzTY+wCP5D8tZcgq9M6t1oc6Tes5jXBE1H38fOTjQXvQ0Cwnf
         ITwU364aKoAPCyPEu4ZlEVGW3MXzf0Zvue46fqbR7ckCoBLK0Vw64wCId+pJYOlYK4Zo
         B8RlHq1kXI50SSl0qo1iEun31qfaydYpQjzYTdopobcMGvZM+Mr0SnrXVYQho0ekInmB
         5brgzZZqeJgQuYYhx3VqtZm0Wb9eKmUfIcYVxwqOJtQ2+artzONHpC8nQ+cTVIdVMloO
         E5qpsj9IxJo7wj0psU1iW8TdS8Kfzz9P8ZRQUOMYHQUm+gKQXsSK9Xt0uT/qO6ATbC+5
         7qqw==
X-Gm-Message-State: ABy/qLaspQbrNzq5gDGnGMy4d7Ssai/IXMTUSpxuIkO3+JhD1CcmzFNW
        iTH7YNgOyF7h2Kjsa3VKUyUKnb5IFNoEVfaq2qX1jQ==
X-Google-Smtp-Source: APBJJlGzzrta8ZukC3rtGrcPpxn8GyAC1LXWMGc2b2OT2L1BDY3rq0Al0FGfLPnv+V1vtGDwWXXg5B0It+rDBMr6Bd0=
X-Received: by 2002:a67:f596:0:b0:443:7a85:8fbd with SMTP id
 i22-20020a67f596000000b004437a858fbdmr3588883vso.32.1688981461067; Mon, 10
 Jul 2023 02:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230621174943.30302-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230621174943.30302-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Jul 2023 11:30:50 +0200
Message-ID: <CAMRc=Mc6Zib-fssXOtnnMU2VkM8HjBQ1kiTtBhKmh0moQBSA+Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] gpiolib: Make gpiochip_hierarchy_add_domain()
 return domain
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 21, 2023 at 7:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> As a preparatory patch and for the sake of consistency, make
> gpiochip_hierarchy_add_domain() return IRQ domain. While at it,
> rename it to gpiochip_hierarchy_create_domain() to show
> the change.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Series applied, thanks!

Bart
