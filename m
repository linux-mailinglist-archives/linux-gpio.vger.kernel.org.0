Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187D450C3C1
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 01:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbiDVW2n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 18:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233365AbiDVW1n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 18:27:43 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50353420C4
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 14:58:19 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2eba37104a2so99414647b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 14:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NNQJP7ntF8soE81iHLRX4D3rG4OVRx16kjDK5B0hv+E=;
        b=pWfQKYNkMMZJG9PgkJeJ10O0wcxeCiz9fbN53VOitR3Jgn6iD6bHOE0TaZa6BoDjMG
         /0y4+UcKW3gaHILLuTRNBUEikivRNDHV6EhM+wkH4JsIAcxZpEUeS+jqi4yRhcqbgBGH
         LJa2Zlj22o8pt1vbAV/M0CA9z3p3+0UwqWaSgfQ6lwaeoiOE2YsAfmYV6oR668MMsCjd
         WPQwsweyVem8CCU/2FazMcS46azD5MomO3E2Ome+pa2BqkhgiFtRdq49gyKcagra7/T5
         tuShQiWL1DnAq7DyRYnVQn89PtwxxHp2DRoMLHDp8QbMp40VTeFoAHWr4lT5zDeyA5Iz
         PrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NNQJP7ntF8soE81iHLRX4D3rG4OVRx16kjDK5B0hv+E=;
        b=ys67n3gAj6b0fUQTI4W5pvGkQjHlFnYSuHbOZHMiBqeRaz1MT6DGiV5xqQHDH7LkiT
         4WD/cCYqOX4xLexYBS0MhIiZJDsJhRuSn6Nb2Rl0lF929+DdXoZFwIDAp/irhkcoKN9X
         H2jc2HTno4mQ5HO1EnRtcPTpC7hq+SGVcVIym7Xu+2aN8xwvnoeqTUEknzLgvML6uUF6
         QUb26JzcE7rJTxR4WJnJLx2TV5sA3KXuyLQRsBBxtkXk9yr566zCINsdNoEu4gv6lTFw
         0MjEdAlIAvchX3RdVh2U1JecLSQEngaPHlQ4FbbYqWDW4yTEJ+EjujH/4f6/vToEQwZ4
         7MTA==
X-Gm-Message-State: AOAM533SIZHd+rQuSbzGUT2ozPTT1e4E7efRPqHIw/khj13kNqrLVnem
        BJ6Fk1islIkJpfA9VyLqcI68XQf/3wRyZKeqMGRLDCAEfk4=
X-Google-Smtp-Source: ABdhPJwiYz27q9al29EVKwaUieTIJ7vxG56fmMN5dBUaNlUXP7voSN0iSDPygWM4Z2MQ1vTu71BmS8xz8YZ3T+3KZMo=
X-Received: by 2002:a81:2154:0:b0:2f4:d79e:35dc with SMTP id
 h81-20020a812154000000b002f4d79e35dcmr7091549ywh.126.1650664699156; Fri, 22
 Apr 2022 14:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220421094228.2141569-1-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20220421094228.2141569-1-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 23:58:08 +0200
Message-ID: <CACRpkdZizkeBsRhk7-VqcJ5u3+6ksRv++znnpYhnX9-7UN=x9A@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: visconti: Fix fwnode of GPIO IRQ
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 21, 2022 at 11:42 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:

> The fwnode of GPIO IRQ must be set to its own fwnode, not the fwnode of the
> parent IRQ. Therefore, this sets own fwnode instead of the parent IRQ fwnode to
> GPIO IRQ's.
>
> Fixes: 2ad74f40dacc ("gpio: visconti: Add Toshiba Visconti GPIO support")
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
