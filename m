Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C635223D2F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 15:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgGQNoU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 09:44:20 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:59370 "EHLO smtp48.i.mail.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726071AbgGQNoU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 09:44:20 -0400
X-Greylist: delayed 2861 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 Jul 2020 09:44:19 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=kh5wuKEi0rw79GCM0tHQndYjyVD4Ap4Wz6eWfkrClKs=;
        b=IA27W7TVeqBU4sAsa8D1EEwqhvUgBg0u1XFb/GExoleSoI1NyrTWrfjVULbJUiazGFKPJxURmCFNcBe4xmEELbfdDV2fKTZ1odwMtHvBGCGYyHuEiEViZHmlQ6h1uGt3znZWfKR9sltRGHK7eyUlZp7aL8p2OsiFbeMd5qYNZoM=;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
        id 1jwQev-0003eG-HS; Fri, 17 Jul 2020 16:44:17 +0300
Subject: Re: gpiolib gpio_chrdev_release duration is about 30 ms
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
 <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
From:   Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <9f141fd1-3c73-c839-b7ad-529a61645031@inbox.ru>
Date:   Fri, 17 Jul 2020 16:44:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9BB76C036EA8E79AC8C6DDDA81CAC925A1649AE829B35E875182A05F538085040A7326E6647923DA28F627B927FF4DB1B31D200EA6C0F8E1856D14DDA4F1F77D3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72847AA60176ABEF3EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063715F166F2542EEE4C8638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FCFF7055EEDF52C4FF8A1F8490E0B463034436006E7F579C8E389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0D9442B0B5983000E8941B15DA834481FCF19DD082D7633A0E7DDDDC251EA7DABA471835C12D1D977725E5C173C3A84C3CA5A41EBD8A3A0199FA2833FD35BB23DF004C906525384309383FD4D963104D47B076A6E789B0E975F5C1EE8F4F765FCB43D85947FB923253AA81AA40904B5D9CF19DD082D7633A0FEB97ECC69AE80BD3AA81AA40904B5D98AA50765F7900637ACB8A4D18BD750D9D81D268191BDAD3D18080C068C56568E156CCFE7AF13BCA413377AFFFEAFD26923F8577A6DFFEA7CA60C52B68663E2D593EC92FD9297F6715571747095F342E857739F23D657EF2BD5E8D9A59859A8B66F6A3E018CF4DC80089D37D7C0E48F6C5571747095F342E857739F23D657EF2B6825BDBE14D8E7028C9DFF55498CEFB0BD9CCCA9EDD067B1EDA766A37F9254B7
X-C8649E89: 7A9803CE3BA91129237D4260330B54E0A5C68945EA9D8E5F95CA3A3E610280F79A0FC3F32F9EC09A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojyFZPfq27zy/9fBaXEqPTBQ==
X-Mailru-Internal-Actual: A:0.90678115368868
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB247B4F270C6BDE20563350FD734DA95EF98F0AAA4051A5F5B9EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

------------------------------------------
#define GPIOS_NUM 8
static char* gpio_names[GPIOS_NUM] = {"IO0", "IO1", "IO2", "IO3", "WR", 
"CS", "OE", "ADD_EN"};
................
gpio_init() {

     int i;
     for (i = 0; i < GPIOS_NUM; ++i) {
         syslog(LOG_INFO,"%s %d",__FUNCTION__,__LINE__);
         gpio_lines[i] = gpiod_line_find(gpio_names[i]);
         syslog(LOG_INFO,"%s %d",__FUNCTION__,__LINE__);
     }
}
-------------------------------------------
I used syslog/printk to measure time.
syslog in example shows about 300ms on each gpiod_line_find call.
17.07.2020 16:37, Linus Walleij пишет:
> Hi Maxim,
> 
> On Fri, Jul 17, 2020 at 2:56 PM Maxim Kochetkov <fido_max@inbox.ru> wrote:
> 
>> I'm using libgpiod in userspace.
>> I have 6 gpiochip's on my board.
>> gpiod_line_find takes about 300ms to find GPIO line.
>>
>> gpiod_line_find calls gpiod_foreach_chip
>> then gpiod_chip_iter_next
>> then gpiod_chip_close then close(chip->fd)
>> then we are going to kernel gpiolib gpio_chrdev_release
>> then atomic_notifier_chain_unregister
>> then synchronize_rcu()
>>
>> synchronize_rcu takes about 30 ms (6*30ms=280ms)
>>
>> I tried to remove synchronize_rcu from atomic_notifier_chain_unregister
>> and gpiod_line_find takes about 2ms now.
> 
> Interesting! Can you provide some context? Are you just testing because
> curious or do you need to meet a design objective?
> 
> Did you use ftrace or similar instrumentation to drill down and find
> where time is spent?
> 
> Yours,
> Linus Walleij
> 
