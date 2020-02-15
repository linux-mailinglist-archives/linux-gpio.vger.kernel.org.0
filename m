Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E58D15FC5E
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2020 03:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgBOChW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 21:37:22 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:41108 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727642AbgBOChV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 21:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581734239; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p/ZgtT/EWlP8S07DoLu7mgPjnXJL5osG0o5D3ejyABU=;
        b=iBnVhq6gFJF8sUysJqkAJION1gVPdQ5OzAGA5DCV0p7Z1f9lCftPfVMxqbojBwKthWRJhQ
        NpnUx+YgKfRstx0V4B93oWoUxHRIQsd2ZSaCUlSmTcyhLnKrvSsVbDO93EMQ/dmEpoAdUI
        daa4bk730Fs4eKlY0kp9gN7DKsi7TaA=
Date:   Fri, 14 Feb 2020 23:37:04 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] pinctrl: ingenic: Make unreachable path more robust
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Message-Id: <1581734224.3.14@crapouillou.net>
In-Reply-To: <20200214203738.af3y4gskukctvvum@treble>
References: <73f0c9915473d9e4b3681fb5cc55144291a43192.1581698101.git.jpoimboe@redhat.com>
        <1581706938.3.5@crapouillou.net> <20200214203738.af3y4gskukctvvum@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



Le ven., f=E9vr. 14, 2020 at 14:37, Josh Poimboeuf <jpoimboe@redhat.com>=20
a =E9crit :
> On Fri, Feb 14, 2020 at 04:02:18PM -0300, Paul Cercueil wrote:
>>  Hi Josh,
>>=20
>>=20
>>  Le ven., f=E9vr. 14, 2020 at 10:37, Josh Poimboeuf=20
>> <jpoimboe@redhat.com> a
>>  =E9crit :
>>  > In the second loop of ingenic_pinconf_set(), it annotates the=20
>> switch
>>  > default case as unreachable().  The annotation is technically=20
>> correct,
>>  > because that same case would have resulted in an early return in=20
>> the
>>  > previous loop.
>>  >
>>  > However, if a bug were to get introduced later, for example if an
>>  > additional case were added to the first loop without adjusting the
>>  > second loop, it would result in nasty undefined behavior: most=20
>> likely
>>  > the function's generated code would fall through to the next=20
>> function.
>>  >
>>  > Another issue is that, while objtool normally understands=20
>> unreachable()
>>  > annotations, there's one special case where it doesn't: when the
>>  > annotation occurs immediately after a 'ret' instruction.  That=20
>> happens
>>  > to be the case here because unreachable() is immediately before=20
>> the
>>  > return.
>>  >
>>  > So change the unreachable() to BUG() so that the unreachable=20
>> code, if
>>  > ever executed, would panic instead of introducing undefined=20
>> behavior.
>>  > This also makes objtool happy.
>>=20
>>  I don't like the idea that you change this driver's code just to=20
>> work around
>>  a bug in objtool, and I don't like the idea of working around a=20
>> future bug
>>  that shouldn't be introduced in the first place.
>=20
> It's not an objtool bug.  It's a byproduct of the fact that GCC's
> undefined behavior is inscrutable, and there's no way to determine=20
> that
> it actually *wants* to jump to a random function.
>=20
> And anyway, regardless of objtool, the patch is meant to make the code
> more robust.
>=20
> Do you not agree that BUG (defined behavior) is more robust than
> unreachable (undefined behavior)?

It's a dead code path. That would be an undefined behaviour, if it was=20
taken, but it's not.

-Paul

=

