Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7642C1FF979
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 18:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728929AbgFRQlw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 12:41:52 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:42819 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728587AbgFRQlw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2020 12:41:52 -0400
Received: by mail-il1-f194.google.com with SMTP id j19so6380947ilk.9;
        Thu, 18 Jun 2020 09:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fVuJAsw1olJOL1LysYgB0jXFgoOC6I7GuVE/JaxXuhE=;
        b=gYrP7hk4aY6wgg782/avFsZlPV028A8HW6tUOidv8YWgMTLq1xx2FzAdTGuvjS8c7r
         FdCdPNmvEy4kb70lchg0UfVGnfQtJOo2+6UDi7Ya7MCo4weXDbE8BeVyhxyUIlvjSzjf
         h6mikpjvSUS2ow/Ms1xE8TjNtqVRdn4ngtkW49eW7DcsUZteU7YHVj0S5aDVFiT8WXtx
         VcjHBKBH0etoImVwCg0SKhcTWoxz0fc6AMB5D/9/HzA+kZa6xfPQ6HbvBB87MYFFgxHo
         llnwwk4a5SDlVknmfU5LG1xy0Z+5Z9wIqWiyrmsOiWBn6nrVbl7SkZYYpaWaFtsxr8E6
         O55Q==
X-Gm-Message-State: AOAM530r16jYEEfGfwcIKTpO6DrAzTlyGG2m4uNpqy4Z/EtD6s7te87v
        Nx+qx6+HoCvCvfMyUAPgpQ==
X-Google-Smtp-Source: ABdhPJw1uAYQlQaYW4i9ro0et3qdLVpy3ZMSLGoanLWJPOU7Ad6UZ4jxcldsw6DcwZ1gNBHNmCypxw==
X-Received: by 2002:a05:6e02:13ee:: with SMTP id w14mr4659208ilj.190.1592498510970;
        Thu, 18 Jun 2020 09:41:50 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j80sm1811247ili.65.2020.06.18.09.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 09:41:50 -0700 (PDT)
Received: (nullmailer pid 500124 invoked by uid 1000);
        Thu, 18 Jun 2020 16:41:49 -0000
Date:   Thu, 18 Jun 2020 10:41:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 12/29] dt: update a reference for reneases pcar file
 renamed to yaml
Message-ID: <20200618164149.GA499887@bogus>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
 <72d7ec91a60e852d34f3e15bc5faef1f62a8260e.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72d7ec91a60e852d34f3e15bc5faef1f62a8260e.1592203542.git.mchehab+huawei@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 15 Jun 2020 08:46:51 +0200, Mauro Carvalho Chehab wrote:
> This file was renamed, but its reference at pfc-pinctl.txt is
> still pointing to the old file.
> 
> Fixes: 7f7d408e5a00 ("dt-bindings: gpio: rcar: Convert to json-schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
