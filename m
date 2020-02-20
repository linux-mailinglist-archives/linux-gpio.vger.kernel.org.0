Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C27166110
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 16:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgBTPf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 10:35:56 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24558 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728295AbgBTPf4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 10:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582212955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zJaV7/DZwvicawYxW2NkeFWBZ8k2VoRAdC8KEafaV2c=;
        b=NqCJGygJi7DVorp2lcpdLwH3ftyrjGZ65wFejYIAXlPoE/Ef8IVuDD/kIxuJHBTsZgTHwf
        rSezrjKrKi9Lkic5Ynb7LchK3+BtP0kFHN6wvcJylyJ7clAO93QFSEylZiiWdo5j3Qijo9
        kW+3Z0HJ7tDA7H9B683t/AvCskUhJ5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-27DWYv0vNgm8V8ZTZpf3Jw-1; Thu, 20 Feb 2020 10:35:53 -0500
X-MC-Unique: 27DWYv0vNgm8V8ZTZpf3Jw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42F8B800D4E;
        Thu, 20 Feb 2020 15:35:51 +0000 (UTC)
Received: from treble.redhat.com (ovpn-123-230.rdu2.redhat.com [10.10.123.230])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C366F5C1B0;
        Thu, 20 Feb 2020 15:35:49 +0000 (UTC)
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] pinctrl: ingenic: Improve unreachable code generation
Date:   Thu, 20 Feb 2020 09:35:09 -0600
Message-Id: <bc20fdbcb826512cf76b7dfd0972740875931b19.1582212881.git.jpoimboe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the second loop of ingenic_pinconf_set(), it annotates the switch
default case as unreachable().  The annotation is technically correct,
because that same case would have resulted in an early function return
in the previous loop.

However, the compiled code is suboptimal.  GCC seems to work extra hard
to ensure that the unreachable code path triggers undefined behavior.
The function would fall through to start executing whatever function
happens to be next in the compilation unit.

This is problematic because:

  a) it adds unnecessary 'ensure undefined behavior' logic, and
     corresponding i-cache footprint; and

  b) it's less robust -- if a bug were to be introduced, falling through
     to the next function would be catastrophic.

Yet another issue is that, while objtool normally understands
unreachable() annotations, there's one special case where it doesn't:
when the annotation occurs immediately after a 'ret' instruction.  That
happens to be the case here because unreachable() is immediately before
the return.

Remove the unreachable() annotation and replace it with a comment.  This
simplifies the code generation and changes the unreachable error path to
just silently return instead of corrupting execution.

This fixes the following objtool warning:

  drivers/pinctrl/pinctrl-ingenic.o: warning: objtool: ingenic_pinconf_se=
t() falls through to next function ingenic_pinconf_group_set()

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-=
ingenic.c
index 96f04d121ebd..13c7d3351ed5 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2158,7 +2158,8 @@ static int ingenic_pinconf_set(struct pinctrl_dev *=
pctldev, unsigned int pin,
 			break;
=20
 		default:
-			unreachable();
+			/* unreachable */
+			break;
 		}
 	}
=20
--=20
2.21.1

