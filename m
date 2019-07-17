Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E52256BC1B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 14:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfGQMHB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 08:07:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:54474 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfGQMHA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 08:07:00 -0400
Received: by mail-io1-f71.google.com with SMTP id n8so26849905ioo.21
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2019 05:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=XMiM4VhhNGMXt1YUP9hYUP+H6sfTtdLHWoBTL1ud0JA=;
        b=k2cA2xLFQxk4GTF6rf/s9CSidOEX2ayCqwMCehIrjzne9yNvb95mrsrwGL7R3mv7FC
         4/kiDY6tDd1oZR+iW5LZrFE+rE8F0xMalaRZ9JUvwzJ61qf8L9MarttOlHv9kkVdRe1k
         54iuhObVgxrHFD8ZcQcNGQFGfL7o4iQKd9Ezw4VGDUCWRlqV7iCtoJ4KG+Y8k3S3z6iR
         z7+XvgmANl+GcO4rcgZf8o0g0SHRQOXZI2htV7/XuS4n2ns6ryiCig1vNmZ65lKeEK6k
         VmmRazNMPaKGsZuVsfb1j745H3fSEPYGkbKC3kgcgqg3BDVe8pA5crFUKhhVqVJM+yMS
         5V1g==
X-Gm-Message-State: APjAAAWKXupM7ONe172FA1EbxtNudSIObyOZ1NJ1Bqy5ROQw3gNOZefK
        Hc3SSCFKn9nL3TdN93+FczxmMSU+yVff02mbSoklkuUknsvz
X-Google-Smtp-Source: APXvYqzJDIa9bplYl+1WI2lx91wpvWCo7zcTm57mmmA3Rf0j84ecemM7YLsQPb+m1xJjo13foqByIr28LUi38D216xL3GGJaASl1
MIME-Version: 1.0
X-Received: by 2002:a02:bca:: with SMTP id 193mr1412225jad.46.1563365220270;
 Wed, 17 Jul 2019 05:07:00 -0700 (PDT)
Date:   Wed, 17 Jul 2019 05:07:00 -0700
In-Reply-To: <CAAeHK+x4KAy2koonjij26iowtPuj67F=Mx+g0kYF968Zr-h8xg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009bc9b3058ddf5401@google.com>
Subject: Re: WARNING in gpio_to_desc
From:   syzbot <syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bgolaszewski@baylibre.com,
        cuissard@marvell.com, johan@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, sameo@linux.intel.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=d90745bdf884fc0a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=126cd1a4600000

Note: testing is done by a robot and is best-effort only.
