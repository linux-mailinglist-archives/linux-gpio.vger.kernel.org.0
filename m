Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10BF2259C8
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 10:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgGTIOw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 04:14:52 -0400
Received: from smtp51.i.mail.ru ([94.100.177.111]:59000 "EHLO smtp51.i.mail.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgGTIOw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jul 2020 04:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=EcLM7uKMsiORseKJACDv7+uuR50BGrYrWOpmNRGZ1S8=;
        b=UGNv8jmCJdsJSBKYkKS7XWSm0CZPVY8SoJDb1VuTZDOKHHzJvidLoh3H33t+juoGcDFDbl/u++pn04Y0BC1pd0PwpNAFq0+HCICvHiUk7M2yD3dlVhcnVUXcj/QnGzTn4REtN2fl9ro0NUb1XAznawuPqMI6SwVLnnY1UoL9WX4=;
Received: by smtp51.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
        id 1jxQwi-0004fj-DA; Mon, 20 Jul 2020 11:14:48 +0300
Subject: Re: gpiolib gpio_chrdev_release duration is about 30 ms
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
 <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
 <190bca20-946f-52f9-64f8-8971da17d38b@inbox.ru>
 <CAHp75VfQdTtbiHjhBuf3czdKAgmiQeALo7CaqW36oEkSGSHUBA@mail.gmail.com>
 <20200718042548.GA43247@sol>
From:   Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <7a22761d-c930-3597-6bf1-c799f70a47f8@inbox.ru>
Date:   Mon, 20 Jul 2020 11:14:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200718042548.GA43247@sol>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp51.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9BB76C036EA8E79AC7183BC094B6F43973D86AAEB5F7F36A6182A05F5380850409833DE0D0DF3B0A572145BD1616FEAEC7A2706531F25CA427C7D8BDADE976749
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79961E86438F5BDAEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379B0255B5E5688AF88638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC3198A535E5195FFABA676E34E6076D1243E1FED7EE6248C6389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE71AE4D56B06699BBC9FA2833FD35BB23DF004C906525384309383FD4D963104D47B076A6E789B0E975F5C1EE8F4F765FC8E65E1C3733EDF1A3AA81AA40904B5D9CF19DD082D7633A0FEB97ECC69AE80BD3AA81AA40904B5D98AA50765F7900637A0C832920C108451D81D268191BDAD3D18080C068C56568E156CCFE7AF13BCA413377AFFFEAFD26923F8577A6DFFEA7C054662F8F2CA352F93EC92FD9297F6715571747095F342E857739F23D657EF2BD5E8D9A59859A8B6300D3B61E77C8D3B089D37D7C0E48F6C5571747095F342E857739F23D657EF2B6825BDBE14D8E7028C9DFF55498CEFB0BD9CCCA9EDD067B1EDA766A37F9254B7
X-C8649E89: E960A6522D0EF3BD89367B65ABBD375FB09F471C3227DFD24CA68903CB919DCD8AE94DC3EAB57286
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojURwlcvcvMAk39vKUWwVNxQ==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB2447A7ED55EE0ED42D24EDC104805D8A9CC229C8A6E59C67F7EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It works fine with this patch. Thank you so much!

18.07.2020 07:25, Kent Gibson пишет:
> On Fri, Jul 17, 2020 at 06:07:04PM +0300, Andy Shevchenko wrote:
>> On Fri, Jul 17, 2020 at 5:17 PM Maxim Kochetkov <fido_max@inbox.ru> wrote:
>>>
>>> I need a small userspace program to do some GPIO magic to communicate
>>> other hardware like devmem. This program takes about 2,5 seconds just to
>>> find GPIO lines by name.
>>>
>>> replacing synchronize_rcu to synchronize_rcu_expedited in
>>> atomic_notifier_chain_unregister gives the same boost as removing
>>> synchronize_rcu
>>
>> Have you tried to replace an atomic notifier call with a regular one?
>> IIRC it's still not clear why atomic is used there.
>>
> 
> Indeed, I recently submitted a patch to switch the
> atomic_notifier_call_chain to blocking_notifier_call_chain, as some of
> the chained calls can sleep.
> Not sure if that is related, or if the change would make this case better
> or worse, but it would be interesting to find out.
> The patch is in the current gpio/devel, btw.
> 
> Cheers,
> Kent.
> 
