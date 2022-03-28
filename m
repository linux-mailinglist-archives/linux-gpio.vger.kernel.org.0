Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF40F4E9F8E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Mar 2022 21:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245502AbiC1TNx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Mar 2022 15:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245519AbiC1TNw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2022 15:13:52 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F273866F8A
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 12:12:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t25so26449951lfg.7
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 12:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z0hyCXgiwng5/9t6+pFesUyv1jubPkOVcRWMPxjuqVk=;
        b=CYAJDipb2kfpHEC0ajYWVsuxHklphuLeT0OAwYQXQ5dbnDOPs6iszc4RweoqSMIy07
         chQ0e15UhHy3z3M8TlDW0c74g3t+miH/0tWmu53PP8HZ2nEbd2CpalJHxLG3HPEDYhEs
         KQtZm/A2FJK0JM3nKRt/PMDS2hMPW+DTmg7Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z0hyCXgiwng5/9t6+pFesUyv1jubPkOVcRWMPxjuqVk=;
        b=ws+bOuQgN94nh3INZKJpqt3Rti9oiJndeGwmo0am0kX2IOMeeJB/u1uVJLRJK/oBMi
         FKV+vo6G1iaF+dLC/vaOqlzCLj8t5LYBTpbvrjVLo4T7heDvVbintAd5TjHcoEvIppps
         nNSr4L0Czh1xo0tBUhJRUmId3YjFmng5AzFnS421x5zRIiWxU+YOsJefMmKRg/HxCi1J
         Y7ucf7/YLX3ltPc4fSNSMpy6ZYyaFjX+HIIA2sPQBt+uP/1WRDc5zrAVWi1vz6E5HcJy
         0oUlkrQNCrhq4lS952QUDWUS4hVm2mBOSVPRijy6bn7KeIlk/pgaD2Ex8Bw8Hqv0jxRo
         FYhA==
X-Gm-Message-State: AOAM53048XTEvT1ZzJXytKJx5HZjcnRnUBLB87zlf0PFlXp0mY+bqJvr
        AzNoLrfmuZmtrUS03d10H7soRzkZsgXcET1xJb0=
X-Google-Smtp-Source: ABdhPJzIwzDuuCz62MoaXctwncGaIjEXRBlJMYRQUquxpeBMViwbWOHbGQcFnmZ74LEC7lspwGLJLQ==
X-Received: by 2002:a05:6512:108e:b0:44a:7147:984a with SMTP id j14-20020a056512108e00b0044a7147984amr15702365lfg.220.1648494727395;
        Mon, 28 Mar 2022 12:12:07 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id m7-20020a2e97c7000000b0024985bf1e25sm1806937ljj.132.2022.03.28.12.12.06
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 12:12:06 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id z12so12663632lfu.10
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 12:12:06 -0700 (PDT)
X-Received: by 2002:a05:6512:3d8f:b0:44a:2c65:8323 with SMTP id
 k15-20020a0565123d8f00b0044a2c658323mr21124202lfv.52.1648494725528; Mon, 28
 Mar 2022 12:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZ_Jr3OzfoOpSSsAJMy1Oe_=zD861jouDzCVD-BQ6yZMg@mail.gmail.com>
In-Reply-To: <CACRpkdZ_Jr3OzfoOpSSsAJMy1Oe_=zD861jouDzCVD-BQ6yZMg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 28 Mar 2022 12:11:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=whzqAB6kfHUcX2uhfPnNiWJRq=UmeA1TbgGi3XA+57j3w@mail.gmail.com>
Message-ID: <CAHk-=whzqAB6kfHUcX2uhfPnNiWJRq=UmeA1TbgGi3XA+57j3w@mail.gmail.com>
Subject: Re: [GIT PULL] pin control bulk changes for v5.18
To:     Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 28, 2022 at 6:08 AM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> tags/pinctrl-v5.18-1

Hmm.

This clashes badly with the fact that we in the meantime have enabled
-Warray-bounds, and I got

  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c: In function =E2=80=98npcmgpio_=
irq_handler=E2=80=99:
  ./include/linux/find.h:40:23: error: array subscript =E2=80=98long unsign=
ed
int[0]=E2=80=99 is partly outside array bounds of =E2=80=98u32[1]=E2=80=99 =
{aka =E2=80=98unsigned
int[1]=E2=80=99} [-Werror=3Darray-bounds]
     40 |                 val =3D *addr & GENMASK(size - 1, offset);
        |                       ^~~~~
  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:219:13: note: while
referencing =E2=80=98sts=E2=80=99
    219 |         u32 sts, en, bit;
        |             ^~~

as a result.

Was this not in linux-next?

Or was the array bounds checking not there?

Anyway, that cast to "const void *"

     for_each_set_bit(bit, (const void *)&sts,

in that driver is completely wrong.

The bit operations are defined in arrays of 'unsigned long', and you
can't just cast the issue away, because the end result is not the same
on a big-endian machine.

I fixed it up in the merge, but what really confuses me (apart from
the apparent lack of testing in linux-next) is that I don't actually
see what made this happen now, and not before. Maybe that's why it
didn't show up in linux-next: it's some odd gcc heisenbug.

Because there seems to be no actual changes to that driver that would
explain why I get the warning now, but not before the pull.

There *was* a change from

-       dev_dbg(bank->gc.parent, "...
+       dev_dbg(chip->parent_device, }...

in that function, but nothing else I notice.

VERY funky.

Kees, any idea?

                   Linus
