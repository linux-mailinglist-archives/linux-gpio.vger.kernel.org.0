Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06441E6E0E
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 23:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436744AbgE1Vpt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 17:45:49 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35023 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436630AbgE1Vpr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 17:45:47 -0400
Received: by mail-io1-f68.google.com with SMTP id s18so166607ioe.2;
        Thu, 28 May 2020 14:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=no6HlcdcFcA/a4l7oGUTR6aVzXC2MXn/zYF87og1wYg=;
        b=b0L+5vyUKKSUswfhqgDzSwmkFRrCCiLhirsgneks3uahsFjAqTH5fKAxIIo1UR85Gn
         PYk/2qs+e1f4zOlSMsa5g7Q0EUp1KakHFcCU4DDvlMU6XMESRlZAmQxp+0WQZWSkYbcL
         Gywn9+0FGdxBlRksFA6Eu/nTlHZFsWLG41sMIyGS6BxWwYhjq94lv5nEI5G4etb3Rs+a
         oeuAmxNXL7q5PCn0+7ePhHky8AC7nISWoFGpAUkDUiO009Z2XObRzz40C+0/9h4BBj//
         lqMZoGlDJUtgtPF9z4koL7Ov/3kLleqnyhjG1qDFLgZCbHA0C5oi0VIScE1jvHDmLxhW
         iyiA==
X-Gm-Message-State: AOAM532EvxgNlMksy4mH8SueCu4VRHkXwdHnHNzdLoVAmrdi2Zi3qycT
        ksgMAQkELBEc1vGhELbmQQ==
X-Google-Smtp-Source: ABdhPJzYXYmo9Aia4JUtPNGct0ALVvFbsn1fqj9BKNroCD9lDsLRuNfCbwzH+Nr0bgOoa2MCjhqxyA==
X-Received: by 2002:a05:6602:2001:: with SMTP id y1mr3953649iod.94.1590702345570;
        Thu, 28 May 2020 14:45:45 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id 129sm2877005ioy.0.2020.05.28.14.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:45:45 -0700 (PDT)
Received: (nullmailer pid 739310 invoked by uid 1000);
        Thu, 28 May 2020 21:45:44 -0000
Date:   Thu, 28 May 2020 15:45:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Boris Brezillon <bbrezillon@kernel.org>, od@zcrc.me,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: Convert ingenic,jz4780-nand.txt
 to YAML
Message-ID: <20200528214544.GA739281@bogus>
References: <20200520002234.418025-1-paul@crapouillou.net>
 <20200520002234.418025-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520002234.418025-3-paul@crapouillou.net>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 20 May 2020 02:22:34 +0200, Paul Cercueil wrote:
> Convert the ingenic,jz4780-nand.txt doc file to ingenic,nand.yaml.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: - Don't include ingenic,nemc-client.yaml which is gone
>     	- Use 'partitions' property instead of '^partitions$' pattern
> 
>  .../bindings/mtd/ingenic,jz4780-nand.txt      |  92 ------------
>  .../devicetree/bindings/mtd/ingenic,nand.yaml | 132 ++++++++++++++++++
>  2 files changed, 132 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
> 

Applied, thanks!
