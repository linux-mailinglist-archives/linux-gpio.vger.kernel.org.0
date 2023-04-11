Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BD26DE479
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 21:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjDKTJN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 15:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDKTJN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 15:09:13 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D183C3F
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 12:09:11 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id p91so19675420uap.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 12:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681240151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQhhr9Ip86r6ZvIfgqpM55UW/t/4MnhV/laWRNygUq4=;
        b=hMBlMJ3A1xKavy15Nnk/EULQvKAVjUVcabPbXt3f2MnKjkA0N8moehaI881iDcye7O
         w2tkLMpwBGi3b4bvq3xKqwt2o4LXRWO5dcxF5fmDFlp/ZKLcHWxLad4NkyXhpCZtwBLX
         mQBQ1bG2eePKiKjeXYgW5hrWTH7xgNeiq1QprtmTgccTFX9fsNHhEN4NvFBx1Z1UVHdE
         wtxmfktjzeEGHlmT/80fpMF1YJoEaWeClZxF1q6WfuxB+Gs92x2bQOufLeRFywuL/BMZ
         IrTDIunsdANCex7g/1QNZq5ujLkWqC1owx/lFmBrNhY2fQ/JG1YAsLr411B9m99rYZIl
         A+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681240151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQhhr9Ip86r6ZvIfgqpM55UW/t/4MnhV/laWRNygUq4=;
        b=dn812acmUudHfW3ICeWd77VWXLSaiEnMYFYH+krJx0kVA3LGKXbW97dm1Wfy5VNTSi
         BZrsMbqt8PBw6mBn3XUqEqMP7ITwBjK1MRy7FBJanMJFU655xo1tuEkTqsanDbKsWmhr
         svpCIeq1YCodWCpDik8X7BwJjO+rYbpSMbaJ+j0FTsC/st+qLA947KFbMLCyVgLqTkUu
         sJfS0JNR7r0NsYKT4jo6HQWP2RzlWp2f7yFdHYK8qSIkj9Cp+bzFV3kzxWJWNrh0wnKJ
         znwjcm4nn731R4s/m+Ez7lFlRsKL2pZEteqLySeBE4EltRRu7rBIzsNQx+U7SOZufI6Z
         i8+g==
X-Gm-Message-State: AAQBX9epGebGLI6DfwitiZX7nk2sjUGKGFIumKlMUJnYWXZIMihfYevL
        W5RlTjXHdKQVdapndHPcW3q7s2uFyEJORY84skQ/QQ==
X-Google-Smtp-Source: AKy350bI8o7kzdDZ+pXJmuB+ctVQta4nyVfXmcJLJqKwUgDtM7gAsZvZ8MbwMqd0LZ55wfyXB2PSb/zXAJB66h+cqqI=
X-Received: by 2002:ab0:54d8:0:b0:765:d142:bed9 with SMTP id
 q24-20020ab054d8000000b00765d142bed9mr9811992uaa.2.1681240150855; Tue, 11 Apr
 2023 12:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680543810.git.william.gray@linaro.org>
In-Reply-To: <cover.1680543810.git.william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 11 Apr 2023 21:08:59 +0200
Message-ID: <CAMRc=Mf2TQbbtCDotTFZ=-P-b8GvqRU2pcHFTA4L_=d29FRmWw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix possible deadlocks for i8255 GPIO drivers
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 3, 2023 at 7:53=E2=80=AFPM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> The 104-dio-48e and 104-idi-48 drivers leverage regmap-irq to handle
> IRQ. The default regmap locking utilizes spinlocks but this can result
> in deadlocks for IRQ chips when running -rt kernels [0]. Enable
> use_raw_spinlock for the regmap_config of these drivers to prevent such.
>
> [0] https://lore.kernel.org/all/1466065537-82027-1-git-send-email-mika.we=
sterberg@linux.intel.com/
>
> William Breathitt Gray (2):
>   gpio: 104-dio-48e: Enable use_raw_spinlock for dio48e_regmap_config
>   gpio: 104-idi-48: Enable use_raw_spinlock for idi48_regmap_config
>
>  drivers/gpio/gpio-104-dio-48e.c | 1 +
>  drivers/gpio/gpio-104-idi-48.c  | 1 +
>  2 files changed, 2 insertions(+)
>
>
> base-commit: d49765b5f4320a402fbc4ed5edfd73d87640f27c
> --
> 2.39.2
>

Both queued for fixes.

Bart
