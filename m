Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC2EC1615F3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 16:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgBQPSO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 10:18:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37345 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727469AbgBQPSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 10:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581952692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oApQbLrzVVhu1jd7qefxCRV4mfxdoYPT/JD7M+EYzVc=;
        b=dbq0K6gEAly8RwjerJJ+KVI46yWYNYxXunO7P8ny0Mx9Q4j54/GryR/ArBupKALRRhx9ZN
        vVkpom5lQ81lImPlXyCeiAmXxOyIuIojkgN9DoFO0LkAd/Ef8jE3nowRmWCLrG3+WgiKhO
        uDln+i/6iREdSjuVO13Ptg0hc+0Bysk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-6_f05MjcO6e7fPTJl3sKMg-1; Mon, 17 Feb 2020 10:18:08 -0500
X-MC-Unique: 6_f05MjcO6e7fPTJl3sKMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84C2913E6;
        Mon, 17 Feb 2020 15:18:07 +0000 (UTC)
Received: from treble (ovpn-121-12.rdu2.redhat.com [10.10.121.12])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A85BD60BE1;
        Mon, 17 Feb 2020 15:18:06 +0000 (UTC)
Date:   Mon, 17 Feb 2020 09:18:04 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] pinctrl: ingenic: Make unreachable path more robust
Message-ID: <20200217151804.yymflofpbiqjqnnz@treble>
References: <73f0c9915473d9e4b3681fb5cc55144291a43192.1581698101.git.jpoimboe@redhat.com>
 <1581706938.3.5@crapouillou.net>
 <20200214203738.af3y4gskukctvvum@treble>
 <1581734224.3.14@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581734224.3.14@crapouillou.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 14, 2020 at 11:37:04PM -0300, Paul Cercueil wrote:
> > >  I don't like the idea that you change this driver's code just to
> > > work around
> > >  a bug in objtool, and I don't like the idea of working around a
> > > future bug
> > >  that shouldn't be introduced in the first place.
> > 
> > It's not an objtool bug.  It's a byproduct of the fact that GCC's
> > undefined behavior is inscrutable, and there's no way to determine that
> > it actually *wants* to jump to a random function.
> > 
> > And anyway, regardless of objtool, the patch is meant to make the code
> > more robust.
> > 
> > Do you not agree that BUG (defined behavior) is more robust than
> > unreachable (undefined behavior)?
> 
> It's a dead code path. That would be an undefined behaviour, if it was
> taken, but it's not.

Given your confidence that humans don't introduce bugs, would you
recommend that we

  s/BUG()/unreachable()/

tree-wide?

Another option would be to remove the unreachable() statement, which
would actually improve the generated code by making it more compact (16
bytes of i-cache savings), on top of removing the "fallthrough to next
function" nastiness.

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 96f04d121ebd..13c7d3351ed5 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2158,7 +2158,8 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 
 		default:
-			unreachable();
+			/* unreachable */
+			break;
 		}
 	}
 

