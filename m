Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7DC38BFEA
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 08:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhEUGpm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 02:45:42 -0400
Received: from mleia.com ([178.79.152.223]:54480 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233652AbhEUGpd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 02:45:33 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 5050F39A5;
        Fri, 21 May 2021 06:44:10 +0000 (UTC)
Subject: Re: [PATCH v3 3/3] pinctrl: single: set pinmux from pins debug file
To:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20210520202730.4444-1-dariobin@libero.it>
 <20210520202730.4444-4-dariobin@libero.it>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <2ef7f7f9-b147-8292-85fb-bcf58a2b6428@mleia.com>
Date:   Fri, 21 May 2021 09:44:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210520202730.4444-4-dariobin@libero.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210521_064410_352838_FA42BC3B 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message. 
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Dario,

On 5/20/21 11:27 PM, Dario Binacchi wrote:
> As described in section 9.1 of the TI reference manual for AM335x [1],
> "For writing to the control module registers, the MPU will need to be in
> privileged mode of operation and writes will not work from user mode".
> By adding the pin_dbg_set helper to pcs_pinctrl_ops it will be possible
> to write these registers from the pins debug:

this makes little sense, because it should be possible to write to the
registers without introduction of this interface, pin group/function
is the right level of abstraction for your particular task.

> cd /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/
> echo <pin-number> <reg-value> >pins
> 
> [1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

I strongly object against this new interface to be added.

--
Best wishes,
Vladimir
