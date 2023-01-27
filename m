Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF27767E6D2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234409AbjA0Neo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:34:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbjA0Nen (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:34:43 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9944F367DE
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:34:42 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-506609635cbso67024917b3.4
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7esqlfGYWzJ6Y0OJydSA+tLwFcU/wE5gsqCLySvP+FI=;
        b=i57taSKI0KV9DD633Xsgalq3yZIYCbjUnOEqRNTxRaG3ZkW3eAINc+I03tOTV6BQ2Y
         FHs2eZEaC2sTf87rY8ZVFOzNa+taUhkzWD7aWEgCrwK3sLRoJc0Cw5ErliVLqZwBatn7
         tP1rVVq6OgfCIwzk4sVt3rt5j3bhd41nDzzl2G+LIll+x8miozQFAqxy09mA0h0MLvqV
         PqJcH2tHWwaPEgKjMXiles+k3XwjBCIGg+WBVuTzmm+k3O3jhdrl1gXab70Y2V1dQY+Y
         iNMBGZBLVRmcDH1pW2a9YppIkGrPkaCnrDDOTVO9WdpjTdbiijCzj67RtLs0SewmVeZk
         gD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7esqlfGYWzJ6Y0OJydSA+tLwFcU/wE5gsqCLySvP+FI=;
        b=oxpRUWuyDTCUbP0Ukf+ucrKRBoC2jQFBG1qCa05+D3tK19GiV2jdm8V1Wl0+x1az2W
         z/sqE/GIPQfWyUeNOXIP26BE5/Z3xnJLRodHDxyywuxFgl5JFZSSN+Y+ucS7OWE4U8d+
         tQKX3jIzzQCN9KDGyU+4O+PyZzVi+Q/85qQ58fjZP7YWlmMnD+q1yah01n7m+9jA4dQ+
         4F7M0aZORSnH+X5Zcj99Ix0fh4qMqxGRDF0LLyCnTBkw2eoezJ8ReSEZlqYWWOxgq6AT
         2XXio3W7vXGScErkOVlGiTo7pZysL+evPFZdPf3Xkwx1l+XYAXk3SBPv8nYFeyG0i4Bt
         56Xg==
X-Gm-Message-State: AO0yUKV5l41cy8eg0qQULO14gR4OSOIxrE/Rij3FjFTQDt7sdQLoftDD
        7h2mIGSya0DluNehi3U63iON8DT3L9U7JiaTK5DEtA==
X-Google-Smtp-Source: AK7set88vSes/BG5lngJVrxXzpSoY8t2RDVO5Y7hI0bNYjMxtiyjEXQTq9fC8laZszhIwxmHVbHyO3JrYsWeQrYHj7w=
X-Received: by 2002:a81:1944:0:b0:50b:429e:a9ef with SMTP id
 65-20020a811944000000b0050b429ea9efmr232496ywz.434.1674826481893; Fri, 27 Jan
 2023 05:34:41 -0800 (PST)
MIME-Version: 1.0
References: <20230127101149.3475929-1-arnd@kernel.org> <20230127101149.3475929-2-arnd@kernel.org>
In-Reply-To: <20230127101149.3475929-2-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:34:30 +0100
Message-ID: <CACRpkdYPoTVtT5snJz3wYFBggYA0+wdSXxHRKoJ3TkH6jeXqaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] gpiolib: remove empty asm/gpio.h files
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Fri, Jan 27, 2023 at 11:12 AM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The arm and sh versions of this file are identical to the generic
> versions and can just be removed.
>
> The drivers that actually use the sh3 specific version also include
> cpu/gpio.h directly, with the exception of magicpanelr2, which is
> easily fixed. This leaves coldfire as the only gpio driver
> that needs something custom for gpiolib.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I see I was reviewing as the new patch series was going out, such is life
as an asynchronism! ;D
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
