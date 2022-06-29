Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF75255F2A6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 03:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiF2BIH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 21:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiF2BIG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 21:08:06 -0400
X-Greylist: delayed 446 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Jun 2022 18:08:03 PDT
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050:0:465::103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B28124
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 18:08:02 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4LXjn92pvwz9sTS;
        Wed, 29 Jun 2022 03:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1656464429;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CEmWHA6YSlMnBrW8SLmEw6rZwpmuLHtzoMh26uU2zmI=;
        b=zkJhkBoZ91f8M7VxB0tju47+ztV+1wwtv3dyYgUHIMyhogtBJ++6HIAqLSoNI9i09znpjA
        148zCKsomU0QSpbf766kJPKcYL925RDRLVnmZ90RSjatEsdG9hthqiBvAPAMN84F4ecdDE
        ClIX5E3y8TbIz02JqXEaiu3//iDgnwk6KFd7aBCcw6BFQBixRYiKa2h0qoTwVbWyxn6eXj
        VB9e88A4P+BM9wAWx5m7dPx5webMJWvptnCOSOUAqTd4er0TrXmMdCYtQQ6IdmSNs+v/Gt
        pM8VexXoDVp7290TOjsUHvxohIksqvHqaeDX7GOrvBkKskk9InuhZZyfw3XdFg==
Message-ID: <d1ecc96f-0f92-4023-5b91-832f089d1cce@gorani.run>
Date:   Wed, 29 Jun 2022 10:00:19 +0900
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] gpio: Add support for SLG7XL45106 I2C GPO expander
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, git@amd.com,
        git <git@xilinx.com>
References: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1656426829-1008-3-git-send-email-shubhrajyoti.datta@xilinx.com>
 <CAHp75Ve5f+fO29=FwGC=LxYsYj=sKRrW6LYav3gx0yK7rx-uXg@mail.gmail.com>
 <CAHp75VfVaKnofadyyf2jF3Lk816i1TJf4pq9s11iN=wFqJH2rA@mail.gmail.com>
From:   Sungbo Eo <mans0n@gorani.run>
In-Reply-To: <CAHp75VfVaKnofadyyf2jF3Lk816i1TJf4pq9s11iN=wFqJH2rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 2022-06-29 04:21, Andy Shevchenko wrote:
> On Tue, Jun 28, 2022 at 9:13 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>>
>> On Tue, Jun 28, 2022 at 4:35 PM Shubhrajyoti Datta
>> <shubhrajyoti.datta@xilinx.com> wrote:
>>>
>>> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>>>
>>> Dialog semiconductors SLG7XL45106 is an 8-bit I2C GPO expander.
>>> The output port is controlled by a data byte with register
>>> address.
>>
>> 1/ Have you checked if there is a driver that sounds very similar to
>> this already upstream?
> 
> Actually, why can't pca9570 be amended to support this?
> 
>> 2/ Have you tried to use gpio-regmap? Why can it not be used?
> 
> Same Q for PCA9570 driver. (Maybe gpio-regmap wasn't existed that time?)

IIRC regmap could not be used for pca9570 as pca9570 doesn't have a
concept of "address"; it only accepts a data value.[1]
Please let me know if the situation has changed in the meantime.

It seems the slg7xl45106 driver reads/writes a reg at 0xDB so it is not
compatible with pca9570 driver (in the current state), and (I suppose)
it could be converted to use gpio-regmap.

[1]
https://lore.kernel.org/linux-gpio/69f5d1a1970838b8c4bd8d6e8dba6cac@walle.cc/

Thanks,
Sungbo
