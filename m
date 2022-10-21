Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F591607467
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 11:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbiJUJqW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 05:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbiJUJqI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 05:46:08 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1600E119BF2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 02:46:02 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b12so3698313edd.6
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P0AQ9jlIG0ZlvzZh3L6x6ssa+d2wthNDGpp7sZigdE0=;
        b=cG4KlR0WMgI8n0RL9tPbQKHpLmpWAy4o2IAPJd8z9JPATgL6wkGWn1syeb41X7r/Pv
         yzVQorDXy0VFPWSjH4a4bdVp027IK/n2Xc16MEYT6sLb6txOLoObjDPnirfmf9Jf+viY
         psyaYkhqNzPuIxnahH4HJTNrxECNzZkflw4wBM/Bwcb7qpgc2o9+hH5o1xo+ELEQ90V8
         EgIrikhasfiFC/VAz7m5Ah0e8Y93ujtecy4t/MNqttY+PKhlLUF1vJfsm23h5h/4cJaM
         MP8vjsF9u0NLT5ZpVdvTvkwV9TyrH4zI+Q0lTzef1RuZ16RZgtsl/ROREzQILVoPRFdA
         MBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0AQ9jlIG0ZlvzZh3L6x6ssa+d2wthNDGpp7sZigdE0=;
        b=GZdh5ZFyyABLDtvF6hHNMvQ+8+mWTNGHpZx5CEYENjcZbjpi27QPofwAiRiYlhBtgK
         pH/MENmFSq4kZ5er5VIlIPAr2PRl2eaA7cOJAXwQGUwIDr11z+J5GanDzvjhh5mbj5cD
         IXA7ihhWazZKrT8qfqqWnWVeeozh+xRWgQqNzSq8Yc9UeujYlMmpQ2Irf7hHwzU8ydov
         Bd7+k5Jjmt4djVMP2IknzcnIyAJxVpwJpEDwwxACdNkSARuDwyuu7+KBOuML5CAOYq9U
         8u7H4FbYJ0EvcrzdCffDVVoXexUgZPcN6x21T4EkR84SJdrBstI8NnH6cNLB8ruH0YgS
         i0TQ==
X-Gm-Message-State: ACrzQf3pGIskKI/bkqyyyE5sLTXlY0po7PZ1phMmDSLH+Xm5orSvMVAb
        cwYn7pBPjmi1kosOVM4vvqMt1QOVdC3ZD5nWGbW3nA==
X-Google-Smtp-Source: AMsMyM5t02ffZNLPF+/SKV0t2zSPdKi04tT1VyQMGwlcqH6o8oaHN9NJPnaobBhqe+u0XBPphswad6nycmwYjCaoaLw=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr13887723ejc.690.1666345560588; Fri, 21
 Oct 2022 02:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221021012728.22373-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221021012728.22373-1-zhuyinbo@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 11:45:49 +0200
Message-ID: <CACRpkdbBW1YNGfec2jEPsUGwqosc8TwwSP9ft+he5KWPf0otvw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: pinctrl-loongson2: add pinctrl driver support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        zhanghongchen <zhanghongchen@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Yinbo,

thanks for your patch!

On Fri, Oct 21, 2022 at 3:27 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> The loongson2 SoC has a few pins that can be used as GPIOs or take
> multiple other functions. Add a driver for the pinmuxing.
>
> There is currently no support for GPIO pin pull-up and pull-down.
>
> Signed-off-by: zhanghongchen <zhanghongchen@loongson.cn>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

(...)

> +static int loongson2_pmx_set_mux(struct pinctrl_dev *pcdev, unsigned int func_num,
> +                             unsigned int group_num)
> +{
> +       struct loongson2_pinctrl *pctrl = pinctrl_dev_get_drvdata(pcdev);
> +       unsigned long reg = (unsigned long)pctrl->reg_base +
> +                               loongson2_pmx_groups[group_num].reg;
> +       unsigned int mux_bit = loongson2_pmx_groups[group_num].bit;
> +       unsigned int val;
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&pctrl->lock, flags);
> +       val = readl((void *)reg);
> +       if (func_num == 0)
> +               val &= ~(1<<mux_bit);
> +       else
> +               val |= (1<<mux_bit);
> +       writel(val, (void *)reg);
> +       raw_spin_unlock_irqrestore(&pctrl->lock, flags);

Can you explain in the commit message or with a comment in the code
why you have to use a raw spinlock for this?

We usually only use raw spinlocks for things like low level
interrupt handlers...

My guess is that you can replace this with an ordinary spinlock.

Yours,
Linus Walleij
