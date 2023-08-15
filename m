Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B669177CA82
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 11:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236028AbjHOJdk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 15 Aug 2023 05:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236268AbjHOJcf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 05:32:35 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F1D1BC7;
        Tue, 15 Aug 2023 02:32:33 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-58a24ac48eeso16320727b3.0;
        Tue, 15 Aug 2023 02:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692091952; x=1692696752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWdpDNEBZCXweam0z6ARfXcf85ClHVSuzD7JjlW5VJY=;
        b=MkMgRulSLOUcIJWVVGwjovpSCpZQcPsdjHJbp0L57NFKsTeVZRz+vTaoh1W/a4f1S2
         k0VE2B4l+gCDYoMVs0POuV7ykVPMfDGlv2Qa6UZsFa08QaZt/VgBzHPJWOBKhKICP94I
         zir1E/abQBAGK6a4UW03mYhupYJuAMZ5GHYk0MfVlEGtRAnITzX0raImtEaGTK9byS5F
         miVkakkMF/UJoJjTRUambK8wrYQDQgr3VeSnNgE5F3N0q/qDdpdt7EGCyHpkEqIVL4pM
         QwtCW3RLQZlsjR4dv+mRim74w+eNQ4fU+DSWT2SBL+4iEQ4Zl66IOWXR1P/grBO5otfs
         8zVQ==
X-Gm-Message-State: AOJu0YzQoSwvxjrIe0RbHfMl+wsEI5lLxm/RqZcx+sbbWotmpm3apRfP
        UoXVzERZRUk63hk+4HZjDs6Sfj5R4YDsPw==
X-Google-Smtp-Source: AGHT+IHQbRl+w8DMSEKB/oPWqTnJqWbYpmkVDTWIFWHHd1C2sdMIDpAcFIzdGqWjeQ1jjVtF586FsQ==
X-Received: by 2002:a0d:dfcc:0:b0:577:3d46:f90e with SMTP id i195-20020a0ddfcc000000b005773d46f90emr12255628ywe.32.1692091952590;
        Tue, 15 Aug 2023 02:32:32 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id n186-20020a8172c3000000b0058605521e6esm3307751ywc.125.2023.08.15.02.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 02:32:31 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d684d7a2a67so3185806276.0;
        Tue, 15 Aug 2023 02:32:31 -0700 (PDT)
X-Received: by 2002:a25:838d:0:b0:d44:2269:a289 with SMTP id
 t13-20020a25838d000000b00d442269a289mr12697634ybk.1.1692091951314; Tue, 15
 Aug 2023 02:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230814072436.3757-1-biju.das.jz@bp.renesas.com>
 <20230814072436.3757-2-biju.das.jz@bp.renesas.com> <CACRpkdaZGrnV6bp0Sz5_yxG6y0oAqBeZh2UAz+pM4ULtpWq30Q@mail.gmail.com>
In-Reply-To: <CACRpkdaZGrnV6bp0Sz5_yxG6y0oAqBeZh2UAz+pM4ULtpWq30Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 11:32:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+544cr+Ykq9Z=0Q8YoNdwWyqHkN81v8UzJJXF23uQsw@mail.gmail.com>
Message-ID: <CAMuHMdU+544cr+Ykq9Z=0Q8YoNdwWyqHkN81v8UzJJXF23uQsw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer dereference
 in rzg2l_dt_subnode_to_map()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Aug 15, 2023 at 11:14 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Aug 14, 2023 at 9:24 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Fix the below random NULL pointer crash during boot by serializing
> > pinctrl group and function creation/remove calls in
> > rzg2l_dt_subnode_to_map() with mutex lock.
>
> What about using, hehe, scoped guards? Bartosz premiered the use
> of this and I already like it a lot... see:
> https://lore.kernel.org/linux-gpio/20230812183635.5478-1-brgl@bgdev.pl/

Quoting the other Linus:

   "We should probably also strive to avoid it for bug-fixes that end up
    going to stable."

https://lore.kernel.org/all/CAHk-=wjsb5gZTvhXofPCQthk48S9_bSGohXKU8x8XDnf7=bROw@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
