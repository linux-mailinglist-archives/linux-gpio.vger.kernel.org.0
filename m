Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25546255719
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 11:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgH1JGl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 05:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgH1JGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 05:06:36 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E55CC06121B
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 02:06:35 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id o18so553157eje.7
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 02:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HvV7eXBvyQgCBgrsjvWaIv2rEaJefsbSLUIuZLspMEA=;
        b=h1hgyTlR8KltTUDbvjiOZ0FJPdU1qPb2uGFPxuC9WkmLFRhAEyeaFSrZW97ojGNcp0
         ccRdiTageCHFfZJBLuATi1xd0boWZlbxqSGcqSlmEk1SE5ZKwTSi9YCZAIGfUZiNksWn
         mBZgya8M2DBV7E+1WLVtyLXHnyeyR28qvSLsk3mBKW1XGhw+ERe3+pE8Hxv8ePRG2Uc3
         FqDohuRqdAKDiQe60Wp7dd+SAqOlJDTYXWvF5PYjIrtO70S+9wpqgoV0PH57Lti/mkS7
         lkA0rwUzvgBigA19Oou95yEg2rao3yIdKqpkBcEr/hgJpNN9FGAPgr0LiMO2eTLNh9sf
         XsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HvV7eXBvyQgCBgrsjvWaIv2rEaJefsbSLUIuZLspMEA=;
        b=PbacBDQVfDW+WLGu472CWw1tFvdwsrEbjC7DvVn6fwxysrprb3zHUd7NhYkRzRzjsj
         FCdhWMCFnoIEQkSCK/5ZOwegy2AkO/noXGtezq74v60BoWZ8zeyDpTanvwtIdhSKcwpS
         IMrUL2Lnz9ry70gx4oMlNXcoh+JMdl+h1u/dacYwRaGj6GqYZB3+BsXjP3+sny1JOqg+
         R+2l2arB8p1S65+sQht6g+mQQ94jTIsOLrHTZo02aSUXY0vihCHX6LY4to9dyNKjStUN
         N9F4l7hqeZHBlmCN9Vyo4tCzcz3xz391v9O8xM6VPiCwwYHhz2FFYFvSUhKlDzGIfpBe
         Ds5A==
X-Gm-Message-State: AOAM530VDWqhsPL7JPgMTKPG9t8XJfMmpyiwiEgLbb+KK/B6Chn/ogg8
        x639J84g3N4E7WsOBKgtBxCh78OScCcFetlHVD6Zyg==
X-Google-Smtp-Source: ABdhPJzmAhVb+RcSV8T4sZX5/XRKDlKD6uVeC4jK3X8WbHU7aWhc8Y1BK4BLw7LNFeiAVXdSfK9JBKq/4Qwn8LtOpcU=
X-Received: by 2002:a17:906:5f8d:: with SMTP id a13mr767284eju.226.1598605593511;
 Fri, 28 Aug 2020 02:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200814100357.209340-1-thomas.preston@codethink.co.uk> <20200814100357.209340-2-thomas.preston@codethink.co.uk>
In-Reply-To: <20200814100357.209340-2-thomas.preston@codethink.co.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 11:06:21 +0200
Message-ID: <CACRpkdZj-eAz0yse3OcKLiO0sPVHJMmhVZ_yLWFt1YKPe3hkRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: Fixup mcp23x17 regmap_config
To:     Thomas Preston <thomas.preston@codethink.co.uk>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Phil Reid <preid@electromag.com.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 14, 2020 at 12:04 PM Thomas Preston
<thomas.preston@codethink.co.uk> wrote:

> - Fix a typo where mcp23x17 configs are referred to as mcp23x16.
> - Fix precious range to include INTCAP{A,B}, which clear on read.
> - Fix precious range to include GPIOB, which clears on read.
> - Fix volatile range to include GPIOB, to fix debugfs registers
>   reporting different values than `gpioget gpiochip2 {0..15}`.
>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

Since the other two patches seem wrong, please resend this one patch,
also include the people on TO: here: Andy, Phil and Jan, who all use
this chip a lot.

Yours,
Linus Walleij
