Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538A62FF1E8
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 18:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388320AbhAUR15 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 12:27:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387906AbhAUR1x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 12:27:53 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D06FC06174A
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 09:27:08 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id q3so697528oog.4
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 09:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oa/WlyzI1t1uo49jIQ3nlsFVHbY2DgsZWB05ly/k8lg=;
        b=QluiuTKvgz/tsNDHzWjmgWjImUK5Qq6O9z8ss/nQki7j71tJHadQnqp/nLjuAPY/iY
         pZtRtkK8OLtO/CPidiugOZzJ+ZVa0omO/8B8cECJgHsSP7xh/zrVLvd1kxmjRmMmNF5S
         Nb+HY8UvcFoQiwwSbZ4HcNXiKRqlv6PlZDQxIMnMePpwQi3uMdi3nA/p5TuYyifdy0Qp
         sp6pIoZmspMP934FKTDyYCsgRGtSWbMel1dmNftC8T0/6Ue6XdmxJSEnNZAd75FtV/Y0
         agQZqX2KvO2buP9AGvHRi3BKxEvysCpWgPOOsrR0bSGLaX9iOBLD/qTEXrY7jyu8x8U3
         1PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oa/WlyzI1t1uo49jIQ3nlsFVHbY2DgsZWB05ly/k8lg=;
        b=eEvbB0XQ0quV2WL5SXrweYKzxveW5w0SNs9VlhYLAjrapOUZ1E6RMtPjR0cRvoMZ4D
         daRABNtglESSdbBDXhHziZeg6Rj7L2D3uwQESRBRyh8jI8OCPE7rzjDFafTziyN9XxhI
         XEwoa6Jlc5za6+JsRC5kvmlwQVoJ3vworYrjx4vYZRykdt32o8eMh2BTrFTtSbND4Hf8
         8K/vVJnjCLLobMUdYi/pedlaEosjD98CIljxith6NE4B2kmjtZrHEz19WyRKK7bbaBJq
         NhLTeINqRrbwg3RTevq+1lE9vM6IdKFQdNHRG5R0HfIeC1NurkisyBogvRVIhYBTIufO
         wkuw==
X-Gm-Message-State: AOAM530BZ0si55YNxnK9/aV0MddHE4LF10N0NwosU7vyZ6eLOuB84kCf
        l7VTc8O4sQuYBqNyoNIdHOaP9g==
X-Google-Smtp-Source: ABdhPJyBs3fFzgKIzhqWkdoZMbLxqO+3+KDvlPsoaZCMvaTQqmg6dx9sfO9UItazUxpFXL0ceEb/eg==
X-Received: by 2002:a05:6820:255:: with SMTP id b21mr572162ooe.0.1611250027694;
        Thu, 21 Jan 2021 09:27:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 69sm1151286otc.76.2021.01.21.09.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 09:27:07 -0800 (PST)
Date:   Thu, 21 Jan 2021 11:27:05 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raghavendra Rao Ananta <rananta@codeaurora.org>,
        Jeevan Shriram <jshriram@codeaurora.org>
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add SM8350 pinctrl driver
Message-ID: <YAm5afOWs95tN0vf@builder.lan>
References: <20210121171747.3161543-1-vkoul@kernel.org>
 <20210121171747.3161543-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121171747.3161543-3-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 21 Jan 11:17 CST 2021, Vinod Koul wrote:

> This adds pincontrol driver for tlmm block found in SM8350 SoC
> 
> This patch is based on initial code downstream by Raghavendra.
> 

> Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>

With Raghavendra's s-o-b here he should be From:, but based on the
changes you've done I don't think he has certified the origin of this
patch anymore.

So the line crediting his work above and your alone S-o-b seems more
reasonable.


For the content of the patch:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
