Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6D23DAC4B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 21:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbhG2T7I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 15:59:08 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:42825 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbhG2T7G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 15:59:06 -0400
Received: by mail-io1-f49.google.com with SMTP id h1so8629843iol.9;
        Thu, 29 Jul 2021 12:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zaYBFxKaWAHQ7lb61lyQgHMS9WtteUX9NlBJgRoVRmU=;
        b=MmAFLDXU3wiZ2DA233iln8f+cZEZgjhhc7jPkspG4xb/PaikZeqeTgczZhmstPQJyI
         gJOuXxf4EAjsvmNBt7lpy/HRdqmA7avUI+L8Rrw6y1Qc4Yw360lC50+mdbwmQIxcS3SJ
         g4qyeF9WS643LhL6PF9B/NTP15jsDHwb3gUL0WCpC+hr2+VKNimXCgwZ887fHs57Ht8v
         yrgLM0LcOkiPaOE4F7/jprsHO7H1nRCJKKCCAD0k3alOAMqg5Vk7Aj1AFmcSkhApwmVw
         Vmlw+okwIuRjHxdpUZt+hImZDk+/FUqIvfSzi/dg07T6Uia/09o18LQoHYpjW4ytNXVn
         f1fg==
X-Gm-Message-State: AOAM532Ynyw1F+ZhNemaK7AhVCh8xUeTOLe0p59YxTuqPcL0IrTcNpeH
        j8zdBr+3HLY2gmp7x7zEmw==
X-Google-Smtp-Source: ABdhPJxPrMHOpX3uNQKU5vG+Whb/pP2ujzbHNXtLCHSyz7ZzuAMT1i/p4oMBXjKKGoEbm7MbtK2lxQ==
X-Received: by 2002:a05:6602:2406:: with SMTP id s6mr5352297ioa.159.1627588743041;
        Thu, 29 Jul 2021 12:59:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b15sm2286802ilq.85.2021.07.29.12.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 12:59:02 -0700 (PDT)
Received: (nullmailer pid 783172 invoked by uid 1000);
        Thu, 29 Jul 2021 19:59:00 -0000
Date:   Thu, 29 Jul 2021 13:59:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        git@xilinx.com, saikrishna12468@gmail.com
Subject: Re: [PATCH 4/4] arm: dts: zynq: Replace 'io-standard' with
 'power-source' property
Message-ID: <YQMIhBPwcNw1YqMq@robh.at.kernel.org>
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1626868353-96475-5-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626868353-96475-5-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 21, 2021 at 05:22:33PM +0530, Sai Krishna Potthuri wrote:
> Replace 'io-standard' property with 'power-source' property in all zynq dts
> files to be in sync with Zynq pinctrl driver.
> 
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> ---
>  arch/arm/boot/dts/zynq-ebaz4205.dts |  8 ++++----
>  arch/arm/boot/dts/zynq-microzed.dts |  2 +-
>  arch/arm/boot/dts/zynq-zc702.dts    | 20 ++++++++++----------
>  arch/arm/boot/dts/zynq-zc706.dts    | 18 +++++++++---------
>  4 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/zynq-ebaz4205.dts b/arch/arm/boot/dts/zynq-ebaz4205.dts
> index b0b836aedd76..be7eae611fb7 100644
> --- a/arch/arm/boot/dts/zynq-ebaz4205.dts
> +++ b/arch/arm/boot/dts/zynq-ebaz4205.dts
> @@ -57,7 +57,7 @@
>  
>  		conf {
>  			groups = "gpio0_20_grp", "gpio0_32_grp";
> -			io-standard = <3>;
> +			power-source = <3>;

This will break using a new DT with a kernel without patch 3.
