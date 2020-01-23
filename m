Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79CA3146C49
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 16:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgAWPHM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 10:07:12 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34860 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgAWPHL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 10:07:11 -0500
Received: by mail-lf1-f68.google.com with SMTP id z18so2557021lfe.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 07:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LO2b8uVYVBtkLDQSkWiZOiZeR9UaVRc6c7oLAxiq0hs=;
        b=L8NE79R9J3d4CO6b59XTiUIFYotqfCg7rEI6/iByzUEA3FODTd/T6JOtG8bUKnUoc6
         78/roEZXuyoIbVFDHsUiAr48VYDPT65EQBJoADV/TRCYFM+GsDEAl8jXJqvy93dy66Of
         yqwZ2YcadIjcEOjCnxXmFlX+4e97Tn88hLMiG49i4NKufYwLjwe9IcD6IoRu2so+ShEy
         Aqga92LMx7pO0sXUS5lkn2zDNOYjilWoxQRjLsWdenwGBUqr5Z+F2fYwnWlngIywgiEK
         QHr1OI+M7XuvC0jZ0rufP5WFZYbbOtwrNIch5Fh0Q3+TwyldE2Ops76pGUemkVFhyPeJ
         SRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LO2b8uVYVBtkLDQSkWiZOiZeR9UaVRc6c7oLAxiq0hs=;
        b=m9Us8HLHXKMTOXTsb0gPkQ5WSTgRplCGSgtLQpnHtD+cjIGRQN7cuP9U3/j1nSzhoD
         anfnL3dFvaNp+Sq6m9qEBBC5JEMwoWpWbmy+8jAxiodU2epbh0imCeZ0hrNiO30ApqCM
         Z1NUFXc9uxMh77TcEhTxTd11fRH/I2Cz+f1acFh660qR98FWmppJE50+YYf/anDMAZse
         xMuCOK2kkZ01zG4vmSVBY/Y5m4cNskiR9njI39ygmkR2XyWrklzdtReZV8Owjabfe99v
         jH7RjArsCMieyg+IP3k5BLYe4/U4GaO+NFF0fhz15k5lt+u8EyjUnjYhOOZnfLlE76xR
         1WhQ==
X-Gm-Message-State: APjAAAWHNpk/XvYzDsBDJ5K+MPlNy2yj5bHzfDVlkDfuFMS8VDzTWusO
        Lz1EjZYfsSGtBEZQq+aCxE7+03gR6hDtWXFyx0+bCw==
X-Google-Smtp-Source: APXvYqySCUYd+U3ZvPuMwCzrM2ftGIrgnFPVoMuA9jR8gZ3PcpcdibtTAWSuOFjbM8o+bjA9sAjze4V6fKpgDMdCUSE=
X-Received: by 2002:a19:dc14:: with SMTP id t20mr4884795lfg.47.1579792029804;
 Thu, 23 Jan 2020 07:07:09 -0800 (PST)
MIME-Version: 1.0
References: <1576672860-14420-1-git-send-email-peng.fan@nxp.com> <AM0PR04MB448174E1DE647E9F2F65106988360@AM0PR04MB4481.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB448174E1DE647E9F2F65106988360@AM0PR04MB4481.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 16:06:58 +0100
Message-ID: <CACRpkdbi8KTEEEpv0fv3Hq_gyRqR0Kzeb799P6woq7+xwhdgUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 16, 2020 at 9:28 AM Peng Fan <peng.fan@nxp.com> wrote:

> Hi Linus,
>
> > Subject: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
>
> Would you pick this patch up?
>
> Per Uwe, this v1 patch use %pe is better that v2 use %d.

OK patch applied to my devel branch for v5.6.

Yours,
Linus Walleij
