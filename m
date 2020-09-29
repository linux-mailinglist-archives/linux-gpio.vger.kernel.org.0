Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0B927CF35
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 15:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbgI2NcS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 09:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgI2NcS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 09:32:18 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9EBC0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:32:17 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z19so5546395lfr.4
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QiP2xLvE7su3A/3FbohxFPRtFwP7RAJmpP6Gapqry4I=;
        b=RBYVwF6a/VEJ2emfv0iKSm7f03uWBll6TI/Ihmggul87n6xJXwZu0n25FdDz6QgJcz
         BdJzD78O/nSe3aEKvFAv9aDtxHulrnUh4tx+o7zrlORi4FDh2Uvj4kP4oq2aYkGVIXmn
         7W1AF+8lTv09LNYvpoStdzCVsF3Qwjd5Il+4zRmHWAHSI3LNtiyK/DUttJ3Rp225401b
         9Sf0HAHsObntboFoCKqQlkw3oiowAFbwbEI9qKtf2D2Ol11N/TpjXu+o2bDSquAPLPq8
         Up2XdmkjZyKTqYeagrotyOF15pqeKXcLoc2P7gyx7VSa2kG4TLD1FsdO+eu3b4BVf/gK
         ktzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QiP2xLvE7su3A/3FbohxFPRtFwP7RAJmpP6Gapqry4I=;
        b=eUdhB8AQuTNhFJrXjP2tnB0RbxlQcduXgil2icFtA4+N9aRPze/n5gIjIsqK2IlXOe
         0QJtEtmtm+iR5y62PBADSFRYwjMaMKV/CIUCQrMz0eZeQvHsfBlEbG1A3yw2rBxrpvC+
         9EP/O+lDxHrmV3J5P/dP9/FyZxcXAIfzKX4NTI7S3SCz+gtqR4ld+Q7YESi9R391pvWp
         oL3gy4YG6KDPs6aWaV+gHpyJD/e0XbvBUGUOULO6r/mnTC6h9uZutbYC1ryvjlfqK3P6
         tO4xAvQFv3Tr51MvUbMMA4iZeQIY0yl860NbFIJTXpdrW8TK/Tt6NpLzmbHfWh68R8vL
         B3zg==
X-Gm-Message-State: AOAM5327Rd1SMRLG/xmOWqxxicOLh0wuAFBs5d8XRcK1br/L43VqrELJ
        Het9nG/yPy7vvllO3YJO/syRLZOgXSuJEHs0qZoZhg==
X-Google-Smtp-Source: ABdhPJxV6tzl4CoUKZUPVH5Q+lX2c9SMwKjF0vOjrfiQ6kGvPMd7WkrS3uyRYrORNbOEQpj+B7cXluO4Pny91ZJTCI8=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr1146645lfb.585.1601386336170;
 Tue, 29 Sep 2020 06:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200922164159.120920-1-gch981213@gmail.com>
In-Reply-To: <20200922164159.120920-1-gch981213@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 15:32:05 +0200
Message-ID: <CACRpkdbL+d5cwNAk9YA8oMN27b9dzH3tkReh3yiuBmPeAJu3-w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt7622: add antsel pins/groups
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 6:42 PM Chuanhong Guo <gch981213@gmail.com> wrote:

> These pins are named ANTSEL[0~29] in datasheet and are used by wmac for
> various functions.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Not much replies from the MTK maintainers recently, so patch
applied.

Yours,
Linus Walleij
