Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B3635EE74
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 09:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349538AbhDNH3o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 03:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349765AbhDNH3m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Apr 2021 03:29:42 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BA2C061756
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 00:29:20 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a1so22248970ljp.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mgKOIRuIsQ8kXdRwlwTu4ZZZzpH+5A4kyMAN1OTQ7hU=;
        b=aNINOsqBxC30qOUx5fl3WkPA5Mk9aMiC33A0aee3DD/EKIpXcqYPHs1UKb4VPk6jNr
         FKD55JILqObGYbRQIqW268PwVx0Ynzi/ficbdm4U+Z6+Zsvwl6rtpJGshQlubNEsqu0w
         UqryakdXf/ATlSn3A5/0qDKPZBH3ak3Ibc8uxlLQo7mbpQViaJj5GFYYtNmULdjy3yoQ
         3vut1tg+ZpzRt+HbrRGIESXFvB+3EUQ+8DU1MZE6sF1ReMYBiPNHm1rS8F6c4hYmUFWy
         SekA+BHgu5vimnblEKRcYRYOfe50jg90GKM5eaM0MDiu2WYV9ZfShS8lon8kPLwItAPa
         qNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mgKOIRuIsQ8kXdRwlwTu4ZZZzpH+5A4kyMAN1OTQ7hU=;
        b=VEXbMAwNBS4KVo7JPi4FxzZumuPH24BX9uYGBEO1DPRf1aIytFYInTHAwECLuZXeNk
         1sx3DPn0Gb8CGD7d6cVK7CnzbSZzqM2P1AAnuIw9W5TL6SVub3WKGglHRjFdbem1ylIg
         vt7AY/rZIDSDr8mprm6MUDPImPZx5lIzLO2oaa1OVuJSC9S14HpAmsspC5uW4m/dwGoU
         rHylf3HO2nNIF2xZ4Tqvxno8PVMNZlgnZmvdbORPfTSrFfkrTrtVib492wC3KEa2f8jc
         Ip3cevmiebE7yuOUyiXGxVKLHd3Ga0V9ccXkGaDfH/PTg4reOqOuDhnqM1dw0RtXdNU4
         Stfw==
X-Gm-Message-State: AOAM532iiUnJyBIQoiVVqCERT/EcG8OC/jjEbleEhuOjLzvwjrwO0Zbz
        /9cAy4qkcJ003BhEOfreMeSdx7NEOZLhz3xNrONaeg==
X-Google-Smtp-Source: ABdhPJwGUEe1Q2DKoTdI1PeRAGjLOJHFbrqRHykxPfSLYQ0BB18t1lAwqeZ29W3m27G4qK8f5DlU6ZV2wgRLZ48W4jU=
X-Received: by 2002:a2e:a54c:: with SMTP id e12mr7593893ljn.326.1618385358966;
 Wed, 14 Apr 2021 00:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210411133030.1663936-1-pgwipeout@gmail.com>
In-Reply-To: <20210411133030.1663936-1-pgwipeout@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Apr 2021 09:29:08 +0200
Message-ID: <CACRpkdYU0qsNf=AonKR6MZg_oPNXkFnX7f2n9K4oZRBFDdtRow@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] gpio-rockchip driver
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Tao Huang <huangtao@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 11, 2021 at 3:30 PM Peter Geis <pgwipeout@gmail.com> wrote:

> Separate gpio driver from pinctrl driver, and support v2 controller.
>
> Tested on rk3566-quartz64 prototype board.
>
> Patch History:
> V2 - Rebase to latest linux-next.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com>

This does not apply to the pin control tree, the problem with basing stuff
on -next is that it sometimes does not apply to any development tree
and now that happened (because of conflicts in the GPIO tree).

You can either resend this based on the pinctrl "devel" branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
... or you can wait until kernel v5.13-rc1 is out and then we can merge
it, but it might even require rebasing after that.

Yours,
Linus Walleij
