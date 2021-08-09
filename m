Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDC03E458C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 14:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbhHIMYR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 08:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235119AbhHIMYQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 08:24:16 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06C0C0613D3;
        Mon,  9 Aug 2021 05:23:56 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d17so16111596plr.12;
        Mon, 09 Aug 2021 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v+zrH4+EPcXw4CLOJBZGgiN9vDAnI/hGo8f/AFQCAN8=;
        b=UG5qkcTuaUXQWyWxNQKUiYtOsxXG58yCazmxfOoWIcuCJ7N5bOV14dPgCz3dyEixIT
         gdhnVnOfCFpncLAOxv8DZ8Szy9W6IDA8E3UirS72D8f0jM3ra8uuTzd4ko81V4YFh8N6
         oV+Y01OBjxXjpzMy+IlkIs3m0+DVgN5DQyPSz8NNU3TKB6rm/jLVZNNB3VrE4GHI/8YS
         HkEJVGWiECC9hwWdF47UYF0VnZUz5dJdSzQU16iaDtR0nEwKV7B2ctfflrbwoFYOIrwR
         LyP7XSTauutKpb2lK3se5z0kzyJ3dHke/jk5qskozZiMxtt99fhmk69OsvrdacN+Piir
         2vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v+zrH4+EPcXw4CLOJBZGgiN9vDAnI/hGo8f/AFQCAN8=;
        b=tt1xJ4Z1RAX9GwOr1o/rtnKQfqrVOJ1nPmkbb0RhDWfo5JobTaVHFm2joswSZmYlUa
         g/FdKE9wd9SVevjOLdGhO6jqfvXJe4ZEaz0j8hQIgsZen9JHAbpETmOgFeJppzuF25Rf
         5X02oIfpnV7y3EsjGbqi7bPzp30tn657dq6Nv/oQ6Aw3jUIIOpvoE7f6mjQMGc2BeFLB
         xccckwQjeNgRxPNK3tZQ9GVewEut9vceIiEQm0onjb+H677rfXpLkjpI3wVOMM4s/IgZ
         RaZFh+wPhQmyEp0QRhT9r/ulO0R8sazEvoD4ZlrfsFIw0PujMKZPM9Pq4TVcRhn/NEbj
         EWxQ==
X-Gm-Message-State: AOAM530ofpbVwktzieVYMoF5kV/z+/xprcUCQrNLjQ4r81gI781s6rWx
        ALLmz7UdrHIwCpUBi6V85KvtFIkJP5m21In4jmk=
X-Google-Smtp-Source: ABdhPJzq5iicsZhsY32/vWB+UgwEpoZH6nl90WWYZLPGRZ4Vjm1Mzbi3cdX0a+eF0PfAi8XOxR4mx/UKW/tU3UYSFk4=
X-Received: by 2002:aa7:868c:0:b029:3bc:e2ca:4e2f with SMTP id
 d12-20020aa7868c0000b02903bce2ca4e2fmr24162929pfo.73.1628511836094; Mon, 09
 Aug 2021 05:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210809121345.967597-1-chrisrblake93@gmail.com> <CALpBJjoc91-WWFYE4h-2eT-wf2Gv8fc8Mn57vq-nD_LG1MKuXQ@mail.gmail.com>
In-Reply-To: <CALpBJjoc91-WWFYE4h-2eT-wf2Gv8fc8Mn57vq-nD_LG1MKuXQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 9 Aug 2021 15:23:20 +0300
Message-ID: <CAHp75Veswv1wTAU-y=XwSZADP1jGNV-sJRTnQryuQm7HcysM3g@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: add meraki-mx100 platform driver
To:     Chris <chrisrblake93@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 9, 2021 at 3:20 PM Chris <chrisrblake93@gmail.com> wrote:
> On Mon, Aug 9, 2021 at 7:13 AM Chris Blake <chrisrblake93@gmail.com> wrote:

> Please do not merge, I just realized I forgot to add in 2x LEDs after
> the move to gpiod lookup tables. Expect a V4 in the future.

Nevertheless, take into account my previous reply to this email.


-- 
With Best Regards,
Andy Shevchenko
