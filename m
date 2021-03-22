Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A16344B3F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 17:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhCVQ0u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 12:26:50 -0400
Received: from forward501j.mail.yandex.net ([5.45.198.251]:53819 "EHLO
        forward501j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231793AbhCVQ0q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Mar 2021 12:26:46 -0400
X-Greylist: delayed 395 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Mar 2021 12:26:46 EDT
Received: from myt6-22bd3499f8ff.qloud-c.yandex.net (myt6-22bd3499f8ff.qloud-c.yandex.net [IPv6:2a02:6b8:c12:239b:0:640:22bd:3499])
        by forward501j.mail.yandex.net (Yandex) with ESMTP id 825343380185;
        Mon, 22 Mar 2021 19:20:05 +0300 (MSK)
Received: from mail.yandex.ru (mail.yandex.ru [37.139.80.9])
        by myt6-22bd3499f8ff.qloud-c.yandex.net (mxback/Yandex) with HTTP id pJjRA00FAeA1-K4FK0BkV;
        Mon, 22 Mar 2021 19:20:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1616430004;
        bh=QMipzWtVd+67Z/3VtnGvTUBRqElGRN+RfsFKjM9Ufg0=;
        h=References:Date:Message-Id:Subject:In-Reply-To:To:From;
        b=S/nickeDJmtHEFGtJpQlSZzHKkYxPaxQnYlaGEQFQAlupE2Uko54zeYvruZzzAtqc
         1yp1ImHmNvIw5u/Ser+rwDfIjDO7a2JZ45d2e2F+uNmrNc4DTYTXa5WelgWp5IycRv
         k4r+DlnQT5A8HB9fHSSUD4/eKc79HJApJhCcYR+4=
Authentication-Results: myt6-22bd3499f8ff.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt5-7210d748eb79.qloud-c.yandex.net with HTTP;
        Mon, 22 Mar 2021 19:20:04 +0300
From:   nikita.shubin@maquefel.me
To:     Hartley Sweeten <hartleys@visionengravers.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
In-Reply-To: <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
References: <1042421616413081@mail.yandex.ru> <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
Subject: Re: RFC Need advice on reworking gpio-ep93xx.c to DT support
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Mon, 22 Mar 2021 19:20:04 +0300
Message-Id: <1095441616429409@mail.yandex.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear Hartley,

> Are you just going to drop the other GPIO ports?

Of course i am not going to drop anything, i just showed binding for three types of ep93xx ports to shrink letter a bit.

This part is just an example of what i proposing for device tree.

We generally have:

- A/B port that share IRQ
- F port with IRQ for each line
- other ports that have nothing more than direction and data registers

> Note that the GPIO banks are registered a bit goofy, Ports C and F are not in order. They have been that way since the original Cirrus "crater" code base. If I remember correctly this was somewhere back in the 2.6.x kernel. Please make sure the GPIO numbers stay the same so that any userspace code does not break.

Thank you for pointing this out.
