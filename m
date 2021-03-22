Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA76344C42
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 17:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhCVQs4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 12:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhCVQsu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 12:48:50 -0400
X-Greylist: delayed 1722 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 Mar 2021 09:48:50 PDT
Received: from forward501j.mail.yandex.net (forward501j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB88C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 09:48:50 -0700 (PDT)
Received: from sas1-185358ff6438.qloud-c.yandex.net (sas1-185358ff6438.qloud-c.yandex.net [IPv6:2a02:6b8:c08:101a:0:640:1853:58ff])
        by forward501j.mail.yandex.net (Yandex) with ESMTP id DFF0F3380185;
        Mon, 22 Mar 2021 19:48:48 +0300 (MSK)
Received: from mail.yandex.ru (mail.yandex.ru [37.139.80.9])
        by sas1-185358ff6438.qloud-c.yandex.net (mxback/Yandex) with HTTP id imjX810IQqM1-mlImEk8j;
        Mon, 22 Mar 2021 19:48:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1616431728;
        bh=/cQbVBbKfD5LhQGSukHmbSFw0GvpZHSo0vVj1fmCW9s=;
        h=Message-Id:References:Date:Subject:To:From;
        b=Yhy4p5xR/ENWU9606o31TacV8u/tkZ/hB06ZtD4MamxaM/NVAHVL0hLE2RvkiyXj0
         aqRg9x+FyuNJZXoxFzQcQHrTsoLOM/gbfcYjsV0Ef89vZNoqULgEf/bmXRnLQJH9pp
         qFouIAxyXZGUaPoTVla5FbV3x+EhgV8bDA+zk4p0=
Authentication-Results: sas1-185358ff6438.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas2-4fe1bb3c0a49.qloud-c.yandex.net with HTTP;
        Mon, 22 Mar 2021 19:48:47 +0300
From:   "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>
To:     Hartley Sweeten <hartleys@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
References: <1042421616413081@mail.yandex.ru>
         <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
         <01b4dedd0f7efba749ebf598925886a6a69d5b41.camel@gmail.com> <BYAPR01MB5621066B411F68EF840B8417D0659@BYAPR01MB5621.prod.exchangelabs.com>
Subject: Re: RFC Need advice on reworking gpio-ep93xx.c to DT support
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Mon, 22 Mar 2021 19:48:47 +0300
Message-Id: <36281616430257@mail.yandex.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear Alexander and Hartley.

22.03.2021, 19:14, "Hartley Sweeten" <hartleys@visionengravers.com>:
> On Monday, March 22, 2021 9:00 AM, Alexander Sverdlin wrote:
>>  On Mon, 2021-03-22 at 15:43 +0000, Hartley Sweeten wrote:
>>>  Note that the GPIO banks are registered a bit goofy, Ports C and F are
>>>  not in order. They have been that way since the original Cirrus "crater"
>>>  code base. If I remember correctly this was somewhere back in the 2.6.x
>>>  kernel. Please make sure the GPIO numbers stay the same so that any
>>>  userspace code does not break.
>
>>  I'm sceptical about this DT convertion.
>
> I'm in the same boat. One of the reasons I have not tried to convert it...

I find this a bit confusing, so you think ep93xx shouldn't be touched at all ?

AFAIK the question is reworking to DT or it will be dropped eventually:

https://lore.kernel.org/lkml/CAK8P3a2VW8T+yYUG1pn1yR-5eU4jJXe1+M_ot6DAvfr2KyXCzQ@mail.gmail.com/


