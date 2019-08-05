Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27EB28169B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHEKNF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:13:05 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38736 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEKNF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:13:05 -0400
Received: by mail-lj1-f194.google.com with SMTP id r9so78811102ljg.5
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B0o9vzM5z4tJmgkpiSutr2QB107dik0sdbw/V502WAg=;
        b=GKcG7C6ACp2Etc3oo6wga+/l3kdzBmg3lZpBaal36I713snq7hNrjuIJkGuJ8Dk2I1
         vDx9hmhpa+2qrSoDMHCoKprfxGZerQBSSC8oe0e8eDgqyAH1Lk4yu37D/jnTfFUIK6Rl
         o2lLwRD9hUMWW0UimQRqhSrSIyYHmxmon8I13jPlcRbcjnIXXBglnzq1QqZnx/uab4lJ
         D7+FSSsPrZJpedeu0i5T9EViaT2eZAkcsNQQN/8bQ8oBaetwOTTZkRLWkV50pPTVC/bA
         YTRtZRu2Um4G0LiTSHH1oVNF9RI9zrSdxI/skDejtRMWLXlHGeziyJSbgreKJVAph3ti
         we2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B0o9vzM5z4tJmgkpiSutr2QB107dik0sdbw/V502WAg=;
        b=RS6VKCfGErH+TfWChOoR+TDj49eDNcfGQQW4C62u/Tr1uMfe20ZhlscObr7w7ax3K8
         oQq/DZm72WMPFn2uRPJpLyjtouCUfkmoWIrE8ph4OwheV4DfrucufTZ2G+YjBZYgXmP5
         FdvhP5SChC7icd28WV9ie16GNU5BMN6cY+hAeuuGWyliz9bLWMD8wGJZ4JgyG9gEBSTP
         pgNUxxab2wCxNBKDSzVLkOkzbFYDnm/tCqd8p/8w0cNFOJWmgPM/jQvwwp3jN/Jv5K3N
         puKekBI9ImLdY9wARYAsYoZutYwb+Wrmy1HT1MAdGDnz0symmGKxgUd93a8N1K19s61D
         Y/aA==
X-Gm-Message-State: APjAAAXPCkr6bvYDG7bu6+aQNraeffuxgjyszAyvy8lxgytQPC2Xclx0
        5xtJQGIJ5jBtO20eh3T65aF+qfM2mtVUwki9F9LunQ==
X-Google-Smtp-Source: APXvYqx8LE5Y30KKQRhMYcdKori2YIGtrIflcpdOEq++H+ZbNgi7NdKekFUFKi4psMKkPwe3/wp/daoMsKr3AczUijI=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr31240262ljg.37.1564999983775;
 Mon, 05 Aug 2019 03:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <ff410d312ed0047b5a36e5113daf7df78bcf1aa8.1564048446.git.baolin.wang@linaro.org>
In-Reply-To: <ff410d312ed0047b5a36e5113daf7df78bcf1aa8.1564048446.git.baolin.wang@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:12:52 +0200
Message-ID: <CACRpkdb_sV8w74kTpdgpwBwRgu1xgKdzrpBZQydzdTZ=SvtszA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sprd: Change to use devm_platform_ioremap_resource()
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 25, 2019 at 11:56 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> The devm_platform_ioremap_resource() function wraps platform_get_resource()
> and devm_ioremap_resource() in a single helper, thus use it to simplify
> the code.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Patch applied.

Yours,
Linus Walleij
