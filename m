Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700A927D7E0
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 22:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729102AbgI2USL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 16:18:11 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:48276 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbgI2USL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 16:18:11 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1601410689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pj/AnET6K2ikj6QYuS+2QSiV5RX6buJM7xQj08RtiL4=;
        b=eBbWH0Hvtgziun5H3+8oJajDinjb97RPHGA+sr06/dpXffEcYW2CQB37ZG4hqMmqFsTJ78
        xVa2/DzupJd5PkkKPHeIpISBG/UCmAfrdFkdRAUf/fDACAtqId/j2w3x2mDRgChBREmitG
        JXybAF5NZoobS/mLJLej2Ha/8ZE5Xjlo2FSsdS+zlY3Oc0twCw/KDGNLdeOHal+nZXol3W
        b7fu+OXS7KfcamW+ogOthJ2e8Qa+qF2X4CE5rvIQvbTlVhIYXb4nIEjaVw6d3wubALlrQR
        oqqWNNa2fngQlsMsiY+TY1CIZ0vnMYSg0QBOqzbRQj94ShKjdKvfENB+jb51zQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1601410689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pj/AnET6K2ikj6QYuS+2QSiV5RX6buJM7xQj08RtiL4=;
        b=ZM7olWDrYZ03zI4j64JvJZYVqN5qowG2/msK44+4vSnXjch3U9qL72KmYt+vlOQvkA18+t
        y2nYA8F/swV4hMAw==
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        maz@kernel.org, linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v6 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
In-Reply-To: <1601267524-20199-4-git-send-email-mkshah@codeaurora.org>
References: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org> <1601267524-20199-4-git-send-email-mkshah@codeaurora.org>
Date:   Tue, 29 Sep 2020 22:18:08 +0200
Message-ID: <87zh58ibgf.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28 2020 at 10:02, Maulik Shah wrote:
> An interrupt that is disabled/masked but set for wakeup still needs to
> be able to wake up the system from sleep states like "suspend to RAM".
>
> This change introduces IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag. If
> irqchip

s/This change introduces/Introduce/

git grep 'This patch' Documentation/process/

> have this flag set then irq PM will enable/unmask irqs that are marked
> for wakeup but are in disabled state.
>
> On resume such irqs will be restored back to disabled state.
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

I assume Marc will pick that lot up. So:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
