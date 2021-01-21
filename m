Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961042FE4EF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 09:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbhAUI1C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 03:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbhAUI0f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 03:26:35 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F745C0613ED
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 00:25:35 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id a25so362698ljn.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 00:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RpwN5C2RXaQ8dp8IACeDHHRkP2r9P2ksf6c27smpuuM=;
        b=wroXOgRGxvgAdh6XmUxeT1ttxKWOVaMvdFZFJQhBT0c/U9vLbK59i1pjwWkCPPHbg3
         SENK8j5MT0JcKlASUhH3kyxx8iJk/nKGAIv7Z5lmpDahyFwYYXBDV0n2c0UbfMR82Xcy
         ku9TDQL33szLi4WYj9YLssJvsGby+3lfVcR+zNbc7Tmg7E+nwQDHgC6205EkNdf2yaHy
         9e8+ZBbVwFlfE6qeov941L7wHH+odvQzdIPmnzM+TuecJXsExCQ2QDHSRci4E1CJLBjt
         N48KkQJHFFAsugDck4kACIF0hWAHpRW3mXW9OyZk4Qv0TvTsZIKSVcKlz6o8KizAMl8V
         We0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RpwN5C2RXaQ8dp8IACeDHHRkP2r9P2ksf6c27smpuuM=;
        b=OyjdrN7NVTOExGLfhKtJm9GSZ2RVfFk/xkZnrEecPB9iotcPCrMZ2Q8c/TniVp3B6W
         5yW+SDFQxvmoCy0o8thxbZuJmk+pgbHewV77RqCoKgDb03xEauT2xmfc6das6cHprW+e
         IDY5FMPAaQGvea/QuGlMBiS7UhHMV8G8N/N0wbiFW9poyv0xCDha5lKX2TkBebkxxv9Y
         FY8/MghGPDnmzTYno8Y7vHm/fAgjEN7jBB0MrSr/vzVjptuesFyNZav4+tG8BPB2yIuB
         CU21ZlOyfsbeP6xKt1ovjqwOAumOZ8fK+ScVWHnMkmOKQlcKvFlD4aSmeR5lvgn1gPZR
         gzjQ==
X-Gm-Message-State: AOAM532tr+tOoYu4Tcda8WxcOYzBnHAgzDbhouSKK8MLqIb4H25dzHfa
        OR4LtbLrhVw82k42xPPbElYqcLLxsn6vgVTBumlWEIheMMmFtA==
X-Google-Smtp-Source: ABdhPJyBYKaUXGeT7ru4rgRC6OKS2A7qyDna6VLNHBBspM26S5nzG8vnM51ZcKvjNnVklS/ne+kH+hlH6xWzrwzcpBk=
X-Received: by 2002:a2e:85d1:: with SMTP id h17mr6337934ljj.438.1611217534069;
 Thu, 21 Jan 2021 00:25:34 -0800 (PST)
MIME-Version: 1.0
References: <mhng-8e7e9405-6528-4fec-8d2e-41eb7ec1362c@palmerdabbelt-glaptop> <BL0PR04MB6514410C82DBB40E645112E1E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
In-Reply-To: <BL0PR04MB6514410C82DBB40E645112E1E7A10@BL0PR04MB6514.namprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 09:25:23 +0100
Message-ID: <CACRpkdYCiiuBUnJGMea66Q=MEmp9hpYMm3bwYZg2YnSUbAPGFQ@mail.gmail.com>
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 1:15 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2021/01/21 3:21, Palmer Dabbelt wrote:
> > On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrote:
> >> Hi Damien,
> >>
> >> this looks all right to me.
> >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> Shall I apply just this one patch to the pinctrl tree?
> >
> > That's fine with me.  The DT bindings are in riscv/for-next, maybe it's best to
> > take those as well and I'll drop them?  I don't generally like to drop stuff
> > from for-next, but that's probably better than having everything all mixed up.
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=ed3137edb31b86702511e7ad12b4abe8686b6805
> >
> >> I think the line that touches arch/*/Kconfig should be dropped
> >> then, that better go to the SoC tree.
> >
> > I'm OK with you taking them along with my Ack, but if you don't want to that's
> > fine.  Just LMK
> >
> > Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> Linus,
>
> Please let me know which way you want to proceed. If you want to take the patch,
> I will resend without the Kconfig change and move that change to another patch.

It's fine to proceed as is, since Palmer already applied the bindings to
his tree, just apply the pinctrl driver there as well. I don't see any
risk of collisions in the tree.

Yours,
Linus Walleij
