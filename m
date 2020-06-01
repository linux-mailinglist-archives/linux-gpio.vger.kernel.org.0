Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE6B1EA067
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 10:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgFAI64 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 04:58:56 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:46922 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbgFAI64 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2020 04:58:56 -0400
Received: from belgarion ([86.210.245.36])
        by mwinf5d56 with ME
        id lkyc220050nqnCN03kypfp; Mon, 01 Jun 2020 10:58:53 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 01 Jun 2020 10:58:53 +0200
X-ME-IP: 86.210.245.36
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     daniel@zonque.org, haojian.zhuang@gmail.com,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
X-URL:  http://belgarath.falguerolles.org/
Date:   Mon, 01 Jun 2020 10:58:36 +0200
In-Reply-To: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Sun, 31 May 2020 09:37:16 +0200")
Message-ID: <87h7vvb1s3.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
> has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
> 'pxa2xx_pinctrl_init()'.
> However, the corresponding 'pinctrl_unregister()' call in
> 'pxa2xx_pinctrl_exit()' has not been removed.
>
> This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
> Remove it now to avoid some wondering in the future and save a few LoC.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Would be even a better patch with a :
Fixes: 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")

Cheers.

--
Robert
