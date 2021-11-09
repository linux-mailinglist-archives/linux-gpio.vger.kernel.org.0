Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6FF44A761
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 08:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243514AbhKIHPP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 02:15:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:38690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232967AbhKIHPO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 02:15:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1D7C610E9;
        Tue,  9 Nov 2021 07:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636441948;
        bh=udyIJkoMexBQwHTVUjWMyXWIufVEo9X/f0669e6IQFw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xsj6EPQkGBUOvQGSS3FTBM+jn6dLfZbayn29DUJYyUfVezWbkSnhYN/+AniPGbdTr
         aoh9cJTRYGm6G05HiCRtLB4mjo+wq11ewlTWHXZgEpKDR8yiXY65iqHOHlz4zHkKow
         Andu8ShpgjFE5Pbc2KnAw80xgLNGrwRTiC/jouk+DKG+Mnum5dnr5Vvyzs36Id84nj
         4mWg+/kVjWX2tO+kCfZik4PJZdqZYo2Mw1R3MVkGZeRZ+zawIPCGfgUPeJYgUa7m5e
         Mo4isDmAX7uJQW10XJ22eFaqUZbLXmsspUGCBb8GVsJ95nLKM5Hp8jmkonBXjqyS+H
         VoV426O/auLMw==
Date:   Tue, 9 Nov 2021 12:42:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sm8350: Correct UFS and SDC offsets
Message-ID: <YYofWOH0V6uYBJYJ@matsya>
References: <20211104170835.1993686-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104170835.1993686-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04-11-21, 10:08, Bjorn Andersson wrote:
> The downstream TLMM binding covers a group of TLMM-related hardware
> blocks, but the upstream binding only captures the particular block
> related to controlling the TLMM pins from an OS. In the translation of
> the driver from downstream, the offset of 0x100000 was lost for the UFS
> and SDC pingroups.
> 
> Fixes: d5d348a3271f ("pinctrl: qcom: Add SM8350 pinctrl driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8350.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
> index 4d8f8636c2b3..1c042d39380c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
> @@ -1597,10 +1597,10 @@ static const struct msm_pingroup sm8350_groups[] = {
>  	[200] = PINGROUP(200, qdss_gpio, _, _, _, _, _, _, _, _),
>  	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, _),
>  	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, _),
> -	[203] = UFS_RESET(ufs_reset, 0x1d8000),
> -	[204] = SDC_PINGROUP(sdc2_clk, 0x1cf000, 14, 6),
> -	[205] = SDC_PINGROUP(sdc2_cmd, 0x1cf000, 11, 3),
> -	[206] = SDC_PINGROUP(sdc2_data, 0x1cf000, 9, 0),
> +	[203] = UFS_RESET(ufs_reset, 0xd8000),
> +	[204] = SDC_PINGROUP(sdc2_clk, 0xcf000, 14, 6),
> +	[205] = SDC_PINGROUP(sdc2_cmd, 0xcf000, 11, 3),
> +	[206] = SDC_PINGROUP(sdc2_data, 0xcf000, 9, 0),

Right, these are the offsets defined in the the documentation, sorry to
have missed updating here

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
