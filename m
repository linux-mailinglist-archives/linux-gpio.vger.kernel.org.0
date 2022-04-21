Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C28550A1F4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 16:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389072AbiDUOSr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Apr 2022 10:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345906AbiDUOSq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Apr 2022 10:18:46 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F065B9FC5
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 07:15:55 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id r189so8991472ybr.6
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mdhV5xJb3yTPG4IXlt4NbO27rLVO/vJmiWIV9V5oqiQ=;
        b=QwIlmWUpQAd4v0AjUgLjg4oebC7z6SlfN1pzB8lJ2uZzt9wKTBXmNQNnf2wTFBzaf1
         8QXh+7UYxlZXMu+6u2wZfndNkIgETSoRrX/QSAOx1E/EfpLAi1npmM714RsC8Xzp2+r+
         J5CbgX7HFziZZmxDNZYbWRhNQqIbi1hpqrcia56Ez8AeKzRHLhM0HnfGNYRTkGBf9DL8
         UVOnY/dOuT7Q8lQqakFBFBRAcpokcWTWFa0HF0M+uvq9dAdKKeauC4STq6WqmVoYawks
         ePZ0/fkpos8Nz4LpXQ3tJA0IbRBWxrk2cju/hmkKzTZ/jaBz8N303f0JEq9jfnBPBS1J
         dvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mdhV5xJb3yTPG4IXlt4NbO27rLVO/vJmiWIV9V5oqiQ=;
        b=TSjs919TUixpci+XAk140Sfzj6FQfMqEdSRsCfamYK/JhuQo/5Ejy6MTtdCfmvAf0h
         peeujZ6udPx3825/0Tp3TOyO+CN/MoWA+KLm0PWpixw09yDqQ9KwJryng82P0v1yJ64m
         yLSAzY/9S8oJrAV/Tm1+1sIYwPwxHsQtNLgyWgPF+QbAbSNOirXPDL7gmhN84L2Rm9oR
         V464JO3XK++MdeEmr4LnsOBKBJRgL7sxU9IKLeDIH9IaN84fw4xhFz1CXqC3qfEHPoXY
         8pFPvWyXdUwk5lRmqTO+JAxtv+MKBxuICIaEWp+vZ2mSNi3kMYgZhxvPNvgGDUhs9Vtw
         YJAA==
X-Gm-Message-State: AOAM533p2UvIGoFWpLBjnhcsN7ZlIn7OHc6JWia4rCeLHNnoegfqFtSs
        NgFdFus4l5OpG4RNXzTFIVVBRNopkZrdkI5JpRhCDA==
X-Google-Smtp-Source: ABdhPJy2/9TEWKOJgrsxEaZAHrf6O4u8qAdfriJlxVUrx8dcunjMApUx6rLwWisom0mmM9vfeNhIq1T4qtZQHMmo8ZQ=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr25169549ybr.295.1650550555204; Thu, 21
 Apr 2022 07:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220412162218.32509-1-paul@crapouillou.net>
In-Reply-To: <20220412162218.32509-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 16:15:44 +0200
Message-ID: <CACRpkdY2L78n5_SB7tLNdyyxrYq9Thx=P4V4e=JmqGA91wqqww@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: ingenic: Garbage-collect code paths for SoCs
 disabled by config
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@opendingux.net, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 12, 2022 at 6:22 PM Paul Cercueil <paul@crapouillou.net> wrote:

> By being a bit smarter about how the SoC version checks are performed,
> it is possible to have all the code paths that correspond to SoCs
> disabled in the kernel config automatically marked as dead code by the
> compiler, and therefore garbage-collected.
>
> With this patch, when compiling a kernel that only targets the JZ4760
> for instance, the driver is now about 4.5 KiB smaller.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied.

Yours,
Linus Walleij
