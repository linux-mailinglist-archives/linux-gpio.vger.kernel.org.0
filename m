Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9949C6CC083
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 15:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjC1NVE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 09:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbjC1NVE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 09:21:04 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A8DAD3C
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2023 06:21:01 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id cf7so14992298ybb.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2023 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680009660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfVZocICGaMpiptz2/572edI1ZnJ7HlcSZYdVB/kpRc=;
        b=XQN7vEjA1iyP66sQpG7RO4OjBJRyFg8+GExxWEZWUp59KaENkFkRkATJ5PNtwxJD0L
         SvP1ABh0xOMY5vHUPSSSMGbkf5sSANT/IIyf+VvZIzZPwTKnw81+uxqL76yhHVdIsXhQ
         HoomMEmgq3I5qqZm7VV2lQtEIwAxaCO8O8enqPB7rW7+Vb8BiWnmvTDJz3q5cYIfbwRq
         ZI6mlwEs/+ntQWZmsfmpFQmBNwBsEuS9RLl0xxcOkjzHW03lUwDd+8abwB1KfriiNnxY
         kxICzrHoh0vPvWSXKs7JTDogrJd3E/iUVPZw8nuaRpcQ+yf5/y2Uf8vcpdA1MqNFb0wl
         NivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680009660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfVZocICGaMpiptz2/572edI1ZnJ7HlcSZYdVB/kpRc=;
        b=UIi9jToibfriqkxE5QwzdalG9MNAEPjPreUcnrgOjf3eNIHeqcx6JHxyBg/h8ZBz7/
         WFP4KTiEVueAN+v+W+TOwjgoJPb7NU418hIZvGaV4bSdhGuvEqtK8sdhCxkjc1ds+NRn
         zxLMjKaXMMz3dbnxpJCA3/v1xvfEqtLYY4FEKuGXzhYcc1/DXT6Bx2CDqVq9YgsEZELP
         OWoUQ6bnMtYr9PXl5MTLGSd8YK71gfkQtF1mMnHHT6I30cVU+HOrxj3A54pS4bBCPl4B
         Gz0DVscZHQYwyhw9ARFl9ZY48dWA85gzMIK/WEnZhPxBlvPuGCHb8bj3F/Yqumvnl7L8
         FcUA==
X-Gm-Message-State: AAQBX9fzXbJNtc2b7d9eHN1Jb5LdLVJePouuatLZLB5TOwN8ZORNdzJn
        O1vO1Wie1CqIM4y32Et1TUXq43FNHq0aMFl71lExQA==
X-Google-Smtp-Source: AKy350YQlzxrQ/EgxtEgV7Vlw8CxZBJVorE7oPpbSDJyYmTCQCG0Cmr3l021ev4od+wljUQwCcq4ECVjOu9TCEti0FQ=
X-Received: by 2002:a05:6902:70f:b0:b75:8ac3:d5d2 with SMTP id
 k15-20020a056902070f00b00b758ac3d5d2mr10307037ybt.4.1680009660410; Tue, 28
 Mar 2023 06:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230320093259.845178-1-korneld@chromium.org>
In-Reply-To: <20230320093259.845178-1-korneld@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Mar 2023 15:20:49 +0200
Message-ID: <CACRpkdZj4qAwMv3ZVDt43WmEyLF0Qv4SW2uSqGtNd1Yuiwgz4Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Disable and mask interrupts on resume
To:     =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@chromium.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        upstream@semihalf.com, rad@semihalf.com, mattedavis@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 20, 2023 at 10:33=E2=80=AFAM Kornel Dul=C4=99ba <korneld@chromi=
um.org> wrote:

> This fixes a similar problem to the one observed in:
> commit 4e5a04be88fe ("pinctrl: amd: disable and mask interrupts on probe"=
).
>
> On some systems, during suspend/resume cycle firmware leaves
> an interrupt enabled on a pin that is not used by the kernel.
> This confuses the AMD pinctrl driver and causes spurious interrupts.
>
> The driver already has logic to detect if a pin is used by the kernel.
> Leverage it to re-initialize interrupt fields of a pin only if it's not
> used by us.
>
> Signed-off-by: Kornel Dul=C4=99ba <korneld@chromium.org>

Patch applied for fixes with CC to stable!

Yours,
Linus Walleij
