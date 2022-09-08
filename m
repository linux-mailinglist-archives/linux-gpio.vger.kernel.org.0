Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6D25B1D8B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 14:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbiIHMqA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 08:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbiIHMpm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 08:45:42 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986F55283F
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 05:45:40 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gh9so15867359ejc.8
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 05:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DagdkGgwofcQurfY/oyoSLL8TcjsetOya7w6PT/SbE4=;
        b=MzSOAiaTHDehvcg2VS85/lF6JzmFEboY16cjI2o/4s3gyYIhTZWm61Pk6oxHcRcZCF
         XtwZ3bFIjug/tRqX/BfXhbbjLePx0JdOkjV5XSYyjQ47lMovO4L1Mr9KdR4LQxNXxic2
         0RMC/EC32luZL2NtXROmJfdA4W/a5pta/b3TcXJlMizZevHyBOTvJ2yokffqdCJ7GF33
         CbUP9Akt0eqSghmqbUV7Lpz7ybvi8EI0FXGe0xhBREcMLKNWMa8tlnK8o68/PO9Wx1Ax
         bK1SWlyaUNJRR37oOT8JuVksIxlTs/2EKa1k0yfRETEic9p73AO5FnnXexCB755gooFT
         ZNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DagdkGgwofcQurfY/oyoSLL8TcjsetOya7w6PT/SbE4=;
        b=IATr5lff39cMZnVCdLQQL/2u3yVUZBWT753qltPBKIq6rfw2G8XcedLMMsQ6+x+r3e
         B9zPSsGhEOIrEpSgIZ6ETzfEE8PvGVwRWu9X1Gyv/FmykcWyWyIzYKQ98p7GbhKN3mX4
         6dmiVAy0hUbi6EjwatHMvyDSY+DfPIRRx/Bx9wKGKFqLeOw30NAgvm/KQIwDIwRAFwLg
         bjRlYJ9xeNqHvCEjGxOg2yORaU/jk+dJMDVI/5VcljUNuPJr509AKsX9cTJ+S1pZuAZw
         mjXMZR7ys431s3RkIn5q5WundlPSgHNk+XNciyCRGd0vf+lBMCgrOriXQkU1pqdkAjVw
         skQQ==
X-Gm-Message-State: ACgBeo3v2xRnuftHZTJ/KOUtc8ey27L85KsC3ROTwcPVyY7MvZr6iLxS
        8f5JqnFWbfJ3HgXrXc7aEEBbGRHGRJGI1zZd9u+fTw==
X-Google-Smtp-Source: AA6agR5J2k6FOxbxd3dYWzdKv22WlViwHevJxlJ+++nc5B9SzV1he7qwEe80kqFmU+D3ju05H9mEZ9bITtJ4T2XdQJY=
X-Received: by 2002:a17:906:cc5a:b0:741:5240:d91a with SMTP id
 mm26-20020a170906cc5a00b007415240d91amr6033974ejb.500.1662641139016; Thu, 08
 Sep 2022 05:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220908053949.3564796-1-dmitry.torokhov@gmail.com> <20220908053949.3564796-4-dmitry.torokhov@gmail.com>
In-Reply-To: <20220908053949.3564796-4-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 14:45:28 +0200
Message-ID: <CACRpkdYUi0vUSS4Y+7qP9cmwFFbfWMYOgyCf5PPKWXnza2R6zg@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpiolib: of: factor out conversion from OF flags
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 8, 2022 at 7:40 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> There are several places where we need to convert from OF flags to
> "normal" GPIO_* flags, so let's introduce a helper and use it.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
