Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE615A3DE8
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Aug 2022 15:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiH1N7i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Aug 2022 09:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiH1N7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Aug 2022 09:59:37 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE4332D84
        for <linux-gpio@vger.kernel.org>; Sun, 28 Aug 2022 06:59:37 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bj12so11012520ejb.13
        for <linux-gpio@vger.kernel.org>; Sun, 28 Aug 2022 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=/oXOPWWho/MuSiQT7Uwd2bmMqCA70Z1crzuATK2DbsA=;
        b=ouo/IBCxMkmbXhwGxeHVl2gsqINhm601cdsvEhPUGY6qWNNa52fNuRXDq8RFHGHrtk
         e29f7Wo4BwC3C0kpvd5hmfCqzJRDErIiLGmGH9RBbm0cLLnBU/cf1nJ3apT6RNxcc0bv
         qWCoXDFj71b2dyjNsQ4WyvYku7cLHM0JCtUpE/h5OF+BGix6eAoNnDnrHVR7zpCdWo3c
         lsLgimCckysaqCvBoWH1fI+rAhGXcaeYvQ9xeBJSgMlY6jkohwh/G7q3lrlVgjfon4o6
         aV8zfODxzcnOARHLphRuuIu70iXKYr9D+C0AoHsy3OK7yQmrXrS0ahtYOl17G0+I5S8I
         m26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/oXOPWWho/MuSiQT7Uwd2bmMqCA70Z1crzuATK2DbsA=;
        b=GDwwiAPFvmAtnsHixuSPGH1EbU0/Wx/tO3T7OoR6qT18yS0zAQO+/RIncfKajBHcc4
         oy7WAyYCZx0pXiOqVStOifH8JiblKWCm9UnAcRssbNawjJL4+7i3R7NxyVoOGqDZBFXb
         vhCL/SGEzEWSgtBzNAw8UgnTme+F4WQN6PbX225ddHgJ+vZKK9/Q9nXu3IeTq2tG8WKt
         6nXJzXk+o6z33d20/Z9AkTbTvIjBppvSPuxZcwn/m8Fv/nYphZQ2UIPrPaTfzI6KdqFh
         TbtwpO5HFiaTsj1Oyv7VCLsYaBGMpPr8rLi8xvWuCGYizNrdQI1voHHcLLlTHdmA+7Se
         D6EA==
X-Gm-Message-State: ACgBeo2Sq2mQ4Lbefkl+Zovp9NiEtOSL5UEzgQF8DUsluf+OxJol33sw
        0bTb9Ntbgcen80jJEdqGKXnSLzDhD2HW6Sc1AINXyg==
X-Google-Smtp-Source: AA6agR7YZfNeHP3K48zotp2yhXazjSBcEAh22Z5nB3LJfkHa3QjLVDhFde/F31kKRKK2Mi9O4fOkD40TxWD1/+aDsQU=
X-Received: by 2002:a17:907:7254:b0:731:61c6:ecf9 with SMTP id
 ds20-20020a170907725400b0073161c6ecf9mr10982053ejc.101.1661695175478; Sun, 28
 Aug 2022 06:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220822041025.3221406-1-weiyongjun1@huawei.com>
In-Reply-To: <20220822041025.3221406-1-weiyongjun1@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 28 Aug 2022 15:59:24 +0200
Message-ID: <CAMRc=MdM7JMVBRPHUhmYURcu7D9dpBH6d+=9yCiTNtwpTxHpNQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mockup: remove gpio debugfs when remove device
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 22, 2022 at 5:52 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> GPIO mockup debugfs is created in gpio_mockup_probe() but
> forgot to remove when remove device. This patch add a devm
> managed callback for removing them.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: return from devm_add_xx directly as Bartosz's suggestion

Applied, thanks!

Bart
