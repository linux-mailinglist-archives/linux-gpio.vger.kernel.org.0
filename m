Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A15285F22
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 14:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgJGMZP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 08:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728003AbgJGMZP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 08:25:15 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083EAC061755;
        Wed,  7 Oct 2020 05:25:15 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d24so2037008lfa.8;
        Wed, 07 Oct 2020 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BG2aRrtMABrEu20HO3uxQjLxpSSHiVUzbn88+piT74Y=;
        b=XNDED/CDPK2Mp8cgF8iiVPv6Y2UaeWC0ttDcos7FM5nWviObXkQerXt5Y356ytZSM1
         Pu60Ck8g9uHo8nsvSasxrHUAMmHyuEU18vVMWGdfQJnjENC+hWdDzkDzMYBu7UrA5fxB
         kLSiJCvbjReXyzDtJlOL2MaHeO6xxA5jGfx/hgo3ttbOQXqHI6vbtYM0exej/un0whzd
         QQ/uv2H4ra1dlCDJN0FwahIVj6fv12dLyTz0iwdfq175tFcFFDY50oVh8w7oNAQi27sy
         GjoFb6wD6D2mfNQPAXDnaVZe8XSUroU/VhSV66SxZIu0xMM/PraYEGt9mP62qCn25K1e
         Z2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BG2aRrtMABrEu20HO3uxQjLxpSSHiVUzbn88+piT74Y=;
        b=ljiUJCwShDhh9W2T1veAc8RViMI+MCzoiYoSl1u/rPk7qP6ALzCG0jPLKvt5xwWDfX
         sZCJr9E16YK6Nd4waF8uqGwiL1WX3rEpZdBfZNOa80pZAHVadCrhVzfXA/GqQo9rSgEV
         Vz6Rp0zSMAaqyzl2lP4qP36eOTOjRNUm5r36enQ00BAvCATJuDFuQ8W6+3zHSP3oyz02
         uGpFC4Kx4Kbczjvrg0K0buoiwH2yhEosDWJW4tzY4K2mRTlJ6kQKwcpeOae0wB42ae5D
         duCQQPU094gYsePoBU8mdzga/dFoBx+alyyFFRTzwNYGDNbOgHDZppMYIHHwBn5QSVG7
         /ALQ==
X-Gm-Message-State: AOAM5329jB86SG0iKkgkPYQ36lRwaq68wAvkEozghovnkTu09YcqVLyi
        SxNIejR2aC0KKCLetIVc5fj044UPqlA=
X-Google-Smtp-Source: ABdhPJwEFtCXAecrp/pxKgqI4EHvqL3/SaG2WNtzq8Z9mz166HmOBbhxgyq4gMQww2FaEPi4np3TeA==
X-Received: by 2002:a19:ca48:: with SMTP id h8mr825194lfj.173.1602073513512;
        Wed, 07 Oct 2020 05:25:13 -0700 (PDT)
Received: from trashcan (host-5-58-109-138.bitternet.ua. [5.58.109.138])
        by smtp.gmail.com with ESMTPSA id q22sm314948lfm.51.2020.10.07.05.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 05:25:12 -0700 (PDT)
Date:   Wed, 7 Oct 2020 15:08:15 +0300
From:   Vladirmir Lisak <junak.pub@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: qcom: add msm8953 pinctrl
 bindings
Message-ID: <20201007120815.GA882584@trashcan>
References: <20201004081644.323858-1-junak.pub@gmail.com>
 <20201004081644.323858-2-junak.pub@gmail.com>
 <20201006212234.GA2858909@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006212234.GA2858909@bogus>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi! Thank you for your reply! 

On Tue, Oct 06, 2020 at 04:22:34PM -0500, Rob Herring wrote:
> 
> For new bindings, please define a node name pattern you can match on 
> and avoid this if/then. '-pins$' is my preference.
> 

Ok, i will change it.

> > +              #interrupt-cells = <2>;
> > +              gpio-controller;
> > +              #gpio-cells = <2>;
> > +              gpio-ranges = <&tlmm 0 0 142>;
> 
> Please show at least 1 child node.
> 

I will add it in next version.
