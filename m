Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3721F18E6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 14:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgFHMk2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 08:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgFHMk1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 08:40:27 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26ADBC08C5C2;
        Mon,  8 Jun 2020 05:40:27 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y11so18618545ljm.9;
        Mon, 08 Jun 2020 05:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M9IeBHSIt08v+2OP0967YbBGaERlUcUrs3wJebrI9TM=;
        b=q932q3s4E+AMy5wt1Ka4q6b7fokx0QNjYzsZFlYcfIOq2Vmnv7Vj5ZubHZYc/rcR2+
         EuWwJXVOQsydCvJ/1tJ9Gpe0xnYY3sqySLB9Sa0Tx8kEPrFHh5LyiSZuwseaJwIfimm9
         U++jS6zzemKs1e8yaO9LTBX2wNN13i5cpxNU1KzsI54sqQDdNwQO7+tRWQpro03+NMnM
         qjGphIZRnxu+55UOGRuFSm0z67IKvYSsP2VKcBHUwr9DiVH1uvzfEOHXyTpkgbNfAwro
         gI0zAfZolotCKIIzs6iGU9izDOvlrZuRvIPYvRB/nRZObKN6HPDArdhTg7csUuCpJORF
         6dhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M9IeBHSIt08v+2OP0967YbBGaERlUcUrs3wJebrI9TM=;
        b=LSb0Lqzf56nNhvCeJA9Y8cYjJCeCbZaMyLVUPyl02xuyd++LyRq7fiW3DJnaSI6VtW
         MtxcUT8lMjnOHc9rPU5zQvKLlWuEMXDZEBXDuQ6DAiEp+BHu5Z5Hsh6CSDdDr4QBQpJ4
         q3QrG9hTHOCCZmp7Mwgqhocu5vbb84VFV/nIeiYccdy0Oj4YbQr+Cu94ZmtlKp/5NHHN
         xCo/qyUN0dEN4vftEr4t1T/CejzWBSFauIhl5ignVrf/Q/WaLgdd6D6Zdtf1ZGYoF5Hc
         VarNqzsoSrCwGhz+h18S5+JDGcD+vxJ8qh2YMXbQv608uHbSQPARfaXk0g2oyH8NJPZq
         lgPg==
X-Gm-Message-State: AOAM531FMLc6d7u//O6BmXkmxFs5yQYj3bJMuNl203vTjqil7rdaUYPV
        RN/c8fBHz4xcitpDR15mNLUkAK1njEmzIuo3H2Y=
X-Google-Smtp-Source: ABdhPJwxMr6puCXF4S4bSaZBrcwiAdlw2Kl7KeQoRCVK6Menzgr3aMXq5ILVLtCSqkjZclpRVu/T6fve4FMhr06Awtg=
X-Received: by 2002:a2e:90d1:: with SMTP id o17mr10897143ljg.206.1591620025391;
 Mon, 08 Jun 2020 05:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200526122133.GA1454440@x1> <20200529175544.GA3766151@x1>
 <20200531001709.GA168774@x1> <CACRpkdYox64qGhxu2ycd-18Q08cKjt=Z019qVfdFEdRdTxxq3g@mail.gmail.com>
In-Reply-To: <CACRpkdYox64qGhxu2ycd-18Q08cKjt=Z019qVfdFEdRdTxxq3g@mail.gmail.com>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Mon, 8 Jun 2020 14:40:14 +0200
Message-ID: <CAEf4M_D1KD-H2Q+P+=xn+USJXiWXA6OOWiTTi1Z=5R=6_Db1jg@mail.gmail.com>
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 8, 2020 at 2:10 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, May 31, 2020 at 2:17 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> > Does this appear to be a reasonable solution?
> >
> > I would appreciate any comments.
>
> Looks reasonable to me. I suggest you send a proper patch. Tony?
>
> Yours,
> Linus Walleij

Thanks for reviewing, Linus.

I have posted a patch last week to which Tony replied that it looked
okay but would like Haojian Zhuang to review as neither of us have the
Hikey SoCs that enable pinconf for pinctrl-single [0].

On a related note, I'm about to send (from drew@beagleboard.org) a new
version that handles the case of when pincof is enabled and a group
has no pinconf properties.

-Drew

[0] https://lore.kernel.org/linux-gpio/20200601174803.GD1371046@x1/
