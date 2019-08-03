Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2B180501
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Aug 2019 09:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfHCHLl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Aug 2019 03:11:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:42302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727206AbfHCHLl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 3 Aug 2019 03:11:41 -0400
Received: from X250 (cm-84.211.118.175.getinternet.no [84.211.118.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDB4F2087C;
        Sat,  3 Aug 2019 07:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564816300;
        bh=D50s0wbiA78nR+2fSDyPs92LMsY/aXJHUMkfLqFQ84o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mi7AZOxjIC1A95Dmgpb1uzgAmEX9akl3RFWbkAdKtvG9+6e72Tr74QWj+3ViffjUz
         zaxc+fn4eUXSEQKuzrOeYvOPq0TTgSjONr9RaEyV7KgpyeJhzg0J0VFTlz/Q0x/W9M
         6fUhyeiRrF628+oyCX1BccnAGvKv1WfEp5JEzhss=
Date:   Sat, 3 Aug 2019 09:11:34 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Chuanhua Han <chuanhua.han@nxp.com>
Cc:     leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: ls1088a: Revise gpio registers to
 little-endian
Message-ID: <20190803071132.GA5797@X250>
References: <20190529083254.39581-1-chuanhua.han@nxp.com>
 <20190529083254.39581-3-chuanhua.han@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190529083254.39581-3-chuanhua.han@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 29, 2019 at 04:32:54PM +0800, Chuanhua Han wrote:
> Since fsl-ls1088a Soc GPIO registers are used as little endian,
> the patch adds the little-endian attribute to each gpio node.
> 
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>

Applied, thanks.
