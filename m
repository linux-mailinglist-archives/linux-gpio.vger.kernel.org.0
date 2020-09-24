Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596D32765E5
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 03:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725273AbgIXBed (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 21:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIXBed (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 21:34:33 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2D3C0613CE;
        Wed, 23 Sep 2020 18:34:33 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id j11so2269429ejk.0;
        Wed, 23 Sep 2020 18:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BdVDi/8E9qWkSdKxeY/lJ0KoRE68VzIF4q1Pns2xhD4=;
        b=cchMfWJLbTknIU61451rYND7QC8qYeJgN6egxZppAsXuwTvDsYc8htefTrxT/eSqO2
         UpbmZvOVIOme+TpfwdjZlHCxpi3/pZ0cFL0T7Cy53lpD+RIIJivxhkE8VFGDITwx1+2G
         GqQMPHSYce5cwuh3vbcF6Q8rzMquc/XpFaWkWnnti0GdilXS/yHP8J/lGSO9/ThbbeqG
         ERtZ4fUOdGA25Tjn/USYwtASuI4VqyagxKDF9VZ3QMEgaZN1Af5Xo3f4oIKA1ZVUqrQe
         /xHhL5Lglc4moV/iF/KCCMYx2F47VucWY1rCPnFkkyUKzs5l38akdbY0/EBCzzC8lau+
         0FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BdVDi/8E9qWkSdKxeY/lJ0KoRE68VzIF4q1Pns2xhD4=;
        b=WTatE0FBzVXzu8Ll87+idsqSOzwJNVNPqNJQq31B8nb4QlIjEnxBKpMCifcNKzs4U+
         GJ7981db3sWT9vrhi9eRqq3Hp0HcVRbgTou30lhHgtVaD6uBp8t9wlPZvUIi5tUAqwUC
         5vnzEgWjM3Jf7Ofo+1U2DnHdRDE2Alc0RvGAtXmBoLehtJikKpNdDjznipOBoJcH+qUB
         60OXMQM+V6Umt55y/ADsf4vgXlr125XZwcalbq+5I/3uzXKdolak7G7KWEDMrutZBrak
         ioF+bZABn86IvDJODoHjVEQ8tXkL2sDaNU6L2rgdte35NS20zHl+VvrE2UpmrEBOyhlz
         6Rug==
X-Gm-Message-State: AOAM533b/jH3jcGM5ldP9cS8QUU6wRBoM1cdcR1j9/yY6DXLCWABl1HT
        t+p6ie65ALpmrG0kDBu7ocyui8BbGFm5NJcTOnk=
X-Google-Smtp-Source: ABdhPJzMxMdP4kSFMn/hJnAwQtYoFTQZYIFjGNisG2wS8nogdPXCZQxSXQvjrd6XQufmIDZ0SbrxRnwJ3VNn3PbOR1w=
X-Received: by 2002:a17:906:390d:: with SMTP id f13mr2326309eje.86.1600911271918;
 Wed, 23 Sep 2020 18:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200914104352.2165818-1-drew@beagleboard.org>
 <CA+7tXii8rwBexgAHeqYsvBywhWLmk-Hf5_VWUU5bQkBREeFcSA@mail.gmail.com>
 <20200917092004.GA2468349@x1> <CA+7tXihwHbcuxZ10jGZrQkET9+Dbs31SfsYDt_6XB+-JM99gqA@mail.gmail.com>
 <20200917103942.GA2477958@x1> <20200923065755.GR7101@atomide.com>
In-Reply-To: <20200923065755.GR7101@atomide.com>
From:   Trent Piepho <tpiepho@gmail.com>
Date:   Wed, 23 Sep 2020 18:34:21 -0700
Message-ID: <CA+7tXigeNhQQVuAu0toZrvBKvMYkDU-8EWTpJR29HLTAMgoOBA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
To:     Tony Lindgren <tony@atomide.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Christina Quast <cquast@hanoverdisplays.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 11:57 PM Tony Lindgren <tony@atomide.com> wrote:
>
> Also FYI, folks have also complained for a long time that the pinctrl-single
> binding mixes mux and conf values while they should be handled separately.
>

Instead of combining two fields when the dts is generated they are now
combined when the pinctrl-single driver reads the dts.  Other than
this detail, the result is the same.  The board dts source is the
same.  The value programmed into the pinctrl register is the same.
There is no mechanism currently that can alter that value in any way.

What does combining them later allow that is not possible now?
