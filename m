Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6511413403B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 12:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgAHLS2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 06:18:28 -0500
Received: from out28-220.mail.aliyun.com ([115.124.28.220]:41497 "EHLO
        out28-220.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgAHLS2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 06:18:28 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08419572|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.234992-0.00613984-0.758868;DS=CONTINUE|ham_social|0.0168103-0.000885784-0.982304;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16370;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.GYVi6nQ_1578482292;
Received: from 192.168.10.218(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GYVi6nQ_1578482292)
          by smtp.aliyun-inc.com(10.147.44.145);
          Wed, 08 Jan 2020 19:18:13 +0800
Subject: Re: [PATCH 0/5] pinctrl: ingenic: cleanups
To:     Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>
References: <20200106232711.559727-1-paul@crapouillou.net>
 <CACRpkdYo0dniDAq12WG=KWmJPjnuYEtDn=pvHRoRGRhzQUX58w@mail.gmail.com>
 <5E14944B.4060405@wanyeetech.com>
Cc:     od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E15BA74.1080901@wanyeetech.com>
Date:   Wed, 8 Jan 2020 19:18:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <5E14944B.4060405@wanyeetech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus & Paul,

I have tested X1000 and X1830 and they both work fine.

Thanks and best regards!

On 2020年01月07日 22:23, Zhou Yanjie wrote:
> Hi Linus,
>
> On 2020年01月07日 20:35, Linus Walleij wrote:
>> On Tue, Jan 7, 2020 at 12:27 AM Paul Cercueil <paul@crapouillou.net> 
>> wrote:
>>
>>> I saw you merged Zhou's patchset, here are some cleanup patches for
>>> pinctrl-ingenic that should be applied on top of his commits.
>> All five patches applied!
>>
>> Zhou can you test the result? I am pushing the devel branch
>> out and as soon as it builds cleanly I will push it for-next.
>
> I tested it on JZ4760 and JZ4780. The hardware of X1000 and X1830 is 
> not in my hand right now, I can test them tomorrow, but from the view 
> of the code, it should work fine. You can add:
> Tested-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>
> Thanks and best regards!
>
>>
>> Yours,
>> Linus Walleij
>

