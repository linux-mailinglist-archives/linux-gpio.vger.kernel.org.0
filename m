Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB04F2AE77F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 05:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgKKEhZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 23:37:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:53474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgKKEhY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 23:37:24 -0500
Received: from localhost (unknown [122.179.121.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 383F6206F1;
        Wed, 11 Nov 2020 04:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605069444;
        bh=8m3AEWrxK/P4YPY6LgxUJwZPkWFO/ZAbOhFfrsP4C4c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pO3MqmsmaZCKjDW02DEqFeJ71ySCY807VKBOKDHFAKTY84sffjp+XVRszPBCMIhK3
         Yy8TK/uFes4xHoJFrkQwYkIH8RSogpaY7ZvJGJoxwcuEpcaQTP9CQSbKaTSQK+mtAp
         t2RniYaadIHKQgxEptTQnGCcYLN1e5PeS5poPMeU=
Date:   Wed, 11 Nov 2020 10:07:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Add binding and driver for SDX55
 pincontrol
Message-ID: <20201111043719.GC161013@vkoul-mobl>
References: <20201109062620.14566-1-vkoul@kernel.org>
 <CACRpkdY=g4omnvgTzsBP6qwg7s8VYaFwChgAsJciQFS7SJ67jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY=g4omnvgTzsBP6qwg7s8VYaFwChgAsJciQFS7SJ67jQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

HI Linus,

On 10-11-20, 15:47, Linus Walleij wrote:
> On Mon, Nov 9, 2020 at 7:26 AM Vinod Koul <vkoul@kernel.org> wrote:
> 
> > This series add device tree binding documentation and driver for SDX55 SOC
> > pincontroller.
> >
> > Changes in v3:
> >  - Add ack by Bjorn
> >  - Fix dt_binding_check errors
> >  - Add gpio ranges in binding
> 
> Excellent, patches applied for v5.11.

Thank you!

> 
> I also just applied John Stultz patches for modularizing the Qualcomm
> drivers so there might be some need to patch up so this driver can
> also modularize, check the result!

Absolutely, I have updated the Kconfig and sent the patch with John Cced

-- 
~Vinod
