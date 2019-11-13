Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED6DFFB2CA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 15:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbfKMOrB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 09:47:01 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35071 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbfKMOrA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 09:47:00 -0500
Received: by mail-lf1-f67.google.com with SMTP id i26so2204318lfl.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 06:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yQrWeWf9QtOi7M1gxxpS8uzFCUgWpoqL5CQthXBahco=;
        b=FgMaQEuSftBWtM2x6N/r8zpt6IzKUvIiO2+PdZgXmtmk8Kvp7kjRJOjg9ItQ0UfS4t
         YgjvVb8ImGI1+6Ez4nlrKNAYqBndmxNvN0uthRUbrzm+YcxT2jyAxAmsiwt0Ny0Vw+pW
         84aPL66ZhxRk7EuwOKGi64gKwvdGH3cgOSh2hMqk0qk4q/8lLCBxVmvR4yYSTNIK51Wr
         1raZQylTVt2BEAd02q4hIEblkJ5PfDVsHESHLYOwaOKOaupbB0GqJ53VwBWLDZQ4z3K6
         EaIAe9cgXJq2COIq+2VX1yubuS7ph6Lrt8SD0UPdEC41xH1eHf6BdR2W28vJ1YH7BUoQ
         GhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yQrWeWf9QtOi7M1gxxpS8uzFCUgWpoqL5CQthXBahco=;
        b=cYZKSMFEjjedDhV5/jxyF80ALVfG9vWJOD1H12HFMLdkOgTxTBEMSBOmXcbs+it3RA
         8igG4Ym1/Oc2IqgibA2WqP1S6jrP1GmYHk91+tMGQAXIVisKTsE59gYvjx8FbS7tUpXS
         xaEyiWQWtG2/C+KzK/ug9knvXLg7faLjecvUW+23vhYCWz+XiJ4d0sFW0ysmp08EQntP
         NJe/pPjzs7HY/ckdhmjRn8YcOF7LB5dvi0zPRLaUOwgDBrCzweH/91UuoFsvO8rejC14
         rHbvBS+iLXoodyoraGtW0laducVB5pj6PLZlshUnW00De0Q1CxboYvFg9Iouia8Fo1Ne
         vsoA==
X-Gm-Message-State: APjAAAV5LAvTA1Ag6FSh16oBHgExj3sXYaVBgqfZEXxU66cM7/vQxSaE
        pwpgBxpwWcdJwvtvjNNIeWgvwe/uSqoNS2Gw2sX9aw==
X-Google-Smtp-Source: APXvYqy4Gs+cn1O1Suko5LQ2TXf5Cr45y80cAOlgn3FYsa6mb1dny3EgoAAMi616HeC1eO4Iz0GaDLxmFchKxY7Tcg8=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr2850516lfn.86.1573656418885;
 Wed, 13 Nov 2019 06:46:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573455324.git.rahul.tanwar@linux.intel.com> <96537f8702501a45501d5a59ca029f92e36a9e4a.1573455324.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <96537f8702501a45501d5a59ca029f92e36a9e4a.1573455324.git.rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 15:46:47 +0100
Message-ID: <CACRpkdYhy1KLyZd4MNSODpy0Q59_SAcc+wkofrZr4b4N+rYDxw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: pinctrl: intel: Add for new SoC
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 11, 2019 at 11:11 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Add dt bindings document for pinmux & GPIO controller driver of
> Intel Lightning Mountain SoC.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
(...)

> +properties:
> +  compatible:
> +    const: intel,lgm-pinctrl

Just noted from another review where Rob noted that this name should
match the internal name in the datasheet for this hardware block. Is it
really called "lgm-pinctrl" inside Intel?

intel,lightning-mountain-io and similar are perfectly fine if that is the
name it has in your documentation.

Yours,
Linus Walleij
