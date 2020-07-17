Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE355223DE6
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 16:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgGQOQz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 10:16:55 -0400
Received: from smtp36.i.mail.ru ([94.100.177.96]:35756 "EHLO smtp36.i.mail.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgGQOQy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 10:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=j9ffjvCpghXIWp5CaPI1O9kw11y8BVvgjSq3Jfbuke8=;
        b=i1GHCMla8vKfNXGZj+B6Sxs9pjRQvACW1iKsA2dplg7QbOcAnyqsS29XoqXfvEFNHYkhYswUz7uzqhsogTJ6tnHvRhwKQRL0ASHd64i3hroSRxd6NVQx79Nb00TV035vCe74DY1F3YeOh4+BjVsDtDk5QeuVYAa+baYEXXHdqGc=;
Received: by smtp36.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
        id 1jwRAR-0000sv-5z; Fri, 17 Jul 2020 17:16:51 +0300
Subject: Re: gpiolib gpio_chrdev_release duration is about 30 ms
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
 <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
From:   Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <190bca20-946f-52f9-64f8-8971da17d38b@inbox.ru>
Date:   Fri, 17 Jul 2020 17:17:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp36.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9BB76C036EA8E79ACB03C072647AE8C234E562997A1F066A9182A05F5380850408D209D1B6B2610D68761B11EB21A8CA3069CBFDCF76A18D38F06533D494BB0AD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE781C4E570E9C9D556C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7C27E92EFAD44F80DEA1F7E6F0F101C674E70A05D1297E1BBC6CDE5D1141D2B1C4BF693CB953F28CC3D2F262A934306A27657D9A906C42AAE9FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B524E70A05D1297E1BBF6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481F9449624AB7ADAF37A7756CC1F0AD1ECDD8FC6C240DEA76428AA50765F79006375F0203DB0EA8E49BD81D268191BDAD3DBD4B6F7A4D31EC0B6941894150739B64D81D268191BDAD3D78DA827A17800CE7E34610862E5853DDEC76A7562686271E8729DE7A884B61D135872C767BF85DA29E625A9149C048EE0A3850AC1BE2E7355E1C53F199C2BB95C8A9BA7A39EFB7666BA297DBC24807EA089D37D7C0E48F6C8AA50765F7900637AF8E4F18C523FAA9EFF80C71ABB335746BA297DBC24807EA27F269C8F02392CD20465B3A5AADEC6827F269C8F02392CD5571747095F342E88FB05168BE4CE3AF
X-C8649E89: 458E5DDE3344D4F0EF578D30B937491EEC76C1BAC3251C4376C18233194D36D6CC2360326D2A1BCA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojyFZPfq27zy+/4VGp69aenA==
X-Mailru-Internal-Actual: A:0.90678115368868
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24CA6D65261EBAC38725A43AC551C0F7DF5844687F1A377715EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I need a small userspace program to do some GPIO magic to communicate 
other hardware like devmem. This program takes about 2,5 seconds just to 
find GPIO lines by name.

replacing synchronize_rcu to synchronize_rcu_expedited in 
atomic_notifier_chain_unregister gives the same boost as removing 
synchronize_rcu

17.07.2020 16:37, Linus Walleij пишет:
> Are you just testing because
> curious or do you need to meet a design objective?
