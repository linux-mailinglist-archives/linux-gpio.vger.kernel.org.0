Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4A2868F3
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 20:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733248AbfHHSl7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 14:41:59 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:55094 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732375AbfHHSl6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Aug 2019 14:41:58 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 46120A0141;
        Thu,  8 Aug 2019 20:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received; s=mail20150812; t=1565289713; bh=oWtBOiSJw6
        GKmS4tVeGK/514J22D9Jyg8jer441863s=; b=mjT/gqWWryWOxFAZyK81mBg6cW
        YlKDOlrSQPPaxTS5/dGnPw0k3fIBT+3SQQF5j4Tl/g6a0vzHCXyWpjofbiHhrMIB
        hkt69PeuYeXgC+QkKMszcTZ7HCFkdHySw/4XRLESV0DOXlNIlMpbwZdGjBPagYpw
        gxdRRlxrELVhFnMYFiuw7lp+Yv9FD3nh8wLy55JMxaJA/Sr1+8Lfr+m/jqgg6Zx1
        LRbNj+aZiZkkqSpBLAKQUBU4fQVoNISUAB0uhSSYxFUHXL1igbRVKqqd+CcI846h
        sSNKtfJESLxWdWzpNknOo85NggCtuU6tfBa6wwYN7mLKpHH5fb7B8tdD43fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1565289715; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3zx1Z316WI2HE6iiyL5o/HqJ5kuW3NK+C4hmsGQJW+4=;
        b=Xe/JLGmkY+km5tH/XO89eOmODgH8OCcjvS7XTXstUp0IdX9RvIo9HUDWyIrpWPXTWQ2qNj
        kSGG62GDAHp1/eKVqyHzFufnBK6ihpQb14wxruDkmAJU79Q0UjOfoOoaw/APBhEqCLwKlo
        jktIB8Csss2R40ZSo+TH10nCZfikIA0IUbwlYo6M5a6isQ+daGyjzwRnIVCuSMRnzmHN+f
        MoF3gMZ254xestFzoUoIF8EoLnzuxBnGr8Vcy2koigG/3ZgxqupWIjt5b81jT+HFIAUFei
        okgd/Ij68qmqm4BancGDMehqdC3+v8ZM20fWmASOkY2msO7eQDpG5PSrP/+c8A==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id roVrzcLLYdn6; Thu,  8 Aug 2019 20:41:53 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 5/5] bindings: cxx: Workaround --success run
Date:   Thu, 08 Aug 2019 20:41:52 +0200
Message-ID: <6061947.U0Wa8ctkoo@kongar>
In-Reply-To: <CAMRc=McmKs=5ToTRLgQ_f30DRtqq-57OZRw-EnL1gm_M1kqUXQ@mail.gmail.com>
References: <20190807195132.7538-1-alexander.stein@mailbox.org> <20190807195132.7538-5-alexander.stein@mailbox.org> <CAMRc=McmKs=5ToTRLgQ_f30DRtqq-57OZRw-EnL1gm_M1kqUXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 On Thursday, August 8, 2019, 5:27:14 PM CEST Bartosz Golaszewski wrote:
> =C5=9Br., 7 sie 2019 o 21:51 Alexander Stein <alexander.stein@mailbox.org>
> napisa=C5=82(a):
> >
> > If run with --success, all expressions are evaluated and printed out.
> > But REQUIRE_FALSE(chip) tries to iterate over the chip resulting in this
> > backtrace:
> > #0  gpiod_chip_num_lines (chip=3Dchip@entry=3D0x0) at ../../lib/core.c:=
235
> > #1  gpiod_line_iter_new (chip=3D0x0) at ../../lib/iter.c:140
> > #2  gpiod::(anonymous namespace)::make_line_iter (chip=3D0x0) at ../../=
=2E./bindings/cxx/iter.cpp:29
> > #3  gpiod::line_iter::line_iter (this=3D0x7fffffffd690, owner=3D...) at=
 ../../../bindings/cxx/iter.cpp:109
> > #4  Catch::rangeToString<gpiod::chip> (range=3D...) at /usr/include/cat=
ch2/catch.hpp:1959
> > [...]
> >
> > Workaround by forcing catch2 to call gpiod::chip::operator bool().
> >
> > Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> > ---
> > This actually looks like a flaw in the binding itself that the
> > gpiod::line_iter can't cope with an empty gpiod::chip.
> >
>=20
> Do you want to submit a patch that fixes that? Otherwise I can fix it.
> I think that simply throwing an exception on empty chip is enough,
> right?

Reading that backtrace today, the actual problem is gpiod_chip_num_lines de=
ferencing the nullptr.
There are 2 possibilities:
* if gpiod_chip is NULL in gpiod_line_iter_new(), return NULLL iter as well=
 (which will raise an exception on line iter.cpp:31)
* return an iter with num_lines =3D 0

Can't rate the 2nd one if this will raise other problems.

Best regards,
Alexander



