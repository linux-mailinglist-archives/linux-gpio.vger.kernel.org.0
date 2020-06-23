Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8862052CC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 14:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732569AbgFWMrd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 08:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729562AbgFWMrc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 08:47:32 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51BFC061573;
        Tue, 23 Jun 2020 05:47:32 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id B23A222175;
        Tue, 23 Jun 2020 14:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1592916448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uIWcxL06bYKGyY5zeMVQC8JJNVmi1MGHB3ymuX8QDx8=;
        b=vaAvorLb/tf1DLoSyGwy93HCy507E7meWCbgT1aWmcsuteBE6T7phkOdkulKf9JLCxyCUZ
        kKfr9NZL4CnZZeJ+gsbXYDTDWa+vGCbR659K2P8/1+xUvMAEHj7uEP75IIwVPDvWHsvak+
        0aPcJqUYw4tlLYbUbPIf+3lW2Hv5b94=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 23 Jun 2020 14:47:28 +0200
From:   Michael Walle <michael@walle.cc>
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: add GPO driver for PCA9570
In-Reply-To: <2291c01d-30df-518e-a952-644bd955f1f3@gorani.run>
References: <20200623060526.29922-1-mans0n@gorani.run>
 <80bbca9a625b2a0feb9b816906549b7c@walle.cc>
 <2291c01d-30df-518e-a952-644bd955f1f3@gorani.run>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <69f5d1a1970838b8c4bd8d6e8dba6cac@walle.cc>
X-Sender: michael@walle.cc
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sungbo,

Am 2020-06-23 14:22, schrieb Sungbo Eo:
> On 2020-06-23 17:31, Michael Walle wrote:
>> Am 2020-06-23 08:05, schrieb Sungbo Eo:
>>> This patch adds support for the PCA9570 I2C GPO expander.
>>> 
>>> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
>>> ---
>>> Tested in kernel 5.4 on an ipq40xx platform.
>>> 
>>> This is my first time submitting a whole driver patch, and I'm not
>>> really familiar with this PCA expander series.
>>> Please let me know how I can improve this patch further. (Do I also
>>> need to document the DT compatible string?)
>> 
>> Did you have a look at drivers/gpio/gpio-regmap.c ? Your driver seems
>> to be simple enough to be easily integrated with that. If you need a
>> blueprint; because at the moment there is no driver in the kernel
>> using that, you could have a look at:
>> https://lore.kernel.org/linux-gpio/20200604211039.12689-7-michael@walle.cc/
> 
> Thanks for your advice. I didn't really know what regmap is for...
> It seems gpio-regmap is for gpio controllers having val/dir registers.
> But pca9570 does not use port registers. The master only sends a data
> byte without reg address.

Ahh I missed that :(

> I'm not sure how to apply gpio-regmap or
> regmap-i2c here.
> I'll try to investigate if setting reg_size or reg_bits to zero is 
> possible.
> 
> Please correct me if I'm in the wrong direction.

That won't work because the underlying regmap expects the address bits 
to be either 8 or 16. In this case I'd guess gpio-regmap, doesn't make 
sense, because there is actually no real gain.

-michael
