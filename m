Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0035AA80C
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 08:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiIBGcF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 02:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235205AbiIBGcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 02:32:04 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB2DA8312
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 23:32:03 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id s22so1058721qkj.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=X4NcCxXF7k9Z1Trr19zd7vM5+qsrHkvjZK9Hyee90S0=;
        b=BN3eElpZfT+pMo2zikkEwGX5qeGEqtXq2eN6JhTPJ8qw1TJFRZAA9vb4xvMDby5vf2
         0K+N/s9Kx/1EUEXZDPpdvElig0nNis31cXoacbHjCFMc32a0sFrwITbxUU7W6mTyzwC6
         wFN+F+NWrwFp7xBI5SZWGnKn6vKeDt9iRZSI3QASh8OGXgAM4aALec+FnPsp8BJ/gA9S
         C9qC/+xSF6eMiGzWXMtB04XR9lI5aheOLJJ5j/aHSr4xBxZsar1baoWJKNVcFmhw5w17
         HY1OrzpUPKZ3PaQhsz3ShmK6+uRu6qh+nh3AiD0KWTAsqj3oAqSG5kKU8wrwyywr7wQk
         cQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=X4NcCxXF7k9Z1Trr19zd7vM5+qsrHkvjZK9Hyee90S0=;
        b=6i8MCeRqrfD0AGKSyoffT7MIjU8Cppl0Y85TOp42+VKgdzKdIPZ4HNvd2TxRsKNeNV
         4tcbg2sCGjk7DcQs8N1LRHfNoyRwfb7BoDZpNY5EJnwLhWuMgnrfEPwdR3SPg/MSsv1G
         e/lRhD6BA61tPJguxPAjL/g/schV1LaxZGiOOOJVOkhtltd3Olj16D6JKWj1SFvVCv53
         OjLv0AdYJa5D+KYwulOxKRHCuMH3MxHmwUL2qNXM75WryDrOl8JqD8+xH1zqxP43T18I
         z758IYTtfdqLKLXfuYM1JqrQLAdZLM7pmVmMbtd4E65OZ1DR/pxmD7zz0/UTLUoXPEwf
         84Tg==
X-Gm-Message-State: ACgBeo1PrZ5jFeIT+KlAhSDlPqAXKCpZw5plLrnlXzzTfxvvO0kcB/h7
        uyYr/11DlBBSmBowbuLqsz9FJCeahIPrDrYjv+A=
X-Google-Smtp-Source: AA6agR4JICc7E0FUZLQlYaaaP83CEbr+9RS26LtnWz7NEbVMYwAZgHXPoAkEaBJKHRlDHRl96o5USc4gMok3Uv8IoxY=
X-Received: by 2002:a05:620a:2987:b0:6ba:dc04:11ae with SMTP id
 r7-20020a05620a298700b006badc0411aemr22062478qkp.748.1662100322854; Thu, 01
 Sep 2022 23:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com> <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org>
In-Reply-To: <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Sep 2022 09:31:26 +0300
Message-ID: <CAHp75Vd8-mOuJvr=PRKjVKbz0SM9hPe39rEcraOMJFYtrwHjng@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To:     povik@cutebit.org
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 2, 2022 at 12:52 AM Martin Povi=C5=A1er <povik@cutebit.org> wro=
te:
> > On 1. 9. 2022, at 20:55, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> > On Thu, Sep 1, 2022 at 5:17 PM Russell King <rmk+kernel@armlinux.org.uk=
> wrote:
>
> >> + ret =3D apple_smc_write_u32(smcgp->smc, key, CMD_OUTPUT | value);
> >> + if (ret < 0)
> >> + dev_err(smcgp->dev, "GPIO set failed %p4ch =3D 0x%x\n", &key, value)=
;
> >
> > Strange specifier... It seems like a hashed pointer with added (or
> > skipped? I don't remember) '4ch'. Perhaps you meant one of '%pE',
> > '%p4cc'?
> > Ditto for other cases.
>
> As was pointed out by Sven elsewhere in the thread, this is an
> unupstreamed specifier (that was missed as a dependency of this
> code).
>
> https://github.com/AsahiLinux/linux/blob/f8c0d18173a7b649999ee27515393f7a=
ae40310c/Documentation/core-api/printk-formats.rst#generic-fourcc-code

I don't see why we need that. The %.4s (0x%08x) is repeating that with
the existing codebase. (I do understand why v4l2/drm have it). Ideally
the first should use %4pE, but it might not be suitable in some cases.

--=20
With Best Regards,
Andy Shevchenko
