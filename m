Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF584B19FD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 01:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345997AbiBKACY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 19:02:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346000AbiBKACX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 19:02:23 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7DAB53
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 16:02:24 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id o19so20070664ybc.12
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 16:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6amdZdKfUfxoy5toKt49P0SHUxAj1DnsrZFrMaxvyJI=;
        b=D7RIFrpCEJQ0wQuEprUdX1acbuAgEexUqcq/lvB14jnOS5ogi4JDn/yVt37yPAdUMv
         cdG+nJNyOiGBDs3Q7oBoxOk7+iJSjIOlc6+IK2Bo0YF1NfrU7itoVPmXEYUvDhcqcaYB
         hN3zRzKzMppQgi6wfwPJ1m5WBsBSndmRbAyqYA6MlnovRWIZxiveV6bMATOtuXsQHLVV
         W8L3zrILKJNEnsKWMLf7ddGjcvQycJkut3j1TnkMzJUBHpWRzZgrreAbRmWW+jFZjIXv
         jBuuvqDKDT8EzktRiQkPY1LS+so+kqF8V0hVR+kwNWdVS4zgqM+IL37eryTfYMXXMUKG
         duqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6amdZdKfUfxoy5toKt49P0SHUxAj1DnsrZFrMaxvyJI=;
        b=zCnG0IpeJ60sdpJ0V3vU8Vj1YBpbJFljPFPxYTPlod6LUIG9z+eXj4SlfURiQGVTDK
         Eq4Ly0ccbIpat8qkxfnl3dz00K0ValY/5sKQTlPRSi4Cvy2hO7eNOVW2fSWbGj951VI8
         sz9mgGCIKeLTXRtjiqlZRM7FhYVrB+VoS2ZjIVf2qGmPpKXxNB3dsGUEdULYB1AG/8SD
         tqmXtpspmyid73NCwGGdb13F/N+WiQ/hQPWcBPiBnMXkEiHGIMvxLidnyNmwfzusMLPn
         +rJ+pAEsPjfi/aGHf2O/1Ys8XyyfO3hLUc6ILDksC4q6/SIO1moYRdX3Ul0/Vv5p9X/l
         GNtw==
X-Gm-Message-State: AOAM531GgAeSp6yV87s/Sozuqne2hmIxLzpW+8395GKGO1aWvQ+5tctK
        u4eRG4/+KiZBK64Cz6y2+WyFLsidzFf8DI9jj3KFqA==
X-Google-Smtp-Source: ABdhPJz8e25o2s6cN31+acUzC45sbRdhVmC27Ml34E9Ew1Pqg581u0yFka+g4I69kuUy5l+0FIhMy3qtizaDRqxhAvA=
X-Received: by 2002:a25:684a:: with SMTP id d71mr9513602ybc.284.1644537743422;
 Thu, 10 Feb 2022 16:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
In-Reply-To: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 01:02:12 +0100
Message-ID: <CACRpkdbzk55pmK9XMwc470O8vJFUBQ6zs35shOYCFKr+YaOezw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To:     Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Cc:     stable@vger.kernel.org, regressions@lists.linux.dev,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Edmond Chung <edmondchung@google.com>,
        Andrew Chant <achant@google.com>,
        Will McVicker <willmcvicker@google.com>,
        Sergio Tanzilli <tanzilli@acmesystems.it>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 4:36 PM Marcelo Roberto Jimenez
<marcelo.jimenez@gmail.com> wrote:

> My system is ARM926EJ-S rev 5 (v5l) (AT91SAM9G25), the board is an ACME Systems Arietta.

Which devicetree or boardfile in the upstream Linux kernel is this system
using?

Yours,
Linus Walleij
