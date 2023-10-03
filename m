Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0467B7372
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 23:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbjJCVj5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 17:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbjJCVj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 17:39:57 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD332A6
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 14:39:54 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59e77e4f707so18076627b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 14:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696369194; x=1696973994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkjSMGI08BUEZqbYCt/0/k2U8kkzN9nX03c/hR47kbY=;
        b=be8rYlhAn51kLN3thlSSL7w+HnHGTsxOaBsSI39kKtLy9CEn4t5HsKLDoL+KA5Vy+S
         jPjQfiKvOU15Esf7KTLQRh/gzpkZv5e+zBmqPdr7mnG9MDSjM/JbNJy6C2W0tn1/8p7Q
         k7sSLH2yr3pzW5un/bDrWQ7qu5wdwDCStuVpYmY/qqMrzW+dvPRozhAVldwwG+3Bp4Iv
         C+dd7K7nsyP9loZi3bpX8sA7esHj+5I8rzE8Kdl47YyRh0aWLGbnMg6N2RMIi2M0HDRa
         Zt0WO6Bw5ZytUuLj19mIbZsdd879tiZ1nTIFIr6u2KJPn+f6WbJ0fkENMWzFxbQa1UIF
         PkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696369194; x=1696973994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkjSMGI08BUEZqbYCt/0/k2U8kkzN9nX03c/hR47kbY=;
        b=q+WtKDwP6yufclKmJbIJBNo9ND3SpO/7UbyQ6s4swFUVfBsGC+0FPty3Du0ATxjWrL
         +X7egXCr7QBEeklzuRet16JVX0vmx030uPoKoZJLT0Cq8JwzS8pZgoWzVIMCJO16M4Z0
         N+iix4Z6dikEUVjGE3nFfQkTyY8vsUhaG7NjYiFpzHPCw2PpDqLCO6t/YXwcDutUIyjG
         2PHsUEfBEvucdlXVdiI16qt2Pf3rHdhp/L6M3HZF0cXPDtAe/ep7wFreS9aUikG8Z0cP
         BK6VWyGeWiiElwDNi/mYjzMNIjcbkuuHS9VKo8/4aIPfROAz+MFcF3r9l/FuYVEGTRp0
         YMAg==
X-Gm-Message-State: AOJu0Yy9RR3xo8jEZsA1ZP9A7oRtv393AAAQxsgKrwalHnZHjUajxTgX
        6/L4Bsxv99ec4CwU2QwG1C9sXxelV+T1si8OnLQy4g==
X-Google-Smtp-Source: AGHT+IHqAVaLO48AqCMkb0AjQp6j/V3JludUlVQMLk0WgqSkYVEpuXE31cZ+mfo1dRdT4U0PfilSjcftpCzeGCuqel8=
X-Received: by 2002:a0d:dec7:0:b0:59e:9a44:9db9 with SMTP id
 h190-20020a0ddec7000000b0059e9a449db9mr768129ywe.26.1696369193890; Tue, 03
 Oct 2023 14:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145114.21637-1-brgl@bgdev.pl> <20231003145114.21637-2-brgl@bgdev.pl>
In-Reply-To: <20231003145114.21637-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Oct 2023 23:39:42 +0200
Message-ID: <CACRpkdYe_9_SwZtupbicyj0+d=ns5TgLgPhdB+E_wZVSo-TAsA@mail.gmail.com>
Subject: Re: [PATCH 01/36] pinctrl: remove unneeded extern specifiers from consumer.h
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 3, 2023 at 4:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The 'extern' specifiers are not needed for function declarations. Remove
> all of them from the pinctrl/consumer.h header.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
