Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19F82162F55
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 20:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgBRTC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 14:02:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:43282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726291AbgBRTCz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Feb 2020 14:02:55 -0500
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E1B0324655;
        Tue, 18 Feb 2020 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582052575;
        bh=yGg6yNRaAc7iDhwPELABRLvrPSnaAFrFM+ijBgVtWoo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dQJS5bcavE0VoZy3dS/+CN4EqnAgMsL2HFP6co6j0tfwA/VryfUjJD+jLWGKNgP/s
         7QO45qSnZKAlxcLswZk8QyTW0yHgO6D+IZvIOhyIhkmq9+QCOiyce6wE7ufDXvGxU2
         pRuXmqKCuzRTX4I3uR6QSvrSq7TyLtxmGr0TfG/w=
Date:   Tue, 18 Feb 2020 14:02:53 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck Lenormand <franck.lenormand@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] firmware: imx: Align imx SC msg structs to 4
Message-ID: <20200218190253.GW1734@sasha-vm>
References: <3a8b6772a1edffdd7cdb54d6d50030b03ba0bebb.1581455751.git.leonard.crestez@nxp.com>
 <20200217062129.GB6790@dragon>
 <VI1PR04MB7023CDE9E4AD086F2E926495EE160@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20200218091831.GB6075@dragon>
 <VI1PR04MB7023C1C536805130D9429E11EE110@VI1PR04MB7023.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <VI1PR04MB7023C1C536805130D9429E11EE110@VI1PR04MB7023.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 05:48:50PM +0000, Leonard Crestez wrote:
>On 18.02.2020 11:18, Shawn Guo wrote:
>> On Mon, Feb 17, 2020 at 08:37:45PM +0000, Leonard Crestez wrote:
>>> On 17.02.2020 08:21, Shawn Guo wrote:
>>>> On Tue, Feb 11, 2020 at 11:24:33PM +0200, Leonard Crestez wrote:
>>>>> The imx SC api strongly assumes that messages are composed out of
>>>>> 4-bytes words but some of our message structs have sizeof "6" and "7".
>>>>>
>>>>> This produces many oopses with CONFIG_KASAN=y:
>>>>>
>>>>> 	BUG: KASAN: stack-out-of-bounds in imx_mu_send_data+0x108/0x1f0
>>>>>
>>>>> It shouldn't cause an issues in normal use because these structs are
>>>>> always allocated on the stack.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>
>>>> Should we have a fixes tag and send it for -rc?
>>>
>>> I haven't check but this would probably have to be split into multiple
>>> patches because the structs were not added all at once.
>>
>> Or maybe we can just drop the stable tag, as it addresses a corner
>> case issue which could concern very few people?
>
>I think that "kernel does not boot with KASAN=y" is an issue worth fixing.
>
>I will split and resend with appropriate Fixes: tags.
>
>It seems likely that this will be picked up for -stable anyway via
>Sasha's automation scripts and those scripts benefit from Fixes: tags.

Even if not, we realy very much on KASAN working on stable kernels, so
please do fix this :)

-- 
Thanks,
Sasha
