Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38E412375E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 21:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbfLQUiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 15:38:25 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:44418 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbfLQUiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Dec 2019 15:38:25 -0500
Received: by mail-io1-f66.google.com with SMTP id b10so12549705iof.11
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2019 12:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bf4DW07ux663sZ7zB+kziR4YNNMjqy9A2bO2qaVQs7c=;
        b=SWfYOp7v2Gbzvj0oex2xBcjnDjxUg4jBwLcNA8Lj7Y20hF7uJS8Z+wqqD+6oKZME9U
         3p6Hh+fBlmoE58Y8glJzGHG3nV2ShrZXJI8oFnXr40yYSDt+Y/Yu67GPHgbuOPgKcRLa
         F3Wu2wWaSCDep6oSq/EtkLx/PZFaVr9IF38mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bf4DW07ux663sZ7zB+kziR4YNNMjqy9A2bO2qaVQs7c=;
        b=AnayGsi/xDc4TGABUhxSuQ1zx/wkHx5KkBdzTao0rOVBsho+Ad9SrsO6HL1VVo8Hng
         fJ5DQLRfGHPA9yQGca5qPYRWJh74q5FsevwUpP4/8pk0NpTK3aATz4dogPtgerJS77ea
         I5BgJeCcok3MEwH+hHKemS1jut7o77oJRPw6k2CIUu2CNV4//BCtmH32qfKo6Ph9c/Af
         OfKHkCRoVDFZ0OSxerKd7CZLOeqh8XS0RyIBmIBRNmxB2XhtCIh110xkpd0sH3rGN4FT
         JELQAdiGgj8AqNf6wqT5ABqXsp2VzbSEYC0tYI3DH61LkwTU/e9Tzdkm8fwiw4Ftz1lU
         e/Pg==
X-Gm-Message-State: APjAAAXVjTk16LBNFeDFfcWqRbTwbEZ/+4BKVsfjjLzuTM1x1Q9YBxgv
        UpsJEmGbjMMLghc76nPKnImmvcDetEk=
X-Google-Smtp-Source: APXvYqwFTbSzTrbRnmNXl5Q8BOQl89gdpmfOyy6vmEC989EPlrhLfA0ne8jpFI5DM81v3tVjFaoapw==
X-Received: by 2002:a5d:94c4:: with SMTP id y4mr5290361ior.163.1576615104131;
        Tue, 17 Dec 2019 12:38:24 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id v17sm7162216ilh.12.2019.12.17.12.38.22
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 12:38:22 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id t8so760742iln.4
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2019 12:38:22 -0800 (PST)
X-Received: by 2002:a92:ca90:: with SMTP id t16mr4548825ilo.218.1576615101966;
 Tue, 17 Dec 2019 12:38:21 -0800 (PST)
MIME-Version: 1.0
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org> <1572419178-5750-3-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1572419178-5750-3-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Dec 2019 12:38:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wkte6aEy_dbNDBgAFimJd6kRPXN1v05K94qoVOaHiCzQ@mail.gmail.com>
Message-ID: <CAD=FV=Wkte6aEy_dbNDBgAFimJd6kRPXN1v05K94qoVOaHiCzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Add wakeup parent for TLMM
To:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bjorn / Andy,

On Wed, Oct 30, 2019 at 12:07 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Specify wakeup parent irqchip for sc7180 TLMM.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  1 file changed, 1 insertion(+)

I see that Linus W. applied patch #1:

https://lore.kernel.org/r/CACRpkdY9ETQRHn7x2D2XVLZ810Uo1cPQxMBqTy5LnrORRNjTVw@mail.gmail.com

...so I think this patch is ready to go.

FWIW, feel free to add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
