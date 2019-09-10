Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27F95AF369
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 01:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfIJXjw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 19:39:52 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4934 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbfIJXjw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 19:39:52 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d7834480000>; Tue, 10 Sep 2019 16:39:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 10 Sep 2019 16:39:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 10 Sep 2019 16:39:51 -0700
Received: from ngvpn01-172-168.dyn.scz.us.nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Tue, 10 Sep 2019 23:39:49 +0000
Subject: Re: [PATCH] gpio: fix build failure: gpiochip_[un]lock*()
 static/non-static
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     YueHaibing <yuehaibing@huawei.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190907010534.23713-1-jhubbard@nvidia.com>
 <CACRpkdbmw-EOm5Os=BjoX1G+ZDxRGnJ3Zd3BWtDksnQ46aJ_JA@mail.gmail.com>
X-Nvconfidentiality: public
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <c917f7f2-2f3b-f01e-8ea2-858eaf5f3e2d@nvidia.com>
Date:   Wed, 11 Sep 2019 00:39:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbmw-EOm5Os=BjoX1G+ZDxRGnJ3Zd3BWtDksnQ46aJ_JA@mail.gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568158793; bh=Qy6VepiFpAZlMrNzDzcHtBi9QfYWbrDNF8q7ZPJDXvk=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=U+YTbJMsGjo52Kl1kpYBHxmh75vkb8qhsWJ16f8tDrh832uxffBKPi5Ntka/pAjmZ
         Kpd6l13CODtxkA9wRTe3PTbSYTNQ2uK+T/pIuMk5GTthp7EkDPiTLSTXoCH89kKHSd
         rb2xT0l7h81/+Rw03UKc4PfvzuFcqs5qveahnT68VRsrgUxc36pkyvcFN3k6/hNN4s
         7muMJmhYSDv5Tx9g/g8o/s9/flBlMuxqjGmCjwKXr4UkpI15JiYng1eUCE74G9B7ro
         MGer5IQH993ovdUiRKtqVc8Y6+9MFa782qoTsdp0Z98c3sDap4OOjfdco9ei+o1CWf
         0+tXPJ7JteGDQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/8/19 12:16 AM, Linus Walleij wrote:
> On Sat, Sep 7, 2019 at 2:05 AM John Hubbard <jhubbard@nvidia.com> wrote:
> 
>> While building with !CONFIG_GPIOLIB, I experienced a build failure,
>> because driver.h in that configuration supplies both a static and
>> a non-static version of these routines:
> 
> I think this is fixed in my latest version of the "devel" branch?
> 

OK, sounds good to me. Sorry for not spotting that a fix is in
the pipeline. :)


thanks,
-- 
John Hubbard
NVIDIA
