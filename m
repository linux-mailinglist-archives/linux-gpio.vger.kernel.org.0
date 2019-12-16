Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F63E1202B0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 11:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbfLPKdf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 05:33:35 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35481 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbfLPKdf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 05:33:35 -0500
Received: by mail-lf1-f66.google.com with SMTP id 15so3845565lfr.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 02:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kf4GwMcKEyP7E4ADJPoI/Ppjsvr0zxu955LKFceYGDw=;
        b=RDOSNMLefpSQpETal85Bim9dPhogcTCS67hhUNMY+1TEzPu40+B8/Ri9cpSlWYEzEr
         X0vgBsDyYL2PXIC/0V8fl10D9tSbnPiZia3+s+/eCCTadthyMr6NucS5B/3O9mHT/Txd
         fT68R1/ja79MMnNvWrrDwVtb1c3M0R0dnE7pGC65XQPv62Zun2qZMLG2tLswiZ0c/mLi
         8M57mVlVCQbwQ95NMX5/Mzz31bsQBbwwx6cK2VRiRzIyMVMkt411kY9yfNq9a7SDQfXB
         A2aTBqHcTVtIfNymGpOn2uThr3BELb8O+zSDS14EJFP0G1CQlffGF9hZ+fxv6jj2/Q1J
         fk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kf4GwMcKEyP7E4ADJPoI/Ppjsvr0zxu955LKFceYGDw=;
        b=TdP04PtosuLaNTs14DKeEXCy3uOjg3gSkmCOwUlKEJdrcGw5vyX1400G2n2q1NV7H9
         PjpDYnZQ4Op3ttM7n05ThB9JYAetmHIGavb6tzOIr5Cde2og6UIP3QEcXhoCO+vqwT/y
         WXD2SCeJbKDRDjKbmm07Ew1VEUZsEmqd5XqLp1J2Hxjg3vFcLgM6hiVxF1kKzGH1dT38
         jVmOV84UfpDC20rd/khIsUW/jVN839eS2cSAvXPA23R+p0svHgTmOjgbO8eiXIkzyc2P
         ETvQGL4Pd/RL2oD1/pCvFFCGzLWsUVZQ7fbUJIN8zhq1JBVamR1KRXq0d/ttS6Bn6m/T
         5tPA==
X-Gm-Message-State: APjAAAW2f1shBXXenPP9/JY5DkLOWmE1nH5NmD/nNvDpJyGaMegQEjFc
        ZiwG0KS0/fX/2pEmlW0Nv2nDlTwNaws8GXLu61Mctw==
X-Google-Smtp-Source: APXvYqymHPUmY8/CzNHdDAD6AwTm1kirH1H2wRv3LEavU5/vztz8RFIuac9dcS+gpU/Uw8IJghQSICFKXObovOuodQw=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr15747213lfi.93.1576492413336;
 Mon, 16 Dec 2019 02:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
 <20191212160413.15232-4-m.felsch@pengutronix.de> <AM5PR1001MB0994E2D72A95E4AC4796F80A80550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191216074734.ctjxx6rqtj6mt2dw@pengutronix.de>
In-Reply-To: <20191216074734.ctjxx6rqtj6mt2dw@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 11:33:21 +0100
Message-ID: <CACRpkdbZ67jp64oMS0Q=aDuo18i_fT22grST0qSVjk_9EV=4hw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 3/3] pinctrl: da9062: add driver support
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 16, 2019 at 8:47 AM Marco Felsch <m.felsch@pengutronix.de> wrote:

> Nice catch, Linus is it okay to add this as follow up patch? The current
> patch isn't wrong without the 'PIN_CONFIG_BIAS_DISABLE' case.

No strong opinion on that as long as the result is running code.

Yours,
Linus Walleij
