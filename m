Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691644299D1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 01:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhJKXah (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Oct 2021 19:30:37 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:43751 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbhJKXah (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Oct 2021 19:30:37 -0400
Received: by mail-oi1-f179.google.com with SMTP id o4so26661066oia.10;
        Mon, 11 Oct 2021 16:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Nl7ggNzhq/E08DQIYShYm5L1lOrbn/CSrL+kmPh33Ek=;
        b=1WmAJ/CT9tpknzNynFU0CHWTLKmQ3dPcMDtCF3I5yKCnlW6IpNVxJGXOqTwxkYWdQK
         0emqZhFhvAVSBpkPlhUfOlnH3PRxOVq93PN4XfE5mz02cTz5twZgieDKrS6ejNHcmsCU
         XK0I2FkfDezVg+q1hsO2TCPCzAqFsO2T/fPbYwt6nW7A6JSOb74eb1NF5405P7k28yWj
         anocp0n3wfafY7HZUXyibYiA4i1jh7X+IJWN42JOcX7eJc1/4cTXXjCPdUjQeFSNfLQS
         HUSNkOJm6Z3CwIzG1dystcNJNd02gd8etIIbk0St24Uqh9BBW3R4cq9wCmtB1Dre5g1V
         v/kA==
X-Gm-Message-State: AOAM533imPNk4NI6mUoJojZB0zEPsa0jRUjTyYvyiyD0OQZtRz/F5/dp
        DfQ9wfqEkio7fhrLgYDOvQ==
X-Google-Smtp-Source: ABdhPJwqbC2OMaRJa5iPNW6jkxhydf0KYtN9bBkKob61hpXRmYfDn8KNb6+erha0VF5fw57chkHOeA==
X-Received: by 2002:a05:6808:346:: with SMTP id j6mr1316648oie.131.1633994916280;
        Mon, 11 Oct 2021 16:28:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bc19sm1881975oob.29.2021.10.11.16.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 16:28:35 -0700 (PDT)
Received: (nullmailer pid 1369203 invoked by uid 1000);
        Mon, 11 Oct 2021 23:28:34 -0000
Date:   Mon, 11 Oct 2021 18:28:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 linux-pinctrl 1/3] Revert "dt-bindings: pinctrl:
 bcm4708-pinmux: rework binding to use syscon"
Message-ID: <YWTIouIA5EEO6fMF@robh.at.kernel.org>
References: <20211008205938.29925-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008205938.29925-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 08, 2021 at 10:59:36PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This reverts commit 2ae80900f239484069569380e1fc4340fd6e0089.
> 
> My rework was unneeded & wrong. It replaced a clear & correct "reg"
> property usage with a custom "offset" one.
> 
> Back then I didn't understand how to properly handle CRU block binding.
> I heard / read about syscon and tried to use it in a totally invalid
> way. That change also missed Rob's review (obviously).
> 
> Northstar's pin controller is a simple consistent hardware block that
> can be cleanly mapped using a 0x24 long reg space.
> 
> Since the rework commit there wasn't any follow up modifying in-kernel
> DTS files to use the new binding. Broadcom also isn't known to use that
> bugged binding. There is close to zero chance this revert may actually
> cause problems / regressions.
> 
> This commit is a simple revert. Example binding may (should) be updated
> / cleaned up but that can be handled separately.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Update brcm,cru.yaml to avoid new yamllint warnings/errors
> ---
>  .../devicetree/bindings/mfd/brcm,cru.yaml     | 11 +++++----
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 23 +++++++++++--------
>  2 files changed, 19 insertions(+), 15 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
