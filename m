Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBA84D3AD1
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Mar 2022 21:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbiCIUKQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Mar 2022 15:10:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbiCIUKQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2022 15:10:16 -0500
X-Greylist: delayed 452 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Mar 2022 12:09:16 PST
Received: from relay5.hostedemail.com (relay5.hostedemail.com [64.99.140.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A279EB88
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 12:09:16 -0800 (PST)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay10.hostedemail.com (Postfix) with ESMTP id B1D4221B6;
        Wed,  9 Mar 2022 20:01:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 5B61D32;
        Wed,  9 Mar 2022 20:01:17 +0000 (UTC)
Message-ID: <400cf2fc8cbc3887a90f50709f40adc0662ec0f4.camel@perches.com>
Subject: Re: [PATCH v2 05/11] pinctrl: mediatek: paris: Drop extra newline
 in mtk_pctrl_show_one_pin()
From:   Joe Perches <joe@perches.com>
To:     Chen-Yu Tsai <wenst@chromium.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Date:   Wed, 09 Mar 2022 12:01:39 -0800
In-Reply-To: <20220308100956.2750295-6-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
         <20220308100956.2750295-6-wenst@chromium.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Stat-Signature: itpi6u5eyed33jaieo59phaog6r153x8
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 5B61D32
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+v5TW9d+3Dr2lvFismD/IYOx5icBwv8Xg=
X-HE-Tag: 1646856077-760257
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2022-03-08 at 18:09 +0800, Chen-Yu Tsai wrote:
> The caller of mtk_pctrl_show_one_pin() is responsible for printing the
> full line. mtk_pctrl_show_one_pin(), called through mtk_pctrl_dbg_show(),
> should only produce a string containing the extra information the driver
> wants included.

Does this function have another caller?

It looks as if this function doesn't need to be EXPORT_SYMBOL_GPL
and could just be declared static in the file instead.

btw: using %1d is mostly senseless as a control, but has some
     documentary use as a value < 0 or >= 10 will be always be
     fully emitted anyway.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
[]
> @@ -634,14 +634,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>  			pullen,
>  			pullup);
>  
> -	if (r1 != -1) {
> -		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
> -			r1, r0);
> -	} else if (rsel != -1) {
> -		len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
> -	} else {
> -		len += scnprintf(buf + len, buf_len - len, "\n");
> -	}
> +	if (r1 != -1)
> +		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)", r1, r0);
> +	else if (rsel != -1)
> +		len += scnprintf(buf + len, buf_len - len, " (%1d)", rsel);
>  
>  	return len;
>  }


