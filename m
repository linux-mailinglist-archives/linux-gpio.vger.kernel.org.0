Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97183954EB
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 07:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhEaFJo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 01:09:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230032AbhEaFJn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 May 2021 01:09:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F0AC60E0B;
        Mon, 31 May 2021 05:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622437682;
        bh=XHpjcmHZrd56ullY6IlHYEG4q2XOZ4wgCqYEmMHlcDg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BZBC4TdbnpsDys0UHAeqRa5vNLMKv/6npzKChlJZOvnUMHmQXPOCJ0jR3s8grdI9Q
         gof13DVSLlv3WGrDVxcdgdxq5LLdia+d7HPp17ObE26128y/SZTGYaWfWElCgRJg7a
         PaX1o7dYlXiLE04SuSF5fP3xQpFSgpHwtWPQTrIgg3EhWhFRrLGbwif4h6kx6DGYjU
         k0S5s0qcaPGEcwMj7elCcMUBLj9nmuv2gqLMRiTn3B2PBFr+oNw1SdMRBDoquVqtOC
         P/U72vRfdpzpIxCUEwgA2Gcn3Vb8AhZ2+STemZS1n5P9fG/jfbXKw+jG18kLWaxxOL
         ZSe7/5zdQ0YSg==
Date:   Mon, 31 May 2021 10:37:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Fix duplication in gpio_groups
Message-ID: <YLRvL5UpVRDMmj7f@vkoul-mobl.Dlink>
References: <20210526082857.174682-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526082857.174682-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26-05-21, 13:58, Manivannan Sadhasivam wrote:
> "gpio52" and "gpio53" are duplicated in gpio_groups, fix them!
> 

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
