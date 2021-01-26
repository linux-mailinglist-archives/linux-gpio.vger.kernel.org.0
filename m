Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE868304081
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 15:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731223AbhAZOhL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 09:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391627AbhAZOhI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 09:37:08 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0657C061A31
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 06:36:27 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id m22so22998980lfg.5
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 06:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zf4/hRXku66Av0zlMNqLfhHFQYUDD4n+doYKutcsCLM=;
        b=tTOTkglRdqrptf8+/hiiDYPiWalvgXAsZ6mNeFFPahFgvqfE79J6AbpXXZqa3e22Ng
         41j0ZlT1W0Gm24ed/NzDiNW0nk4WKZJaKDgaETPnC1goVvkIF3SNNplNczYwGWqMj/GD
         zUm65bshHw8Tq3ezAWLUsnXh+sIM+b9CV6F1j7J9oh+Lvc75C3tJ9aNiZWe4G8r7UuKa
         e5nt20NdSmEojbP+dmanE48bVIAGKQKtPjWuKflHIJSYHUJInibFNrJc+RIWAT6PPU0m
         XeBgcrR2HyY1Ut7QnED9r8Sbgz6F3bD4e7bbAWlx0lkMvQFMNDHz4UVX+s80mPdNd99z
         JmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zf4/hRXku66Av0zlMNqLfhHFQYUDD4n+doYKutcsCLM=;
        b=K/yL6+hJI6zWrh5jufk+HpGULOuUauCuGDfJ409RqRMj0klzI/Qn6Dbk3N+uxgaUoT
         YNikVig2p8yqYINJbfiv3gDAEhuRtp5dFJytuLa0exyDIKl4Z4uOJtpWLqxo6tpJadvB
         QhPMkAMqnHrH/jUTybAawiuiBrBJ+4pSTGJndGsxFVYt1LjU/Ww1TgpCPCtBQrvSNDex
         KpWo7PXkM36KJXkfUKIsJMRIoOrg+wHaLSUbwpNQajMXFFfkhC+o4QUYhVLZ0CxY2AH6
         LWa4SgFFeT97OTROA+q6O57SHvBv0GvM+nRcYXeKAf5AY2u++cTTDfKODpTVAVQMM31A
         UnGw==
X-Gm-Message-State: AOAM531AiAbF1FaxqCc7p+BYDJkZ2e+dsBmDlvshd2yTmqEiCm+efoE4
        /LoZZC/6/quaRFJ5nATF61rK0QD9iG+0KM5QU8r9RqHTRt8tQQ==
X-Google-Smtp-Source: ABdhPJzatip9SKHID38YXMk5VRCEudz7m/vPaM1+pu0/R2lsQzBhwwNKSuKACtiUY9JBelOp6CYuYSOeU7k9l6oqPsU=
X-Received: by 2002:a19:b8e:: with SMTP id 136mr2909633lfl.29.1611671785447;
 Tue, 26 Jan 2021 06:36:25 -0800 (PST)
MIME-Version: 1.0
References: <YBAd2HT9LFIugxEo@black.fi.intel.com>
In-Reply-To: <YBAd2HT9LFIugxEo@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jan 2021 15:36:14 +0100
Message-ID: <CACRpkdb149uAwygJHEvwnjMPp=zXNTGTuf0HziE47CHXAGrQew@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.12-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 2:49 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:
>
>   Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.12-1
>
> for you to fetch changes up to 0e793a4e283487378e9a5b7db37bc1781bc72fd7:
>
>   pinctrl: tigerlake: Add Alder Lake-P ACPI ID (2021-01-08 16:04:50 +0200)

Thanks Andy, I merged in v5.11-rc2 and then pulled this on top!

Yours,
Linus Walleij
