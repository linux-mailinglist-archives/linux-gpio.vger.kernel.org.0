Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C661BDA8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 21:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbfEMTVh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 15:21:37 -0400
Received: from merlin.infradead.org ([205.233.59.134]:58368 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbfEMTVh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 15:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nU9LZDmTC34xYD5bAKs5rwkq2+XzEcWgxjqH5jBl+o0=; b=xErTWYADs+p5t/RClNFR+DvUJv
        ym5WaNm3TdC70dHOrcyL9SUMXY7INUXtrigWBbux0Pu0l5e7cE6WnEn8rgmb1eXNbfaXrkhQu1gLo
        G6kYPn6alFSRuvEr+Be+UtXO43iH9cJOWaQVq8TLT2vXo7pqWtGkQ8GFg0bW7VDHn2bV/Z4hXFbgM
        oCCIb2/6MvQmn6HiJDWtF8DI+5VAUasPlhGDkjcTPHU5reLsCBCe57qWn6ygjgvr037/c34SZx1da
        KyLwGoPuOgWOHxwAXafIBAbA6+XxF6m0sZctHperrq9lDHQJ3bmLdXgaU5FcpAj71GaSbcOAaKA98
        fmILH7nw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hQGVw-0000zX-OF; Mon, 13 May 2019 19:21:33 +0000
Subject: Re: linux-next: Tree for May 13 (drivers/pinctrl/pinctrl-stmfx)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20190513142525.43c0e826@canb.auug.org.au>
 <9bfd6a01-1b08-a21b-64fe-ccbe6d5e2810@infradead.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5d6d5c73-2af9-2455-d3d8-3c731019f578@infradead.org>
Date:   Mon, 13 May 2019 12:21:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9bfd6a01-1b08-a21b-64fe-ccbe6d5e2810@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/13/19 8:06 AM, Randy Dunlap wrote:
> On 5/12/19 9:25 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v5.3 material to your linux-next included
>> trees/branches until after v5.2-rc1 has been released.
>>
>> Changes since 20190510:
>>
> 
> on x86_64:
> # CONFIG_OF is not set
but CONFIG_COMPILE_TEST=y

> 
> ../drivers/pinctrl/pinctrl-stmfx.c:410:20: error: ‘pinconf_generic_dt_node_to_map_pin’ undeclared here (not in a function)
>   .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
>                     ^
> ../drivers/pinctrl/pinctrl-stmfx.c: In function ‘stmfx_pinctrl_probe’:
> ../drivers/pinctrl/pinctrl-stmfx.c:652:17: error: ‘struct gpio_chip’ has no member named ‘of_node’
>   pctl->gpio_chip.of_node = np;
>                  ^
> 
> 
> Full randconfig file is attached.
> 
> 


-- 
~Randy
