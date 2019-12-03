Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12AA9110260
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 17:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfLCQdo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 11:33:44 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:51290 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfLCQdo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 11:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bmHoVTlf0pCpIQSoAotql3m5fbx6C4BbcKfSAm0A92U=; b=oRdLWz80LB9JS+CxEFpCP+w0q
        jwYiGS1ZNRht3ecXNBDcRRpHZAKkGmtOZWAj+s7RytRgR2akpqHJkZ2hQ4Eeyb9OBquqvmVzVPdlL
        a1Nk5J18bjum26pM9/XAdPGM2USIDIBIoeBz6g5v1W+2TaCyHGJqrKw4T4HWDQWgssUfe6TlhmQfP
        sKZSsmL2VTn/7w93PaVNCpFyF5s7ZbqpxyULBE7mIes4a4anGd/XjpOdoz/uYniiDn83Q+saBx9rJ
        lSAQEIW5X74UbbEdRNlQlM4izZVUIzmmDBnMIv01IxRWii8dOrpWwodwZ19miSPsHfm4TrZW7tSxN
        pu5fnxCZQ==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1icB7O-0002Hq-HS; Tue, 03 Dec 2019 16:33:42 +0000
Subject: Re: linux-next: Tree for Dec 3 (pinctrl-equilibrium)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
References: <20191203155405.31404722@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1a78124d-bef9-46da-aef4-60f85fddfceb@infradead.org>
Date:   Tue, 3 Dec 2019 08:33:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191203155405.31404722@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/2/19 8:54 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material for v5.6 to your linux-next included
> trees until after v5.5-rc1 has been released.
> 
> Changes since 20191202:
> 

on x86_64:
# CONFIG_OF is not set


ld: drivers/pinctrl/pinctrl-equilibrium.o: in function `pinconf_generic_dt_node_to_map_all':
pinctrl-equilibrium.c:(.text+0xb): undefined reference to `pinconf_generic_dt_node_to_map'

Probably depends on OF.

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
