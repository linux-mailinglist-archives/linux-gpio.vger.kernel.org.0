Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87CC652BDF3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 May 2022 17:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238978AbiERPBQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 May 2022 11:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239160AbiERPBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 May 2022 11:01:05 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD1B2CDCA
        for <linux-gpio@vger.kernel.org>; Wed, 18 May 2022 08:01:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id en5so3417173edb.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 May 2022 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QMOlyN/qTFm2XsoAL3zOzGQtzc1v4ZBdV7QAODxVM04=;
        b=S0/LlJPilupWVBxbepDWd4ALkj1jqFqOGpfsYt4oZz1IbJPM2jChXarVWCnPFrIQy9
         hu+uwPwW+dDlDg40DIBipE6hUIF+wt9Go2ORD00La3rPSt5ZM4A7EA+HWaxRqKql3jBg
         PM5Z4S/a3eM9dT8FMxAWQjOUqRtNfmTPxZlmzlCrpcT9qLLizJLUhLxpkxpj1SXuGHi+
         fLtlM7OvbfQQQhfiimB6ceSJKoRTW5RkRzk+nw2SkhaqBHDUvzffTR6ZIj+tx/L5IyMl
         aZkm37p4XFtuIYaoXm4tPfoiMUacEeEXWpqPzpnl5kmFA+0CGb1S6fXTYHw1ROypza5V
         2pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QMOlyN/qTFm2XsoAL3zOzGQtzc1v4ZBdV7QAODxVM04=;
        b=l+C/WoG/vdWSJqvy5mp1kqh0SF8xHfGYTFJcJvgQZ+k9OXeaUO008F2iDEPc6JOh+k
         CdkbfpTM1fmrhEIUUvaOKzg0DHah81NlYmtogz0cCR4UmvZG3uHeksCSwTHjaEIWproM
         3CeZZVURJNrXs3Jy59SaSeOVFU1CnhMIlbMTCFCv0jPsCCubeENQP6x5UGe6hphc/nLt
         6YWNPUwHJR4cWGZwjpM8qs/5qIPm+nI1WprbDCZJ59rR8W4YNClEKIYJJ3Y4HefMyY20
         BNE2ncavVsPPa89uCuokHreWYAroOKvrmxkHqmWq40YBQG3Q/6BHKwHyQsvGmfvnwAf4
         2njw==
X-Gm-Message-State: AOAM5309ehITAuGfk+z5qXIgfvegdLaw346MhetfQ3dtL7aRO48x1YH0
        EdT30VloggPP0LZinfkvWKUbWMU7BM7hKx5VQXY=
X-Google-Smtp-Source: ABdhPJx8zUUBtXzXZ1/JGjDJmNbcSqyN0kVGya8Y12DFmgeWY/u12Mwo4rQLwdEYIPgK87Ktme506w5enXxDiPAOj64=
X-Received: by 2002:aa7:d911:0:b0:42a:af69:e167 with SMTP id
 a17-20020aa7d911000000b0042aaf69e167mr189743edr.54.1652886063021; Wed, 18 May
 2022 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <e6380b316db23ee03a9adbf0a7d1ad83538f9961.1652884676.git.geert+renesas@glider.be>
In-Reply-To: <e6380b316db23ee03a9adbf0a7d1ad83538f9961.1652884676.git.geert+renesas@glider.be>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 18 May 2022 17:00:26 +0200
Message-ID: <CAHp75VcWuYM=STsNW5mP19UBTkNmnhP_Ed+pUxoAhTU3JiWXtQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Make the irqchip immutable
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 18, 2022 at 4:40 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the dwapb driver:
>
>     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the dwapb driver immutable.

Same comments as per PCA953x driver.

-- 
With Best Regards,
Andy Shevchenko
