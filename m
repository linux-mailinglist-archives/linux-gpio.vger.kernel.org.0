Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05B097BF9F2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 13:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjJJLlG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 07:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjJJLlF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 07:41:05 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EB0B4
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 04:41:04 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a7c011e113so6185527b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696938063; x=1697542863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0k9o0rUIEiJ5XPd84FDefo81gadVXjzJ3xtE8+bTHs=;
        b=cuf/HA4gjTdeULAPVP1HwAN7uzwa3YhzXXi9xBFBQ3mQHFqM8k2YvuHAVP/vm5StJo
         FalHMmJOrKB254qR0vEgWTgqz1comLIafgUXOdHBpj/qjrT8qxZZxOfYeTsBNTDT8fC4
         DTf+7KbN/NpvQhJQe44pvz8GoOSTFpcDrird2YlqVMaBaLSZ6J3cN6mXHkU1neqQHN1B
         t689FD/pFtYUf13ubZ6SLS8X1uRjDdpjMRMOEi3SgL04b5/lEsXFnN19qvZw8tz0nayL
         m1j9yWgMXemikSeT2cqHepRk/OwxwwZs/RW0DAi5WedCq5eECkfdn3IK0ywlY+tmLZH8
         eINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696938063; x=1697542863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0k9o0rUIEiJ5XPd84FDefo81gadVXjzJ3xtE8+bTHs=;
        b=evfBnAzcOgDMbGqf8RHd6gnFb6hwaJsnd/BZJztR4b+53u2UQu3JDes2fEOe8vrD1t
         qzHvxX6awIR1QRSmP9jukrQD0HCM46YzSiXCZnx7DSHYIlf9jIbymMgMZfmS2xsX6ugY
         WOAg5Yw7fWrdaA60DEbYxxR/YJH7gXeYe8jP27hR+JpIc2ECrVtyrYRI7aGCxoCpBn8W
         0vgS9EbqQ5lsVsE978om0uOnSQiE9Cckbk2X90xYv+TgxtezrrKcMxNKFEmyKH6mf2Qi
         N7AaLCKUjBgYzofKYHN4gdsFOZOx1gKWj3rfZbznRUJWvRRSmzr+PBQR642ZHvr8MhlG
         To1Q==
X-Gm-Message-State: AOJu0YxOqltF4VmUTKnZwfLXg50LCeapzB7uM3HiaP2RZESgFOaNuN1C
        SG9PUqFeHO9Gu+y0/Eit5+VYyu7N/wsQX9OBV5a+GSYKKv2dAq3F
X-Google-Smtp-Source: AGHT+IGdKYVnJbrA2c3DmfIO8Msb0nOZXtAsiXNme33EYQ0Co6ebtOXeqRj+/YPjDz/lUSBfegDGY3jrmXsBnfEOwyM=
X-Received: by 2002:a05:690c:4085:b0:5a7:b481:4dd2 with SMTP id
 gb5-20020a05690c408500b005a7b4814dd2mr2557864ywb.47.1696938063696; Tue, 10
 Oct 2023 04:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231001150113.7752-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231001150113.7752-1-biju.das.jz@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 13:40:51 +0200
Message-ID: <CACRpkdY+OrEcA3ExaZhTq832o-t2UO5S+FyRxsottQw5L2+ojQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] atch data improvements for mcp23s08 driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.au@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 1, 2023 at 5:01=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:


> This patch series aims to add match data improvements for mcp23s08 driver=
.
> This patch series is only compile tested.
>
> v3->v4:
>  * Added Rb tag from Andy for patch#3
>  * Removed duplicate mcp23s08 in the name of variables for
>    struct mcp23s08_info.

v4 looks good to me so patches applied.

Yours,
Linus Walleij
