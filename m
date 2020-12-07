Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33BC2D0E80
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 11:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgLGK4m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 05:56:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgLGK4l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 05:56:41 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B770EC0613D0
        for <linux-gpio@vger.kernel.org>; Mon,  7 Dec 2020 02:55:55 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id 19so4489546qkm.8
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 02:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ia12m9uDX+0LNlAEFwkrOarHwftjJKLgewl2oTIgrE=;
        b=lzzmt0CZmK2Jmd7kyroYw+RWFtJX3ikmVxwIpkx+vZ/gCDKMah0PBZ3pRvKxqo8lN4
         eStRjgjM4ibwnew31RMzb0hOwrT6uiFAFmqPXGWbPGnLbol0VBIpkeSQGAMsmcvQpOll
         n6xniOcxXcDXSYxpEDnLx9saK/zqAazjt5HMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ia12m9uDX+0LNlAEFwkrOarHwftjJKLgewl2oTIgrE=;
        b=Nz2vro5tKzBlQ+rt8G2T7DahLFRTRdP/atTsikjzjllewXVMuFtSbj/oxeeTIT6ydi
         IUcf85MFjQNxeeWaXAgEaQaykZ/iXeN5huPSaQotJimASkmueulDWuYkdVNHN0spmg3K
         K0ZOwahEEogjSRMnyZAXOnPuYiUH+JA/gqqcoU8lrVQPCV7Bt0ARvuYtGvRsuaNNllCd
         dh8qu7pHPsmNDWuxPYJG/AqYGLp6mJILLRO5ht3R6rcT97yhO4LdGFTroSlqmrHRSrSG
         +uyfKZY3HCsRXlUctMrLpqX64oNJxvTCdECRkZtqy8Z9/YFQNlq44zodrNXnIKFNMxqr
         Z7tQ==
X-Gm-Message-State: AOAM530g+sRm8xljKXRfxy5vVk/0PSRk6L1MLBq2LDgWFm5QPENZKf0I
        Advx4W/xgfaEAKH5Y1dP9CG7PjRLRa7G6EYIe2IxqA==
X-Google-Smtp-Source: ABdhPJz5LN12jxi1tLmMe+C2qEWEij3QetZAtETxe63ezdGfiuGGd8prNeyfZ8+OZ//s1SFdN8nthpHV6T5ni1agtns=
X-Received: by 2002:a37:8681:: with SMTP id i123mr22759135qkd.54.1607338554890;
 Mon, 07 Dec 2020 02:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com> <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
In-Reply-To: <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Mon, 7 Dec 2020 19:55:44 +0900
Message-ID: <CAFr9PXmx1XZmVOp8mLygnDUfEKPpo6=ZQPMKSCnZf0i23mNqVw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
To:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>, olof@lixom.net
Cc:     SoC Team <soc@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Sun, 6 Dec 2020 at 06:43, Linus Walleij <linus.walleij@linaro.org> wrote:

> OK finished!
> Patches 1, 2 & 3 applied to the GPIO tree for v5.11.

Awesome! Thank you Linus. :)

Arnd and Olof: Sorry for being a noob.. Is there anything I need to do
for patches 4 and 5 (device tree bits)?
They are in the Linux SoC patchwork.

Thanks,

Daniel
