Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB08C38BFE8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 08:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbhEUGpb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 02:45:31 -0400
Received: from mleia.com ([178.79.152.223]:54460 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233240AbhEUGpa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 02:45:30 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 6F5943990;
        Fri, 21 May 2021 06:44:07 +0000 (UTC)
Subject: Re: [PATCH v3 2/3] pinctrl: core: configure pinmux from pins debug
 file
To:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
References: <20210520202730.4444-1-dariobin@libero.it>
 <20210520202730.4444-3-dariobin@libero.it>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <87ea9971-9e15-c595-95cc-14c68b0b68d8@mleia.com>
Date:   Fri, 21 May 2021 09:44:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210520202730.4444-3-dariobin@libero.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210521_064407_482056_69BD8F55 
X-CRM114-Status: GOOD (  11.19  )
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Dario,

On 5/20/21 11:27 PM, Dario Binacchi wrote:
> The MPUs of some architectures (e.g AM335x) must be in privileged
> operating mode to write on the pinmux registers. In such cases, where
> writes will not work from user space, now it can be done from the pins

user space has no connection to the problem you're trying to solve.

Please provide a reasonable rationale for adding a new interface, thank
you in advance.

> debug file if the platform driver exports the pin_dbg_set() helper among
> the registered operations.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

I strongly object against this new interface.

As Andy've already mentioned you have to operate with defined pin groups
and functions, and so far you create an interface with an option to
disasterous misusage, it shall be avoided, because there are better
options.

What's the issue with a regular declaration of pin groups and functions
on your SoC? When it's done, you can operate on this level of abstraction,
there is absolutely no need to add the proposed low-level debug interface.

--
Best wishes,
Vladimir
