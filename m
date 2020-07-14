Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3402221FEE5
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 22:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgGNUuq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 16:50:46 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42676 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgGNUup (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 16:50:45 -0400
Received: by mail-io1-f66.google.com with SMTP id c16so18792580ioi.9;
        Tue, 14 Jul 2020 13:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eygC9f8Xxqb4MDq1b649X0GG6DFc2lLTxU3qtkHDzQ8=;
        b=uMxofP3uSd87GACSDHzYtPQRiNpDaLwlTmJbWF6BBE0ECFqCa97uQEwdL3MJPPEvpK
         MLWnuJ6sUVn3srHtCjgmFrldgxZ+AJsYNtGKAMTBOLqzYi/46dFwRGX7zWjKF3ZT+Oc5
         KFulAByi6M2Rsb4amVEAr/c2+KtxYSTqMPySKsAdSuLJNOU/rJYvsX5d18JowIlf3WfU
         aA1oQ6ZxLeXQfq95By527oBVcfQkJQyM+/piaIK1Pk7UNvQKfMIAG8yREMvVS6bO9YiL
         7pnq4rZuSaSUhzuK4c35q/NJAyhtL5Qv+NHdri9eyS8uoTwDh5aAjaCloFTb3AGEZsqN
         RY6Q==
X-Gm-Message-State: AOAM532zh0K/Pt4+Q95HDzkmbM1b5KEX3ZAJLMVrDxZIIjLGLVzWxu0m
        wXP7Ir3QIQkt9wyn9xhwbY11Cv1Eu1cV
X-Google-Smtp-Source: ABdhPJy2C4LALLI4bX+F9nn7mugzaDWQxEFn++/edEEYR2aPhNX4Qf1+rAt/fXVaeKCjkM+O4EiwrQ==
X-Received: by 2002:a02:c7cc:: with SMTP id s12mr8144011jao.79.1594759844855;
        Tue, 14 Jul 2020 13:50:44 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c16sm29061ilh.54.2020.07.14.13.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:50:44 -0700 (PDT)
Received: (nullmailer pid 2895898 invoked by uid 1000);
        Tue, 14 Jul 2020 20:50:43 -0000
Date:   Tue, 14 Jul 2020 14:50:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     wens@csie.org, liyong@allwinnertech.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        huangshuosheng@allwinnertech.com, mripard@kernel.org,
        linus.walleij@linaro.org, tiny.windzz@gmail.com,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 03/16] dt-bindings: pinctrl: sunxi: Get rid of
 continual nesting
Message-ID: <20200714205043.GA2895851@bogus>
References: <cover.1594708863.git.frank@allwinnertech.com>
 <b486dc2f07aeb4772af7ee2ed521932582354a34.1594708864.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b486dc2f07aeb4772af7ee2ed521932582354a34.1594708864.git.frank@allwinnertech.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 14 Jul 2020 15:03:53 +0800, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>
> 
> Rather than a continual nesting of 'else' clauses, just make
> each 'if' a new entry under 'allOf' and get rid of the else.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 124 ++++++++++--------
>  1 file changed, 68 insertions(+), 56 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
