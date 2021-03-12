Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC5D3384D9
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 06:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhCLFG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 00:06:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:60648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229530AbhCLFGS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Mar 2021 00:06:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 421C564F9E;
        Fri, 12 Mar 2021 05:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615525578;
        bh=0Wc4FBYPBaBupC0/E/I5YEVzKsmxkJiGtJgoRNKf6Wk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EKibj2QOM7vV3nuJtVS5/dMdiy2S2TBfrP3/YkFzXchOWVSemFwtG/IjR5+NDCjWX
         PLrPMQZVib9yAXhbQegxZWfxMqrPYJ6nO4VUZfK+FcuxujD/Bxj6dWUs4Pw78LdCRl
         wsxujjuWeDb2vZz3l0GvMHJDecdqF/RljRplMwIod51hHm1Dl+LA72X70gjxn1fQ4u
         wUOcy8tjjUIVMyQBtyKU5L7CzocSsrXNFvJMgNeSPUSvOwMRZe0RHkXawnqQZxPjpl
         7+CrlT4BYRfHozO3vmALClKDOghQ4t9ql0VU41m13QOdQqT/X4snTyAq7WNVsDad8H
         LvyHGXabG7AJQ==
Date:   Fri, 12 Mar 2021 10:36:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: sm8350: add GPIO wakeup interrupt map
Message-ID: <YEr2xnXz05Pb2b6x@vkoul-mobl>
References: <20210312034218.3324410-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312034218.3324410-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11-03-21, 19:42, Bjorn Andersson wrote:
> From: Lina Iyer <ilina@codeaurora.org>
> 
> GPIOs that can be configured as wakeup sources, have their interrupt
> lines routed to PDC interrupt controller. Provide the interrupt map of
> the GPIO to its wakeup capable interrupt parent.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
