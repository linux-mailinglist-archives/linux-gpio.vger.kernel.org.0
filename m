Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB0B6C69E8
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 14:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjCWNuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 09:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbjCWNuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 09:50:00 -0400
X-Greylist: delayed 436 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Mar 2023 06:49:57 PDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C219EC48
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 06:49:57 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Pj63M2Y1Fz1r2Z4;
        Thu, 23 Mar 2023 14:42:39 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Pj63M1gxDz1qqlb;
        Thu, 23 Mar 2023 14:42:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id L941TGtA4KFG; Thu, 23 Mar 2023 14:42:38 +0100 (CET)
X-Auth-Info: Y9ljV7DUgiDa0xJFxkULtCmdxBb9ocJEGCmvDHDXVPnz+6sqxe7kkrxP8wnJBm45
Received: from hawking (unknown [81.95.8.244])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 23 Mar 2023 14:42:38 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
References: <20230323133656.679478-1-linus.walleij@linaro.org>
X-Yow:  I fill MY industrial waste containers with old copies
 of the ``WATCHTOWER'' and then add HAWAIIAN PUNCH to
 the top..  They look NICE in the yard--
Date:   Thu, 23 Mar 2023 14:42:37 +0100
In-Reply-To: <20230323133656.679478-1-linus.walleij@linaro.org> (Linus
        Walleij's message of "Thu, 23 Mar 2023 14:36:56 +0100")
Message-ID: <mvmfs9vwpma.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mär 23 2023, Linus Walleij wrote:

> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index 911301224078..0a9bc8292f78 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -102,7 +102,7 @@ static struct list_head ptable_list[2] = {
>  	LIST_HEAD_INIT(ptable_list[1]),
>  };
>  
> -#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page(page)->lru))
> +#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page((void *)page)->lru))

That should probably get a pair of parens around the macro argument.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
