Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED9616545A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 02:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgBTBhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 20:37:14 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:41586 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbgBTBhN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 20:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582162631; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g/qGIDqkgIozFpdOtlMp+Dtu76f8lgaOYvJWkuAfEMw=;
        b=wz426QWDY0aAgnJ0mydROr4g5rQFH4aMNVQWOmSvFmaQc3DLt1kqFqoSyu8wLMHEuYNlgv
        32i2A1fLG0X2CksRvPxLmRzlItTLSlcUIB9oJmJihRxyNXSEErZozb1HRXj/MvvJBBM/Od
        XWvUxzlU/1w/+gVPITvNW9s4CyLTe84=
Date:   Wed, 19 Feb 2020 22:36:57 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] pinctrl: ingenic: Make unreachable path more robust
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Message-Id: <1582162617.3.1@crapouillou.net>
In-Reply-To: <20200217151804.yymflofpbiqjqnnz@treble>
References: <73f0c9915473d9e4b3681fb5cc55144291a43192.1581698101.git.jpoimboe@redhat.com>
        <1581706938.3.5@crapouillou.net> <20200214203738.af3y4gskukctvvum@treble>
        <1581734224.3.14@crapouillou.net> <20200217151804.yymflofpbiqjqnnz@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Josh,

Le lun., f=E9vr. 17, 2020 at 09:18, Josh Poimboeuf <jpoimboe@redhat.com>=20
a =E9crit :
> On Fri, Feb 14, 2020 at 11:37:04PM -0300, Paul Cercueil wrote:
>>  > >  I don't like the idea that you change this driver's code just=20
>> to
>>  > > work around
>>  > >  a bug in objtool, and I don't like the idea of working around a
>>  > > future bug
>>  > >  that shouldn't be introduced in the first place.
>>  >
>>  > It's not an objtool bug.  It's a byproduct of the fact that GCC's
>>  > undefined behavior is inscrutable, and there's no way to=20
>> determine that
>>  > it actually *wants* to jump to a random function.
>>  >
>>  > And anyway, regardless of objtool, the patch is meant to make the=20
>> code
>>  > more robust.
>>  >
>>  > Do you not agree that BUG (defined behavior) is more robust than
>>  > unreachable (undefined behavior)?
>>=20
>>  It's a dead code path. That would be an undefined behaviour, if it=20
>> was
>>  taken, but it's not.
>=20
> Given your confidence that humans don't introduce bugs, would you
> recommend that we
>=20
>   s/BUG()/unreachable()/
>=20
> tree-wide?

Of course not.

> Another option would be to remove the unreachable() statement, which
> would actually improve the generated code by making it more compact=20
> (16
> bytes of i-cache savings), on top of removing the "fallthrough to next
> function" nastiness.

I'd prefer that, yes.

-Paul

> diff --git a/drivers/pinctrl/pinctrl-ingenic.c=20
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 96f04d121ebd..13c7d3351ed5 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2158,7 +2158,8 @@ static int ingenic_pinconf_set(struct=20
> pinctrl_dev *pctldev, unsigned int pin,
>  			break;
>=20
>  		default:
> -			unreachable();
> +			/* unreachable */
> +			break;
>  		}
>  	}
>=20
>=20

=

