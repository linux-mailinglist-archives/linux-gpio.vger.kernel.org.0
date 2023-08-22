Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0616C783D29
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Aug 2023 11:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbjHVJmH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Aug 2023 05:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234427AbjHVJmH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2023 05:42:07 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD86CC9
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 02:42:01 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-48d165bd108so588269e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692697321; x=1693302121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlrZc/v97on3iVIkMHvJhtbqFEB90Kl148r1FUXo47Q=;
        b=HRvL/2m0zeq5XcmR3e6F/XjnhYl66r4rcAtDUsC0BxtFiPYLlDONI+FS8IqRwyTRBz
         Q7seBGGbtkc+sjlEGEfd4m1/7ji822ZihQI/nI/J930HuFqsXr9Wwo61KqG9eI16LJsZ
         zXNJYX3/v9E9xuQu6ddqGGbMY8JnidwTI5VvVFMdC9RcTUr5uQryuOuVaKCJoiI3zWf4
         MmXXbQl0j51zC6Txuxf75Eef0ItITFL1rfyhjbFzJeStGspZ9HC3Or0ivjqdbze5tQOi
         rhJnVgkk2RrYKArHDbwfXW9N5qtkjo4LA7ViJ1I5g9Y07PvoB+6zkiljjxabPSfi+kVf
         Zb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692697321; x=1693302121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlrZc/v97on3iVIkMHvJhtbqFEB90Kl148r1FUXo47Q=;
        b=KD/BfhVUG+AiGJu5MHTgcSj3LLV6rwlSnHKL6Cl7EOIihAbNiSJQBGbLigjlHqf9ZR
         vYQLP/mIGMJi1PAsgYKGNQ2lZJJMUSxDOpKaadPEJLe/EFVaAummv9MzKxYzbWUIdsvQ
         GLulxABAZlCtXslALlrr1y0twBpFm7ekJSLRHfeQ7AZP84cqXlkhUie/mmGRSAVFtvk/
         JRyaLj0s4S0XlXPIAe08q7e1z4VDbjztHPo0aPf9V3+gK6UnvNRDE4JomEK9grXmXJmk
         ETrEV8HhbBxhXmvHWV9noWFC0ttznmeVwgIcez8qWBeNfA2TygSHfh3mmcFgxpG5YgXM
         CD8g==
X-Gm-Message-State: AOJu0YxbXLj0fUw+TfBeqPD12UbyqTiZPl9K2T4iMJIajNd8DskCJrAf
        ZJbQ82DLEQuY1aa5foblIqO9Cfk9YMIyZNopKqvCdw==
X-Google-Smtp-Source: AGHT+IFW8Z/t2lgQ06nzLJZ6QPZTPQj1hJ7FeMOi3zmTsKSMMWLSckf3xN9aPekD0PS80MEaGwhn56WJXIGiOGvh2l0=
X-Received: by 2002:a1f:e002:0:b0:48f:280a:1d5a with SMTP id
 x2-20020a1fe002000000b0048f280a1d5amr2720764vkg.1.1692697320854; Tue, 22 Aug
 2023 02:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230819180443.16718-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230819180443.16718-1-biju.das.jz@bp.renesas.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 22 Aug 2023 11:41:49 +0200
Message-ID: <CAMRc=Mf3m4Rvs8w8VgvqA=mn26+kbPCdTGich00pW+W3E=Gmnw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pcf857x: Extend match data support for OF tables
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 19, 2023 at 8:04=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The driver has OF match table, but still it uses an ID lookup table for
> retrieving match data. Currently, the driver is working on the
> assumption that an I2C device registered via OF will always match a
> legacy I2C device ID. Extend match data support for OF tables by using
> i2c_get_match_data() instead of the ID lookup for both OF/ID matches by
> making similar OF/ID tables.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied, thanks!

Bart
