Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2F133BFC7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 16:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbhCOPdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 11:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhCOPcs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 11:32:48 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D58C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 08:32:47 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z8so16743783ljm.12
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 08:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u4mfgg1DIUGlXI6xo6QY7f2Figp4+tXtMVg/4l0zfRQ=;
        b=BlZKt2JOJ3qgNgj0raT2+uZA/qUkIWMlqrm2M+aX6bHHfX3i11JrEg14J+LmgyfKlm
         hlv5qWWIppwBes/z3o8TRayhMEDfoRD7wDs/s/70xXzU0Fp2VRToNojrk7W/Xegn0ZFx
         XVRSgCYezE3pnaKTYGWDxS8JIfp8IPRrjv6Fs8roOe6g1Btkp5h00wT27asoxCp5hoKF
         V7ZFDy997e6i61sDg4XS5CNeSgHlhg29kM24P0LkEfJubU+L+3r9bsAHykmIk6RqD6LP
         9s99JD2sokPfM8m4ZAZMgyMqoAkwC/WCC0JGwqfqkCoEaCfrJeOOuUHFJjwCfC8nWCdk
         m5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u4mfgg1DIUGlXI6xo6QY7f2Figp4+tXtMVg/4l0zfRQ=;
        b=rOH+l8lbiPmc9rD0LG1rz3pFEZnKNdnsE81BoXZIHKo2kZeNlbvTrk0JyO9WNE5R0Z
         FIsiMWzpTnHqA0c66+4QBu8yempx0Im+AkVc5KvB5LAueDRs0ERNU3/xAoDXDj15uqFQ
         ROAI7OMcmKOMfA0nEefAeJrCfa1fo7hHvpZLM2q5b5J2HCBFfnS/w+m1kqCKTGdkiWs3
         imQm/KP4AY0ek34rF/ZCUJTXrfAVDQO5jpnjDacK6xrQ7MLwlVyo9BifOCtkWiVBoO4l
         fwapilMoJ9/pPOBzr3yUW7ryIf4F7yBuETUEUhXhd+H/tH5fHlIB1rJnShpm0y5D1eyu
         +hXA==
X-Gm-Message-State: AOAM5314ZtqFhOjKCy/2xwf5kw2KYwQcJC/umvfpFwkRG7pv/trh9NfP
        tVaY8wEVbSdsz7aJmWw5yCYsojU1Ij3oF3PRIxyKEvbe/it0U9eS
X-Google-Smtp-Source: ABdhPJx7bQdMlV7qNayDIZJ4LIK/NhHoHaOaRFmne1Lui34RFwaVgtIahs6g02YLw46XTH+5paM8kjQz2UswgbyTke0=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr11340184ljw.74.1615822366345;
 Mon, 15 Mar 2021 08:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210305003907.1692515-1-jay.xu@rock-chips.com>
In-Reply-To: <20210305003907.1692515-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 15 Mar 2021 16:32:35 +0100
Message-ID: <CACRpkdaAL4U_ymEJTnP9SFV4P0EVLkRGsyVNY9PPqNPFPVxf+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] make rockchip pinctrl module able
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 5, 2021 at 1:39 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Make the rockchip pinctrl driver able to be module by unselect
> PINCTRL_ROCKCHIP from ARCH_ROCKCHIP, then modify driver module define.

Applied this again with the irqchip patch under, let's see how this
works!

Yours,
Linus Walleij
