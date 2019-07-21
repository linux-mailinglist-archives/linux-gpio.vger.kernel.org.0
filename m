Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0D9F6F588
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 22:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfGUUYl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 16:24:41 -0400
Received: from foss.arm.com ([217.140.110.172]:57616 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbfGUUYk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Jul 2019 16:24:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2526328;
        Sun, 21 Jul 2019 13:24:40 -0700 (PDT)
Received: from why (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D6933F694;
        Sun, 21 Jul 2019 13:24:36 -0700 (PDT)
Date:   Sun, 21 Jul 2019 21:24:10 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
Message-ID: <20190721212410.12a889c7@why>
In-Reply-To: <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
        <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
Organization: ARM Ltd
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 21 Jul 2019 12:40:40 -0700
Sowjanya Komatineni <skomatineni@nvidia.com> wrote:

> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
> 
> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
> for Tegra210.
> 
> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
> interrupt controller suspend operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Acked-by: Marc Zyngier <maz@kernel.org>

Please let me know how you want this to be merged (either via the
irqchip tree as a standalone patch, or as part of the series via
another tree).

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
