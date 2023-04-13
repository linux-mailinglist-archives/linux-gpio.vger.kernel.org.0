Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B216E173D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Apr 2023 00:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjDMWUY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Apr 2023 18:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjDMWUX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Apr 2023 18:20:23 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B3065BC
        for <linux-gpio@vger.kernel.org>; Thu, 13 Apr 2023 15:20:21 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id j17so31419267ejs.5
        for <linux-gpio@vger.kernel.org>; Thu, 13 Apr 2023 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1681424419; x=1684016419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXzUcxPP626cgc8CdfapvJZ46tgsC0UFbGeqvzuoYnU=;
        b=L+kmTBG6Ktzt2fMXak5DKnXkUk4b/fuoUwKatOd0CGhdkI5rJMYFQkItVv+QO7WD3/
         lIEZLMXxIr8qcpf7usgaN9uXi7R5VJW2qW1ZDwt2xIv0aEClUscfrb/WbpQZC2v90EPI
         AE4UOhJb7UHfgjWEkxDP02QcthcuI/rNwgRCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681424419; x=1684016419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXzUcxPP626cgc8CdfapvJZ46tgsC0UFbGeqvzuoYnU=;
        b=PtWFjPzK1K0uMg96I9rRfvk2iBGDd6GOoIWdrrXKsFrjTqeQ2yp1gmkBImDmCkNjf4
         zNvuIo37UVb4oZAsLODVLs8Ay1urKI4sXjTkSpPssKy24IdqKfwwXNmnuUvIGghjj9Ic
         jLHCZJGuDzzpijTAAiwnWQVyuMxsaeW9RaRdtAII+lKJ2ocAeACQgJNNERMhnrddkmAo
         V/JBAePq9SXDx/9ujLzqMkplsb14WPZ0aoexB0+yFov6w/m9cJzoKfeCzYd8uwE5cNBt
         ClF2by74iCyXdG/ab8EfVb+bkDPHoM2Y6bgvw6Shwgw1LyF97NAcTuBkgqz5fjAx8Be3
         1RHA==
X-Gm-Message-State: AAQBX9cPikxDo+6fh5s9cFkQqAobsMeBKFFEKZr9mXRv6Lizqsg1knqn
        uBxw2s0UVuU83WdF8HMn6nCqUCN1uEmv/XTf+VmE3g==
X-Google-Smtp-Source: AKy350ahBuL6uay/TjqqaH7pAQj5TLeeMhQEYkczSTbIpiBY0H+UcTHO+kRkvTEzb2KwNtd2lj/Kng==
X-Received: by 2002:a17:906:a1d8:b0:92f:33ca:c9a3 with SMTP id bx24-20020a170906a1d800b0092f33cac9a3mr4323133ejb.71.1681424419687;
        Thu, 13 Apr 2023 15:20:19 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id b11-20020a17090636cb00b00930aa50372csm1550621ejc.43.2023.04.13.15.20.17
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 15:20:17 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5027e589e20so6828855a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Apr 2023 15:20:17 -0700 (PDT)
X-Received: by 2002:a50:9e85:0:b0:505:50a:a4d0 with SMTP id
 a5-20020a509e85000000b00505050aa4d0mr2029706edf.2.1681424417227; Thu, 13 Apr
 2023 15:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZsoGihp-cVVKTMPFBPBj_7_ScaYJZFU6jZNugucyx3qg@mail.gmail.com>
In-Reply-To: <CACRpkdZsoGihp-cVVKTMPFBPBj_7_ScaYJZFU6jZNugucyx3qg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 13 Apr 2023 15:20:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wioXgXLB1XcxU_f_kmVwfDd+EoOX7KLtJh7fnPMZx4RBA@mail.gmail.com>
Message-ID: <CAHk-=wioXgXLB1XcxU_f_kmVwfDd+EoOX7KLtJh7fnPMZx4RBA@mail.gmail.com>
Subject: Re: [GIT PULL] Pin control fix for AMD laptops
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thorsten Leemhuis <regressions@leemhuis.info>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 13, 2023 at 1:10=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> This is just a revert of the AMD fix, because the fix fixed
> broken some laptops. We are working on a proper solution.

ENOPARSE. "the fix fixed broken"

I tried to fix fixed broken it up.

             Linus
