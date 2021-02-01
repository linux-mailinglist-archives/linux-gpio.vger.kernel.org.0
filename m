Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20A930A6D2
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 12:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhBALsc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 06:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhBALs1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 06:48:27 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E022C061573;
        Mon,  1 Feb 2021 03:47:47 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id i187so22285239lfd.4;
        Mon, 01 Feb 2021 03:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tLoUGYYRljTnLjLuno/Xls/2EE1SU/oALMjym0xXgfk=;
        b=aoR+nZ1rbMe9jSxcVsJ6VcMaUh4PIosXohuok52EwR0mkUgdH8tJ7uUvXLWnsB+Nzf
         wcqRiTOaP9CECI94JFo13yVy3w15pASrLgSTuMeA8x7ArGamy7oq1EFkH+hrRywKtZI2
         F7EVTB0Xxa4rJcLuUcwgkZG21U2nK10YeGha81/OjNqvPcYKpmt9R0HlC5h9nRxej3W2
         tu9xmYKdVns5Eru4EAIfi/M/uPOS0uNOPxo1GdQvOz6kK5DK704sBnnaLtKXxWcIENjq
         HBjhf2fKKZzvswquPNUFTMOrbx3zlwfh5lge8if1U72OWiCviUwviDz43lfpljXO6Plw
         nqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLoUGYYRljTnLjLuno/Xls/2EE1SU/oALMjym0xXgfk=;
        b=kuWK3MaamjNEpL5fAmWEygQtstCG/cKYF3YylwB+RapqXC1aw2HgnHE96zfhPY3htq
         qGCvsO/j6y+nFuby2n/+7vWABVi6TRoahwic+zu/Ef3HBQZ3peYOLJH2GL67qsOMdRD9
         YZApnFLuIXrOvbaCxNOYkvZfsTOpdZZ4VHooDjRZKU4LTFqHl5eY9WMKSPbt3qqWIl+G
         6z8c2aucqBPXVHvUZD57RjUhPNClTF0+20xiOgsFaksdjYd1NLu9HKvZKG5hs8xvV/o3
         JrnxSnHQIg2AjM0DOJxnNEbjkWGW543XHualiTC6ZOHXns07q0IwKxhA4rur0Zb+SW4L
         zHHg==
X-Gm-Message-State: AOAM532a5dkxdVmrXuXMJJoDJt0przuztYsAamZGvoQahv8HSsN9fMQm
        BVIaSVHVL/WZ8SU+sMpw6hFfi4mMOTekCHcTns05AJu5f9k=
X-Google-Smtp-Source: ABdhPJx7L7QR35s32XnQ/FGK2askX81AVy9oy5jqVRWkwgWaIjarDS2sqg6TKSVk22PI0q3Ev+XRRAge4D8/QKn4LLM=
X-Received: by 2002:a19:6c3:: with SMTP id 186mr5354694lfg.500.1612180065593;
 Mon, 01 Feb 2021 03:47:45 -0800 (PST)
MIME-Version: 1.0
References: <20210130082128.3778939-1-michael@amarulasolutions.com>
In-Reply-To: <20210130082128.3778939-1-michael@amarulasolutions.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 1 Feb 2021 08:47:34 -0300
Message-ID: <CAOMZO5DyKDj_RjHM-qwcU9gcuROL6OYzDj3a_fdRRqCwOxWcdw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Support pin that does not support configuration option
To:     Michael Trimarchi <michael@amarulasolutions.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

On Sat, Jan 30, 2021 at 5:21 AM Michael Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Some of the iMX25 pins have not an associated configuration register so
> when they are configured the standard way through the device tree the
> kernel complains with:
>
> imx25-pinctrl 43fac000.iomuxc: Pin(MX25_PAD_EXT_ARMCLK) does not support
> config function

Could you please share your device tree that causes this warning?

Shouldn't you pass 0x80000000 in the devicetree for this pad then?

0x80000000 means that the kernel should not touch the PAD_CTL register
and use the default configuration from the bootloader/POR.
