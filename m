Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9616F1CFC8E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 19:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbgELRq2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 13:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgELRq2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2020 13:46:28 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE71C061A0C
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 10:46:26 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x73so11309754lfa.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 10:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ES33Ff/hX9Lt7ZdWNFhLgXbSOeoiO7TlTuuemLOLyZE=;
        b=G1lTNsXayueOOgZODxtiixitMWMAt+sxOQROXajaPEa3506KQWhca7dS3ckLE80uJ0
         5tv4hEWPNB2qquqnlxCpG29ECGWb9pkioi7+cmFVAEorXNRSA8eGGcvaNsKP1UEq/TjR
         WhYlTjvMBqoV1UF+LMz+DAXwGnfkizpEQ/sXSPXaenKTL6b6EJewzI7z6eS0tZ2qHXs1
         DC77oF6aVjFp7Y12phf9605AKVHRU+xhgDf6pIAidV35qg4wjY5ZKbkO1OVBJfRRpfPy
         s0vCtqVy8MF/McSvXVmrZh3PrBo8fa9st6FgwShWrf2NwmF4eMtqijC2ECUmMTTqZgNw
         +HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ES33Ff/hX9Lt7ZdWNFhLgXbSOeoiO7TlTuuemLOLyZE=;
        b=JiwdSTLXBKSUXx/VkoKvfbhyxSGijBAwzWsK8/6EB/cKjr1MSvfB1Oo9t4t8Z++NoP
         DJlYRNkAjfV9LqcfbIeWqmhrYBkQmOugI6FEVMQ4aQAPC/0oh2HRXtOvgG6HOm7ybgPe
         3MA8hhpa/9/NVkHrOJ3fYvxqgrJT1jC3e+W+qdsPvYDLxD7gZlu6EwF0IDQ5lnBxTqNq
         7g/1ZHQTg09DCLWI0ItTy4Zwvv5WYMDchFEEhUU2UdfARNZKmm/OG88ojLzkf66EG2eY
         GrVrLrk1VOTT58HqVILZ7d9G/BUmZDu7aeGyU0ue333KRZPN/NHkCFlGx2awsVxlKAHC
         8faA==
X-Gm-Message-State: AOAM530aTfbAvrm3YgHcK4DWOMOp/SR/b9rHHRPOc1VG4hs8Ng9mDjIE
        YMOnjW2zzNeG1KdUH/a9RIP1PUWpUq+hTZ/b8nM96A==
X-Google-Smtp-Source: ABdhPJxXirLllM+MHpLQOCLbGmzUdj2o3E13tCmeTCphn+zn945vIqHpGCJygj9ebntSTSBCtW7KVu8W2be0SK6V4qE=
X-Received: by 2002:ac2:414c:: with SMTP id c12mr15075075lfi.47.1589305584834;
 Tue, 12 May 2020 10:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200506100903.15420-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200506100903.15420-1-dafna.hirschfeld@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 19:46:13 +0200
Message-ID: <CACRpkdZ7QSNfMSm1NEFC9zbH8tkOieoPr39Fx3kzxgmER1cqAw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: fix memleak in rockchip_dt_node_to_map
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        helen.koike@collabora.com, ezequiel@collabora.com,
        dafna3@gmail.com, kernel@collabora.com,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 6, 2020 at 12:09 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:

> In function rockchip_dt_node_to_map, a new_map variable is
> allocated by:
>
> new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map),
>                        GFP_KERNEL);
>
> This uses devres and attaches new_map to the pinctrl driver.
> This cause a leak since new_map is not released when the probed
> driver is removed. Fix it by using kcalloc to allocate new_map
> and free it in `rockchip_dt_free_map`
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Patch applied.

Yours,
Linus Walleij
