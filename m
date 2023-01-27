Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7DA67E6DA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbjA0Ng2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbjA0Ng1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:36:27 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F65E367DE
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:36:25 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4a263c4ddbaso67720247b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lm/eKWA7nHZbFTBeP8HSFE1ZhC80UbaJbWzWM/DYvEY=;
        b=BisZtvp+WU+ShLvP3I22aaq18YE/l/TkOw+2mCy4ukjPx6MncMr3F9Daz1CCvviroc
         iXvzrCfp3Xi7y6KwebzWm/c2OkAk2REum6hp9Z5cRuZOe8WHWSHG62dgDgu2EY0QBjtU
         gGHj1fHgzErEQ0A59YAzSnD6gjCdGpwr7IAiN0xyfXAwgLDcBS5YZVH7Ln/mjEwRXzGG
         0G+7uw3p/BamzKZyP9Jk3FUU4maF5JVmRlFe9qAbVAndg706C5knJw68LFlcaDjSGX2r
         VW6QCPJ9QpxRGV+P3FyDncclkjGaXfpCfPBk5yqdtpTZrbE8dGHNatviN9MhYlsY+yOE
         WOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lm/eKWA7nHZbFTBeP8HSFE1ZhC80UbaJbWzWM/DYvEY=;
        b=6ufq7kngukoopGKGVX4RBHwiNOJpmLfOdmzs1vqFLlz9tXpBGNe3xqcsGwZBc96gfx
         MFvzas7ozMPwzdOAUsiTO+3ete60DfzAjaSAMFjZSwILvSbGO7Rqm49xTu3n07Eb6R9e
         /g0GRIbTDSs9+6mpLg3KFnPORSe7EPsIi4pcKRSa8KDUaAKlLI3Gc7CeA1ax6DtSfUe9
         gBd9rY9Oeg3uz8cp3do+r3P/axxrSg1JdDg7TfEG+n2nnCFjOsA3N8uR7H2G2TAvvZ9Q
         31wRnyrSLn1uiGDKSpNRF5gdkVUPCNpWHVewBjoV5Gg3VKsMbT56bZL7gFs3G71beCdv
         cmLw==
X-Gm-Message-State: AFqh2kpisTgYcvZVqDPgFsJtHChhqZw3XIIS9VvF4fixZ1b1niXaTM5E
        egiNb/VTrUCfCT078u1CK25y12twhZhmUvjPhtQHnw==
X-Google-Smtp-Source: AMrXdXsvsMo+RSYvpOF8LTfpgwn21rd/yE1KiL3zhHjBbnv+ngzGNNuYOcljzya2rYscdB+tNAcQ8WeslCISgqryo9I=
X-Received: by 2002:a81:6842:0:b0:4ff:e4bc:b56f with SMTP id
 d63-20020a816842000000b004ffe4bcb56fmr3635887ywc.488.1674826584821; Fri, 27
 Jan 2023 05:36:24 -0800 (PST)
MIME-Version: 1.0
References: <20230127101149.3475929-1-arnd@kernel.org> <20230127101149.3475929-6-arnd@kernel.org>
In-Reply-To: <20230127101149.3475929-6-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:36:13 +0100
Message-ID: <CACRpkdaUfjWp=DFajpacyfK7vi==r1YSZ27m3ERiuZj7SB7Dww@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] gpiolib: remove legacy gpio_export
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
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
> There are only a handful of users of gpio_export() and
> related functions.
>
> As these are just wrappers around the modern gpiod_export()
> helper, remove the wrappers and open-code the gpio_to_desc
> in all callers to shrink the legacy API.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
