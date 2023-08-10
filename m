Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B96777332
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 10:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234390AbjHJImN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 04:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234383AbjHJImJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 04:42:09 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18D3211F
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:42:08 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-58451f0fefeso8598877b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691656928; x=1692261728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weORogC0MVWRhV6ssfye+wxDML/n1t2mu4TTWlqW8ec=;
        b=KIg6LL86oXZugWxeJFc/04PLXxcZCxDTyGJBSCGNyXf+QiGiyjsjxzhIpk8hz/hmln
         m480YoipQH26dAyoeP/oh8dSQ5NT2UONX8TmCS/PVnA8B71mzxOyKcyn0h9TuF6+HmBn
         gDo/JIfg6olCnO0SF8mjEskOP+H2Flxoh9VlRcuZo3WIw82SP7JyP+9K1+HDRTa65AFY
         59Own3Xs5PZs6ePAbhzjNesDCKkKDH/MX23MFmq9WBhjSldO9/4ajEaBRf99RxM9sLP8
         B4ywy3ME75XhgD3k0XjoGHHy294Ad4Z0GXyZGRge6SgGZNQ6leNme/IlvZaps2bloYyS
         K/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691656928; x=1692261728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weORogC0MVWRhV6ssfye+wxDML/n1t2mu4TTWlqW8ec=;
        b=gRpTnFy4CxxBq36olZzOKRphG9WF/MTCZ4GEaaCIuD4bdPJqo05SGiaeLRFTaSyCEu
         0tAVE9MkZ4tTg7GK9rUACr+/fmVZYRgLcNsCVh06u7q6zoP5kw4YHHZsUvzc7UAW5mll
         GIcSbXUlIspd/Yt7Gvm93e6EhUoeAFGNeM8Z7okRIJTvyhaZ2Iy2Wwt1/Qs+2u8dp6vM
         1ebXtYHwyT2My0e8pBBdhSdagE1MRNlB4VB7PoU6GM6vx4nZ8sAFjD5MTcpwfCMNU5Xy
         FuOS0Y6uKNP8n6/Y4HgUe/cBoVYEhAJr7n+CUm0Tt1DeytTJK0X2YimVPN0OZpm7tBsl
         R2pg==
X-Gm-Message-State: AOJu0Ywg++bvcohmnpmTSdUWzn4S+NA7M5JjOSl6LSAgM8mmnrDvK+Ff
        SrYA1XEw6JW0GgsoljCoiDdhd6/cT6JhA4Qi+6/8Bw==
X-Google-Smtp-Source: AGHT+IF9Tb7QX6+7PoBWglP+hIJ2WJkSQPVgQQHuclqmq/vh7Jz6qT2/SGQEz7MoFPymQ9gtliw52JMmLAsOIZexa1s=
X-Received: by 2002:a25:e7d0:0:b0:c39:9e09:2c71 with SMTP id
 e199-20020a25e7d0000000b00c399e092c71mr1844510ybh.41.1691656928030; Thu, 10
 Aug 2023 01:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230808180733.2081353-1-florian.fainelli@broadcom.com> <20230808180733.2081353-3-florian.fainelli@broadcom.com>
In-Reply-To: <20230808180733.2081353-3-florian.fainelli@broadcom.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 10:41:57 +0200
Message-ID: <CACRpkdZF6Wah1DcZ8ZLEJ5NCEVBRKcrTbJRAP69qBQK6WSuZgA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] pinctrl: nsp-gpio: Silence probe deferral messages
To:     Florian Fainelli <florian.fainelli@broadcom.com>
Cc:     linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:BROADCOM IPROC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 8, 2023 at 8:07=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> We can have gpiochip_add_data() return -EPROBE_DEFER which will make
> us produce the "unable to add GPIO chip" message which is confusing.
> Use dev_err_probe() to silence probe deferral messages.
>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Patch applied.

Yours,
Linus Walleij
