Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDEA5305C6
	for <lists+linux-gpio@lfdr.de>; Sun, 22 May 2022 22:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234866AbiEVUNl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 May 2022 16:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351169AbiEVUNk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 May 2022 16:13:40 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE29E369DA
        for <linux-gpio@vger.kernel.org>; Sun, 22 May 2022 13:13:37 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id i27so24815421ejd.9
        for <linux-gpio@vger.kernel.org>; Sun, 22 May 2022 13:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OpzbHgH536qvvso8nHRdp83iD1CHXw2nkTEr7wls1Q0=;
        b=6nGbt3awrMH1pvnqrHq1mc3E5sd2FK6KeJ/MlsdnrBXjODFn0wt+SA7+RQSAQp+WA3
         r8s8xHLgnmB5ghMBS7/6tEYcS5FEPfQD8VqxMQF0DT7/obAYsVUhXiI/GcMwZ6T20GZi
         LNb11KDw3RUakcFtmz5EEjh+q6LxaXxgtrwP8r9THvlrABBF+VM8sypIhiD7hshE5n6Y
         GL/mrX/+vbB4cmANUE5Ll8f7n8xqSeDBo9kjbktGZimj102mH2uXxFUuxHyp41alJsXf
         +t6oaLNU6xgXJF2e3JSzju0N1JHwRkOBzeLU5G1iv3eABFTGFAT3Xw4YXkS4WNSStGuV
         ugLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OpzbHgH536qvvso8nHRdp83iD1CHXw2nkTEr7wls1Q0=;
        b=ypQjhBceCtCesN44AqHdIHGfocXDqntwtuR/3E27SZAOcDpRFRngYr/d+jmA5Qq73d
         ZqrTmV3+WBFMbr78pkcxVoUDNOvSy4n84iGqczO1ZwJEMxenqbzW3KJcubJv0wzSwZIF
         abbEmo5itlkjtfrMfaAhEdfujn1tWs7mcoRm3WszEwmo+VBwGovef7XbMIg5yDmH+X7a
         MomhdrAgAfn8b3SiqKISqe9vg+RaPR4OXGLPh1739cGfjI7qS21Zy5732auPJoUrwyng
         r2PTf+otIuKjQy7+6hey49AaR70u3VB5PPmKxRnHPD0niOZ/TN4S7J4ErMdWYHKkQmYV
         ++JQ==
X-Gm-Message-State: AOAM531Cyh+06w+NS8flFWJy+cDILQ4UcsqwhMoEMgpREv4bbupL/X0x
        arvwJH8b8DyqWn1LuXow/5kK6xXRr5E0UZSC/kUjSg==
X-Google-Smtp-Source: ABdhPJxYuVG1TaflrhFCdv4pTHDcixd6ZXCps1dkNigoWccxm378qOu6FSEC8rD33asST84y8ugHUZ1ip+fPOWHHT+A=
X-Received: by 2002:a17:907:c28:b0:6f4:2a80:f355 with SMTP id
 ga40-20020a1709070c2800b006f42a80f355mr16517780ejc.101.1653250416319; Sun, 22
 May 2022 13:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
In-Reply-To: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 22 May 2022 22:13:25 +0200
Message-ID: <CAMRc=Mdf_PHyC3doO4KfzeTJz+WT2VZE6pxADOxz3_Sy9jPGqA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: dwapb: Make the irqchip immutable
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 20, 2022 at 12:23 PM Geert Uytterhoeven
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
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against gpio/for-next.
> Boot-tested on SiPEED MAiXBiT (Canaan K210).
>
> v2:
>   - Factor out hwirq using preferred helper.
> ---

Hi Geert!

I'll pick those patches up for the next cycle to let them spend some
time in next.

Bart
