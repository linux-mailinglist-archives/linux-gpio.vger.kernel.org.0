Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C359D7BFE4D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbjJJNq0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232455AbjJJNqG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:46:06 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114ED30D6
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:45:31 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a7af52ee31so16568827b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945530; x=1697550330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQoVGRS7dETbgV3CTGGzd1lnUKsqhrqwon34noS0Bns=;
        b=pBLv91vx0ATqEqqb0fCFMbzaHvPJFPHFWg8YBec79DE9JUE3mj8FJ9XB4571Y1dSID
         gFcdu9gpSy+bq2P04SPr29YZRmn8nyNbP7NkKBXApugDfnxuGOBhXm30SYaxnaxIDM25
         4YsbKGv4gTpZIxcNKLE8SNA64lueWYoTllYmyk0xywJA/p2WzZ3ZunXb+oIx1ygXr8oW
         Ek2nijdGu5TgVc7ZjH0Tz9qkfy2Jo3Hl4d6dF6GIDBgWdNqma04RpwCUcJkSGgkT21+t
         a/WgCf8/8OTRH1OIOMIiXC+kpnJuL+XZh2oCBIqFiLfTyCdxdszmcSogk7kX6LTzmrUr
         Zw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945530; x=1697550330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQoVGRS7dETbgV3CTGGzd1lnUKsqhrqwon34noS0Bns=;
        b=hFU/UNe81qk2WjDmyspnJhhDBLJ1w2+G7LC2G2bNz6+lA0Ttt7G3UEZgJ4iVixcJLY
         80A+XFbD2o/zBb81qzV5ULhKZEVoBiNB/O8ExXeKp7/BMOkbV20i6JhtwPIR4WYuZk9B
         zCT97MuReN/uKOUq1Q/iAwgwZ5el3l/g1T1zc2aZFyGAl9mSPEDqlsHdVOD6KaLrOu10
         aoywsUhYwG31v4XP4lxLpIXuqySmTCjxg6cbtu+Tbj//Evkd0ibltgPFFYQPsPpXd8cZ
         WMPbbLtOHqyCSqJn4lEWvTFLz9f9qPQhAsOKftkzrlOLLsS54X6Uta6NAlG59dwF2OIs
         cvDA==
X-Gm-Message-State: AOJu0YwWCW43DaPYHAay36cfbFlTZNT4331U0vE6Ix4pkRETE5PVMS2l
        AI7pFfUaMGn+X+NwsdbosF5CuEYSl+gtMfHylaW76Q==
X-Google-Smtp-Source: AGHT+IGrO7LkLD/MRm5QkzXeIcnLLYqdWFi9qGCJ2DBHCDw5MlrCdMPazBkBNCYOQCgCUP8762z6lGP8prXzvQVB8kQ=
X-Received: by 2002:a25:3308:0:b0:d9a:3801:aed8 with SMTP id
 z8-20020a253308000000b00d9a3801aed8mr3475649ybz.14.1696945529849; Tue, 10 Oct
 2023 06:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
 <20231009083856.222030-20-u.kleine-koenig@pengutronix.de> <CAMuHMdX=pESX1PefCXBSHgu8wRMsEiNO02q1-sjsxqysKb1znA@mail.gmail.com>
In-Reply-To: <CAMuHMdX=pESX1PefCXBSHgu8wRMsEiNO02q1-sjsxqysKb1znA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:45:18 +0200
Message-ID: <CACRpkdZ0xhgEA733XNOehBL0G5u1P=1FGVTf9tcToLhEj5vQCg@mail.gmail.com>
Subject: Re: [PATCH 19/20] pinctrl: renesas: rzn1: Convert to platform remove
 callback returning void
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 11:39=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> Linus: do you plan to take this whole series directly?
> If yes:
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Otherwise, I can queue it in renesas-pinctrl-for-v6.7 for my
> second PR for v6.7 this Friday.

You pick it! Andy is already picking the Intel changes, so it
is better to refer to submaintainers where we have them!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
