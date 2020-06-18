Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE681FFE5A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 00:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbgFRWwI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 18:52:08 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:44624 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbgFRWwH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2020 18:52:07 -0400
Received: by mail-il1-f197.google.com with SMTP id l11so5115687ils.11
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2020 15:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=eWQTfX1g8JOgeWYSSIzFk760Kxm5cADaSJtq+50orro=;
        b=McD5yFo6X2+mwFiBtaEWFKY/EM5QZ3gRGiVc8RzoP0jGNJJTHpXMR7TZAFUZt2Phw0
         9xjQ/E7qv9HomvIj1b9hak23w4npkfCk35P0U1MC9eKiPOF0m2L9gBi4bS9zVLIDrsyc
         INks4rfJKKqmPeqCrJ+P11CZr4N6/nNxZj+JPYmMV+NbyPIYgnvXB10rinbJlHMx4VF8
         K3nzvMcZxXkSDZzvrBOANSPsEa/2L2nCflGb6kZ12NJNEpeODQtYsHwINg/4crcPqG9r
         8jn4TwyfslAL2dSjXRfbOJJTVS+Qh9LFNvgYluvWZLfrUJg3lNXO7OLImCgUZipa0sL9
         RxPg==
X-Gm-Message-State: AOAM531WF+Qj4orhxgyNkK/LkZGbxSTSjHuYChgzkCyCFSExieOuyO1Y
        LhQf5kfP5sFMqBoO78BA7wKKelmWexCxfKdysFi0fh2ZscBJ
X-Google-Smtp-Source: ABdhPJzueD6XzKGdxKBPJFSLQ5DjaVU/HXFzLbQiJVdvX4tT+HS52gVxYvFpJZJ1Ljb0snBMpA/OhqPiLRLuhFxaiBc66KFh8fm0
MIME-Version: 1.0
X-Received: by 2002:a92:a198:: with SMTP id b24mr864894ill.46.1592520726414;
 Thu, 18 Jun 2020 15:52:06 -0700 (PDT)
Date:   Thu, 18 Jun 2020 15:52:06 -0700
In-Reply-To: <00000000000086d87305801011c4@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000320bcb05a863a04c@google.com>
Subject: Re: general protection fault in __bfs (2)
From:   syzbot <syzbot+c58fa3b1231d2ea0c4d3@syzkaller.appspotmail.com>
To:     amitc@mellanox.com, andy.shevchenko@gmail.com,
        bgolaszewski@baylibre.com, bp@alien8.de, davem@davemloft.net,
        douly.fnst@cn.fujitsu.com, hpa@zytor.com, idosch@mellanox.com,
        jon.maloy@ericsson.com, konrad.wilk@oracle.com,
        len.brown@intel.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, netdev@vger.kernel.org, petrm@mellanox.com,
        puwen@hygon.cn, rppt@linux.vnet.ibm.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        tipc-discussion@lists.sourceforge.net, x86@kernel.org,
        ying.xue@windriver.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

syzbot suspects this bug was fixed by commit:

commit 46ca11177ed593f39d534f8d2c74ec5344e90c11
Author: Amit Cohen <amitc@mellanox.com>
Date:   Thu May 21 12:11:45 2020 +0000

    selftests: mlxsw: qos_mc_aware: Specify arping timeout as an integer

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1315b059100000
start commit:   8834f560 Linux 5.0-rc5
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f00801d7b7c4fe6
dashboard link: https://syzkaller.appspot.com/bug?extid=c58fa3b1231d2ea0c4d3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15bab650c00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a331df400000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: selftests: mlxsw: qos_mc_aware: Specify arping timeout as an integer

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
