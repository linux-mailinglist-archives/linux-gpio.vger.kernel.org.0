Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D97723341
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 00:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbjFEWeY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 18:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbjFEWeX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 18:34:23 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B02A5E55
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 15:33:59 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-565bd368e19so54826467b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jun 2023 15:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686004438; x=1688596438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLN+ZswznH6b0VWMRdhCrxBe/4tMg0KlcFn8llepCzw=;
        b=LGx6UIDqPNQMJcpUmdGVkkYWnmzxKq19NDvp0Cl1vg5zaS/BckdmirXTkQ+Fj5WTVT
         yvRqYG72eR6Bj0ul2/6ZJKoGAQHzf4D1ZadiZXs06WYDr8yGUVFrNv0xdDUa51vwtr1g
         donqVED6SILHniEGwbAesiOIN32nrpuyUlQWHC6QgmbKJR/985TShXVmzzfse8Dyk5ew
         LfjHM4pRmxTVTP6vysxvufGEstspDflvneGOrlX2SagzG9/Kk7+QI4hl9p6DXditJ4T1
         J1HN0G+Srt0y4KkSJOIrsihCwLVJSoH2AJbmyqtZX4l56aHN6ZbI4i024ybS4+TbLz9z
         XteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686004438; x=1688596438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLN+ZswznH6b0VWMRdhCrxBe/4tMg0KlcFn8llepCzw=;
        b=GWcgGNWaAOCaKO9w7RNNspM/tjpKkClnICsEjLbGUnHku6BjjDwb/XcyVywPEoMV7s
         wd94u5gTCDwZQHr3v+hitLwHjJUR0RLbg5YfKgVEXq438a6L6v33zBm7+I9y7KPR3QZU
         JgXaSJHIkp1mxexxhYWAsH0O3qQGXqFt3fwEZVvENsALT0F0+9bwcO/KyHUVqIOoOR94
         u12r4EqDHYxo1pQqaqhOj2JyafsV6g9A+ucgX6B/9cFI9+Hn5v3oXsY2cNYe9B7CUiQP
         muZ9ytzUDNwpXrCs7eSZ90PnZAgXnvUCNpQFReXEJtZ7sBfphAL3kEOek2BOXnbph+Rh
         MT0A==
X-Gm-Message-State: AC+VfDyGO+t4I/XsaWNR0YayKAh41hYB8U8R3YPYLIxgO4yCtBNniupv
        axj4quiUy3uc9SXPt0ZgId0EQ+bglGobEGNmloSFNw==
X-Google-Smtp-Source: ACHHUZ6JvlPIxdp7stn0KZdPO3+sKF1aAp7CV3KmWlCn2z69jSzLyJCNvlWB2zDusDBxSmCloxwPLohgFHdwUQmeQHQ=
X-Received: by 2002:a81:7282:0:b0:565:4eee:a4d4 with SMTP id
 n124-20020a817282000000b005654eeea4d4mr10003536ywc.10.1686004438642; Mon, 05
 Jun 2023 15:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230605151015.564547-1-brgl@bgdev.pl>
In-Reply-To: <20230605151015.564547-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Jun 2023 00:33:47 +0200
Message-ID: <CACRpkda7UJnKxuRvc11g5nH12f1nRcGsPP28ke9Reap+eqUvUg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Andy Shevchenko as reviewer for the GPIO subsystem
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 5, 2023 at 5:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Andy has been a de-facto reviewer for all things GPIO for a long time so
> let's make it official.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Excellent move.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
