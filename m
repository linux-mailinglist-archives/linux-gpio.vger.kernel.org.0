Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF821743B29
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbjF3LwK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232862AbjF3LwA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:52:00 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400733AB1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:51:59 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5701eaf0d04so18034567b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688125918; x=1690717918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kxPMZoEb+z7y9xiddQ1zRKvH8TZFy8Uki9e/0Z3Fys=;
        b=rWV3TQA8uRadh+hGwmCGKrnAWcrxulnSBr4I7cgoMyxIqrcwmeaBSTiRf51qg6RfQT
         bEoBM1HulkxbBIPj0JLfCY57jVeIVAUXe5LM1DLR81IfnxYv1zk3DB6MG6soNvitNEEJ
         PsuT0X7p7S5WulHUdLiuxnx13PtM/+1vpxfLwb4sMcmLRlosbalUlKc5Ev/64bZNMta5
         THHcYSuAkwT46vNP8l5jkOB2f0LwvnlrnVtaxVeJVGZBPKPCn9fu4uDzQMzM7swDZ1Vd
         eQW524AW7As2oLup1b6UTKdX32QQFf2U93ciBWPjB7vzAwPHbs9JZh0tMweYyVcA/zJu
         unOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688125918; x=1690717918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kxPMZoEb+z7y9xiddQ1zRKvH8TZFy8Uki9e/0Z3Fys=;
        b=XGut1xfQ2kB8LsMLzz4N3NExcIJfahU7bkXtRFiEI0c7BK17IMebw5DWyKezE0zYLV
         moge1q44OkUF+Tc2+hHwfoHWp2ulxBThZYrj6Nsnsbh59SW+Kj9IOhIyn6tan67EwXEz
         E2RPSud1rtWOoK9mY2PNpDYR8vdeSDJLVQ1YzOpmYSmempHNtzFBq7GmI+CT7MWszJQO
         54FxKMZpNlWz8ticvENYpqzFV2+LcFpP3kE8Jd46L65rr8pQB6YADOUZEDOqS4dwa75I
         l7Z42xkH8YVoMj9bia039mCTirO2/Gf7/wXiefFK7Qu9t00Z1fl/L3FiHmF+CghEOoSF
         +7mg==
X-Gm-Message-State: ABy/qLYre/F09TUpF1M5/9+qTXgOgGEUapvpi0Xeemwj6Al1OXkScf1p
        zzD3xPp2KMLpP/Gu2l/8xlG5NgJgoHrLlo3+Q8IRvkHETIW6DS4fM44=
X-Google-Smtp-Source: APBJJlE76ldGEzRnOrLOgBjYmwgRtIZr3DBybBE8k4x/w+xHyhrLPHBqx3ONPQ5e7vEbf3Sd1Ln839+o2wRpXW/0ulY=
X-Received: by 2002:a25:ce8c:0:b0:c18:bbaa:754 with SMTP id
 x134-20020a25ce8c000000b00c18bbaa0754mr2301177ybe.51.1688125918415; Fri, 30
 Jun 2023 04:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230621174943.30302-1-andriy.shevchenko@linux.intel.com> <20230621174943.30302-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230621174943.30302-5-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jun 2023 13:51:47 +0200
Message-ID: <CACRpkdbOoDKZRF+8cys6FAf4Yy=v7UokPAmUp9mSkVnbqsH2tw@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] gpiolib: Replace open coded gpiochip_irqchip_add_allocated_domain()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 21, 2023 at 7:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Replace open coded variant of gpiochip_irqchip_add_allocated_domain()
> in gpiochip_add_irqchip().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

and this concludes patches 4,5 very nicely as well.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
