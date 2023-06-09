Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6DB072A06D
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 18:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjFIQoE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 12:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjFIQoD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 12:44:03 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0323AAA
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 09:43:57 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5149c51fd5bso3437713a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 09:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686329035; x=1688921035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU7ZExiYZGpXxtSGpQ49waf+c1eFY7AbxM1kuBi0fpQ=;
        b=YrnXySk3YXh/YlYz6ObsTiPCZR45zJXxRZ/715/SlhIvFmmND24w4AGX7Mwp8N2RTn
         CSHfipaLqA2Y6Rto31jSd84jtyxj8p7izlY5VKEhvdbM8hlg2/NmZtsTjc6iaLy6zKf2
         ih3thb5Bh+oWfvscRZcy7ttxCfhyweYsWyEu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329035; x=1688921035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bU7ZExiYZGpXxtSGpQ49waf+c1eFY7AbxM1kuBi0fpQ=;
        b=Yj1fHxXN53Z0XCVKLKCVmiCL/lVhAgmv/L/aENwOwy1mupVqpa5QGQLe+H1wqMuH7R
         Qnj6GfrcHuWS9Hc1R1bbb2GZTVPF8xpdTkKWysT+NuaNjWr/g9U720gjSRT2aTBY61fK
         1u+lkqIH7YixqUGU3PvAK9SChy6UT4YefBPYY+9Jjxam1Mt4xkyTHSFr5DMQ/rgZR7/2
         XpWNml1BS4Xm2rOsO3v/05Ph0CX8cJBq6uWAzTOYta5SFB2VW3grCtZo6yk2b6sSfVoA
         SDT1YfSP+2//aklg8PhwODrat+Rn6uPIRStmJFVtfEcFlrH50ypwlDtR49lW5xwAcovW
         hgbA==
X-Gm-Message-State: AC+VfDzSYs2wvsVLZ0PUuGFkotZVLoLWfoZ2629M5zoXKdftwWBbpNrH
        vSl1R6DyGmyEC8ZSRT+1P+O8L6cQ+SknHe+otYtwtQW3
X-Google-Smtp-Source: ACHHUZ7fgQaXfsj4FzB7plgJO5Ip9eOn8SLNs/eGQBSlqiNOwD/IIqZqjXy/URz6XttmTMme9/9zjQ==
X-Received: by 2002:a05:6402:1216:b0:514:9b60:ea6a with SMTP id c22-20020a056402121600b005149b60ea6amr1815822edw.4.1686329035404;
        Fri, 09 Jun 2023 09:43:55 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id e5-20020a056402104500b005153b12c9f7sm1966335edu.32.2023.06.09.09.43.54
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 09:43:54 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5149c51fd5bso3437680a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 09:43:54 -0700 (PDT)
X-Received: by 2002:a17:907:70a:b0:96f:a935:8997 with SMTP id
 xb10-20020a170907070a00b0096fa9358997mr2422134ejb.12.1686329034229; Fri, 09
 Jun 2023 09:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230609144613.210272-1-brgl@bgdev.pl> <168632880867.22652.10987437416013616928.pr-tracker-bot@kernel.org>
In-Reply-To: <168632880867.22652.10987437416013616928.pr-tracker-bot@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 9 Jun 2023 09:43:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=whVcTX2hJ9VrpooL1ft34oB5kyrRsziM7cH94d8RGA_7g@mail.gmail.com>
Message-ID: <CAHk-=whVcTX2hJ9VrpooL1ft34oB5kyrRsziM7cH94d8RGA_7g@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v6.4-rc6
To:     pr-tracker-bot@kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hmm. I have no idea why you got duplicate replies from the
pr-tracker-bot for the same pull request.

Konstantin?

               Linus

On Fri, Jun 9, 2023 at 9:40=E2=80=AFAM <pr-tracker-bot@kernel.org> wrote:
>
> The pull request you sent on Fri,  9 Jun 2023 16:46:13 +0200:
>
> > git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-=
fixes-for-v6.4-rc6
>
> has been merged into torvalds/linux.git:
