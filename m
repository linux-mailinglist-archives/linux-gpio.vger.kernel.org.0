Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4196032ACF2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383831AbhCBVSa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351116AbhCBNbV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 08:31:21 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72166C0611C2
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 05:18:17 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b1so20432178lfb.7
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 05:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3LFPoAfk7O5qeF3Y4rUX5gE1CQLUrhXp4Z8+GayD0FQ=;
        b=IrumaFHcp/MnXfUwA+tJBdHp0hZ8wayBSy+H5vJVP9MdhhClsGzaU69AuZJ0EhkXfz
         fxaM7ylsxwJgr92wqQtnfdHrOlb7RzZat6xwVDXjRlVnnz+ebFgOQG6EjKFu1eJ6tG68
         aXYVdUO6+1zra//C2K73BYpbw8XsO7VHywkzE1BO6pfmH4IgmNp3ofzRQrR7BPtygmHQ
         JvK4WRCzvRwqX+BWIu+gqVjgfPyuZEhqWiS+l52omHxfozAZAefka0OY4TMsElVeJDsj
         iP4zy54OIhQTH9IBEUoUUMG8Ho6DPAwgGO8EdDVAL8yGwx3rKN/jPP684tJX0HRbVuAo
         MZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3LFPoAfk7O5qeF3Y4rUX5gE1CQLUrhXp4Z8+GayD0FQ=;
        b=ZOUloIGmTNWHKyepmBvLt5M/XrJjgYYE4uHCn2Dm4pefjQzK0q0oRIUjtb/tJIl4XT
         edGOx587baGPx3x/+AEJ8VnEsbFAHk1w7y4ko3VXXW04pEMg12UCDEjHi6yPJpG1CeMj
         a5JpvcFq8x3GsF0+R/Xg0QgiPEywRuQxMKAnQpWLPbkoNaoMxciL5VGWtoVwKXfpjnCw
         9yiqlI6VkJVc2BvkA3/JDlvHgTN6cyo3Yt5CxX0di2NjyLS2kU7iU4JNEBpaf8IZCv1r
         95xRImliA8wJJBcuAklMg1SXWYeZO0YNXIRtzIwB6Z4ChpxaD3TG4/XZETW9bIOgjLnt
         kskg==
X-Gm-Message-State: AOAM533nrB098LyCFUhYzm01LMrBFu4pXwiD4nIRCnGwU+vxaYkBoFvz
        zjcZjS4EW1JPdvC6ctgdwe8PDLpDMaMQHAOBBzB/RoJvcWQiIg==
X-Google-Smtp-Source: ABdhPJyXLXj1ElbNsZ8nYLMjQKDHPE2WIbQ64a9N7NA809dZ8rZFodCUWxqls+DIBYtN3FZw01VL+N1dWPfKnLeAfwo=
X-Received: by 2002:a19:548:: with SMTP id 69mr10031398lff.465.1614691095978;
 Tue, 02 Mar 2021 05:18:15 -0800 (PST)
MIME-Version: 1.0
References: <20210223064211.120935-1-jay.xu@rock-chips.com>
In-Reply-To: <20210223064211.120935-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 14:18:05 +0100
Message-ID: <CACRpkdbqkCEMuZdwgfPJAhnZBKW1KV0+1MnXqNvTjm300jaS9Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: make driver be tristate module
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 23, 2021 at 7:42 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Make pinctrl-rockchip driver to be tristate module, support to build as
> a module, this is useful for GKI.
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Patch applied.

Yours,
Linus Walleij
