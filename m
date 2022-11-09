Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3825C6225F7
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiKII5e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:57:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiKII5d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:57:33 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D40A1839A
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:57:32 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id v27so26203335eda.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 00:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z1hRKXwVB2zqbRKgazpAfelVDfIB83QYMnKU9WhNPso=;
        b=QiKNjIZP/NVw66cQ9HADd5LIkfQP6F8jpVSgENrQ+wAerOTYi6IsDpRXH47Zk3W9R9
         pr5AGBcM1N0WIWn9g8db9WpudVrZcwyBTWM34qSivLKNlcZGTQ+urNwmVdMuWXUMMlcq
         RvFQ2Xx+ijsh+2wQCLv8iWhJ7AeEzbq94/VcnRCFvZSRrJMFD5dV7F+Z1LUW1ItqUUos
         vXkffc0YcJOwDEpwm3Bh3U4fiof/i+c1Q1eMbOYF+1nqgKhck5GR2b6qRYSaDyYv+vSn
         m2DtbLqFRW9hQoWLJ+n1vI4YkuqI9UYtOIwq7S944lJfcEaTgRnmvMdWVMM4aZUJ/gph
         9BtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1hRKXwVB2zqbRKgazpAfelVDfIB83QYMnKU9WhNPso=;
        b=ct0DU1gE9Hz5zDpwD3hFAeDjvIN5s8BmZrpTxwTkahgl3pXN9Z2zJh3dPmjYEOj5T/
         40TaGNAMeKrbIiqa6cnFx+3IThjxmVSSy428ioY9y95Mq9arjQjtifx+OyvXznUkNIlN
         6HnIcN0PA5rw9i8TfxGFn2zlX3kMdUWNSSQYDpT+Z/X8oYt3ezxYrzH+T4C+K/nsrCTL
         tlUVGxu3qDr0NbSJLBoOCftWGg2k747Y6bYigHkba3shRSt1f5hB2SmRDC5fNQ4JINc4
         tpv7AOYrdLON1pn/9UQO1e2fynWKG+fJd5LQp2P02tsr4d6TTnHipfXvQtYIUe4aMngh
         s1Nw==
X-Gm-Message-State: ACrzQf1AVA7alpyLXxPGN/9rF4Z02sumeKWqFZ1KeJ8tnm2AmPdISFaD
        iGVoLNBTMH/zpl7T84wvDibwpwx2p0+ofOlyUscmeQ==
X-Google-Smtp-Source: AMsMyM4wV6ZrQBRO3Nus3KwHc/K2UYSxn2KzEQnw8XZfrBH97PBwEteETvQa+c6qsQ5UQ/srBrkGOVcgEJ7LRr1Jhos=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr59359972edb.46.1667984250985; Wed, 09
 Nov 2022 00:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20221108094529.3597920-1-liwei391@huawei.com>
In-Reply-To: <20221108094529.3597920-1-liwei391@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 09:57:19 +0100
Message-ID: <CACRpkda6ghdCq2-yktqGSYRjQzO=5gW3V_F7R2oxtgTGOF10bw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Correct the header guard of mt6795-pinfunc.h
To:     Wei Li <liwei391@huawei.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        huawei.libin@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 8, 2022 at 10:47 AM Wei Li <liwei391@huawei.com> wrote:

> Rename the header guard of mt6795-pinfunc.h from __DTS_MT8173_PINFUNC_H to
> __DTS_MT6795_PINFUNC_H what corresponding with the file name.
>
> Fixes: 81557a71564a ("dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl bindings")
> Signed-off-by: Wei Li <liwei391@huawei.com>

Patch applied as obviously correct.

Yours,
Linus Walleij
