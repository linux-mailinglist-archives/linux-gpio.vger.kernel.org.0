Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A116DE5F5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 22:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjDKUqn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 16:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjDKUqm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 16:46:42 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E982D10E
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 13:46:41 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id y186so9677374yby.13
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 13:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681246001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po1MCvCf5OQxV9nwlMwg/r9Glz6To+YmkbTBIFPIgs0=;
        b=sKxLGyKycdzz5MFSp3E9IS9EFd871Flxvh5NgsRmglRJUNfboQvxQXEAgRXu72Yvhy
         fFNhYQjMTTRhOE9gg1nsJW7Wt/e2tOQjxD/3Q/mVJ0sI4oFzHI99QI0G1hBhVD85NKJW
         EUwdO/DJC4ma7K9HNSstSQ5jBNqRgo+QfF82z1c3+T9xDLmEiFMQJYobLaaF4SonVWex
         2psED3f9soFbJHgsHhhnJqs19HWpTqJfSsqioJ4+Lz4MXgv46dClH1hmQerMR3QQeIoH
         wVhuYb23x0s8GBSPj14Ehx1/mMuoscqJ1MwKLd2FkdIB4uL9WQ/jtM35/6FkEe+Gj0Mc
         5+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681246001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Po1MCvCf5OQxV9nwlMwg/r9Glz6To+YmkbTBIFPIgs0=;
        b=UzRPITfUQ6HYQfiGCT8zDCS9QmCUGii5vz8J0OgxnCF4MN8uADV2KzkSBHoHYUNIWV
         DNqvt+YptAr5CBKydFUK46kdQJJrBQi4Vj6bxo+jB/YGWQ30Vwog8HzOmKAT8G86kaq2
         s7r41OtJpzDvZIlo7QhFLL2Xf7lxYv/TZP8zLD52nDUTMlwEAPft6u4uUPdiF4g+FTHg
         bBygErGQKynHiOXsrw8Emb7EYRNb7vwxcTgRB4e3XKEE7efRpU9PY34uKwwVWgnmtde0
         kRLRbgBFezBJAeIRtGUzDQdTnvvMF9tfermPMgdQ7ZPO4/82RRzjUTDdpoU1OA2GYAaH
         vQKg==
X-Gm-Message-State: AAQBX9edMGceeW7j8aiyc/gYu6sox3eS1ZX+vKPxaasVt1wTw+N7W06V
        S9Ow6GiZp6qMI+axkAwjym9LJNAwWQoXB24qpMPl8Q==
X-Google-Smtp-Source: AKy350YMuCQT9UcSmIL1nhQvQq2Ll1FqF/WxgWvjJpN6Rile4v8m1nTnvcOubzCK97qgvWJYmwW7yO33QW3BU/M4WOQ=
X-Received: by 2002:a25:df4a:0:b0:b8b:eda6:27c7 with SMTP id
 w71-20020a25df4a000000b00b8beda627c7mr7883592ybg.4.1681246001137; Tue, 11 Apr
 2023 13:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230411134932.292287-1-korneld@chromium.org>
In-Reply-To: <20230411134932.292287-1-korneld@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 11 Apr 2023 22:46:30 +0200
Message-ID: <CACRpkdbJxU_Z=Zyc+y1mYW+D6gnqBrzMYph1DMiZKsBsGtBGJQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "pinctrl: amd: Disable and mask interrupts on resume"
To:     =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@chromium.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        upstream@semihalf.com, rad@semihalf.com, mattedavis@google.com,
        Gong Richard <richard.gong@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
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

On Tue, Apr 11, 2023 at 3:49=E2=80=AFPM Kornel Dul=C4=99ba <korneld@chromiu=
m.org> wrote:

> This reverts commit b26cd9325be4c1fcd331b77f10acb627c560d4d7.
>
> This patch introduces a regression on Lenovo Z13, which can't wake
> from the lid with it applied; and some unspecified AMD based Dell
> platforms are unable to wake from hitting the power button
>
> Signed-off-by: Kornel Dul=C4=99ba <korneld@chromium.org>

Patch applied for fixes, pushing for linux-next and will then relay
this to Torvalds.

Yours,
Linus Walleij
