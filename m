Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8037743B23
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbjF3Lvb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjF3Lva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:51:30 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4945DEE
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:51:29 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-bd77424c886so1739943276.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688125888; x=1690717888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XNK+dKeTAZKDPl3/snsEh3yGnhUwDk+DSAz9PIndMk=;
        b=yFKA/De05Qv0WpNcXF7ncMLlWV4rDz1AgTFdqwTQt6WILVsPI95de/SvK4MvoBbb/z
         ctwgg6t6i7PiBHXsfPO1coldFcvAnWtFdm+Us9arqDfYmD9dvGbxUPaj3FDMq/Jo4xxU
         ht9zgpZDXUTLpOUkL2VXK7UQJvpOM2qZItwoP/Eq4d1DmNnq5QkLmBs6+pYIEveH0qCI
         f1F0dUtfYVWYGsBaHElNgHQs551Jx9F7l+1uMkrv5jQerW0zLoXh0DPWEtblY5sjWa39
         b8gvpGZ33eaB+yZgOPVkZZrKDKP/xBOghG61Frf3Dre6+37YTYaSrp9naUwLZMoGU4fb
         8tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688125888; x=1690717888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XNK+dKeTAZKDPl3/snsEh3yGnhUwDk+DSAz9PIndMk=;
        b=DCo/RuirRBfm2MpMfGkFMtjxoKioXkHiEyAX6fBcFE23B5EVqY3kINLlrYcAlAV7K7
         CQq/J/fehIhBdTo08U8qc+Ae8F88iNgwOT6SZrEuxRc3qWwy4xnDDITICd9g8qpbvGB8
         W9GhkkHaJbXbUxyEbC4wd/cx0kzusNBWxE+tewPPaTNqEEEXua9uAfhYZ8/v/cvrnhMJ
         nYk1MsXSzbnSQQi6xtA5rJ1DCyzxXW1JI3dvkOWD/V4LAZoO76kGb/EAM8zYslZPnfWX
         nGpHwhaL3iC23K+JLYWOIyYvlJmnR5yDYQRKoKkjLCNI9XzkpyNjoQzdTsmH3g191SUs
         obEQ==
X-Gm-Message-State: ABy/qLY7UGoBm6kXWzhRg7frTgpC7gqCS9+Bxc3Gkus7I62jO2WNzbPX
        rVieLBxSBZ/v/f98YzQqdJfQVAV5x0YfCp+B3GHjfA==
X-Google-Smtp-Source: APBJJlFvjH7krzx+EDcfZctYU/w7i2AhV3XC0cABrjpgQiyYpHMU5mjSsBpofTBEev181OJKmBWdfJAzyjmiNBYAwyo=
X-Received: by 2002:a25:a249:0:b0:c11:d5a9:d260 with SMTP id
 b67-20020a25a249000000b00c11d5a9d260mr2264891ybi.49.1688125888512; Fri, 30
 Jun 2023 04:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230621174943.30302-1-andriy.shevchenko@linux.intel.com> <20230621174943.30302-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230621174943.30302-4-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jun 2023 13:51:17 +0200
Message-ID: <CACRpkdZSi47q9jXxN=9Z00WnzN_iDrBQVfOGXGbcE=u=CrVPZA@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpiolib: Split out gpiochip_irqchip_add_allocated_domain()
 helper
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 21, 2023 at 7:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The gpiochip_irqchip_add_allocated_domain() can be used
> in another place in the code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
