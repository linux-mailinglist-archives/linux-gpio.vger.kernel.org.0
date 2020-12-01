Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6E52CB0AD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 00:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgLAXNL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 18:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgLAXNL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 18:13:11 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C1AC0613CF
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 15:12:30 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id r18so6166857ljc.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 15:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1CTlTv39RPYPAy/+NOAJ8dQCTyzV9XuGFgDycIoPAug=;
        b=sYDGEFW7UQXK0Zq0BGH7Qta+/pGARj1ad8W+QhJrmva0XAGPn79l5ZSb86k6CJHi7C
         yIHYMuI0ejBzQN35Gy0d7lOeoFrgUgOaF23kAy/mzZIZRcGsCVSjKFRZUvk6Tp2QZJw+
         bNGZCnvsx8Eo+MSlbphU7nU+Bup1I1lg2UJ2fFU3DszIEgL612HvjtfULje/SYWw0zNU
         BHv5zyvfqO0imIzz4qng7sQnBHjQxGT4QtdW+m+z3fVwuAa5OuAF7hF40q5MQL0ed9e+
         uG5k5rDVIFf5aHTnnUByi9KCJCTmNjmHOMOocKHmEfgqcDVBXNLy2dOK+QHAeMyMnqpK
         JYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1CTlTv39RPYPAy/+NOAJ8dQCTyzV9XuGFgDycIoPAug=;
        b=lCQhE8o2zJLey1o0j18nrHm1dy3OwDNimXcFtLs7qt71Vr19bGbaWWONqpCFALur8E
         P+2TAc2FqdJo68FHw3TPCxQW4qDF2xVmGQ7Ati+fwtV8SSJikWPCLSk0HkRMJCkcEdJO
         J4pBIerIHSZbJBoIQ8gNWwZVYrYiMV1vOrl6Di+Pq2x3v6vAU/EcdS72zXGKkTwCuWa2
         pFHY3MRsYB1Pv74QfIp5CoJ0PSvwk0APJ7eaDKzponVk8BhG2j3zvcSu5/wAWOHc7TEz
         aPXOVaysX7RQpZqrD7GNM9wg/naXMORivt7hKFADGFZXwLaubdaukdggVX6b1iqwhGc9
         hMYg==
X-Gm-Message-State: AOAM5317xh2X6L1Oi7I+NhF1PeJLQSeNtURbg82AwLvY1Z6tKcjL20se
        46prUCAkcWau+Ln/hlwu6yJSwvK6dHBCovjopyGUj1gkNSp3BQ==
X-Google-Smtp-Source: ABdhPJxFgznn14qUCcOpS03trneRudWl7bCmYiKVjZ72gjQiUcF/JqdQlJcHbLqD7fKnWE8FyJHBDACcWXhADyaojvo=
X-Received: by 2002:a2e:b1c9:: with SMTP id e9mr2389105lja.283.1606864349186;
 Tue, 01 Dec 2020 15:12:29 -0800 (PST)
MIME-Version: 1.0
References: <20201125122014.11237-1-lars.povlsen@microchip.com>
In-Reply-To: <20201125122014.11237-1-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 2 Dec 2020 00:12:18 +0100
Message-ID: <CACRpkdY=wXBQ730YoCLW_XM3aqa6WHxHxj17EP8gr_PtMR6cgQ@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: pinctrl-microchip-sgpio: Add OF config dependency
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 25, 2020 at 1:20 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> The pinctrl-microchip-sgpio driver needs OF support, so add that to
> Kconfig.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

Patch applied!

Yours,
Linus Walleij
