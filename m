Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362623899F2
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 01:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhESXjk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 19:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhESXjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 19:39:37 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B913C061574
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:38:15 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id v5so17521246ljg.12
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H838k+WFWmKb6rty2DL9eIaIrsjQLnVxjk3iXslgoWI=;
        b=aGvisEXveeJl32Smasmj3dD6Oc3D9XgGV87Ml8Hngzlt8gSn/f2y6nn0IiVR/bvgIv
         qXnJBsNTVjzOXZZL1rATfW8/TCGL1zMi9+6C2MzUWoCtZMkWUNgKIFOtWLXU5xlFjKZv
         zdblZAw24ERKcOB6MKsCHUZuuFyUbew33g315iQ2Gmxb0ehz2v1Ug2rTUUm70tjfluEw
         YoOsDyFfQSympUSwhvUD5wQunnokDD52x/zDABZgniU59lYt50LSsbIP6aLrdD4YDoig
         cSqlHIWNbTuiFLAa7Gf7SkiAFS4gapEBVeqMzdT82K8AY31pp8c2nBVazYghs/CBffWY
         buow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H838k+WFWmKb6rty2DL9eIaIrsjQLnVxjk3iXslgoWI=;
        b=qijuZSZlwTSGeesUaefxVdlO7LSgs6Wb/k8AAwJEx1aq0uJt7g9PCFUONcIVPcSKXR
         +P4kT/qOlsBtev29ifWOLmELRW9WEdT/Y5Mm8ezVRdp666UW83ikqP1KcRKhEoisFpKA
         Dz4kRTL/9cZZ5QKQ8VrA9QNvupMLUuj8puCruWyrHuWN9scLOl9cc+iQ5C3/15vN/cvW
         RtQqthUhd6x+Q784KgPZxYghpldNrf3ek1Ic6wwxHKyPEceK1eMxjJQVLJjmk8nGklKE
         fr0yFtXp/THWxwMz/10Ys/1e0OUqFS4xhruZLOU2WhmsH/o604R0OZxLQEJpwfhWylEF
         AXxw==
X-Gm-Message-State: AOAM531IogRJRT5SoHtIE4mlphDKMDX+HXW2usIlEBxvWRFqRREmDzyd
        mEjawhdyt+tmn/BB9av28pzcVrF8KBNjkfVcipwvnA==
X-Google-Smtp-Source: ABdhPJy9LqmYfXGE9cDr+sBaI3InXu0gfmyltLcrcJdcJWLuUignT9jF0UHKFrvXKxe7T+VneXgAO5CF1iskleK/KVU=
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr1148791ljg.368.1621467493484;
 Wed, 19 May 2021 16:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210511085126.4287-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210511085126.4287-1-thunder.leizhen@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 May 2021 01:38:02 +0200
Message-ID: <CACRpkdbunzp4QhcNvHHxVsXiUWC5qsE_gT9HQdgPTyrO14tqgw@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: iproc-gpio: Remove redundant error printing
 in iproc_gpio_probe()
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 11, 2021 at 10:51 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:

> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
>
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Patch applied!

Yours,
Linus Walleij
