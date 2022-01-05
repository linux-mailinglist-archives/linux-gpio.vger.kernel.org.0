Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56659485000
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jan 2022 10:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238864AbiAEJZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jan 2022 04:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238862AbiAEJZF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jan 2022 04:25:05 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B201C061784
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jan 2022 01:25:05 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id j21so159264628edt.9
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jan 2022 01:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3J6/rFE8yGmn8Upj/1+Ijsbc1W85sYxHOJQK0JBFVzo=;
        b=KlGjdMr0VPON2oWLDLdkbXp0tPbWPiD1poU2xLiIMv/hRoDwGrRcWv4UJiSFEQZ75V
         ABJbXRvEE8bwzc2qO4ClJb9J37Patzq9NRvWS8Py9NII6z/PzRtuZ9nCcTQZSw4gLkn4
         fwscgrNhkdqCPEndMzMTRueke2TktGuCiafUTbG3eU6OWpGyzZTHOv2eXY5jQHK/XgVb
         kU7PuRLRCULEtmvHhUEa78QkNZcSf+JExzidA9yR8UrCeI8EaTNPJaidPqKKlpmuE8uA
         lgprYLE8Y9JkfM/m0gxApOGY84Jhf1fimx8GRtFSF90m1AEVb8Zd+IdqMuSbV0aE8tUg
         ysCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3J6/rFE8yGmn8Upj/1+Ijsbc1W85sYxHOJQK0JBFVzo=;
        b=eu72S/BBW8gpEKYKJCHsV6cKeer3X9dfKnBMWEUI5C+2I9SdUluCHAKCs8aAAqySPE
         1rr6qi2LRlZWXNUjkTS+zedfts8EiSlMmfVwMpOGRqmdsEcyBGiPufccFUG/7VfErNs5
         kRwMsGbOxMUZyHrXjeiyC6iEA6UYbQBLKO+dwIG7NNHGxcuS+7fSf1myD844GNdbSJzJ
         uMBD9b0oLGjL2NJQT+DL6ctmNKLB4jjYo/JpV+vqV5n7XDG9NBYqRc9O5YVzsJgf5nxv
         vYooPsT0FUYPzpBIieXMLaaXPjLuQBkEDMG/HhDL5sHWl40UPL0aihOLeVdDUNH8HwnX
         P/xw==
X-Gm-Message-State: AOAM533J/M2P+XNxMeHTKeg0FtX2XVNC/zsYKeWw85uvQX+7oGrzkxXR
        DyaDBsyQipzOWTDi0wj/fYSWop/V3mINlD7OY1PJyw==
X-Google-Smtp-Source: ABdhPJxdBg6eB2+NNIWd3yrK/JL4s+i6VfsMStaQuG/O5Xm/e7PG0+gyycuKLjFO5GFQerXEEbRl+IgYLXZa3dXSSzg=
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr41279420ejj.636.1641374704211;
 Wed, 05 Jan 2022 01:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20220104153615.13393-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220104153615.13393-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 5 Jan 2022 10:24:53 +0100
Message-ID: <CAMRc=MciRJDeLMMKQ=Rg0VdApWtu4oQ=7Xe-DsaHLEqK7x6B+w@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Propagate errors from devm_request_irq()
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 4, 2022 at 4:36 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> The driver overrides the error code returned by devm_request_irq() to
> -ENOENT. Switch to propagating the error code upstream.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Applied, thanks!

Bart
