Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEDD28DDE7
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 11:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgJNJqG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 05:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgJNJqG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 05:46:06 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CDFC0613D2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 02:46:04 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s9so2978431wro.8
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 02:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O64oufbI1HdC5TSRm3/CRUrel2ecCtGIg/wv/WX/Y94=;
        b=IEuvdFIVnhaCDXlW9sS0sQ5aBGeO4OUOgJSLNCHbXWfA+Vk7m7OUJ8Ido0AUez4Rox
         jT/SyNTxjbS6xPx6q7OJBMQrcvbkErMzdqEAlA/CEO7/I4FdJCzEHywKtR8cXYPFnbe/
         NJQ6XAzUN0JrudUFVC3Vlkt/QUp4RwbJ0RFZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O64oufbI1HdC5TSRm3/CRUrel2ecCtGIg/wv/WX/Y94=;
        b=mQBvJJcEYNNJjGqeNxyMYiqgfCoKpE3R4niZebFv94vJWysKCWs4i4cCPKIEykvp3X
         YRabCFFcg3Uz1VZ192Ig5bsVdILqxg4ZRbnpSiMaCFPx5wm5Sqw9igFHsiwPQXUmPKzk
         VI2uzRUukbD9ApEHG/lIdnm5hMavIe5HwDi/17CFWqVQMFbpN1TwBlW/hV6c3kgT3fLX
         AAxyg/+jJg4WU557AYG8K0DCid/M7PLRApiCZdo2e5Gj/pG7iLNcYosPxl3vNpkjymLS
         hVIEhY898qM5O+kGEB1lJ1QDtTe7jR35xNVnZYQ5voND4J1hBCGKazQwzegq3HexWuJN
         RhrQ==
X-Gm-Message-State: AOAM532aQuI8EqwDK9zwNn4EpYtO0NHhwjCHfItX/sO/zCD6dQDPpFec
        +rYatafLe8g4lufCsms9yFS8wGtW97WybxiJUZuXmg==
X-Google-Smtp-Source: ABdhPJycDl8gZ1dz3QYyWHfbKW5ZhLpbrJPquHLktOSpMgRvhIbNukpryKchkU8uMNrbAOFO9RtLvupjWUe6PgNe0SI=
X-Received: by 2002:adf:fe09:: with SMTP id n9mr4648496wrr.144.1602668763527;
 Wed, 14 Oct 2020 02:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201011024831.3868571-1-daniel@0x0f.com> <20201011024831.3868571-3-daniel@0x0f.com>
 <20201012161156.GA1635284@bogus>
In-Reply-To: <20201012161156.GA1635284@bogus>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 14 Oct 2020 18:45:52 +0900
Message-ID: <CAFr9PXnK8wsTURRy77jMwsAS9vkjo6ibTVJch0BEUgvT4ALEhw@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: gpio: Add a binding header for the
 MSC313 GPIO driver
To:     Rob Herring <robh@kernel.org>
Cc:     linux-gpio@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Tue, 13 Oct 2020 at 01:11, Rob Herring <robh@kernel.org> wrote:
<snip>
> >  MAINTAINERS                            |  1 +
> >  include/dt-bindings/gpio/msc313-gpio.h | 95 ++++++++++++++++++++++++++
> >  2 files changed, 96 insertions(+)
> >  create mode 100644 include/dt-bindings/gpio/msc313-gpio.h
>
> This should be part of the previous patch to avoid the error.

Would reordering the patches to make this header before the yaml file
be acceptable?
The commit message might be pretty big with them squashed into one.

<snip>
> > @@ -0,0 +1,95 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
>
> Don't use DT on non-GPL systems?

Good point. I didn't really think about the header also being used for
something like FreeBSD.
I'll fix that.

Cheers,

Daniel
