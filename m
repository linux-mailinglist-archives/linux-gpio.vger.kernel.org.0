Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477411A7E5F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 15:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387701AbgDNNir (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 09:38:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:47154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387571AbgDNNiG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 09:38:06 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C4112063A;
        Tue, 14 Apr 2020 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586871486;
        bh=C+Kf5k2bXkg0Y2GPt8KYHthrWFn7YtFU07XcZSmpOcA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lg8UrALfysnSRBHKXXV3Q1Xxzbn8AW4Ku9k3w2g+ebQRb6/iDcYMxOvgkDaaN8WEf
         pgCUqux9e/oiV8wgbbo7JDm5Y25ABcj4xx1OokJupFxMQZNupuAyPpDAjWXBQZ0LEU
         hxKmI2XnHUEbx2vjT+Z0f9l7dbeyh0O5srJ0LLhQ=
Date:   Tue, 14 Apr 2020 21:37:57 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     peng.fan@nxp.com
Cc:     sboyd@kernel.org, s.hauer@pengutronix.de, linus.walleij@linaro.org,
        arnd@arndb.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, aisheng.dong@nxp.com, stefan@agner.ch,
        Anson.Huang@nxp.com, abel.vesa@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: imx: drop the dependency on ARM64 for i.MX8M
Message-ID: <20200414133756.GD30676@dragon>
References: <1584070036-26447-1-git-send-email-peng.fan@nxp.com>
 <1584070036-26447-3-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584070036-26447-3-git-send-email-peng.fan@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 13, 2020 at 11:27:15AM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Moving to support aarch32 mode on aarch64 hardware, need to drop
> the dependency on ARM64 to make the driver could be selected for
> ARM32.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks.
