Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC551EC36D
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2020 22:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgFBUIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jun 2020 16:08:05 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:23547 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbgFBUIF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2020 16:08:05 -0400
Received: from [192.168.42.210] ([93.22.133.243])
        by mwinf5d52 with ME
        id mL83220025FEkrh03L83SZ; Tue, 02 Jun 2020 22:08:04 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 02 Jun 2020 22:08:04 +0200
X-ME-IP: 93.22.133.243
Subject: Re: [PATCH] pinctrl: freescale: imx: Fix an error handling path in
 'imx_pinctrl_probe()'
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, linus.walleij@linaro.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        stefan@agner.ch, gary.bisson@boundarydevices.com,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-arm-kernel@lists.infradead.org
References: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
 <20200602101346.GW30374@kadam>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <9e186840-aece-cfcc-918a-8441db9f6f7b@wanadoo.fr>
Date:   Tue, 2 Jun 2020 22:08:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602101346.GW30374@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Le 02/06/2020 à 12:13, Dan Carpenter a écrit :
> On Sat, May 30, 2020 at 10:49:55PM +0200, Christophe JAILLET wrote:
>> 'pinctrl_unregister()' should not be called to undo
>> 'devm_pinctrl_register_and_init()', it is already handled by the framework.
>>
>> This simplifies the error handling paths of the probe function.
>> The 'imx_free_resources()' can be removed as well.
>>
>> Fixes: a51c158bf0f7 ("pinctrl: imx: use radix trees for groups and functions")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
> You didn't introduce this but the:
>
> 	ipctl->input_sel_base = of_iomap(np, 0);
>
> should be changed to devm_of_iomap().
Done as a separated patch.

Thx for the review and the comment.


CJ

> regards,
> dan carpenter


