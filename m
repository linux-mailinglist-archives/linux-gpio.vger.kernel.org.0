Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4DC177654
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 13:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgCCMq7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 07:46:59 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44525 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbgCCMq7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 07:46:59 -0500
Received: by mail-lf1-f66.google.com with SMTP id 7so2584824lfz.11
        for <linux-gpio@vger.kernel.org>; Tue, 03 Mar 2020 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pApeAoBn1TbpfXW2dmTLTf9gfqzvW3DOKNrNysvAldw=;
        b=ODlGKB8wwjJZKEO70OxhYHWn4gC4iQlLm+XrIh4OFH3iejS3rg2nErBSNrw9Qxshi6
         1gpN2VVJfcWt4qZhdZ3uEKe/GA6D0oXK9o+AxH9SqIqE5deiXVFS5JPlnlRb7W9qWd2p
         Qhs1+wuxuMVd6J5sUSBI/OEtcEyllJ2FoVK/bdaloS3Bp43LbZnqDdSKi71OKy1M7BY0
         TXWpjIaBQSWqSR4xm6/6iLnii/rcaLbyAOHoaeJrN6tmX5Ave8tqn5NxPJdsiDWbc2ws
         wOZ1Iasit8qxP7R36xtOcCrAA6vMT510+vVvYlxdcg2lwyUmSGyR0YHjUyyvtiCunZQb
         ueag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pApeAoBn1TbpfXW2dmTLTf9gfqzvW3DOKNrNysvAldw=;
        b=U2pHEE1X0jSbPx8MssXo2Y+210+78YdbABs7Lj6Xc3K0VfupY/AkYGIx2e28220mBR
         QRuM4Nj4raz0eJm+q3ykYwOVcIrRPtjLmcfv+g3dosa9bH4RwkJlCffkF8YdE6W9ENGT
         4oAUmsGLy4QyXdoQg/0YQFLcpioLRSlxII/EJC4bE7huh8fZhW4IgSgk8C0mtbwiAxIz
         03ZzjOC6DUVAHRCGfVD4dUGmN0B06ICPVkfe6BU1uLj8432sknXrLtxi16yPP/iRwnGg
         BEx3Vw2Vf/QLbAuBh5tmkY9mJIA0tk85odoghtb0TnLH1XYrGCs7eO+AhGJqfq06VKaA
         Z6sg==
X-Gm-Message-State: ANhLgQ0Yk7XDPrsiOWyiZ0cSoy0deGJS66KA+7yvskyym45Cynjj+/SO
        XCelJZkN+H6SSQHQWwC+TfjKNsT929tXDz9RftBroA==
X-Google-Smtp-Source: ADFU+vveCcd3mJKFto36ctzYcVg11SxOFVs72ItChP7e+OVk/jIhV2OoD94fhb4y3ETydv8N+LhTNJ4Zqmg9jvXAmZY=
X-Received: by 2002:a19:110:: with SMTP id 16mr2705207lfb.21.1583239617657;
 Tue, 03 Mar 2020 04:46:57 -0800 (PST)
MIME-Version: 1.0
References: <eeb12d7843fb06f80e19f98eb25711231c3b610f.1583205650.git.baolin.wang7@gmail.com>
In-Reply-To: <eeb12d7843fb06f80e19f98eb25711231c3b610f.1583205650.git.baolin.wang7@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Mar 2020 13:46:46 +0100
Message-ID: <CACRpkdbDYZm26zmw6RKuB449ukXeXeJ9mnog8cFyKoExedSMDw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sprd: Fix the kconfig warning
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 3, 2020 at 4:32 AM Baolin Wang <baolin.wang7@gmail.com> wrote:

> On X86 plaform, if the CONFIG_OF is not selected, and set the
> CONFIG_SPRD_SC9860 as 'm', that will cause below waring:
>
> WARNING: unmet direct dependencies detected for PINCTRL_SPRD
>   Depends on [n]: PINCTRL [=y] && OF [=n] && (ARCH_SPRD || COMPILE_TEST [=y])
>   Selected by [m]:
>   - PINCTRL_SPRD_SC9860 [=m] && PINCTRL [=y]
>
> Thus move the configuration dependency under CONFIG_PINCTRL_SPRD_SC9860
> to fix the warning.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>

Oh there is a fix.

Patch applied, thanks!

Yours,
Linus Walleij
