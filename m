Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1EC1E098A
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389207AbgEYJC1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388854AbgEYJC1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:02:27 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2FCC08C5C0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:02:26 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v16so19948379ljc.8
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2hg/OH74DORU9tQYyoK6Bqm4fFp4PsuIpQ1XLjl+5O0=;
        b=nJgmdmXKEcK518FOp+NQL3H6U+rX+6T2vs7v/hbMr9J7mT+2oqY5KESoJrLLAjOUG9
         uZQP1RTQZ59BZRCli+A8sOYo+oCK7EjHGwWIJD7hMZeI49fs0lVC7oMvLSsrEaCdeYd7
         D9ftD2zAvSNkl8FFKRMqVMuY2uWNqV+eUM+Ubhy8lyZ4Oan76ifF3HzMV80DsH0eWWwe
         z/RYZU/PENhp4FyyFK+yA0dUh5joa/UuWAWxgcBchUTn1H5kvYWb/pD1B55BLWpj9Rb9
         Q12oVhjQlXXxI49ZU5keD+FfG/wX4BZr6dj+DxxLXS2e8op5jpfTGZw4yAuPM+OtzzYX
         mPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2hg/OH74DORU9tQYyoK6Bqm4fFp4PsuIpQ1XLjl+5O0=;
        b=WW86i41iK/c4qxkT6Yb5eggD1i5AsRI+ndTDzjAhptlllQXkldOXxXEwS7lKG4ycUH
         5SWWaXrA2FHGKihyUQ4HDRODgnu6LdZmGx8pVwyIGx7TeYrFMZV/uFlk8lcj/a4O8nUE
         si2sQuLHuPcq+4Vpz+7ChTwGhCpgkksLorjQolajU2GaKlphaekY2PqlFCiW37USowli
         t14Q2fIRoPsR/JJdcHrM1PS2QA7Ulp7ZZYwqhXz/YPo5xz9+/ceIBJtarhu8D8j6LoRZ
         64JgH3vs1t60nMqkPo64LBKv6TBgDzTXGcHv51x5kMOfPNQ8xPMyT7x8Pxhn+OMbwf50
         sG+Q==
X-Gm-Message-State: AOAM530idbbIQRixv8FjrYwTNevIhxWuoGZFtRRZ7lexcFtNXv1DDHMA
        sV5LGl/fg7aKIJYRFbsNt3HLs+Bx3lvwCOowWmkwQQ==
X-Google-Smtp-Source: ABdhPJwWFwfymHIMrEwH+BYN7cjY1SJ5pJ5xBRDS9aLWhYF4MaLelR7tHM5Ct+bMfDm+2aOeyWd13ahqyngusi6HRaY=
X-Received: by 2002:a2e:9716:: with SMTP id r22mr13965648lji.293.1590397344884;
 Mon, 25 May 2020 02:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <1589817025-21886-1-git-send-email-groverm@codeaurora.org> <20200519013813.GU2165@builder.lan>
In-Reply-To: <20200519013813.GU2165@builder.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:02:14 +0200
Message-ID: <CACRpkdbSsVcy=6Bo42SnPqgKoa+jNanmBEXix_yv6aNK8VcreQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: msm: Add check for pinctrl group is valid
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mayank Grover <groverm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 19, 2020 at 3:39 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> @Linus, we started off with something similar for GPIOs and ended up
> with the logic in the core code. Should we somehow try to do the same
> for pinctrl?

msm_pingroup_is_valid() looks very reusable but I'm afraid I do not
understand the implicit assumptions around it, but I guess yes,
if it can be properly documented etc.

Yours,
Linus Walleij
