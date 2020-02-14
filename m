Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1A715F7D3
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 21:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730234AbgBNUhs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 15:37:48 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33811 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730283AbgBNUhr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Feb 2020 15:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581712666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UGcUHbwqqpeQnJQwyCqeDTtom+aR+5t20Vzf3Q4bt2Q=;
        b=cUuppIE+Qgua70w+K2gCrlUD9bGEe4GuW2yuuIbZ4jhRccuFmkHS5eauu5pxczb7YDSpkX
        OHIgxgMyu+vtX3cy2YF/3gBdMAJmSgpqZG8i/h2we2Qjh9w363MFDQQh8rWwr5M1sydSXN
        TdzFYl5p3jrnCPyJlAMSJHjiBevMCkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-1dILkOu6O_yVSE2iFnO4ew-1; Fri, 14 Feb 2020 15:37:42 -0500
X-MC-Unique: 1dILkOu6O_yVSE2iFnO4ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9E89801E67;
        Fri, 14 Feb 2020 20:37:40 +0000 (UTC)
Received: from treble (ovpn-121-12.rdu2.redhat.com [10.10.121.12])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E5C4460BE1;
        Fri, 14 Feb 2020 20:37:39 +0000 (UTC)
Date:   Fri, 14 Feb 2020 14:37:38 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] pinctrl: ingenic: Make unreachable path more robust
Message-ID: <20200214203738.af3y4gskukctvvum@treble>
References: <73f0c9915473d9e4b3681fb5cc55144291a43192.1581698101.git.jpoimboe@redhat.com>
 <1581706938.3.5@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581706938.3.5@crapouillou.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 14, 2020 at 04:02:18PM -0300, Paul Cercueil wrote:
> Hi Josh,
>=20
>=20
> Le ven., f=C3=A9vr. 14, 2020 at 10:37, Josh Poimboeuf <jpoimboe@redhat.=
com> a
> =C3=A9crit :
> > In the second loop of ingenic_pinconf_set(), it annotates the switch
> > default case as unreachable().  The annotation is technically correct=
,
> > because that same case would have resulted in an early return in the
> > previous loop.
> >=20
> > However, if a bug were to get introduced later, for example if an
> > additional case were added to the first loop without adjusting the
> > second loop, it would result in nasty undefined behavior: most likely
> > the function's generated code would fall through to the next function=
.
> >=20
> > Another issue is that, while objtool normally understands unreachable=
()
> > annotations, there's one special case where it doesn't: when the
> > annotation occurs immediately after a 'ret' instruction.  That happen=
s
> > to be the case here because unreachable() is immediately before the
> > return.
> >=20
> > So change the unreachable() to BUG() so that the unreachable code, if
> > ever executed, would panic instead of introducing undefined behavior.
> > This also makes objtool happy.
>=20
> I don't like the idea that you change this driver's code just to work a=
round
> a bug in objtool, and I don't like the idea of working around a future =
bug
> that shouldn't be introduced in the first place.

It's not an objtool bug.  It's a byproduct of the fact that GCC's
undefined behavior is inscrutable, and there's no way to determine that
it actually *wants* to jump to a random function.

And anyway, regardless of objtool, the patch is meant to make the code
more robust.

Do you not agree that BUG (defined behavior) is more robust than
unreachable (undefined behavior)?

--=20
Josh

