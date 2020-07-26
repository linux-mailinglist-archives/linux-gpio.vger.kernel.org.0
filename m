Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF54722DDD9
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jul 2020 11:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgGZJ5H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jul 2020 05:57:07 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:49734 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgGZJ5G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jul 2020 05:57:06 -0400
Received: by mail-io1-f72.google.com with SMTP id f7so3672984ioj.16
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 02:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=M+lItSmzANKwPOA/FLnsRuuzLx9O8sKK2O7ztiuewsw=;
        b=UrhQSFO0ywJNveYFko2iGEaswAKBWU1TuF8iaaH58ECgTeRyEyp1SBN2rajwfZ2dy+
         jIA6SQsfJIswpBko96dcIJ6uuKUQa8okdJCc4GSMM2zuIDmYjblynrK4Zyw5GeRSanwB
         c1NgoXGvuvfS3vgOQneFVVBGRVHbrD+bYL9mM/mVvWZIkI+oO72H2a16dGObkgH2LuWR
         nzqHc1lFSlKDIRfFssKRs1HpIl/EyGhl7J4tTJHR0buiS9pDaEqv1HPjUNyobPsYPPSB
         3iMAtpfq0Ci67C9b5Dt1wTl6BfNEeWZht9WjEdmeGipTF1wCbb76+3vN1VHNgERbKPhd
         bEFg==
X-Gm-Message-State: AOAM531pImc3bcvgEITC5tb5r+WV3gzmYvsITBN/EzVJEyvGycpRCwuc
        JakrPS9DnthxfCezKLSg9jq5iRTuLHhx/zRxfx+45ceitoqO
X-Google-Smtp-Source: ABdhPJzTKAuBrLOcNZShjjC5K+KAmmPmtsbgfXbsIB9MoOqOOoq6/meN+p4dsSnL857g+Eev4GfZNXcqIkmPJyR9BymjGF4MALae
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1495:: with SMTP id j21mr20749916jak.136.1595757425808;
 Sun, 26 Jul 2020 02:57:05 -0700 (PDT)
Date:   Sun, 26 Jul 2020 02:57:05 -0700
In-Reply-To: <000000000000a376c105a8313901@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000083581705ab553aab@google.com>
Subject: Re: KASAN: use-after-free Read in __smsc95xx_mdio_read
From:   syzbot <syzbot+a7ebdb01bb2cc165cab6@syzkaller.appspotmail.com>
To:     Markus.Elfring@web.de, UNGLinuxDriver@microchip.com,
        davem@davemloft.net, dingxiang@cmss.chinamobile.com,
        hdanton@sina.com, kuba@kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, steve.glendinning@shawell.net,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 7e23ab72e73bc601b4cf2983382691d9f165c8d1
Author: Ding Xiang <dingxiang@cmss.chinamobile.com>
Date:   Mon Mar 30 07:56:26 2020 +0000

    pinctrl: nomadik:remove unneeded variable

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13cfe3a0900000
start commit:   7ae77150 Merge tag 'powerpc-5.8-1' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d195fe572fb15312
dashboard link: https://syzkaller.appspot.com/bug?extid=a7ebdb01bb2cc165cab6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17046c66100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=140a8a3e100000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: pinctrl: nomadik:remove unneeded variable

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
