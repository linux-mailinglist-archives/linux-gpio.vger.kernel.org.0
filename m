Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 799F31D2AD6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 11:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbgENJAd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 05:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726108AbgENJAb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 May 2020 05:00:31 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3F5C061A0F
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 02:00:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l11so2878529wru.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 02:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=brO8SatzFGXuJx7truk9R35eMq/wT5WUrcx2WinNCbE=;
        b=yB4/wSNaH36qcX3ATdVHv5wM50wNQ0F9THXz6MYGO/Z5VW2nm/DAW0ZrVAZSVQb4Ei
         8WzGL9TSkBUW3QBwu55rhPuu5Z+ozILLJFZuV2KWUbiOP15IS+2STJaVBzF02gWjxou/
         +zqMqF9qqfNCHP4eM3uUGlS8mwnkL85fYTiB4clQVJHIhgf7rI0DDdmiX21dGKp33EMS
         BBkKD1zYjwe9VnLcjKRxyHAf5ra0+BR4ADKbuaAd2QC3WVrp3Vrvet0BaL/LUd8xD9MQ
         qZwLuJu7yprAKLS87ee2yC92l4XctwEjvIybLReXE1eSLnwB3R58upThUohkGOb+rDKV
         TLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=brO8SatzFGXuJx7truk9R35eMq/wT5WUrcx2WinNCbE=;
        b=OqruIDXYBUmrgVR/phk4orI3LI6s4xiLbGy2oSBzOnANBzlbBMo6ZIRxXhNcGZnWhq
         /TpV4fClhzNpY7DOe4NJkVsQDkUaNhmoIYVAJJSUbMerZPrJ8nOskyeDVGLaTdlBzZMb
         hSsOeH8JTDbr3KbSqFhguRsPDZo86eJBiWmhiJfVqU2SsRrN1uOrhESjm8uiRhJTFqPL
         FT5XJcC1n5fDUCDdHzmfdkwao0eQcx4ke345esmDeKxjclosTyGQZUf9QJC6RZ1z5Blv
         aA9uvU38m5bgrx9TQUlrpfsJKlE6UKvuZO3kEEbS5lX90UOhZiwhA+st51rhlqyHUO13
         f+kQ==
X-Gm-Message-State: AOAM531MdKPFrD/ZzEjIsZpfWTFu/Fj0I1c5BHkAxwvGsdXP7w6ItvqF
        /6ArH+NCcarTbU90ezBzCPmKvw==
X-Google-Smtp-Source: ABdhPJw+rFHQFUTHAaNgyLW1xC7hhZnEVdOwRgOheuGlo7jgtN0uXxuUcMgeW3VsFaSa/lENVe3Vzg==
X-Received: by 2002:a5d:53c7:: with SMTP id a7mr4414459wrw.334.1589446828174;
        Thu, 14 May 2020 02:00:28 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id c193sm13125691wme.37.2020.05.14.02.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 02:00:26 -0700 (PDT)
Date:   Thu, 14 May 2020 10:00:25 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     Rob Herring <robh@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.co" <mark.rutland@arm.co>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Amelie DELAUNAY <amelie.delaunay@st.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to
 json-schema
Message-ID: <20200514090025.GE271301@dell>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
 <20200226162125.GA13349@bogus>
 <70ee04c9-4f65-6909-32bc-a379c21a031e@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70ee04c9-4f65-6909-32bc-a379c21a031e@st.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 14 May 2020, Benjamin GAIGNARD wrote:

> 
> 
> On 2/26/20 5:21 PM, Rob Herring wrote:
> > On Thu, 20 Feb 2020 17:22:46 +0100, Benjamin Gaignard wrote:
> >> Convert stmfx bindings to json-schema
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> >> ---
> >>   .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
> >>   Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
> >>   .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
> >>   3 files changed, 124 insertions(+), 144 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/mfd/st,stmfx.yaml
> >>   delete mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
> >>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
> >>
> Hi Lee, Rob,
> 
> I haven't been able to found this patch in -next branches, can one of 
> you merge it ?
> 
> Thanks,
> Benjamin
> > Reviewed-by: Rob Herring <robh@kernel.org>

Rob,

We should agree on a process going forward.  Do you take DT document
changes or should I?  Up until we moved to YAML formatting, I took
them but responsibly seems to have migrated over to you since then.

I don't mind either way.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
