Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16CB47AD1F4
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Sep 2023 09:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjIYHnR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Sep 2023 03:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjIYHnO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Sep 2023 03:43:14 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BF8E8
        for <linux-gpio@vger.kernel.org>; Mon, 25 Sep 2023 00:43:08 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-452c031f7b3so1802961137.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Sep 2023 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695627787; x=1696232587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqSSfRt2FX1iJgBnNFLYuQcx0Izo1QKFxQpbwmgNxLk=;
        b=ZeAg6Ywp1qkdnd1zKcQx2etQeb/PPE0/F7vJtTt8Yssa39IxL4csN3q8PevavOy7ek
         Qnn/roTXPkhAwk91ZERG+q0l6ZUAxi2NbjEmMgqqSdmrHYfAxDlCHUjW2sJdBgJOfC+P
         wSixGsU4lGm6t25exYUI/2VRM7S6B0WRSYkcs7BmVtI7iAiM6xfJpWqCRmfgPByI0RC/
         UT/Ik9tVaL5dN8V8j+hjCTcCpXB0VXYEHOagIl/BPhTvMMx88rlENiUrEgyinGX3YSR0
         Cv4+vzez8fPjFxObCvkAiDPdUY5jT+fAY1k06ApsyyTjvcG9Ni/AeZGIs9ZYNVyXnxEU
         OQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627787; x=1696232587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqSSfRt2FX1iJgBnNFLYuQcx0Izo1QKFxQpbwmgNxLk=;
        b=ijRUpdhl5bcNpI7jK7Ln+ZF6mgd3PQpfs66csCuNumj820BY5OSo+30hoMlRskOBTZ
         sZGP7qLrZ+PFRN55Q8BCsPq8dDVV1MxiWpAdn4+svsvI1XtLxiDydaeFU+G713p2YVog
         Nr6XdfMV/f/TTDOSu7HJ7t2VD2F9wi1qVJcow+twpxOTZgypfVYrc1uFyyMjE3gUi0us
         n0rM6PDn2iDRdfillCitn/9im7ZYSw1cHBmtuYjJame9kvvlGFgbjdTr3ESNuN+rbtTv
         z6+n6f93298gKB1Tyki6CkKdosl47ejOpK2gaMSo3KZnpE27gJmLp2lSuiC41zjHA1CD
         tv1g==
X-Gm-Message-State: AOJu0YyqGivizC2Fgbloi1HLVATCN+8rSiekKrCbAloWcG4w3awCR+f6
        cC2omWW9yw6zIiqIBvqpv4/SL8j+nbgOvk3bVXnIKA==
X-Google-Smtp-Source: AGHT+IHcByVh1sZSB41P6ROWWyheYWiE63uzqjuBPnfCzpm9MQIkcZT8WWBea8nPFnPgbSK6agxpxLCyYwLxfeakN18=
X-Received: by 2002:a67:d014:0:b0:450:c5e4:4869 with SMTP id
 r20-20020a67d014000000b00450c5e44869mr2873248vsi.25.1695627787321; Mon, 25
 Sep 2023 00:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230922175203.work.760-kees@kernel.org>
In-Reply-To: <20230922175203.work.760-kees@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Sep 2023 09:42:56 +0200
Message-ID: <CAMRc=McijWTgX8yvar_J=boHfTPXmJftHnfLENj1XXseKLyL6A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: Annotate struct linereq with __counted_by
To:     Kees Cook <keescook@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 22, 2023 at 7:52=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct linereq.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Applied, thanks!

Bart
