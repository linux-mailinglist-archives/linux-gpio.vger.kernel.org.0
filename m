Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2767429879F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 08:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771043AbgJZHuu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 03:50:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:57130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729498AbgJZHut (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Oct 2020 03:50:49 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F193222EA;
        Mon, 26 Oct 2020 07:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603698649;
        bh=5BX0mNli4+Nc9I3rS+xRDlYTpZ54Htob+yCptCWPDYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dp36Ah7NXr/0TAX9nfPjBDq1ulwaMVo8EjUo3rjOVSlpxOs/O1DYGhLscbEpN3+Ad
         sUq+YuzZJ7n2ERWJkiDow4F6IBqLy8IEXUlFQc/9+edvDDOZJonth1HphLBxEdgnaT
         Zypjr5yWbeC3SyD1lZO3JJB9TBezToIkhry3RJuA=
Date:   Mon, 26 Oct 2020 15:50:40 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linux@armlinux.org.uk, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, oleksandr.suvorov@toradex.com,
        peng.fan@nxp.com, andreas@kemnade.info, hverkuil-cisco@xs4all.nl,
        olof@lixom.net, krzk@kernel.org, geert+renesas@glider.be,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aisheng.dong@nxp.com,
        lkundrak@v3.sk, joel@jms.id.au, bjorn.andersson@linaro.org,
        leoyang.li@nxp.com, vkoul@kernel.org, michael@walle.cc,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V3 2/4] arm64: defconfig: Build in CONFIG_GPIO_MXC by
 default
Message-ID: <20201026075039.GH9880@dragon>
References: <1600320829-1453-1-git-send-email-Anson.Huang@nxp.com>
 <1600320829-1453-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600320829-1453-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 01:33:47PM +0800, Anson Huang wrote:
> i.MX SoC GPIO driver provides the basic functions of GPIO pin operations
> and IRQ operations, it is now changed from "def_bool y" to "tristate", so
> it should be explicitly enabled to make sure all consumers work normally.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied patch #2 ~ #4 as fixes.

Shawn
