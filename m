Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABC23384DB
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 06:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhCLFG6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 00:06:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:60754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230136AbhCLFGb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Mar 2021 00:06:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E21AD64F9A;
        Fri, 12 Mar 2021 05:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615525590;
        bh=mTrXYGiCFD/vKnmMgUgXAaLeAhB7KziX/yR7nx6a9aE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K9I/1zqSaK1mX50A0jMPVW/Z+hqFmJHZZ483H12vTgrAGbEkWqBV6fz9y+0WZ5sCO
         V8kxBSs50E/UVS6jsOv3MhcwlcLNrc/FzPvhc4tG5YzVGkVrzpYVGs5h7F8FNXAuR1
         t+NtailltUQJKWAFtqSS/vScuSdaoaKRMtAs/vu5Dr2ekBqMkhzCJVCgng0yyr1wyC
         bqqyIVpf/J9qCsO0HfDOMu0u/IpcpAqSP3iLqbIFu7KtHJmD3NtUki6T9lTPhlSDtq
         Eux/F9IIVpK5WfyxriyUDCRdoA9BjSn+yF4vPqPTuKmxOTG9TUzMuzXdaG45HJ5npy
         ax8xmQDLcxcyg==
Date:   Fri, 12 Mar 2021 10:36:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8350: Add wakeup-parent to tlmm
Message-ID: <YEr20kQzaAHicGSb@vkoul-mobl>
References: <20210312034218.3324410-1-bjorn.andersson@linaro.org>
 <20210312034218.3324410-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312034218.3324410-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11-03-21, 19:42, Bjorn Andersson wrote:
> Now that TLMM has the wakeup table, specify the Power Domain Controller
> to be the wakeup-parent of TLMM.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
