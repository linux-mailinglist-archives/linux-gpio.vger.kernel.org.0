Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9657D5FEB87
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 11:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiJNJ1q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 05:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiJNJ1p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 05:27:45 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03C9167EB
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 02:27:44 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id d187so4285773vsd.6
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cjnW4tf9c8x2Kot+4dsA36tSE1A+nkdrr9pQjeRPHo4=;
        b=e/8Eg6T4sL2d/8ZnDiMjNkRy01w2HUG9WQlOFFimobkyf+lC2UbteN4wD+9hgX5kqL
         YTFyWdsvdUE2puoNRHdJ7gsClx0sb46fqYhuZRG+zQHTIrkRGK6I72RPinw6QqXSiVTg
         2vZbnYUxvOyZxMlvQOTfgU9AfHuTdjGCiZ3+SkuXiNFPEe3WYNqFozCjMt7+70jIcQz/
         ogcbPTHZeq6TGS4OUwFpfW2VcXDYfdv1AcMDryMyK9EI+9haZfQZdr82q5hJD6ZRg+rb
         9rhsPWE0aTRRp7RF/jfDVKcYOqmHrbq066AnWQPTjer+YGaqWEUwmzKqrp6b5edWz4+v
         b/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjnW4tf9c8x2Kot+4dsA36tSE1A+nkdrr9pQjeRPHo4=;
        b=3M+xsxy8o2JbFH6TBaDxF96Rg33rTNq5tpebflxwcIPesrf0ottqB0WH57PuTiSD6A
         V8vWZUluOC5nY4f2RnMPgWnTXFBR/ifwToftrEUoZup47Y1G8AOW6DnSyV0SzPit3ENg
         5XC9gP32K80IeMndQm4ywCkaA/Oxcvo1X7jo9v0eyVxeNLzY6dlQUVnZo0n2dhkahhP8
         rfspWPHHKGW5N4x9RP9t07zNNlU4Vbw+7X4IC2jzigqq8SWL6CqxxHNHVAEkkrqHvzA5
         0qQQVUQ9G4x+JShVwdDzpfRqwuzAcCsleRbDv8FbAgVCnvwjkqwaaJM7ApSdMjyhDgEF
         u+kA==
X-Gm-Message-State: ACrzQf0SRMBDyUJmQadHyzwN+k59uBhMrxar3koHVXlqYWeofQkeFGRk
        tx6mId0f4kz8VaenV5fkH31TWn1FckDGQZogVSN8dA==
X-Google-Smtp-Source: AMsMyM6cJ+8YudU/hDCymz25EyARZ8r+Qou4Z3HxJ+UPdqodRApASZer9YjNLOs6CCe1LBlOtcI3yHLb/56Zzr4CEZw=
X-Received: by 2002:a67:cb07:0:b0:3a6:f64f:4627 with SMTP id
 b7-20020a67cb07000000b003a6f64f4627mr2269436vsl.47.1665739664146; Fri, 14 Oct
 2022 02:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221013001842.1893243-1-sashal@kernel.org> <20221013001842.1893243-21-sashal@kernel.org>
In-Reply-To: <20221013001842.1893243-21-sashal@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 14 Oct 2022 11:27:33 +0200
Message-ID: <CAMRc=MebwvKv28084YHihnNGYGTz9FEBcDA8EPmsgqoEif6fzg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.19 21/63] gpiolib: of: do not ignore requested
 index when applying quirks
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 13, 2022 at 2:19 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> [ Upstream commit 98c3c940ea5c3957056717e8b77a91c7d94536ad ]
>
> We should not ignore index passed into of_find_gpio() when handling
> quirks. While in practice this change will not have any effect, it
> will allow consolidate quirk handling.
>

Sasha,

This is not a fix, it's code refactoring. Definitely not stable material.

Bartosz
