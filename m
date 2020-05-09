Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A185C1CC3B4
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 20:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgEISf1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 14:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727787AbgEISfZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 May 2020 14:35:25 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79F6C061A0C;
        Sat,  9 May 2020 11:35:24 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id d16so4157443edq.7;
        Sat, 09 May 2020 11:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=utUg+njPE1R78ibsKG63T1N43ZIUmqNveGR52jnUI1c=;
        b=n0UrUCUiYUufwg68km1Zk/XTBqLkxN7YNzPhw7YD5CC9FSMdO/4Me0UnvTh4DVY22l
         975HXTVf/njdTs4t4gn4B+3wBxpLzXQa5xLBEwERg74NC/R8Ob8nWqKnM8zlGRrkKG1l
         rjzze9yNW0ZPmY6B0ehS7oiqxfOeUPBYNx0QerSHqciFL/fBYmCOKmvZqcjZfgMDrkE0
         BksKzEKmd1yAnQ/YF4OLzEJuEH2ABG8agdVfG1M++BiAHOYMLNOfCfFsXpOIQI3vNrGf
         LEpLgOUPnREPEY3zS4aCLrwjwewCyV5a7NVxGMdl0CU/oOUWJd8MA99a0vVlPFJLtNUy
         wb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=utUg+njPE1R78ibsKG63T1N43ZIUmqNveGR52jnUI1c=;
        b=BPWi9QZAHHIR1gVweR+pqq9vloR8kP+MJG+DlQVAb3xEOXiqYGKq0YW2lkc5C2wAv2
         Z6PSxaV+JQtxRGAhO7+/YYo9wCo1Qt3nfDHlbp0KhGZ8Ab1gq7QWmgxrgUCi8/WAaMNS
         KL1rElE6hB2Ek7mZRN4H3i7MQr8XqTxATadqyiKpmQI0QUNadhvjnG+3oF6khjOGNorY
         3Wtw7q5+ra+hR71k9HxG1u/2e38vQjLohQDMxuhko08vqxcapyf192V5Qmlg7NldnsrB
         ahGtMEGoOfmfbHFsyzlfFkL/nO8XtV8eio2mg7l9n107f1Jr5wvmIRkRFTYWqcA45Nm7
         g2ZA==
X-Gm-Message-State: AGi0PuaDyHJT/fKfoFyhnVH9dcnzRUJOwrkLP90krvDhZKT0Jx+PHLnE
        SnOmVdQUp8AEmrHKZrhR/aBqjT15B0RTyIhBHUQ=
X-Google-Smtp-Source: APiQypKcDsrlf52ien88Tvw4J/n6MWoqk4eQg25WolLAm5L6tIYO9yQtvjjLKsoe0bV542rP9Hm42Tfch5r9JTLIZdY=
X-Received: by 2002:a05:6402:1a46:: with SMTP id bf6mr7000136edb.44.1589049323195;
 Sat, 09 May 2020 11:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200509103956.26038-3-hui.song_1@nxp.com> <20200509103956.26038-2-hui.song_1@nxp.com>
 <20200509153315.GR208718@lunn.ch> <20200509172724.GG1551@shell.armlinux.org.uk>
 <CABHD4K_tPkCherpY5zUtxV1wcKc=7aj3ayr9yxG-sLFZeMf3Dw@mail.gmail.com>
 <20200509181845.GH1551@shell.armlinux.org.uk> <20200509182647.GI1551@shell.armlinux.org.uk>
In-Reply-To: <20200509182647.GI1551@shell.armlinux.org.uk>
From:   Amit Tomer <amittomer25@gmail.com>
Date:   Sun, 10 May 2020 00:04:46 +0530
Message-ID: <CABHD4K8jwLxcfLeeiAQpsEVfafV5DutFOWukj2WJaKKU0gPjUw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] armv8: gpio: add gpio feature
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>, Hui Song <hui.song_1@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, jiafei.pan@nxp.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Oh, and... u-boot@linux.nxdi.nxp.com bounces because that domain is
> not resolvable - I guess that is internal to NXP, and this patch
> should have remained within NXP and not been posted publically.

 Yeah, realized it just after sending my reply. It is for internal NXP list.
 Had it been for open source U-boot, Author would have chosen
 "u-boot@lists.denx.de" ?

But, I still believe Author did it unknowingly and we all should be
easy on him/her.

Thanks
-Amit
