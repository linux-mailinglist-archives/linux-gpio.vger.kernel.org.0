Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 489CC476BE8
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 09:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhLPI21 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 03:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhLPI20 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 03:28:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A096C061574;
        Thu, 16 Dec 2021 00:28:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4AB54B8226E;
        Thu, 16 Dec 2021 08:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD748C36AE2;
        Thu, 16 Dec 2021 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639643304;
        bh=zgTcLxl9/sbejRn7LigmNy9dMwxkTC6II6n0m0lpBW0=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=pf+nH7QrhwAWGInhbmN7E1cwM0/pMbQLixg4jaYXJbRB7PX30mDTyVN40juDi8+s2
         GxhdeJEdj8prPOK73QEUdmmVaN8fCoLNc0HVN56n8VKsv1wYC/QZ1LLCx4z7EEuNb9
         0FqnUjIZcW1QYgPYfUzSlIFBK2tvolTkZd1+gu4zPHonPaB0Iy0+Ut4TgHg1P0MwWG
         8RZGruZpwj6WdsTq6MMS8SviD5Zh/JHvtmSoZ/QtLYifu3BAhi5xnnk/1qKiwyqbW9
         e90JVaBDlCBn4H1GLHuiFWLX2g9Kc65ZmLWLosBf5Zc7ll3PJOZnWIxm5mM0L6jqdk
         2Iwn2MF9/pUOg==
Message-ID: <6e12cd2223fffa796b9c80c52df02190d56cca5d.camel@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
From:   nicolas saenz julienne <nsaenz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Phil Elwell <phil@raspberrypi.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Date:   Thu, 16 Dec 2021 09:28:17 +0100
In-Reply-To: <CACRpkdanDLzQOjYcSEKDwi+=6NyWeK-+Xnd0we5JEGWYKXFE_w@mail.gmail.com>
References: <20211206092237.4105895-1-phil@raspberrypi.com>
         <20211206092237.4105895-3-phil@raspberrypi.com>
         <CGME20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db@eucas1p1.samsung.com>
         <8671ebd8-a853-7394-9864-0457514337e2@samsung.com>
         <2ce5956f-ce8c-80f0-df9a-492a8da00a08@raspberrypi.com>
         <dbba6665-9688-9a5e-091b-eaa8e92e6886@gmail.com>
         <83bda801c9be665086f94acce46d44da5d24ba9c.camel@kernel.org>
         <45fa0de1-c2be-84dd-782e-184ab608895f@gmail.com>
         <CACRpkdbyi4QrHXpPaZvPaZZhuO0-iMwTi=UmVHy5XagSFqJnzQ@mail.gmail.com>
         <e6ba2ec6-6de4-687c-5d50-e3e6ac11ba44@gmail.com>
         <CACRpkdanDLzQOjYcSEKDwi+=6NyWeK-+Xnd0we5JEGWYKXFE_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-12-16 at 04:31 +0100, Linus Walleij wrote:
> On Thu, Dec 16, 2021 at 4:28 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > On 12/15/2021 7:27 PM, Linus Walleij wrote:
> > > On Wed, Dec 15, 2021 at 6:14 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > > > On 12/15/21 1:02 AM, nicolas saenz julienne wrote:
> > > 
> > > > > As for channeling the path, would it make sense for linusw to take it alonside
> > > > > GPIO fix?
> > > > 
> > > > That would definitively work, Linus, are you comfortable with doing
> > > > that? I will reply to the patch with an Acked-by if that helps.
> > > 
> > > Do you want me to merge this patch (2/2) into the pinctrl tree,
> > > where patch (1/2) is already merged?
> > 
> > Yes please merge patch 2 into the pinctrl tree where patch 1 is already
> > applied. Thanks!
> 
> OK! Patch applied!

Thanks!
