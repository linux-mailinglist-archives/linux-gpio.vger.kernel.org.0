Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E735F3263
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Oct 2022 17:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiJCPU7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Oct 2022 11:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiJCPU5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2022 11:20:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1012F1
        for <linux-gpio@vger.kernel.org>; Mon,  3 Oct 2022 08:20:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E3B161120
        for <linux-gpio@vger.kernel.org>; Mon,  3 Oct 2022 15:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09ECDC433D6;
        Mon,  3 Oct 2022 15:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664810451;
        bh=WC+BosNXx1F1F2jeMKQrKPR3/Ya2Z4QIVSXxpRp1RHI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uhXojpUkeekElDcvteue3LHErnhqTM5aa5K4GLsWAI1U+S0zm/aOZ/wkWLO9T7kTn
         4Z9fUT47iMv28+NGwya86UIwDYBxtw+d+mzVssafbKx+DV4tOzqC5/izOCfmX2enQT
         utnimw6ihEPs9C5UVD3/SNVF82DNDAO0rw/IuQOsxhR5YsMK5wbvQod51RNqXSNivN
         UvAnxwtQP8dVRbVqH0Lss97jSxq4H+rtUaiL86fdKcAzKOA+l3+uVhCIcYpMFoMhUE
         u0rJW3l7hRX6ME8CvoARjPYZrdlxHQaWmOAq4vY3X/Q9b2tCEgJg6gyKuTievFiSJK
         2+i7IoO2a9QAg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1ofNFQ-00EKTA-M7;
        Mon, 03 Oct 2022 16:20:48 +0100
Date:   Mon, 03 Oct 2022 16:20:48 +0100
Message-ID: <865yh1aq7j.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2] gpio: tc3589x: Make irqchip immutable
In-Reply-To: <20221003074520.2526581-1-linus.walleij@linaro.org>
References: <20221003074520.2526581-1-linus.walleij@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 03 Oct 2022 08:45:20 +0100,
Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> This turns the Toshiba tc3589x gpio irqchip immutable.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Add the proper gpiochip_disable|enable_irq() calls in
>   mask|unmask, oops.
> ---
>  drivers/gpio/gpio-tc3589x.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.
