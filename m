Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25CC32ACEF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383804AbhCBVSY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446134AbhCBN2y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 08:28:54 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05688C0611C3
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 05:27:34 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id h4so23723284ljl.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 05:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kqFBMTe07JF336WaEgWvxl6JQ62X5Vu3BcUQAs9nHqk=;
        b=RJ6ibPNww69Aio6ct00LUR9dKbPmy7OIT42sPAEHNaL6+GGQS54dMmwaDetMlumogq
         TlJufOjnFhGZnU9gfhH5ojz97/hjWYLw8n4VqZ2p059/q6GXezEe5OTbHNTxh2yIa6zB
         XERquy2W7DNi4npiGjUvXosNj7QxJqvS8YYRcfxDRpw5EJZ5FYrLdL7ofCf1peDgmbPJ
         vdYzEGwkFoho4FuVJwSF9srgBO/Lz6d7tjSb+Li31DE5YnZj8qU7IHsg+PqROvpm5PmJ
         a/yXQ+T/6rYvTf7TLGrlZEilH9x6dl0meUiPmSVa1K834FlxDMDbekAIZuE3nJxKjcst
         f+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kqFBMTe07JF336WaEgWvxl6JQ62X5Vu3BcUQAs9nHqk=;
        b=Nw63pxySQMl5CThls4AKIhOu9dZKGcbFjMP4r7UIZKwwCH+k7+Xt8+pJIBczqysF0S
         PImlAOZ6UmKJtwAf2Txum8W7oaN9EKSV0GfP/SP5EcFUTTUABb2/SwtXlmobDiCy2hW6
         xtQ/fSb4C2O65E9jzc+ijHpKmQ3H99wIoXwff3hvQJIQaTTpQL8bDTcJ5wAkCLGoqPCn
         vh+0zQcUBNTCMSJT+HPsqbIVKgbhv5NeYyMukcvgZgQF6oIebIXU9dpPQpHOBpvAoAoU
         x9aUTN/TJe5NMtoR3gpVD1tv3kH9Tvf3ig2hFHCrk+tblJqNEAvtUey1fPpg8lkvxt/8
         GGCA==
X-Gm-Message-State: AOAM532Gd2MQv9U+9nyfNtPY9xnkrrp0kFqVYHdIvd9kgU9mWKDwCHeJ
        RqUTctYP/GNaaUPNSlJSvB7I8VA/pXdnjZn1zOIXuw==
X-Google-Smtp-Source: ABdhPJx9UKU16bL/UniBoHtTrYHMA5gEsiMnQWYTWVuxpoS4J2UDt8TQoGZDBpwNpQ4V8qT768mkldiNlACEzrMIwtY=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr12191635ljc.368.1614691653392;
 Tue, 02 Mar 2021 05:27:33 -0800 (PST)
MIME-Version: 1.0
References: <20210223064807.121358-1-jay.xu@rock-chips.com>
In-Reply-To: <20210223064807.121358-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 14:27:22 +0100
Message-ID: <CACRpkdbUj850W7eOtLAKdFwQEg3KyuWnSeOL8Q5QhJBjDhLKxA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: fix restore error in resume
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Wang Panzhenzhuan <randy.wang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 23, 2021 at 7:48 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

>
> From: Wang Panzhenzhuan <randy.wang@rock-chips.com>
>
> The restore in resume should match to suspend which only set for RK3288
> SoCs pinctrl.
>
> Fixes: 8dca933127024 ("pinctrl: rockchip: save and restore gpio6_c6 pinmux in suspend/resume")
> Reviewed-by: Jianqun Xu <jay.xu@rock-chips.com>
> Signed-off-by: Wang Panzhenzhuan <randy.wang@rock-chips.com>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Patch applied for fixes!

Yours,
Linus Walleij
