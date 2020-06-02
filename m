Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A091EC026
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2020 18:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgFBQfF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jun 2020 12:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbgFBQfE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2020 12:35:04 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB70C05BD1E
        for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2020 09:35:02 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o15so13363253ejm.12
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2020 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GTp3v0xs6mu5kFIbCxhtRB6gkwXEBZW6SmRoVZ5I7s8=;
        b=bitYm4VsV59axD8Yyh4/9Ainp4Ejsxy3f6GGf06ZdUqBePwsXjnxUv7AmcsFBxvAy+
         sDgixVmXWE6rE7BLZHD3F1/LiFked4NddpNfvEFHK/NblwSiZoc9dwiIABl4C18iogld
         C2nem6F99yGeMb5XU56PVEoWwTQ2o8qPyaMB6SkojPG1j908NQJhpg8LYDaPIVXxWOd9
         BNm+13BoZV0nIpK21TFz6d+M7RIzMWciWSxuwtcHm9t9eGgH+irmW4Ews6p5nUE03jI5
         ZQUWTlmxEzbsAJRn9CsQ34znh7kYX/db89XVj6UXQgRXDW9qCmRKCffbHNcW24DpcDlE
         /UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GTp3v0xs6mu5kFIbCxhtRB6gkwXEBZW6SmRoVZ5I7s8=;
        b=WaUzz3fj0juB9R0Hae1kno9OwAPd4Mq7av9DMOCp+ur3/Q4CukJQxRd+9YB9aRgavR
         06ehBkeQVpp6v+wM22AEnm6wIgrt+SdbyAsPk3MdWWYe8BiDO8VNc1XmpV1guH6CumQB
         dr0ZnvJYmyOXcF9nRiKnGvOuq+VlPaNj6g/bU5xge0kaGExU3MRNZ+EhVTX+8rkdKYod
         7YRLcuNc9baaH0HGBG6dnlFw0VFlx8TtKkpI1TRQod930TcPmC1PCoA7tWEFlmK1QtWK
         iw2Yz3kDpXXPwQlrNg6igMVMnTzAn055cDsAKeWaUxbs8k8wzivQLEdNbFsrUJK9SSuj
         qd/Q==
X-Gm-Message-State: AOAM532FGqE4JVUAXyENi4C9pAYsF7PjCJtwFK24vpq56X7Ld2JRn4mz
        fvnbM2kkRyUNx42DVpr0RHoyQ1CXcDAtOqJx
X-Google-Smtp-Source: ABdhPJwDC5xZ0HQrYmCYTAi9W3vztRFSPp2byu4s2Wfk9myNfuwm4bvRwoMVZ7BolQqQim/GmZ2krg==
X-Received: by 2002:a17:906:1c8c:: with SMTP id g12mr13519380ejh.456.1591115701447;
        Tue, 02 Jun 2020 09:35:01 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id ce16sm1829533ejb.76.2020.06.02.09.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 09:35:00 -0700 (PDT)
Date:   Tue, 2 Jun 2020 18:34:58 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, jkridner@beagleboard.org,
        robertcnelson@gmail.com
Subject: Re: [PATCH] ARM: dts: AM33xx-l4: add gpio-ranges
Message-ID: <20200602163458.GA847883@x1>
References: <20200602131428.GA496390@x1>
 <803e2d78-28ba-0816-dbb5-d441d7659a91@ti.com>
 <20200602135155.GE37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200602135155.GE37466@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 02, 2020 at 06:51:55AM -0700, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [200602 13:44]:
> > 
> > 
> > On 02/06/2020 16:14, Drew Fustini wrote:
> > > Add gpio-ranges properties to the gpio controller nodes.
> > > 
> > > These gpio-ranges were created based on "Table 9-10. CONTROL_MODULE
> > > REGISTERS" in the  "AM335x Technical Reference Manual" [0] and "Table
> > > 4-2. Pin Attributes" in the "AM335x Sitara Processor datasheet" [1].
> > > A csv file with this data is available for reference [2].
> > 
> > It will be good if you can explain not only "what" is changed, but
> > also "why" it's needed in commit message.
> 
> Also, please check (again) that this is the same for all the am3
> variants. For omap3, we had different pad assignments even between
> SoC revisions. Different pad routings should be easy to deal with
> in the dts if needed though.
> 
> Regards,
> 
> Tony

It appears that the only usage of am33xx-l4.dtsi is for am335x for which
specific parts mentioned in those dtsi files are 3352, 3358, and 3359.

$ git grep am33xx-l4.dtsi 
arch/arm/boot/dts/am33xx.dtsi:#include "am33xx-l4.dtsi"
$ git grep -l '#include "am33xx.dtsi"' arch/ |wc -l
27
$ git grep -l '#include "am33xx.dtsi"' arch/ |grep -v am335x |wc -l
0

Also, it appears that the only AM33xx parts that actually exist are [0]:

AM3351, AM3352, AM3354, AM3356, AM3357, AM3358, AM3359

I clicked on the datasheet link for each product page and while the URL
has the specific part number in it [1], they all end up loading the
exact same PDF. The header states:

"AM3359, AM3358, AM3357, AM3356, AM3354, AM3352, AM3351
SPRS717L – OCTOBER 2011 – REVISED MARCH 2020"

Thus, I do believe all SoC's using am33xx-l4.dtsi would have the same
memory map for the pin control registers and the same relationshop from
pin to gpio line.  For example, GPMC_A0 has mode 7 and it is labeled
gpio1_16.  conf_gpmc_a0 is at offset 840h which makes it pin 16.

Maybe am33xx-l4.dtsi should have actually been named am335x-l4.dtsi?

Though I suppose there is no point in changing that now.

thanks,
drew

[0] http://www.ti.com/processors/sitara-arm/am335x-cortex-a8/overview.html
[1] https://www.ti.com/lit/ds/symlink/am3359.pdf
