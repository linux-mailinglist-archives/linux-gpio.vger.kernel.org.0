Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495FC2B3D8B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 08:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgKPHNp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 02:13:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:42710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgKPHNp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Nov 2020 02:13:45 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A95E520781;
        Mon, 16 Nov 2020 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605510824;
        bh=TvHa858TO6tDWQ1Yo3IYCS+2hEGBtiTZh0MtJTUIgLg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TX2NMDyLZBshM5lSMIwU9nTNX09y1w3pFN40QcVEVw+JHCpOlxIlh+8LMK6AYFfbX
         h/zXx5V/NREps5jIZjywfZkaxoiSVgO3frCnvZ0xg2mODt7vfeSeREUdYkTK3dDiiT
         aaZ+EE3eDOi6QpDOsPPaTIlidJNBTR4csbPS9naU=
Date:   Mon, 16 Nov 2020 15:13:40 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: imx21: Remove the driver
Message-ID: <20201116071339.GB5849@dragon>
References: <20201110190210.29376-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110190210.29376-1-festevam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 04:02:10PM -0300, Fabio Estevam wrote:
> Since commit 4b563a066611 ("ARM: imx: Remove imx21 support") the imx21
> SoC is no longer supported.
> 
> Get rid of its pinctrl driver too, which is now unused.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
