Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFB315F64D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 20:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgBNTCe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 14:02:34 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:51406 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbgBNTCe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 14:02:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581706951; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yvCOCg562GCkzsEcg5HQ6kirpT7S0uOjNf100aPmIzw=;
        b=HmWCZB+seF4VoaFtudUXtxPcGvJyCFWed1h8dyYi0eEuCbC9s9gAehGzTtjNvxZ2VZvSaJ
        FN5Tdx8kBJ37s66o65/yhtTGh1PvFQuzvuRsPgpThWEvo9UFbj2NnB5bz/mJDmXfDdA5jl
        Eu+KOwTBwLPnD6C4oAnB/M5g4j9q8BA=
Date:   Fri, 14 Feb 2020 16:02:18 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] pinctrl: ingenic: Make unreachable path more robust
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Message-Id: <1581706938.3.5@crapouillou.net>
In-Reply-To: <73f0c9915473d9e4b3681fb5cc55144291a43192.1581698101.git.jpoimboe@redhat.com>
References: <73f0c9915473d9e4b3681fb5cc55144291a43192.1581698101.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Josh,


Le ven., f=E9vr. 14, 2020 at 10:37, Josh Poimboeuf <jpoimboe@redhat.com>=20
a =E9crit :
> In the second loop of ingenic_pinconf_set(), it annotates the switch
> default case as unreachable().  The annotation is technically correct,
> because that same case would have resulted in an early return in the
> previous loop.
>=20
> However, if a bug were to get introduced later, for example if an
> additional case were added to the first loop without adjusting the
> second loop, it would result in nasty undefined behavior: most likely
> the function's generated code would fall through to the next function.
>=20
> Another issue is that, while objtool normally understands=20
> unreachable()
> annotations, there's one special case where it doesn't: when the
> annotation occurs immediately after a 'ret' instruction.  That happens
> to be the case here because unreachable() is immediately before the
> return.
>=20
> So change the unreachable() to BUG() so that the unreachable code, if
> ever executed, would panic instead of introducing undefined behavior.
> This also makes objtool happy.

I don't like the idea that you change this driver's code just to work=20
around a bug in objtool, and I don't like the idea of working around a=20
future bug that shouldn't be introduced in the first place.

-Paul

>=20
> This fixes the following objtool warning:
>=20
>   drivers/pinctrl/pinctrl-ingenic.o: warning: objtool:=20
> ingenic_pinconf_set() falls through to next function=20
> ingenic_pinconf_group_set()
>=20
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> ---
>  drivers/pinctrl/pinctrl-ingenic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c=20
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 96f04d121ebd..6b61ac6cd4d2 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2158,7 +2158,7 @@ static int ingenic_pinconf_set(struct=20
> pinctrl_dev *pctldev, unsigned int pin,
>  			break;
>=20
>  		default:
> -			unreachable();
> +			BUG();
>  		}
>  	}
>=20
> --
> 2.21.1
>=20

=

