Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6567072DAC4
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 09:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239067AbjFMH2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 03:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238466AbjFMH2W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 03:28:22 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3041AA
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 00:28:20 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b3d0b33dc2so11874165ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 00:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686641300; x=1689233300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63cY5MDBfCbni6DuTdn4QhZJnacgMIioy7UNS1wcIP8=;
        b=YVhI1gDbZL6Y+eRMPzJ698flP6Sk5/Lx1uaHohQBg4nZx5ID9VWNevPkA0d7tkdBF3
         rN6nSh1a9jvOFAd6np4rujhEF5OR4VhlIxWgHjRQ4UzZ9hA61t9ecw9QbzR866kFqVTm
         oCJncyOenKkBav13q6DME1WHafO5221n+RE4/cQS7vSCxQS/HTGeZ8mEc4VCa6yiEHtJ
         2VVMqrYn9OwrnKj1eYgjy/10EScTsCaH/cARPA74BjuhLp7dRM9Jc4t3yen0Cb42rsCF
         ZFMXN8nzRMoYdAj+tr99iYCB+blzOryYdx1KxhSlTed1fDlsLvn3IZOoyxlZjHR0jyna
         tI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641300; x=1689233300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63cY5MDBfCbni6DuTdn4QhZJnacgMIioy7UNS1wcIP8=;
        b=LdpFpLCKCTtIcgjaB38bhrDGdA25WgESmmZjH7CKhwpJtNjH9aWLUYTdvEdIApKO08
         WgR/YmdfiRiZvnZpgItIfXJ5r2yOk84sQeFN0ZUUJfV8X9LW5wmiy7XgRKSUerAaEF0U
         nFxy+im8f7wSNE5JTgfYMi0Q12bTYt9/wmzCeLLDeFTacdOBcVx+8ouM05YRol1bRqrv
         EtZf/dBuxl8S2CkjJHNnFmnpxkz9EQuaRZtvh15uz7XNCOzasf0QKYIQ5ovIulWkVYcj
         8vSSivIHKFk8mPQyMkM6+p5fmH2tcWYCAemRCT7Qk5/M8JB8Qz7cxIlqn+u2oRNulK/2
         51DA==
X-Gm-Message-State: AC+VfDxdaCtgKLNh6oZEnvadFS0ihFQG7QOUd03L5m4+v4PtyUdlibYu
        CEBCpur/axEN2o4rz2WZ8u3D3cMGe++Nklik2rs=
X-Google-Smtp-Source: ACHHUZ4jFrM4ndLypvcTqSK15a0crpX2RA4h5zaR/wTsPvZLAk8UywwpIOyuPz8np+RxpQe2W4RV+g==
X-Received: by 2002:a17:902:b687:b0:1b1:95bc:a534 with SMTP id c7-20020a170902b68700b001b195bca534mr7230106pls.49.1686641300341;
        Tue, 13 Jun 2023 00:28:20 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902b58300b001b1920cffdasm9392743pls.204.2023.06.13.00.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 00:28:19 -0700 (PDT)
Date:   Tue, 13 Jun 2023 12:58:17 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Erik Schilling <erik.schilling@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: rust: add missing license and
 copyright boilerplate
Message-ID: <20230613072817.s4zcdkvtkqownkvu@vireshk-i7>
References: <20230613072643.105576-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613072643.105576-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13-06-23, 09:26, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Make reuse happy again by adding appropriate license and copyright info.
> 
> Fixes: 1f8085953086 ("bindings: rust: build against pkg-config info")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/libgpiod-sys/wrapper.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgpiod-sys/wrapper.h
> index 8a8bd41..e5cdfa0 100644
> --- a/bindings/rust/libgpiod-sys/wrapper.h
> +++ b/bindings/rust/libgpiod-sys/wrapper.h
> @@ -1 +1,5 @@
> +// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
> +// SPDX-FileCopyrightText: 2023 Linaro Ltd.
> +// SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linaro.org>
> +
>  #include <gpiod.h>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
