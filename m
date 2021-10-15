Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0CA642F206
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 15:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239255AbhJONYZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 09:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhJONYX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 09:24:23 -0400
X-Greylist: delayed 1548 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 15 Oct 2021 06:22:15 PDT
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CB4C061570;
        Fri, 15 Oct 2021 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
        Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
        :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=o0wfY5rWG9bmKz4fgn2nS2DQacNRL7NBVJevnu+cu7A=; b=C4BLm5NskSbrQTV1sjBDGHez2B
        Bb9TCosJPdsS3LYNjtqn7rEp5XDA3EZZLlAsYyjnOXOXTNOIIHA9zB6eHu3G6sTJEfVJRe81gxD2f
        pQwakmwJIfNhZN2HSYcyXmTbgLp5xpJimHu9+xQNU+W2I/P6EZJ0tYtxzogoXGR+CE8tzRVBALNe1
        AvTIQc2Yid5js5hUlYgBszJugfslQewUiudB5VoKuCwj4N2I2X9sDKxKzkkWYAlOAGgzsaoED+YBw
        xCDxOaWlqyKmGWCWinE5mBcM8PlQDA6Ue/pQwnmLzNr14iNVdB2oK6unt7vEatV0fjd6QC87JCLrG
        mwOwocig==;
Received: from a2ef-817a-a3e5-8122-5100-87f3-07d0-2001.dyn.estpak.ee ([2001:7d0:87f3:5100:8122:a3e5:817a:a2ef]:52775)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1mbMl5-0000tY-BT; Fri, 15 Oct 2021 15:56:23 +0300
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210621172053.107045-1-maukka@ext.kapsi.fi>
 <20210621172053.107045-3-maukka@ext.kapsi.fi>
 <CAHp75VcjGpveAHNAW7Xf7d_Zf6LGSSyD6+qBiF9xxvb+EKs3tg@mail.gmail.com>
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
Message-ID: <c7b9688f-5f52-94e3-532c-2177132869de@ext.kapsi.fi>
Date:   Fri, 15 Oct 2021 15:56:23 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcjGpveAHNAW7Xf7d_Zf6LGSSyD6+qBiF9xxvb+EKs3tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:7d0:87f3:5100:8122:a3e5:817a:a2ef
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v5 2/2] gpio: gpio-cascade: add generic GPIO cascade
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 21.6.2021 20.43, Andy Shevchenko wrote:

>> +       gc->of_node = np;
> 
> This should be guarded by CONFIG_OF_GPIO.
In the Kconfig I have a dependency to OF_GPIO. Is the guarding still 
necessary? Or should the guard be added and dependency removed? Or have 
them both?
