Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDCA31A60C8
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2020 23:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgDLV6L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Apr 2020 17:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:52912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgDLV6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Apr 2020 17:58:11 -0400
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFC8C0A88B5
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2020 14:58:11 -0700 (PDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 1A488AC5B;
        Sun, 12 Apr 2020 21:58:07 +0000 (UTC)
Subject: Re: [PATCH] pinctrl: actions: fix function group name for i2c0_group
To:     Amit Singh Tomar <amittomer25@gmail.com>,
        manivannan.sadhasivam@linaro.org
Cc:     andre.przywara@arm.com, matheus@castello.eng.br,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org
References: <1586702060-3769-1-git-send-email-amittomer25@gmail.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <2d629e23-ddb1-6033-5ea3-fe9e02476e18@suse.de>
Date:   Sun, 12 Apr 2020 23:58:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1586702060-3769-1-git-send-email-amittomer25@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 12.04.20 um 16:34 schrieb Amit Singh Tomar:
> After commit 6f87359e8bcaf88381b9c9c038929e0e6872d308("pinctrl: actions: Fix
> functions groups names for S700 SoC") following error has been observed
> while booting Linux on Cubieboard7-lite(based on S700 SoC).
> 
> [    1.206245] pinctrl-s700 e01b0000.pinctrl: invalid group "i2c0_mfp" for function "i2c0"
> 
> This commit fixes it by using correct name for i2c0_group.
> 
> Fixes: 6f87359 ("pinctrl: actions: Fix functions groups names for S700 SoC")

The commit hash should have 12 digits.

Please also check the white spaces: The subject seems to have too many 
after "actions:", and there's one missing before each parenthesis above.

Regards,
Andreas

> Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
> ---
>   drivers/pinctrl/actions/pinctrl-s700.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-s700.c b/drivers/pinctrl/actions/pinctrl-s700.c
> index 47a4ccd..f579a65 100644
> --- a/drivers/pinctrl/actions/pinctrl-s700.c
> +++ b/drivers/pinctrl/actions/pinctrl-s700.c
> @@ -1435,7 +1435,7 @@ static const char * const sd2_groups[] = {
>   static const char * const i2c0_groups[] = {
>   	"uart0_rx_mfp",
>   	"uart0_tx_mfp",
> -	"i2c0_mfp_mfp",
> +	"i2c0_mfp",
>   };
>   
>   static const char * const i2c1_groups[] = {
> 


-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
