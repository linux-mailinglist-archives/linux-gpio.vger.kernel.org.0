Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082443018BF
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jan 2021 23:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbhAWWzX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jan 2021 17:55:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbhAWWzS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2021 17:55:18 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234B5C061786
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jan 2021 14:54:38 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id a12so4499737lfb.1
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jan 2021 14:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hpPVms42Qj3wyzK8TZxiwezrbYMDzaDl0qJC7o+O95A=;
        b=JnqAn/nCDH1I3FJ2vvEUCe/9Qs3MNAMiuY5aKGF7agHtBuKa2dND+oSvmNVE6emUej
         pxTuKutuhNRL9cfapcZH72FJDOOX/7/LML6jN5A4d1c8GCglVk9/nAvupo8MDAKKC9ak
         bbmfbdLoO/FM60BPmDLeGOocEXzxdQtPihW/27JqeSNuOMKzK1gqdRP6Xq9n9mxjSTCL
         8XP4fcv9qC1S0vTlpFEqEiFugakmMS1fj2L3olkRzErEOfFd7B+XtwT73Oh1vZBuxv6B
         t52ft1Y/8QlFC0+2DlNFmQB4eVqRIoWPviczj6RaY3SoJrRtL4FORkIDmabQYGjNi2oX
         mbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hpPVms42Qj3wyzK8TZxiwezrbYMDzaDl0qJC7o+O95A=;
        b=l3cMr+SA500PunUaClpiN4mk2sU7ZdLYFhKOXXwcPQaKiRanme/F5aMRdMcIujr5Gn
         4HM4RV0gRi5EzRJOvbyYojvVUICoXsNjX1M+xi3gf/A3Kz979p6r6Etgl627Kwfkhjxf
         5HXtMY87jeI09OzNGENebningQ18UX8DAPuRRs1NdPE/hqnx0H81JiNuugMdvbPn/Xum
         NcB3PGxhSKgqdG2qU6y3+ufdmrfQUbVSertqFG76EPvgdvDiZm6M6ZAtv60CwJ1U90ME
         ixpfLjNZITcXl474OoZ4uLr4UwaAPhVPFckyvnlLgYmHqgyh/LIm8Igi8lXtf+Fbdot+
         4NtA==
X-Gm-Message-State: AOAM531rOUwyyCKiSx1bfuV8tqoduSgiuhvjntFQyXbBvhcHgw9E6/TL
        DkrEfcJCF49G7oogY2lRPlu1JRl12H8cyeOqwzJOIQ==
X-Google-Smtp-Source: ABdhPJwAkjlpagQHKLJ3rhbl3XiPLlkcsgvSyAEaBP9bd69MBoanQKe+NOJImbhbS1Ybz6vhpv4n9Rf5uSnyLSqJiJY=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr831929lfe.29.1611442476603;
 Sat, 23 Jan 2021 14:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20210122195959.4197-1-digetx@gmail.com>
In-Reply-To: <20210122195959.4197-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 23 Jan 2021 23:54:25 +0100
Message-ID: <CACRpkdbpMhXXg4R3doD5PWBScM6kKKBgShA5uxAuptuHzHLAsQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: tegra: Improve formatting of the code
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 9:00 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> Don't cross 80 chars of line length in order to keep formatting of the
> code consistent.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
