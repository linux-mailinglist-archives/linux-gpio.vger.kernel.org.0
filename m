Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C803C300378
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbhAVMvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbhAVMva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 07:51:30 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75997C0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 04:50:50 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 3so6399486ljc.4
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 04:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QO7Q+Bo33zbKnfaEHa+E7ZPJqNq7QkLPG7LoF8C4d3A=;
        b=SL1MkqdG64CwdvkhfXYSrqOrM8jouPAzIskR9ioxGZEGYVr+LPhxO3T8H/nksBdLOb
         CbIVcTHnzQh3T9v+a1Wjht2/fpG0vuMJT84bG0x32AYxuDxxwoeLBI+7l5dJTvabgc6a
         XpjrEOUqSdNv6j4rWkEwkooIxq0NahTmHQe1is4N6EMrNJGy6L8Wy5cdcr5ksbl2TIeL
         4Z5Vx51aSdIYZ4NFkqxkZfD9nOd624I+sv1rNq2JLm2BKioaHCOEhPIFCcXEukJNzbP+
         8w5h6pR5T/OoSGb2mJZQgc3M4uorEtBFccLjjOxSqhm7zJf9TUr0R2hIW607eINllEdo
         d0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QO7Q+Bo33zbKnfaEHa+E7ZPJqNq7QkLPG7LoF8C4d3A=;
        b=EOR2DLQzCeIUeSdepx9b/zOJI+vbExhcg2vUGJO39x7Hs00Bht50fQZjYBuTBgQNSJ
         eztisZLiQVCNYOlxVAxDMwCF6Be4saBiPv478vm7QjIXp/lgM0fCL4qZrEZwZpBOrCc6
         bfqIic5+71zXWjRBNiN2VHR7qBikZhfnFXjQKVuuOLDZJko+1zdxtWZoV48olZEBL4eO
         6xf1Sn9qBSnceUs4bWt2azkNLGG+S16euhC5yuqzVS/NqJle2O76KxZd+I4l9DCPmA5+
         xvlg/J7q0SQZXalDUd7bjlQr31ZDxXUezrJ8ZRlMAZDZgu9SoVhhNLaxJ+l2aGWiV+7r
         WTcw==
X-Gm-Message-State: AOAM530DrSzpMYXsJ8xHGB5Z+OF+eVEwofQdGYE63hdRaPh+NENu5eEr
        Qc9589Lj+Sr1q9oKs4lJuO2FhTbArJ/VQ8F2bF+41g==
X-Google-Smtp-Source: ABdhPJzrQ3mW9M5Y//9pmvu5f6Du0SUf66RDCzTfz6ifwbqkhCcvEypYapctjRN3IVFznyLy+t5TLNmK8ZHFt3ytEWI=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr720600ljj.326.1611319848907;
 Fri, 22 Jan 2021 04:50:48 -0800 (PST)
MIME-Version: 1.0
References: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1611034054-63867-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
In-Reply-To: <1611034054-63867-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 13:50:37 +0100
Message-ID: <CACRpkdYH_ZdwF_aXTrp-5rYCifmHF2X8172513q9P+t4vy_RLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] firmware: xilinx: Added pinctrl support
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 19, 2021 at 6:28 AM Sai Krishna Potthuri
<lakshmi.sai.krishna.potthuri@xilinx.com> wrote:

> Add pinctrl support to query platform specific information (pins)
> from firmware.
>
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>

I need an ACK from the maintainer of this file to merge it with the rest to
the pinctrl tree. I suppose Michal?

Yours,
Linus Walleij
