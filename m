Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBF2F6DE5F0
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 22:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjDKUpO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 16:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjDKUpL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 16:45:11 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A271F5257
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 13:45:03 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-54bfa5e698eso334944397b3.13
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681245903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgS6IEmvWs5WBVd7nSRmmrb6udze83mNz8YT1MPLDCw=;
        b=GdSPoHYWHmtNABB1G6TVf4ymN/dF9UJquIdJ9tvM9Pasonho5T92PYWxjrVhIzKZHD
         Q/cLvb85bMTzJm2p11YMPa+cGC3qfFX+DkR43XX3h0egvZZIGgk+YWA8gqQwfMBTqV1C
         C5PD4IP02UVOLhnsrrbHimnVveJssROD44RQliKa5z+Ev8ItEzhsf484wS/ns35KWdFA
         quyneT7fHRJRKAGktD67mL5ym+yG+uH7A9UwT6Qz7AMTTdC24SuvBoHMs+0FLeIgzqhd
         DOCDqTik0rBEP9xTCjVRPCttcH0ltT+H75ispCFOk8gFL42yLf/1FDDwe0dwlRzmgPwQ
         KbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681245903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgS6IEmvWs5WBVd7nSRmmrb6udze83mNz8YT1MPLDCw=;
        b=37g+Tvaipw0RME7tDiTVKOylVROL/zjGJyTbh1lxjAyz39lfKAVDWNjYOC9y2sFlqg
         jkAHMHTK0XjzUsCBhygynqzJFN1DzqmXuQs4rS1FB0kLYr3Fj/F8dwK0uoMB3U2sGSr1
         xkSKzLU9/sR6miJ7CK2peQP33s1XrpWo0NMJ5q8vIHWJvCZwW+l/GK2K0Z+nvAiOkrQg
         x7WNSG5rhtZzvns4f335JxB9S7RwEylTM+On43v8aLRKOd1/hb+8VpOgpmsi7RbfZcmu
         TMhrehtPHAcJAqrfeMwBtowQoJt+yE1+fYN03HzNlMWr6IUj3bx6H8DJJLHUE30HHVcE
         3OlA==
X-Gm-Message-State: AAQBX9feel8omjgJ9WV5CldmBrwefewZv+da5oX1FrEylF5ncGrRVcTN
        z8oxo86cYM4WQgjJaPa3ZuC4IlFa/vmf7CC9aXcESw==
X-Google-Smtp-Source: AKy350Z+vv84TfPXjGXWUbXDW7zPAcZWRO2q/uRnM/9iQT/1/Y97Z4uyZuZxOjgZXA883a13iohrKJ6ZnyDUyKogSXc=
X-Received: by 2002:a81:ae5b:0:b0:541:693f:cdd1 with SMTP id
 g27-20020a81ae5b000000b00541693fcdd1mr8623016ywk.9.1681245902804; Tue, 11 Apr
 2023 13:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230320093259.845178-1-korneld@chromium.org> <d1d39179-33a0-d35b-7593-e0a02aa3b10a@amd.com>
 <ed840be8-b27b-191e-4122-72f62d8f1b7b@amd.com> <37178398-497c-900b-361a-34b1b77517aa@leemhuis.info>
 <CAD=NsqzFiQBxtVDmCiJ24HD0YZiwZ4PQkojHHic775EKfeuiaQ@mail.gmail.com>
 <36c7638f-964b-bee6-b44b-c8406e71dfec@leemhuis.info> <CAD=Nsqx2Gy08HHzjRoWxS7u559hUgi_GGRis0UDFxrUqLYjTfg@mail.gmail.com>
In-Reply-To: <CAD=Nsqx2Gy08HHzjRoWxS7u559hUgi_GGRis0UDFxrUqLYjTfg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 11 Apr 2023 22:44:51 +0200
Message-ID: <CACRpkdYoALVKFPoxxac=c9x3vRhYge+VAUSqKdkqSvgvS+PiXw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Disable and mask interrupts on resume
To:     =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@chromium.org>
Cc:     Linux regressions mailing list <regressions@lists.linux.dev>,
        gregkh@linuxfoundation.org,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        upstream@semihalf.com, rad@semihalf.com, mattedavis@google.com,
        stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
        "Gong, Richard" <richard.gong@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 11, 2023 at 3:35=E2=80=AFPM Kornel Dul=C4=99ba <korneld@chromiu=
m.org> wrote:
> On Tue, Apr 11, 2023 at 3:29=E2=80=AFPM Linux regression tracking (Thorst=
en
> Leemhuis) <regressions@leemhuis.info> wrote:

> > Linusw, what's your preferred course to realize this revert quickly?
> >
> >  * someone (Kornel?) sends a revert with a commit msg for review, which
> > you then apply and pass on to the other Linus?
> >
> >  * someone (Kornel?) sends a revert with a commit msg for review that
> > immediately asks the other Linus to pick this up directly?
> >
> >  * we ask the other Linus directly to revert this (who then has to come
> > up with a commit msg on his own)?
>
> Would you like me to send a reverting change?
> I can do this right away.

Yeah that is best.

> The commit message would contain something like:
>
> This patch introduces a regression on Lenovo Z13, which can't wake
> from the lid with it applied.

Looks good!

Thorsten: thanks for watching over this issue, we'll have it
resolved pronto.

Yours,
Linus Walleij
