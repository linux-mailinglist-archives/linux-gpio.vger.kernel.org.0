Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F68D2ADFF4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 20:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731654AbgKJTms (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 14:42:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKJTmr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 14:42:47 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B467DC0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:42:47 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id m13so15739497oih.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=swnl6W0o1oP58XVc+UEOVDjshhVnK6QW20rMo6jAFFA=;
        b=UC41n/jce6fD1NaRa69DSR4jUK8fZFtj49DTSyNehqzUE3K1frYQPezID16wqlJLgK
         QNTY4cryBCkMcmRo+UPX+oUHx6VagXOd2JVdEW2/hJ7BtrI3OE0AG5iXnnftAZdiNjEV
         2iowooHeJoaA84Desk2qtzqyVRq7SxH2NE9ezhqmmKMaEswke7kDmiGbHjwrN9u6iKG6
         X1nzBxjJO5XgSteYJGmZ1K8cmBRokIUgtVunJz5rIEFM2/NmItZi4yVjWGfFhrV8HbuY
         Cccm+xYc7B2JlsE1fdY8u+MUERbrJCYeO58w7cI0TNnFlBw5adBWBERFKfjfZK7au1Ai
         rikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=swnl6W0o1oP58XVc+UEOVDjshhVnK6QW20rMo6jAFFA=;
        b=Uckz4+OsaVTbJiamI+gm4LkZYxdJAyx0p5UDJcPziAxI24T4e63i6i2QdIgs6fWaex
         YNiDmjTfgn8Z6e/gqmGFozlrAqsbUwxbHawMhgzPKk3ZtBMpRQNqyfNLsbhoX6xvGuXG
         WUzuHfzUjfiP/0qvrvrZcXqf5QlcGEYixiUtI93LFeGRT3+VviPyicFETL2AfDk155m7
         K2gRBhO2xDQ06g/I+oS4mypHfEUG4bpwRQmLXX+g0wmcSuUSgvfrZ7q1heFta8iwvu3Y
         LK1LmxvC7qWj2tTlUyFmU+waNFUxSnSf5sCXjWsVY3lSRMU8CS5Q09NP7CryPJsOLuhv
         GpJA==
X-Gm-Message-State: AOAM533xr0zXJwMujKlJDDI164OSxOfvIBRuysh3dNeJU6rQlcL8UU8Q
        9BVdtqTqSCyfDsd0x0QvCBkVMl8TtsBLDcPNUPOIZg==
X-Google-Smtp-Source: ABdhPJyfFrx5cAMFpIKI7aNj+jHmpT3VBake4QKDM5UvN3aHdJ1FxcytkHYM156P6uMG9KvFXdx/gg16hs7RUKnJ17E=
X-Received: by 2002:a05:6808:4b:: with SMTP id v11mr421954oic.169.1605037365896;
 Tue, 10 Nov 2020 11:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20201110190054.20517-1-john.stultz@linaro.org>
 <19b7b301-3460-7ece-21d3-59cd7490c8ed@codeaurora.org> <CALAqxLWQua4UWwXomOin5OdizevvY2F=rMExyDbB3o8h5F731Q@mail.gmail.com>
 <25cf555d-113c-28bc-7776-047e4a412fdb@codeaurora.org>
In-Reply-To: <25cf555d-113c-28bc-7776-047e4a412fdb@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 10 Nov 2020 11:42:34 -0800
Message-ID: <CALAqxLXVdJZBHvHHJ9q7DfWe62VEdWusByNvZF1Gzx8nQKoiVQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Fix msm9853 Kconfig entry to depend on,
 not select PINCTRL_MSM
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Vladimir Lypak <junak.pub@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 11:33 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 11/10/2020 12:32 PM, John Stultz wrote:
> > On Tue, Nov 10, 2020 at 11:29 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> >>
> >> On 11/10/2020 12:00 PM, John Stultz wrote:
> >>> One fixup following my patch commit be117ca32261 ("pinctrl:
> >>> qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then
> >>> a selected config") being queued in LinusW's tree, as a new
> >>> config entry was added for the msm9853 that also needs the
> >>> change.
> >>>
> >>> Applies to LinusW's pinctrl devel tree.
> >>>
> >>> Cc: Andy Gross <agross@kernel.org>
> >>> Cc: Prasad Sodagudi <psodagud@codeaurora.org>
> >>> Cc: Vladimir Lypak <junak.pub@gmail.com>
> >>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>> Cc: linux-arm-msm@vger.kernel.org
> >>> Cc: linux-gpio@vger.kernel.org
> >>> Signed-off-by: John Stultz <john.stultz@linaro.org>
> >>> ---
> >>>    drivers/pinctrl/qcom/Kconfig | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> >>> index 8bdf878fe970c..cf56e029cd9c7 100644
> >>> --- a/drivers/pinctrl/qcom/Kconfig
> >>> +++ b/drivers/pinctrl/qcom/Kconfig
> >>> @@ -115,7 +115,7 @@ config PINCTRL_MSM8916
> >>>    config PINCTRL_MSM8953
> >>>        tristate "Qualcomm 8953 pin controller driver"
> >>>        depends on GPIOLIB && OF
> >>> -     select PINCTRL_MSM
> >>> +     depends on PINCTRL_MSM
> >>>        help
> >>>          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> >>>          Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
> >>>
> >>
> >> Subject should indicate msm8953, no?
> >>
> >
> > Sorry, I'm confused. :)
> > The subject is "pinctrl: qcom: Fix msm9853 Kconfig..." is there
> > something more specific you are suggesting?
>
> Yes, that is the current subject.  Yet you are changing a Kconfig for
> msm8953.
>
> msm9853 != msm8953
>
> Infact I'm not sure msm9853 is something that actually exists....

Ah! Apologies! My brain flipped it reading it each time. Will fix that up.

thanks
-john
