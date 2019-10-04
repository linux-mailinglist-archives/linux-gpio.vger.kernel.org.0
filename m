Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25FA8CC4B0
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 23:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730855AbfJDVRA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 17:17:00 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44387 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730598AbfJDVRA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 17:17:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id m13so7831325ljj.11
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 14:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mitmi3lOMqSpYTCDDP4OehKdhas886p4UDP9S7yQMAs=;
        b=lK2gFZ1qa+irwSUDd4m5G0GGGVDwSqXGEGwE9XSPDVK9mkW5D5pX8lir0ilN0Wl9Ww
         tTa7IohtNwD7QWPSsI/kieHPMvZNDLQLySmZ5WTBTPlHo6cge7H4hKRpXAqZToukjHwK
         BvIDHYzaLPxqn3yqyv5w7FTZbCI3FkhQkHXHGtdDlYffqKNKqCEbjeL6QEPfHYaAWiZ5
         1DUmkNepBkT1xVg9q4MWBde5ANLw1r5w/FuUm09/5z9MkdeGleQ0APAeNcWqoDXK454w
         QE9A9NA8qgdzVNbZirmmQuKsoTvhBWF8vkHdLqs2BIUh6rxxErtCPe1p7KM9FvB/oO4H
         0G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mitmi3lOMqSpYTCDDP4OehKdhas886p4UDP9S7yQMAs=;
        b=uYT92STZF4JGNrDQ2lRFPGPe2rNKymEldyojEAp9LSQa4k4PIgQfeW/og1NalX7OnN
         yfdoiPCGdyNRWqlSfKdTtAZfCOCRK/DBqnw+0EApnHn0eyLd7yq+7hbDf5q/MWgCfdBS
         5VLiyneGCKadP6XdaDJHEWUGZ5tcbTCud3TnBR+3R3eTh8/3ixj++RmNTY86+jToAHr5
         yato4nWbKOFv8qnCIBkc0QzDhy19xMyn+wKceHV00eh1IFMDYIdkNKV+t+/mxTN57L11
         ZK6aYqwQo8OcMwYjaNRlkunqLRdz7CPOshQIO8Te6p4zRkRond3b++/u44adK+VR9ewU
         O5Aw==
X-Gm-Message-State: APjAAAVX1t/f56M9oJSGWUcowTx/GC4hkg82mwj7qFy7gi+/JjBneSmA
        ogcEuKmY3MII9C9UR0+nNbaYXpx/dpKo5Qggbh2UwA==
X-Google-Smtp-Source: APXvYqyvx1ZJVx3BdlEwVPKWVbrlnWhYW68EF/q5bhSKJMO+egyDnB8hTFcsfD4uKHWflQL5bAmuc673rey06t4k4d8=
X-Received: by 2002:a2e:80d3:: with SMTP id r19mr10497466ljg.41.1570223818492;
 Fri, 04 Oct 2019 14:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190921101207.65042-1-kholk11@gmail.com> <20190921101207.65042-2-kholk11@gmail.com>
In-Reply-To: <20190921101207.65042-2-kholk11@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:16:46 +0200
Message-ID: <CACRpkdZH9VxYHh5c7r405nKHo8vq8PWZZnncP4yzTyJe_Zvnng@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956
To:     kholk11@gmail.com
Cc:     MSM <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Angelo!

Thanks for your patch!

On Sat, Sep 21, 2019 at 12:12 PM <kholk11@gmail.com> wrote:

> From: "Angelo G. Del Regno" <kholk11@gmail.com>
>
> Add the pinctrl driver to support pin configuration with the
> pinctrl framework on MSM8976, MSM8956, APQ8056, APQ8076.
>
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>

This changes device tree bindings so you need to Cc devicetree@vger.kernel.org.

Usually they want the device tree changes in a separate patch.

It'd be great if I can apply the pinctrl patches separately from the rest of
the series.

Also I need Bjorn's review on it first.

Yours,
Linus Walleij
