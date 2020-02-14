Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F80615E502
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 17:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393913AbgBNQjP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 11:39:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55622 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2393907AbgBNQjP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 11:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581698353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ejjWyNnsQ4fYjfK0i4jU0/WTc3mIEUoKR3OpTBufYKo=;
        b=Amj+zpwnEEXyPvBvI3Zqu+eNDggXcfDR/D8NLDJPKlIu1LVMjPNV7iMvEG2vrV4FQRQOGk
        qmVmytk8q40svJnTvS9Nz+r+KQLETPrLmy+w2eQTkzv5vwotPjehI9jcjLzkGGgNdnbTH6
        VRBEqYJYKJ9sGZxnaHro8LOFkHvqOVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-vWas1kg9MGecCh9FP-ZwqQ-1; Fri, 14 Feb 2020 11:39:09 -0500
X-MC-Unique: vWas1kg9MGecCh9FP-ZwqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F49F18B9FC2;
        Fri, 14 Feb 2020 16:39:08 +0000 (UTC)
Received: from treble.redhat.com (ovpn-121-12.rdu2.redhat.com [10.10.121.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 739ED10021B2;
        Fri, 14 Feb 2020 16:39:07 +0000 (UTC)
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] pinctrl: ingenic: Make unreachable path more robust
Date:   Fri, 14 Feb 2020 10:37:40 -0600
Message-Id: <73f0c9915473d9e4b3681fb5cc55144291a43192.1581698101.git.jpoimboe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the second loop of ingenic_pinconf_set(), it annotates the switch
default case as unreachable().  The annotation is technically correct,
because that same case would have resulted in an early return in the
previous loop.

However, if a bug were to get introduced later, for example if an
additional case were added to the first loop without adjusting the
second loop, it would result in nasty undefined behavior: most likely
the function's generated code would fall through to the next function.

Another issue is that, while objtool normally understands unreachable()
annotations, there's one special case where it doesn't: when the
annotation occurs immediately after a 'ret' instruction.  That happens
to be the case here because unreachable() is immediately before the
return.

So change the unreachable() to BUG() so that the unreachable code, if
ever executed, would panic instead of introducing undefined behavior.
This also makes objtool happy.

This fixes the following objtool warning:

  drivers/pinctrl/pinctrl-ingenic.o: warning: objtool: ingenic_pinconf_se=
t() falls through to next function ingenic_pinconf_group_set()

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-=
ingenic.c
index 96f04d121ebd..6b61ac6cd4d2 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2158,7 +2158,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *=
pctldev, unsigned int pin,
 			break;
=20
 		default:
-			unreachable();
+			BUG();
 		}
 	}
=20
--=20
2.21.1

