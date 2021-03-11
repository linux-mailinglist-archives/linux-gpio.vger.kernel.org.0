Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF29B33814D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 00:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhCKXRn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 18:17:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhCKXRX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 18:17:23 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097DCC061760
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 15:17:23 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id o19-20020a9d22130000b02901bfa5b79e18so477640ota.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 15:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O/1BasX53ustb+YwoFg9cotua8g8c2ln7CwN1aiIWak=;
        b=TpTmshjru2pTMb8mis7NfOAQYLh14cnY0apwhaLXvUwKbISlNm0PBstBOX33WO8DbH
         HHeistEMVz07cyObhNaHEXYHssuuazks5S9hW3RJRCXORjHPHqKrkmziPZzxN1gZLUAk
         NN1Y9i/zMOChSC0Z9ULiYHqaVmytsS09th/E3ZNNwWgKThGvWrRTCuvny0VBhYmzWzvb
         qT5DVVvGyI+VDO7bbqxygnZXh7VhNlNFWXNxzml5cndHvq6Af3shf+sbcBkrFX/UKpCZ
         SrxVy2Me7ekhz+aX3OIYAoyZ4/6Hg3qkM4uKo0pnU0/+N3GNgeQ2R0rx0PixtBFctOxg
         55EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O/1BasX53ustb+YwoFg9cotua8g8c2ln7CwN1aiIWak=;
        b=diqRrENw/HTFaZgOue4bFYvWYuEOfwd7Ws3yvBJjbko1n6DGGE4nRAuWgqjCGlGc20
         UCEBxoQ5myYNrIXm7EebHsKG80vZi+Nx93ypc1p1uql6t+GdboRMB3fjqM48duQ1/0Xo
         dYZVo+XvonVRJY+FYvs8VtSmmEK9+/pv5ATDLKpseN0hLameH5sMD4NlpQs3ZxqCA0B8
         FEX0ZNtZ/WiIEC1Bi300evs9GIaMlIwGRhkmJ3MI3JWZnlD0uZEYaWJXEHJ5htUd+68d
         fcQqo7STBK6fXMHxGZXUzU1WeOcq9aCIlk2w7uirTCN3BKntUsChVt7LWuZvMitc5clw
         c+1w==
X-Gm-Message-State: AOAM5300FDz3pxlHxVbFQ++VW52HNHcxI3QAgYZkRyWDSq/X72BdW5OB
        ZzqwdQXLy4dY4EH6Ny+tCKdz7Q==
X-Google-Smtp-Source: ABdhPJwLGVT09tJ98beiEHxWiFw5lQdBGU01XCFQ73puFX1unASYPnc7E9xq57IjUy4WPenUTsDKOQ==
X-Received: by 2002:a05:6830:15cb:: with SMTP id j11mr1058492otr.126.1615504642482;
        Thu, 11 Mar 2021 15:17:22 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m34sm959436otc.25.2021.03.11.15.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:17:22 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:17:20 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845: fix number of pins in
 'gpio-ranges'
Message-ID: <YEqlANAhGJWZdLVA@builder.lan>
References: <20210303033106.549-1-shawn.guo@linaro.org>
 <20210303033106.549-2-shawn.guo@linaro.org>
 <YEKl7GbxBhui4eoT@builder.lan>
 <20210306012829.GL17424@dragon>
 <YELhMmDndOTSSJJO@builder.lan>
 <20210306080049.GM17424@dragon>
 <YEkOaK+UiLy8kSDu@builder.lan>
 <20210311011951.GT17424@dragon>
 <YEpLHSRKt651B6FP@builder.lan>
 <20210311230924.GX17424@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311230924.GX17424@dragon>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 11 Mar 17:09 CST 2021, Shawn Guo wrote:

> On Thu, Mar 11, 2021 at 10:53:49AM -0600, Bjorn Andersson wrote:
> > On Wed 10 Mar 19:19 CST 2021, Shawn Guo wrote:
> > > Yes, DT stops working because of the mismatch between
> > > msm_pinctrl_soc_data.ngpio and gpio-ranges.
> > > 
> > 
> > So what you're saying is that when Linus merged the .set_config patch
> > yesterday he broke storage on every single Qualcomm device?
> 
> Better than that.  Only the ones that have mismatching between
> msm_pinctrl_soc_data.ngpio and gpio-ranges.  More specifically, the ones
> that the series are fixing.
> 
> I didn't realize this break when I was working on the .set_config change
> for ACPI.  It was a surprise when I tested DT later.  You can ask Linus
> to drop .set_config patch, if you do not like this break.  But I think
> the mismatch issue still needs to be resolved in some way.
> 

We're exposing the UFS as a gpio and I think that these patches
therefore are correct, so I've picked them up.

But I don't think we should break backwards compatibility will all
existing DTBs...

Regards,
Bjorn
