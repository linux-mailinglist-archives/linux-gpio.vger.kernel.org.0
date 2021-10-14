Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1269C42DBA2
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 16:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhJNOdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 10:33:14 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:43656 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbhJNOdM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 10:33:12 -0400
Received: by mail-ot1-f44.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so8448921otb.10;
        Thu, 14 Oct 2021 07:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=JabzPd6t6kiXfNS0QYCpjwDF/E/73IVEaQ8WDMarIkg=;
        b=U/ZxhQV7AjQy6/jUHkbBjyOW2ksN5gwVLm4KnL/R/FukNlUtz5cv4kq5cvglz89HqY
         RZmrQsXPEkMx7iN01sHZ8/lhoWjhqY5NEAa6vYa8KIhHofAO9Lsm03iyZJYvILeK2RmZ
         f/Zmj6bU8PWXKNNLbpi32IcyoruLdGI7hgtN+o9Fk7Iu8UHu8nFgkkh04qwQzE5f1RUv
         tz6oEL6oAqAqF/i5wdy931oUXMXAlKqh6xaVlyf1UQ5Ih5wG4MBsQpq31MQovSyk/jg0
         JyzIr3a+xcAHFcvK0fx6PQeDdoZdZ1eYYuqN79r0FLT6rNne3UrNahrWVNBCq0OtiVtm
         O2Eg==
X-Gm-Message-State: AOAM533Bs6qGv6FD2H1GGulQNYRDwQPwtxomP7RibVcvlR+ePzGseLZl
        DmKOK9sPJjUndpLqRPg9kCxC1wvWVA==
X-Google-Smtp-Source: ABdhPJypLKHSBFnjx8VIYSyTZnzAgk5HudrAyzN092U6WAhsRHGoKcjoUIe6YeTN3COcJ3sBkiy3UA==
X-Received: by 2002:a05:6830:349d:: with SMTP id c29mr622633otu.263.1634221867483;
        Thu, 14 Oct 2021 07:31:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j65sm604298oif.5.2021.10.14.07.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 07:31:06 -0700 (PDT)
Received: (nullmailer pid 3295885 invoked by uid 1000);
        Thu, 14 Oct 2021 14:31:04 -0000
From:   Rob Herring <robh@kernel.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        monstr@monstr.eu, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-arm-kernel@lists.infradead.org, git@xilinx.com
In-Reply-To: <72c973da5670b5ae81d050c582948894ee4174f8.1634206453.git.michal.simek@xilinx.com>
References: <72c973da5670b5ae81d050c582948894ee4174f8.1634206453.git.michal.simek@xilinx.com>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add missing compatible strings
Date:   Thu, 14 Oct 2021 09:31:04 -0500
Message-Id: <1634221864.213975.3295884.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 14 Oct 2021 12:14:18 +0200, Michal Simek wrote:
> "xlnx,zynqmp-gpio-1.0", "xlnx,versal-gpio-1.0" and "xlnx,pmc-gpio-1.0"
> compatible strings were not moved to yaml format. But they were in origin
> text file.
> 
> Fixes: 45ca16072b70 ("dt-bindings: gpio: zynq: convert bindings to YAML")
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
>  Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1540859


gpio@ff0a0000: '#address-cells', 'gpio-line-names', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dt.yaml

gpio@ff0a0000: '#address-cells', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dt.yaml
	arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dt.yaml

