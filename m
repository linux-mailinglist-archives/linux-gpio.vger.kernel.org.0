Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C129891E14
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 09:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbfHSHkV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 03:40:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfHSHkT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Aug 2019 03:40:19 -0400
Received: from X250 (37.80-203-192.nextgentel.com [80.203.192.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D72A52186A;
        Mon, 19 Aug 2019 07:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566200418;
        bh=SSwGoyQjtxQyIG+L12Fa79RfIeakkTxJQkrFw8MwzFo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0fxXKqzZ27SPO5MQzxrckPFMQvlzrVgisB9+HTtPvm8PaVOSNkPuzDRurwscI4s1Z
         7upOTcs8GamBB1WmW34ZnG17cylcGhhGOMhvSCadorBrnmXrTYAHbj/Sw+30sE0c+C
         +OOfuwbRv2Gz5lUfZkk34G5rQwVDgGZVAc+F34kE=
Date:   Mon, 19 Aug 2019 09:40:06 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: ls1028a: fix gpio nodes
Message-ID: <20190819074005.GC5999@X250>
References: <20190805065700.7601-1-hui.song_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805065700.7601-1-hui.song_1@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 05, 2019 at 02:57:00PM +0800, Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> Update the nodes to include little-endian
> property to be consistent with the hardware.
> 
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

Applied, thanks.
