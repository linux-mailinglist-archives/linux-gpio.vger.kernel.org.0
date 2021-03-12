Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA6133888E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 10:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbhCLJZK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 04:25:10 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34048 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232808AbhCLJZG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 04:25:06 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lKe2a-0006Wa-95; Fri, 12 Mar 2021 09:25:04 +0000
Subject: Re: [PATCH] pinctrl: core: Set ret to 0 when group is skipped
To:     Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     dan.carpenter@oracle.com, linux-gpio@vger.kernel.org
References: <e5203bae68eb94b4b8b4e67e5e7b4d86bb989724.1615534291.git.michal.simek@xilinx.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <ced576c2-11a3-3fbf-0fdf-4620a442cadf@canonical.com>
Date:   Fri, 12 Mar 2021 09:25:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e5203bae68eb94b4b8b4e67e5e7b4d86bb989724.1615534291.git.michal.simek@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/03/2021 07:31, Michal Simek wrote:
> Static analyzer tool found that the ret variable is not initialized but
> code expects ret value >=0 when pinconf is skipped in the first pinmux
> loop. The same expectation is for pinmux in a pinconf loop.
> That's why initialize ret to 0 to avoid uninitialized ret value in first
> loop or reusing ret value from first loop in second.
> 
> Addresses-Coverity: ("Uninitialized variables")
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> CC: Colin Ian King <colin.king@canonical.com>
> CC: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> 
>  drivers/pinctrl/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index f5c32d2a3c91..136c323d855e 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -1266,6 +1266,7 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
>  			break;
>  		case PIN_MAP_TYPE_CONFIGS_PIN:
>  		case PIN_MAP_TYPE_CONFIGS_GROUP:
> +			ret = 0;
>  			break;
>  		default:
>  			ret = -EINVAL;
> @@ -1284,6 +1285,7 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
>  	list_for_each_entry(setting, &state->settings, node) {
>  		switch (setting->type) {
>  		case PIN_MAP_TYPE_MUX_GROUP:
> +			ret = 0;
>  			break;
>  		case PIN_MAP_TYPE_CONFIGS_PIN:
>  		case PIN_MAP_TYPE_CONFIGS_GROUP:
> 

Thanks Michal,

Reviewed-by: Colin Ian King <colin.king@canonical.com>
