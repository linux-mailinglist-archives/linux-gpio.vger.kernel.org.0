Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272AF3675EF
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 01:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234907AbhDUXyu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 19:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234878AbhDUXyu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 19:54:50 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454C7C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 16:54:15 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id o5so16636473ljc.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 16:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ha9Jxb8RRWJm9u6+BE/jlSRSSfMQmc0ncpQ85OvWeew=;
        b=M50X8kcpN0JZxJee2WEC7hWKQL0fYBwjBzseQ1GefKJtd3isMQEL5rIyivhKodzsOE
         +jbXIkBkGJmO0NYoUS/5Ts4KaIZXB6BQsnP7QKmFwHTHedhE8iBorxq8C5MX3i8iD8fW
         sUSEWlmlyZMEQFYsijMDfiLsCDxtlpUxCzKZKOzNZUDzxelFut7iGeyfvTNqaXkdIP2/
         bNN/fRjFYVPRoxPMG79suGFZ+R54dzIHJccxLrZFSCe5rlaQ21rotV83aJvjMS8a/ad4
         Ugm4PUZJaM8cIEVW2TEPWZaFAWn0Wi2rxQlEvrQ3lHyP9ecDdFc6haxupHcWi0ypD+1p
         8WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ha9Jxb8RRWJm9u6+BE/jlSRSSfMQmc0ncpQ85OvWeew=;
        b=ACQKnWTW/A2bZkY2mKzHfHvRuesuPCufxZo2W5RZAYpbjh8XU2edi6zxfXxNxv9Mqo
         th8KttKwijW3e9B5qMSoNn18tLJmzRHyOkDRXGbx/jol/QkWYi0uBHGL/I1R4Fi6eHKP
         Mwt8J3+ZawyIYCCg5VWomYiAWmDWtVAvGpU3wUa0pURmyVPbJyI4pCZOSWRVkKaDNdKQ
         wSQXKXEQlDVkOrJIb3b+atbWFfEfmrIyQveXt6lv2y5QYNJqZOBJBd2tscj7b7TO393R
         hmTuc651m86xAvvqv525BVih6Z2qxDLzgG1LLDvt8QzfqyPkeiO06Y2T3keU5MbIo2I9
         ESkQ==
X-Gm-Message-State: AOAM530kucOIHCkuB5UGFuHNLgX+23SQ/cSi6V5LWagK5jFCIiAq1iJ1
        I/wUUr0nKkwIHTL0u5/+gKh93Gl2/rH8BenDHrP24Q==
X-Google-Smtp-Source: ABdhPJxXbb75aL5nQVGTClsRSQ0xMrdu07CRAlP8Af8vi1m/elQpncbyJdz0Xi1ZLRYaId/J1dJqb2gXdIhWm1JwzMw=
X-Received: by 2002:a2e:8992:: with SMTP id c18mr557921lji.74.1619049253829;
 Wed, 21 Apr 2021 16:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210419093449.3125704-1-tzungbi@google.com>
In-Reply-To: <20210419093449.3125704-1-tzungbi@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 01:54:03 +0200
Message-ID: <CACRpkdbhTbskkxkVo4Jw2=KDapytqw=QJ4kmRtqk=bHhgKUpGg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: use spin lock in mtk_rmw
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 19, 2021 at 11:35 AM Tzung-Bi Shih <tzungbi@google.com> wrote:

> Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
> mutex lock in mtk_rmw.  However the function is possible called from
> atomic context.
>
> For example call trace:
>   mutex_lock+0x28/0x64
>   mtk_rmw+0x38/0x80
>   [snip]
>   max98357a_daiops_trigger+0x8c/0x9c
>   soc_pcm_trigger+0x5c/0x10c
>
> The max98357a_daiops_trigger() could run in either atomic or non-atomic
> context.  As a result, dmesg shows some similar messages: "BUG: sleeping
> function called from invalid context at kernel/locking/mutex.c:254".
>
> Uses spin lock in mtk_rmw instead.
>
> Fixes: 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Pulled out v1 and applied this v2 instead, thanks!

Yours,
Linus Walleij
