Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A085B8835
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 14:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiINM02 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 08:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiINM0X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 08:26:23 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A58AF7D79B
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 05:26:16 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id a41so10133142edf.4
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 05:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=k9MKDLx1zeog5ZY0mV9PJDJQBpJXdcAQGVDM+T/iZyE=;
        b=qmVa7tLTdZ4KSZ75NW0cpBFP6z597wc/CMiyEvk9efwFimRXkiKOJsApb1NPN0fmAU
         TJq+WGVYc804vZ2WPTy69v1lUoPgeYJ9AaZbQEWmRiEaH/Ab0htLv0XAQg6qk0lo4I6E
         pKZT3S2Gwmu8UKJm0hC/lhd1AVTUkuroStGzJvifwyT3Hkxxoj9lcD212pohzNmT65AF
         g8p06/eQErClxoxQPNDOes29eo0stZKfRQwgQZpUVOnYxJrdpAP5q9i1JGyLcO83jxqe
         U5/zf3u2XgLeM8BF7FjdozR/chaWFvYzK713aG9z+4RM331mpkXnZ+EBhig7m+VT1vHA
         COfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=k9MKDLx1zeog5ZY0mV9PJDJQBpJXdcAQGVDM+T/iZyE=;
        b=2KLREyuBk4dYMbPlDs2DOPyMiNaZ6blzPLB2I81+qmze8K3MuRDNby1/HD+NAPptGW
         913N8GxoCMwQI55ED5E6DEI7Dva9HY6mTtFlZTw6Yi4Ax0KtOVr4nktizkccE72v0Rtm
         elG2rUcLnc2FcczO3oTz+Yrs1mQ6WVN0hZ25RMr719HF8Im45Uvw93Z5IsZHHb59nIhB
         fL0OQ2ruQMB7q9pFI7mFx8cakway9Fw9HYSHGVP4odnoYTuhPahjpbheQYn973fWYc7N
         EMih0AxxLymcZd4xyOMwarsA5lzJRrElga+YFT+Roe9Yw7YgS/Kjh/aPKJc1BGSCcLd5
         35tg==
X-Gm-Message-State: ACgBeo2EzSFIK1eu8XXS27VvWpo1oY13yCvXNYXY+F5plFj0Ceg9PCZ3
        BlMRfaXHED3gHJe63wa/IGYwyAVC5rjk9EQmcxd4Or5huO4=
X-Google-Smtp-Source: AA6agR70V6yk6E7yrt1VsCzInmzb0sjFBZ3tK/GKgE5x8Mfi8c2D6D4XoYotKo71IpJc+WIviIdGGUTxFy3wBbExO1c=
X-Received: by 2002:aa7:c84f:0:b0:446:2bfb:5a63 with SMTP id
 g15-20020aa7c84f000000b004462bfb5a63mr30393705edt.172.1663158374387; Wed, 14
 Sep 2022 05:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220909153802.3370088-1-colin.foster@in-advantage.com>
In-Reply-To: <20220909153802.3370088-1-colin.foster@in-advantage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Sep 2022 14:26:03 +0200
Message-ID: <CACRpkdYmC6wFX2NWmqmWXem-nNMY27nAPv4XDzhmDf21Nx-6TQ@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: ocelot: add help and description information
 to ocelot pinctrl kconfig
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 9, 2022 at 5:38 PM Colin Foster
<colin.foster@in-advantage.com> wrote:

> Add missed help information and module export name to the Microsemi Ocelot
> and Jaguar2 SoC.
>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Patch applied.

Yours,
Linus Walleij
