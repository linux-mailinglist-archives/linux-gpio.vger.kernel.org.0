Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA6C2AD84A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730666AbgKJOJg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:09:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730070AbgKJOJe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:09:34 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A31FC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:09:33 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id d17so14319009lfq.10
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jhI4bSrNDAusomml7icPJ8XO3XGcl6w6VFJS+7Es/p0=;
        b=vD8YryUlwWqsT9VdEa66fNxYuA/it6r/SYmTV+jRFCuuamiVwulurfBCPq11IybAbr
         xGjyCyHw8hR8UqCGtAYNK0zYaOaJ4Udrw7Wizl1DapYfFYVKMvlxYGcL/OvUpXDyxxEh
         cCfL6YjzgMUssT8tOHkzEWqsJjEoUW+YzZHV+I6WMQ6WsLN6Sq31TsGK6IG7T8Vp/PzI
         Qt/2NZzXicuUo3C3SSDBumm1Lo+LCM28HU+WYA4zq8PMYmyvbOfxr/WKYbQUmNabB/rg
         tzLxWH7sW0dPaYCkqdq7iq/uHOHmQYWy0vdWdYpdHwSwCbWKaLsPTbsqmIT25n5/sebB
         ym9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jhI4bSrNDAusomml7icPJ8XO3XGcl6w6VFJS+7Es/p0=;
        b=BaLIblS5qLoIwZ2d0WLS9r5tf4gRAYoVggzjDmcFrEihEKVhgzp3YD08LUKvlTbsdb
         nVJW76J5LLsDl6ldyGuflfZBfiAemvbVgMXwQvNR4xfHpAVCsCXt5sWOYNnhpdFVRIWf
         QPm6FilxyMykdJ3ivCaovT7kaNqT+iWk76dyTt1NDP6LrLMFf/fLW+PGUnqQ43RCxThq
         20BC7xmHGuMOZVpsTGm5ep3RFhdfsIv6GaJFzyFXfB6F7jkMJ1XGrsY2i+9wkFL/PFU8
         X4zgRJp1yN5VKDyfRcpM0xV9PNLiXNw4djUo91uaIYyAj0Pu3J+PXJVAXpDUWnrFy2tB
         68qQ==
X-Gm-Message-State: AOAM533LyQuXfxsNbx72CYQEzvCFQoG87XzzhSdM1oJwbOYhS5Z4Q02H
        UZEhnkpY5Iyho+XnN4LBDynqKt6Mp4I/2HWdGVYgyQ==
X-Google-Smtp-Source: ABdhPJx3lRtvu5f1m7IcbcJfPqqYI+rqK33E+vQGK2kAiZemb0dqFxd8r4Yzhke3xRLxmiZQAfb7jcUAcji+5x4aYxY=
X-Received: by 2002:a19:ca05:: with SMTP id a5mr4543584lfg.571.1605017370813;
 Tue, 10 Nov 2020 06:09:30 -0800 (PST)
MIME-Version: 1.0
References: <1604651795-1220-1-git-send-email-kaixuxia@tencent.com>
In-Reply-To: <1604651795-1220-1-git-send-email-kaixuxia@tencent.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 15:09:20 +0100
Message-ID: <CACRpkdYoboNJEBeUzo1t00byXQESHkcXqtm95HoJpr7W2nQVHw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ocelot: Remove unnecessary conversion to bool
To:     xiakaixu1987@gmail.com
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 9:36 AM <xiakaixu1987@gmail.com> wrote:

> From: Kaixu Xia <kaixuxia@tencent.com>
>
> Fix the following coccicheck warning:
>
> ./drivers/pinctrl/pinctrl-ocelot.c:732:28-33: WARNING: conversion to bool not needed here
>
> Reported-by: Tosk Robot <tencent_os_robot@tencent.com>
> Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>

Patch applied.

Yours,
LInus Walleij
