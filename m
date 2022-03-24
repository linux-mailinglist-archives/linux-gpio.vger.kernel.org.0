Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF19E4E68FA
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 20:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346187AbiCXTCN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Mar 2022 15:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343982AbiCXTCM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2022 15:02:12 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8506B823A
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 12:00:40 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id e203so1271793ybc.12
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 12:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WiU1PWqUv/hxRM+xUKI6EDSP8WecIO/am6cTOSF7ixg=;
        b=wnrbFXq2RdrvoDJzZ/wn8kC5mBPaOcXwvy9lAvad22sKp6PJXw82b8sNimpmAxHJ6y
         R6EVGg0XYz8Azsu89KTWGfcjNaK6i0DJHiZrOJerIjqdOAmZE7X6513n7saTjsUGttMR
         yDdlq4ok88HYIvWlYJYh65y7aCLAb2A/yIkqbaOQkX+S+SQ1utyC6QB9iDdwFN9nzltk
         dn+VtSreZiOglzkSMkJaOIF+3f2yDMHr4iFvUngPSOTBj1TqG7JpUyjaIXSuMn2Mnhlv
         k8UdGILFCf4J09Xo1CHbEAENJMplYnXA+BZNAiVE8/OfEo7Eq17AVFzOxj84+bcAneqz
         xY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WiU1PWqUv/hxRM+xUKI6EDSP8WecIO/am6cTOSF7ixg=;
        b=n/oDSKk4ZYFepAygEh33gFCZSnp6pzLuaser1hYPGgKnx5/TAMzNenxR111nT+IYrP
         LMYhZTEBt42LGgXDJ7reKAThbu6CE/w5D/v4G8EWdqZ1s+/iB9PtxG+/an7BUG7U5rAm
         uXfPnC1SZ2RWFDdrSrBkB2ctmyFqxiwQOur4AW6FxiNhRoqQuwPpBMmZe58MAJw3BfiB
         Y4jNF1DLjsx6zaZVx5UMf5bde2+hT7f7gKIlask8J9WkqEhDQ1GXpuGYWYEkTCgUHr5w
         iHOQLJ3MLaKNe7Gy4ZgwezgPNPzlBsrTXakyPPsLvDX87WHX8/wiP785uFOm8iL8sb4G
         bkaw==
X-Gm-Message-State: AOAM530xcauRsQhtYA/Ow1D575pnS/6R3GOCaqVjexxpo6zmi9ixvEND
        DLvP7ffY0Piw4IBDCEPLogOh05XfKXs1RdHJGuvIMA==
X-Google-Smtp-Source: ABdhPJzu8M8Gdb44idqU+pZeLJlagTuwrjYQjNqglQygC+fsPiBbBrZ0wYLfM9fmbo6xrM1TiGDiojPKpN3ukNx2Qp8=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr6010009ybr.295.1648148439871; Thu, 24
 Mar 2022 12:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
 <CACRpkdYuxsYw99CZZK_GXp3V-mPiuL50CxgsE-=oRMApZf_bxA@mail.gmail.com>
 <15171d7e-f065-88b8-b3b3-dbeed75c5e6e@gmail.com> <98561f61-55c7-afe1-2393-362376251e43@i2se.com>
 <55b5cb38-41ea-2efa-321f-952259b12082@gmail.com> <f498afb0-dec9-c6fa-8469-896897f77d3f@i2se.com>
 <78dc59cb-cf83-3649-f3d4-a03f3edcb9cf@gmail.com>
In-Reply-To: <78dc59cb-cf83-3649-f3d4-a03f3edcb9cf@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 20:00:28 +0100
Message-ID: <CACRpkdZfruAcg7t2fT5Nz-N815BNAF8hvYVZ3HQLVhHZ5CXqAA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] gpiolib: of: Introduce hook for missing gpio-ranges
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>,
        Phil Elwell <phil@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
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

On Mon, Mar 21, 2022 at 7:21 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> Linus, how are we proceeding with these changes? Any hope to include
> them for 5.18?

Yes if they are finished? These two have RFC prefix but if you say they
should be applied I'll apply them, I trust you!

Yours,
Linus Walleij
