Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEC4A7ECB4
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 08:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388655AbfHBGec (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 02:34:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:56714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387789AbfHBGeb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Aug 2019 02:34:31 -0400
Received: from localhost (unknown [122.167.106.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 78FE22086A;
        Fri,  2 Aug 2019 06:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564727671;
        bh=cJaAltKw2HmiShckV9OPRGcWigyW6icAz7uT7eQkYlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bdr8ArbVupd9zFA9WmfOzZaafEt+tcPJWfQMSGi3e1IDNt5lysMoUUNnFzdZzN8s3
         z9WAU4Kg4pjw5VlOSWk98rrKlxw7JpqKoTS6jMxPOzi+WW59OC/Tq8Qi2gFBzN2inu
         MdFW7BUflskAjoeQ7FZXOk691pf82i1d8QO7SXW4=
Date:   Fri, 2 Aug 2019 12:03:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jitendra Sharma <shajit@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add SC7180 pinctrl
 binding
Message-ID: <20190802063317.GB12733@vkoul-mobl.Dlink>
References: <20190802041507.12365-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190802041507.12365-1-rnayak@codeaurora.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02-08-19, 09:45, Rajendra Nayak wrote:
> From: Jitendra Sharma <shajit@codeaurora.org>
> 
> Add the binding for the TLMM pinctrl block found in the SC7180 platform
> 
> Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> [rnayak: Fix some copy-paste issues, sort and fix functions]
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

changes since v1: ..?

> +- reg-names:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Defintiion: names for the cells of reg, must contain "north", "south"

s/Defintiion/Definition

> +Example:
> +
> +	tlmm: pinctrl@3000000 {

this should be: pinctrl@3500000

with these two nitpicks fixed:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
