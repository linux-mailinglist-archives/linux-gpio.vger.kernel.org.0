Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7789A5EA6AD
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 14:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbiIZM6c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 08:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235880AbiIZM6I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 08:58:08 -0400
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3356B662
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:31:40 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id z6so9745785wrq.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pYI5zmDFx/C+Gngj0n9osNCGzV4YuNxNfzv+IfUjAvY=;
        b=VF1hX6ebYRmgkJzzQVGKqMJ+8IoUaAc6k6Mf9Ksbsimsz2qlAFlzLJWZcjaRRkmLfh
         RgB5Zx1llE8IVjEM7vpij+/iTBO+SMY3ze8VS0iD1NqCWPvKmFTIE1iFF8OcPTuwlyhq
         C55whwJGJoQ2+km2IK5SYHh3QwaeecBjpFAkyAL5xlmsm9UcKX1/Pr3pd6qbJ2McWYXc
         Rxxcx2UlpZOIt5Nd124NPW35SCalyk9tIDPH7QA8EaPXAS/pL39kK7mXF0x1fIQBydmY
         EwRQyvrLaVQZ9RcbtVUTh4BztthZ/C8nbrJitFJk+Yo60OuGCf+Lx8wEzRYoWpUacn8v
         3low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pYI5zmDFx/C+Gngj0n9osNCGzV4YuNxNfzv+IfUjAvY=;
        b=Fw9l2Y7o3w5uUpYLbJ+W0M0wi2wB2SXIxXtuVBsmkdLhp/lzUAfjP6KzNYrIJGbH/u
         wCD0sDa9UZ016g5vNL/WZjupK4VvmR/RIDWYagbNLdyZQVoskH948LyRF6qL267eUYPk
         SVQGRKJbuJ9aNpShHeYBCB7g6oKj/cxQRPknE22LzBlCCf5njFZER7Ee2WWBLHoUQvrd
         LnafQmfCoZzOTWcpupp4H40oD30VH8/lKUt1WUtRpkEOysYlO5rMX26bWlhZGHHxJP8Z
         DsK69DX7Z6vU686rO0mdtWFfCtXa8VWIKvrI9fB6WlkCUfjiEg8hRRE5x1yAJZJSDW5G
         RYrg==
X-Gm-Message-State: ACrzQf1czWSUGZt3sGOwNfCmPd8MOCbjMYdFSzQEGx5pf54XUq68FnGr
        kxMirxGbJbeTjXAhEPyu1vE1WM8+ihshrBkzItVwjuxg5to=
X-Google-Smtp-Source: AMsMyM47axr3KS3piWD9iwfWMUqziIc4l9f9La8IAm+EGnHJdjvZlrwb24HERQLurx0j3CqQAiTH0gyMfm4RU1ok/Rc=
X-Received: by 2002:adf:e609:0:b0:22a:a6fd:cfe1 with SMTP id
 p9-20020adfe609000000b0022aa6fdcfe1mr13645240wrm.0.1664191499269; Mon, 26 Sep
 2022 04:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220926084428.1792815-1-weiyongjun@huaweicloud.com> <20220926084428.1792815-2-weiyongjun@huaweicloud.com>
In-Reply-To: <20220926084428.1792815-2-weiyongjun@huaweicloud.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Sep 2022 13:24:48 +0200
Message-ID: <CAMRc=MfjB4QTf_zp5Rk3T_ndqDjCCjAW2HmGpJ9EF-i1epSLcw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] genirq/irq_sim: Allow both one and two cell bindings
To:     Wei Yongjun <weiyongjun@huaweicloud.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 26, 2022 at 10:27 AM Wei Yongjun <weiyongjun@huaweicloud.com> wrote:
>
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> The IRQ simulator only support one cell binding now, this patch make it
> works with either one or two cell bindings, where the cell values map
> directly to the irq number and irq flags.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  kernel/irq/irq_sim.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
> index dd76323ea3fd..73a90b7b6022 100644
> --- a/kernel/irq/irq_sim.c
> +++ b/kernel/irq/irq_sim.c
> @@ -149,6 +149,7 @@ static void irq_sim_domain_unmap(struct irq_domain *domain, unsigned int virq)
>  static const struct irq_domain_ops irq_sim_domain_ops = {
>         .map            = irq_sim_domain_map,
>         .unmap          = irq_sim_domain_unmap,
> +       .xlate          = irq_domain_xlate_onetwocell,
>  };
>
>  /**
> --
> 2.34.1
>

You'll need Marc's (Cc'ed) Ack here.

Bart
