Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90BC91ABB69
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 10:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502244AbgDPIhG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 04:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502492AbgDPIfd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 04:35:33 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34728C061BD3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 01:24:01 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h6so4956373lfc.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 01:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H9Z4l3hppp6TCIa45Hxja3dsjinLCm6mBL8W41Pph0k=;
        b=O88sX/eY/ZndHEXjyGgsfVESIDfup0ASEpFabBfcGOezZWo5R/Prw/qBIt8l4I/ayI
         sIDV7348QRlh/2mRxDSesMsCXA6I+YQa1siuyNJPz07mIxeZXs4JWb7Pdp5wvzCbl/Pq
         unltqkjacLW+WcBpwDxb1Lx2u+cmvi2eo2JYx3wLxlTJWEhdA985xjaanzgG5vJpkCoP
         +JyW3uGpDrBlBuEzOeizBJ+mEUZ1gEd2MbLFrluD055JDmtTb5d0w7Jzo3PbTNMxg5Y/
         kRi8cjn0qXEJ4qcpozAQ1O2TymcLquSv/EZ5Zc7ZuHfbCP53Hkm3FNoYMM/ThADrhrlC
         NUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H9Z4l3hppp6TCIa45Hxja3dsjinLCm6mBL8W41Pph0k=;
        b=A4uh0ZB3rHvGGFQQLvHqbs58q8//GE2dJ8nHaWJOrQR9MGChv+pmzB7PaD9z1aXfkj
         7J3owPwfkt/nO6cV9RwgQMEJ8lUfnQnCwwy1+dhQYQhmnjRslDx5P01ZgYBXL4czm3bN
         8MexDALSzJG3RiiuhRyP+2aFOh/9FO7AbplFJ11ByF4WnzX3T+XuhQzFlw7tPmB0gTnX
         jJ4U5blpMKBiPOzg8QWUSbrvIWZhycZwzUZ6I9mIo8MGffXmFcb2sfgLtfPR2BAW1gZn
         VzmKOkaag7KdRyRcB1nwREhmqbCEF+2eSHqAxFj9g6oMIztj/nqhZHsvAHktasYXdp0e
         CoaQ==
X-Gm-Message-State: AGi0Pua0mW/2RGGyNmhY7G/dnKOYCxuZT4W5bPB+1PhYVjR+mKP3WrTm
        B8YBApokSC9/Qu5liKM+yncLa2WX8LC7n9XJ1B8yGg==
X-Google-Smtp-Source: APiQypI9PGqy9QkvtyKHNgt3xATf8GtqzRkowASz8B+RqstF66+T930LfeEf8r5btaykxEzUjQ6154Qbj9zh3YQYj1Y=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr5448214lfg.21.1587025439678;
 Thu, 16 Apr 2020 01:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <1585818532-23051-1-git-send-email-clabbe@baylibre.com>
In-Reply-To: <1585818532-23051-1-git-send-email-clabbe@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 10:23:48 +0200
Message-ID: <CACRpkdb_JztWo9XhWZw9einj2D1fgBiB+up3ZUrCOf5S-dT3VQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: handle probe defferal
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 2, 2020 at 11:09 AM Corentin Labbe <clabbe@baylibre.com> wrote:

> When checking the logs on my sun8i-a33-olinuxino I saw:
> sun8i-a23-r-pinctrl 1f02c00.pinctrl: Reset controller missing
> but this driver was working after.
> This message is just here because the reset controller was still not probed.
> So don't say anything if the return code say to wait.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Patch applied with Maxime's ACK!

Thanks,
Linus Walleij
