Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267865805C7
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 22:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiGYUie (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 16:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiGYUid (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 16:38:33 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F2922BF0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 13:38:32 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id o13so518202edc.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k5RQX+QWF+51OrTUsHoUUoS4fCYQ6NOhXVTW0sDYJgw=;
        b=cG0qT2Qy/oaAU/qZXPM8cJJf0FDPzcmza0dD0Sq5H8O0cj72vlfMeLQVW5eBsSdUU5
         KFbTcNFW3j1JfD4/4pf9Et5neXPIwG2Cqniwx1kfIj95mqlE8E/wMhNU3JVODQR4knLA
         bMOzEhql9EcSvC6p25gIQL6vWNDV7MJi1OvwzhM94mUMpZ0Zvn6C/5p0qITzdQWPgTIL
         YcyhUo/C5tKaxwU+B5DM8h65Im424kdTFfKTxAxWHV3Ot6spxBLu5qzyL/T306o4VTbN
         6pn4mPSyABItsxgjn2JiAqTUqjKWxI/9EXchTNH8taXZCGEyKcOsCYlJbjfE5X7r1pKE
         DULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k5RQX+QWF+51OrTUsHoUUoS4fCYQ6NOhXVTW0sDYJgw=;
        b=fwGz1+vDG99BE/2gRh6K7NE3VTUqWVfL8Dc8VMxdDvuztbwDSE+6bmZedBwMM7VuaF
         meHoMIiP8e9kQPZHe/igKG8Swy39VHBsANul2Yucco+XClChVAzIBiAcIMdFehAlDAab
         bz3pOnMfTbaxKu4IDOwpAEdylwlW9GqwMmNrhfGcKbqnPJeu7mSjVb3a+5lOboE/plYy
         FUhPZCnuwacgKJL91NPpX1onjS5QZsKqgk0B1zp8432SMrzQ38O+QF830nbJFXQs58f+
         8VL76B7W/3lKvNBAtVA/HfiN7bJ+iLDs0fcNVcEWMfWCQC5WNULIXepl4Wo7TcboZjr5
         otqA==
X-Gm-Message-State: AJIora8TSjKwBn7XmJTyDTEN5ITRmwq7zB6wev/z3ETOWdX63SYQZimY
        ReRH8Ycie9EUcr704O5qMeteKu3P21XPgv+GzNw=
X-Google-Smtp-Source: AGRyM1v0hQwnp+ZuQMm+E+slVqpuFt4Wy5E8DJRiLtqqcKOt4/9m6cOhfcupkWxEAM+EDoFiFC0WIGwraD+oAqtjfCI=
X-Received: by 2002:a05:6402:d53:b0:43b:a0cf:d970 with SMTP id
 ec19-20020a0564020d5300b0043ba0cfd970mr14659276edb.277.1658781510819; Mon, 25
 Jul 2022 13:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220724224943.294057-1-marex@denx.de>
In-Reply-To: <20220724224943.294057-1-marex@denx.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jul 2022 22:37:54 +0200
Message-ID: <CAHp75Ve0EQfee+eiDDG_pgzt8V3yoWeVfRZswG3EdFZZRyxa2A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
To:     Marek Vasut <marex@denx.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 25, 2022 at 12:51 AM Marek Vasut <marex@denx.de> wrote:
>
> The driver currently performs register read-modify-write without locking
> in its irqchip part, this could lead to a race condition when configuring
> interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
> the register read-modify-write.

...

> +       spin_lock_irqsave(&port->gc.bgpio_lock, flags);

To my surprise, is bgpio_lock not a raw spin lock?! How is it possible
to work on RT?

-- 
With Best Regards,
Andy Shevchenko
