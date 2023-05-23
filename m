Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDB6C70D6CD
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 10:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbjEWILl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 04:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbjEWIKw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 04:10:52 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC60AE53
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:09:49 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-439494cbfedso566178137.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684829388; x=1687421388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CNRl25Mpbn7lFd0EgMpSYuJMXBCVTWb8XFSUxuhk/w=;
        b=iKu1Lk9TTHBk6ivWdWvne1Mat6Vn12uHBIYceW5hrzFawy0Xhh3u75jaTKBMUtiXUF
         PJbMr175Hd436RjD4EqAiAxdNyDZisu19fL7pRbzybRGtBYnF5m9/Jxwq1dTso5XrZxV
         hdF9Nb4zEtQ7mo/gU7sY9XPgpv/ktCjq3EIYI+w39AOUeKY2BKWZD6d2lKFPoiySfGAY
         givG9+RuCWs5DJs8SEqENyBN2BKvbRctSNPcwyru+CEpr2RUfM+95bx+UoCH2hFJ80xR
         T5eqpOPePGifBw0IDDGXzYPIvWIuuO/x/Fvo+6dkuvL2eXAgVkeW3jr93EZE1pL9bJgc
         +KBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684829388; x=1687421388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CNRl25Mpbn7lFd0EgMpSYuJMXBCVTWb8XFSUxuhk/w=;
        b=fKdogNOaS/bFhfsL4zRMhMIS8mVlMWcqbZJRRJKThLRuGMO53c+wZbz4XViygPabbI
         S0I9n5vgwY06hzU2yvz3sYsBt9TiLpU4cXX7iEW+bWiV2jyejlcNq8e1UIi2lDCsaK1H
         QVSeTUPD1cHXbLH6Y/51Ub3bFmMz1fWshYdi5shSOlZbBBDUmTWdIQtlm4Uy48F5gv0t
         r29zuSZBQsCsDnRVZFz6WvF+3pquKKlE8iD62vKcoHsrvICMC85iNx2rWc8nu5BcpHa7
         mV1ztcJsd2vumcILtnxfK3JmrF0JOdBoQqhuZebU7tpBTc7V4R9uBg8V2wBHGMIQzeEp
         egpg==
X-Gm-Message-State: AC+VfDwN+FlOxqmznFpqDS5tXmViNqJd5dp2j78hXMDFTosGeHGQF5bJ
        TpjHCAmRSB9/gl4fOcbZ+lLQLyiwai0sLogvtIrhKA==
X-Google-Smtp-Source: ACHHUZ5wVVYDtqJ5trI6DNyB8qj2EZ7BVAkHoxu4beE3+B6QVToBpQVNkBOU5iMCHzz6QKlBPr2CjpnRvb6HVnmmovs=
X-Received: by 2002:a67:f5d2:0:b0:434:7757:f025 with SMTP id
 t18-20020a67f5d2000000b004347757f025mr3355323vso.0.1684829388693; Tue, 23 May
 2023 01:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230520174735.364367-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230520174735.364367-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 10:09:37 +0200
Message-ID: <CAMRc=McchJfNfcqW6e03JWXPv1wMkJcZ1GrvjVay5xCopD8JWg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Switch i2c drivers back to use .probe()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 20, 2023 at 7:47=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() fro=
m
> struct i2c_driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied, thanks!

Bartosz
