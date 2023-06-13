Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83D4672DAF4
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 09:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240301AbjFMHbz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 03:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240534AbjFMHbl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 03:31:41 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCE02111
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 00:31:01 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bd20beffda6so466945276.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686641460; x=1689233460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IrfjpCdUT+kJUVd/WfU6skEI8CHNuU1srBMbNYG+uok=;
        b=XYJAiihlg3FLbwdMgngS8I2khiQD6zsmuNJj3FTTSOWFZkUMeuO3R3goecehdCav88
         CEQEr9L5CEP6M2OlVB6VlM3e/xR+o6jl4sizAQUChloCqxMUuWjmar+4UScJoeRDXyMg
         mnErASYvLHu77Fh9Zes4jdqvcbnUgmv3sIzVVU602D18hJ2aI1zW39eURvPL8PKmGVKX
         eMiLSs8NmSp9lWNEB0wa+shhgakLxsNPGOlTSiuGscInzBGoECvYDCJqX4883BXqTxui
         /bMsgbG6deZ7LMBBdhGnQM7PNjzaiITisgKZnRwYUhhjg1qMr9Fkx/xKEAu+nUcS5Vcg
         MOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641460; x=1689233460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrfjpCdUT+kJUVd/WfU6skEI8CHNuU1srBMbNYG+uok=;
        b=Kbe/AaHaq5RrR/Fkqtk3rsTFic07fT3sC/dLTo7mqevo+/kJj6fpGJuT+DCVghJZds
         v2JQOqVyJbYvd6gLjXUJB3ZkwWRd6ejWueASX1jLKc3fBJSx7FYrBSYAfA8MkeT5JpU/
         Iql4TcQ8JVtfTzF1kbVBfNbeR4+rxcJfeLP0oO8m9k84sn4RobO5x3nyujGmceTjh+9T
         h4uYWrGmDsI/HyJ1U1DtLdSCKKaIkse5gmLTO0Ez2U/1+7KfPbCJSYgf9A+M6wyDjm5S
         7uQhTyHolZfy38l0cMcJK0gxF3GbhSdUbrmjo1rInmcxeuoHjUWn56xXOl825g2G3cNu
         0MWw==
X-Gm-Message-State: AC+VfDwHXu5e9K9XJu6dOSmorTkTZA/kpnfbfsDwWG3oGohbS0d4WeC4
        unAKnAhV1pDTB/vi19ly+jy9xgv8hNCG84NFc+oQiA==
X-Google-Smtp-Source: ACHHUZ6202vqCdMtoVR6sC5FsJ9/o6i+pMm06jUG/HM+YdmLIm8A0M1vsPtX5lZNel6Kxw/QlKdMQdHf0WA9DHsVTnA=
X-Received: by 2002:a25:9085:0:b0:bca:7cd:7f32 with SMTP id
 t5-20020a259085000000b00bca07cd7f32mr1124109ybl.48.1686641460116; Tue, 13 Jun
 2023 00:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230613072643.105576-1-brgl@bgdev.pl> <20230613072817.s4zcdkvtkqownkvu@vireshk-i7>
In-Reply-To: <20230613072817.s4zcdkvtkqownkvu@vireshk-i7>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Tue, 13 Jun 2023 09:30:49 +0200
Message-ID: <CACMJSeu97ftDjarB8830_5tvvGbqRJ-84X1NpFTC3KdFu4DWVg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: rust: add missing license and
 copyright boilerplate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Erik Schilling <erik.schilling@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 13 Jun 2023 at 09:28, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 13-06-23, 09:26, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Make reuse happy again by adding appropriate license and copyright info.
> >
> > Fixes: 1f8085953086 ("bindings: rust: build against pkg-config info")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  bindings/rust/libgpiod-sys/wrapper.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgpiod-sys/wrapper.h
> > index 8a8bd41..e5cdfa0 100644
> > --- a/bindings/rust/libgpiod-sys/wrapper.h
> > +++ b/bindings/rust/libgpiod-sys/wrapper.h
> > @@ -1 +1,5 @@
> > +// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
> > +// SPDX-FileCopyrightText: 2023 Linaro Ltd.
> > +// SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linaro.org>
> > +
> >  #include <gpiod.h>
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> --
> viresh

Ah C headers should use /* */ comments for SPDX stuff. I'll fix it
when applying.

Bart
