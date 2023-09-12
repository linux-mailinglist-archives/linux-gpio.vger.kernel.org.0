Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F4079C969
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 10:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjILINd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 04:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbjILINc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 04:13:32 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A642810C4
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 01:13:28 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d7f0048b042so4555479276.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694506408; x=1695111208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0wTIBjz7kND/AUdb88zaZ6X4O2w6qaMsynEQ4VEpl8=;
        b=epfwlzndbg8iN6IKpVOONhQux0Y+bcRHa+QZa+tSab7mp5H/8xUtMLwZlIyHESK5CR
         dHbZRTnLBE8AGhBfsGKKJfrD4WffVD6Yzjub+aPvCjuUFH9EQKi9KsMPF8Cf1kCqpfeF
         qr6+BSI0PqJ3Qcc9P9sVTtUN8QlSxzDqDg39TrjMT6Tw4UB2pLIKO1GPU8EzCMurtSb6
         fmh17+Q78dIvBRhPqRQ04KgcGfMfzDq91WBvoes8VemaC4/SnRVocfKwYN9xRQk+6U4q
         M7Xy/H4j8GJO3sqG/pHQZUn0LCCnVfD3MaAdPaKFw9D2hYn1hSEn1AGV3OoTWrKipdoO
         Tmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694506408; x=1695111208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0wTIBjz7kND/AUdb88zaZ6X4O2w6qaMsynEQ4VEpl8=;
        b=IwYLN2iC4mocs5BI5mAfhrBF7sBFrZ+oWSNVeHKqSBtl0ok0cLFH3JnhCeLt2mavPd
         na0B50W/cc86GOg4v8UZzVM/kD91KwWBsrrxA/n/lbyJsPcpPs+lIKq8FCDVzbopNv10
         G951JM6LX4M71+bI56iJawSxr/dSJdT/n+sqQ22ETvLpaidFGoNPYliv+g7IgK8Cz3Ts
         CCH4arp+YjYKZJJl9cWw6hyZRme5TOIhh0e3mF2jCdMeRSY6IF03zZZLL2iT+dkJaNeB
         pC8nKvpxSdwuz0s30i2z5oXvI49Z2dahmnw5O+dSBVJZbmHRzcL0Spw4ipezseWIpKQx
         kpTg==
X-Gm-Message-State: AOJu0Yz6UQ1JzzFCo2+YS952fvzVWmsujydJXt8g2RT5Fxd/ngXeEhHf
        E9VyYtH2Gn/9I9M2Kl1/5+nedi6j/gcNwglwd1RflQ==
X-Google-Smtp-Source: AGHT+IHuRDjHz/DsWcBLoVAM4Op0qIFV+tGRyxcDnwHyZP34sJun1mYbuiZ2BQt/IoBMXyuIY/jdhrKEYgWyinOH9/A=
X-Received: by 2002:a25:8451:0:b0:d0a:8973:b1c with SMTP id
 r17-20020a258451000000b00d0a89730b1cmr9957810ybm.12.1694506407900; Tue, 12
 Sep 2023 01:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230909110459.12453-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230909110459.12453-1-biju.das.jz@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 10:13:16 +0200
Message-ID: <CACRpkdbcb9iPZ68dF48gHFzvQsZ_-SnhUJmVRoYv_UArEg_EOQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sx150x: Simplify probe()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.au@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 9, 2023 at 1:05=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:

> Simpilfy probe() by replacing of_device_get_match_data() and ID lookup fo=
r
> retrieving match data by i2c_get_match_data().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Patch applied.

Yours,
Linus Walleij
