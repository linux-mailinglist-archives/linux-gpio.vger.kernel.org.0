Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0D6E5BC389
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 09:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbiISHgn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 03:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiISHgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 03:36:43 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2759A17E34
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 00:36:41 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r18so62454879eja.11
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 00:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LJdpyyNzLvr7q0tv893y8yCUamy2mFkSZIFkDptOKRs=;
        b=WxX1SLlG7RySGDUrJgpIvCZZPOssO0ZtizKfWPWRs+5lQjNpAmzhQqphs3N3pqHbYK
         7nfow4jfMKFVe3+BuHiyCKqnxEM5j+VZ8HfUiJrI7UqTFYXzzQS4rLeZnHCpWHW5ese/
         HcUo1WqcEx6SPwPqDNGF+wrKxjuXjkk/VyqZrmr2vFz6eYhL2RFVhJEug66zgqLKbpal
         Evs5NTiPeIGUYmGth3G4ZMFUcyreG8fLCFs9yxnxyMfumpQRuIbPCz9YRuMkD1iftHIO
         CY+Lw97wGCPjzTvP8GSeNkNnB9o8htmtUfNbkUBJGQ8GBqaGMrlCd1b0bKVWsnru7THL
         jaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LJdpyyNzLvr7q0tv893y8yCUamy2mFkSZIFkDptOKRs=;
        b=ILu8FqXl3kyGcZH1bkCRQGh4j2aQi4ytErlbROP+ElS3n6HbLU7AGGfkTZWPzwcZaD
         4tABlpDh6fCBk7FAcF0oF44mJ8rGKqsAERSUg9wQ0ZGwpUBTHK5NZZnVU7BlQvWmwMEM
         fhnfTy8t62UKy76rpqSfs0Ho7A8NCu7s9QuHNn8GVO7eJGDDGJaiiJ0Qv6rZfQM4S52s
         Mu+48xV4AhuZNk5N87jISKixZWA1ppB3oJCD8yTlhWZerda+PND3/o1I41TFohTj1qLX
         SBi5nirNQxCmmIXrCVSL84/14/2cYcD8nkyvzSmk2UX05tAT5rg2TKxk1HDS1tcENEbX
         uIWA==
X-Gm-Message-State: ACrzQf1mOHIz5bCRAAK+JU3wEsavqe7nr6AK3BGkAu/lTpqRyJ0XL218
        4l9nxkKFGm0QicsTCSNH3e9MlSxQVisgVnXC5Ugic1RPNpM=
X-Google-Smtp-Source: AMsMyM6z2r0A0G+YdJLW3c67eEpmz7sjf/h+lw90SncbokiYqAFsrj/PbvoVlJmRC5aTissCILOP6IQch32RwI/lzpM=
X-Received: by 2002:a17:907:7e94:b0:77a:c48b:c80 with SMTP id
 qb20-20020a1709077e9400b0077ac48b0c80mr11281824ejc.690.1663572999689; Mon, 19
 Sep 2022 00:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220919065435.27747-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220919065435.27747-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Sep 2022 09:36:28 +0200
Message-ID: <CACRpkdbGAJ1Zcwvit1mau-mCLvCZyMhT47MVnm4nhGzVv7DMDw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: remove dead code after DB8540 pinctrl removal
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 19, 2022 at 8:55 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit b6d09f780761 ("pinctrl: nomadik: Drop U8540/9540 support") removes
> the DB8540 pin controller driver and its config PINCTRL_DB8540.
>
> There is some code left-over in the generic nomadik pinctrl driver, i.e.,
> drivers/pinctrl/nomadik/pinctrl-nomadik.{ch}, that is still around for the
> removed DB8540 pin controller driver.
>
> Remove this remaining dead code.
>
> This issue was discovered with ./scripts/checkkconfigsymbols.py.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Nice cleanup, patch applied!

Yours,
Linus Walleij
