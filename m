Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24EF5BBC8E
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Sep 2022 10:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiIRIn4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Sep 2022 04:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiIRIny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Sep 2022 04:43:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE902182D
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2022 01:43:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E668612FE
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2022 08:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB99C433D6;
        Sun, 18 Sep 2022 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663490632;
        bh=BeEJMqsIZckkIoyfb97fL3eCeMgGq/73acDXPV3lx8Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=q+AksA8TCsnCAyID1fKEMUuhHdKZ+aCUOQQGz+NaY0STydXTR+82EdyKqEFKHVt9B
         /Jv0ykJmtKIl82EXv7zzvdaX+8krrzVZ1j6m2eNCrK7k5hAZmJjMPD3RsKlswjovjH
         mhe13sL8O7ENnxZRQVbumfLm1g9ymIPouA0rT4oWHWgz6EI3x24wzreVhz4mI5Xcqy
         6YVgjWT8LGiONPxprz7XGQVzhCh8ZkrsB6nYepLGo8Na/lqu1xEd5RaGv+NiQzO9YT
         FvTSx4yYhkzNuyOuWlXlTnVCBHeVWJk1ALlrHcdWw1Yglu90EoedIvSKx+ZWs095L3
         ccfPGBDoZeVnQ==
Received: from 185-176-101-241.host.sccbroadband.ie ([185.176.101.241] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1oZpu2-00Arzx-DR;
        Sun, 18 Sep 2022 09:43:50 +0100
Date:   Sun, 18 Sep 2022 09:43:49 +0100
Message-ID: <87leqhkr7e.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2 v2] pinctrl: nomadik: Dereference gpio_chip properly
In-Reply-To: <20220917203036.167607-1-linus.walleij@linaro.org>
References: <20220917203036.167607-1-linus.walleij@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.176.101.241
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 17 Sep 2022 21:30:35 +0100,
Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> The irq data passed to irc_chip handlers i the struct gpio_chip

s/i/is/ ?

> and nothing else. We are just lucky that the nomadik chip
> pointer is first in the struct. Use the proper dereferencing
> and helpers.
> 
> Reported-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - New patch for a bug identified by Marc.
> ---
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c | 30 +++++++++--------------
>  1 file changed, 12 insertions(+), 18 deletions(-)

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.
