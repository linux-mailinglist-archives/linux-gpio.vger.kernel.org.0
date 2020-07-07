Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCAE2216B9F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 13:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgGGLeX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 07:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbgGGLeW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 07:34:22 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2816C08C5E0
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 04:34:21 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d21so24499024lfb.6
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 04:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZWFCdEUgk5dfzDM3fhNe+v2tWxrsCvDUWA3/QI1yjsA=;
        b=dRxCuE1+l4lJyQ2YbJAaOdam3ofJb8lgOtEdWezxKOyRRyDMxmvt7gEf0x6w0E8JX6
         zfj7ZoIxtLjX0RoOMTlhhp7h2JjwzRPmSlFeghxpjgBnoebMvd8IizTdR+RZTz7Tb7e8
         GWLtSt2RMzfl/2xH9EXD3CfW9B5mBTWTW6Qi28YrmmDUD8WfYzAp+GMW/NX1sf2jcim9
         p9TV40K9JWSp95sXcbLXnhApLLu0A0ABHN7alxdXkM1r9I/97RVRvjvbSl0rwCFDnrds
         MgVQ5wl2VKBhy5HWTXFp0joV93UB52d4AMRaTt7+yi4p9Oni+yYVsyZGW1Ys135suUi7
         NP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZWFCdEUgk5dfzDM3fhNe+v2tWxrsCvDUWA3/QI1yjsA=;
        b=JgWeMNZLCynxRyWNio/Ickoao5TnPB4JBvOr1391TgE8g8Vcn0c59sPeKkum2eNGXr
         STgSEQyzvowMYTTyWGBE5gTwJU9Eevl9VnIBHb1yqxKyQg16pTwwbZG+Xb/pNwuaw6NE
         55NMpYwY+xlhsByRYAwkj2OIGOLEIGBECiqKojecteaS5wX6Wa2hWIimR2IyVtPEqAqT
         c41+BMIzms6XfOXyuW0qHQkDLT8vEQpZE0A5lGH4t+DC8kJpUH0Wr+iOVCxxjTN34v44
         4zD5yd59TeyT6S90DcmUAoh9mZ4x6Q2qXsBUfcOHNrE37JNlANzf8XyWwb0AsqWI7q/A
         WMtg==
X-Gm-Message-State: AOAM533F3PFmyPt7muqaPTd6IfwoxGAiZoVsZOq/sIY8tZx/HuUCaLjB
        5djQEnDkSi0aM+b9+MTAfPYHbuPeuf0QP9tzueLB4Q==
X-Google-Smtp-Source: ABdhPJyIiIuyUQqHN3zlh6wrnfN64GqNkLKnTcdf/MuoVjXEMgRphXgXP3Wlti/RgXHlE/J8tuuX/mMRGR2kcN3VA8g=
X-Received: by 2002:a19:745:: with SMTP id 66mr32821101lfh.77.1594121660274;
 Tue, 07 Jul 2020 04:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com> <CACRpkdavqjcma8A1y9Sh=WWLu-n0+mQOhyNw2dHenA8ZnQkvgg@mail.gmail.com>
In-Reply-To: <CACRpkdavqjcma8A1y9Sh=WWLu-n0+mQOhyNw2dHenA8ZnQkvgg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:34:09 +0200
Message-ID: <CACRpkdb5TyictD3j_PE5JtBJmxX87Bk04YkxF1ErsbHwO4TSOg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To:     Hanks Chen <hanks.chen@mediatek.com>,
        Sean Wang <sean.wang@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, wsd_upstream@mediatek.com,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 7, 2020 at 1:31 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Jun 18, 2020 at 1:34 PM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> > for virtual gpios, they should not do reg setting and
> > should behave as expected for eint function.
> >
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
>
> Sean if you're OK with this patch I can just apply it separately.

Ah nevermind since the next patch has your ACK I just applied this
too since it's a dependency. Yell if this is wrong.

Yours,
Linus Walleij
