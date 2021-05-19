Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E6D3883B4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 02:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239501AbhESAW5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 20:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhESAW5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 20:22:57 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E743C061760
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 17:21:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id v6so13495091ljj.5
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 17:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UftTHH5WOS0+ek21TAOcjOBrt29OQqH7WD5JI2fLx4U=;
        b=ehRKdo7IVr7I+sOuiA5Q+oSOGMVpyaAVrIAPnYJTTOxs7qatZpnBAlaaKQqwRlDLXk
         Qmg1/3dcumhwmpf6xxcgSzER4tqc1viuAWtlBwzuIdGRwgJe7hC96kfwipIFrSulTvs5
         2vCKo90Gpz5ghceYWFdOrcl8VTN4xsKMT1K+wRnEH/usfNX1z6pps6UmJHkXwqItmoKO
         jezpKSujySWQbRziM7vie+QBn0hOpUoWgEA1uUEnNfLx/GUMobst4pS+eCydr7pNzzq+
         vwwnpXWpwEzFNYBAysutED2iFzfzPE7x45h5igiJ6cwrQCuddk/6Z8GLHERELY/AcFwl
         qltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UftTHH5WOS0+ek21TAOcjOBrt29OQqH7WD5JI2fLx4U=;
        b=bQ9is+bqP2NLDQFPuq8Nfman0P2gK0/TmCc+P3gMSCcFwhtxuwvkuJ5pVar2R7Kcm4
         8SKQd88RtKArfnbbAeIucMTwb8/FZLzcbbD9IS8zrYPS6ghxflwBCOFmNzoWRVBbaQdO
         hKU89FDvLstn/bs6dvF7DqkVuasRb2Hadua9E7ODobqtGR1qWPqirocUWwFH8VycpEJt
         zbrZo8Ra2hdIrZsalZmkkF7eEWV1AUSNlvCqa+52Va3exxOY3XZp4X/xx9shPZ8VR6ub
         mGaYx2qendcnp555DAJH46o0N3Ui8ae/33wP8aGCIqiSsNs6jsPxEdJ8hRSV1HXVMyrU
         mLGQ==
X-Gm-Message-State: AOAM530gGurIgoFJJcXB+DCxPfEp0k4m2bX4Ft/s8t2Z+yZKguvUMhzt
        +T1jLN7n+d538M+c6ZMNfGsC1daqeA8WyGbM3hGzYA==
X-Google-Smtp-Source: ABdhPJxlsLOZDX/cQnY1SXwJ+fu8Y5I6ivt/BTGTg8yfZW9IzCGSP7Xh5muOSNuksB0aJZPUbZe+fMZ313TAvFiLlwY=
X-Received: by 2002:a05:651c:4c6:: with SMTP id e6mr6133210lji.326.1621383695549;
 Tue, 18 May 2021 17:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210429163341.1.I7631534622233689dd81410525e0dd617b9b2012@changeid>
In-Reply-To: <20210429163341.1.I7631534622233689dd81410525e0dd617b9b2012@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 May 2021 02:21:24 +0200
Message-ID: <CACRpkdaXAp+wsLAHeNP=qOdjygBJvco6eZmk6HBZ-hg7Vpe9zg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Implement irq_set_wake
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kramasub@chromium.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 30, 2021 at 12:34 AM Raul E Rangel <rrangel@chromium.org> wrote:
> This allows the OS to control which devices produce wake events.
>
> $ grep enabled /sys/kernel/irq/*/wakeup
> /sys/kernel/irq/24/wakeup:enabled
>
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Patch applied under the assumption that this is just a new
feature. (Not a bug fix.)

Yours,
Linus Walleij
