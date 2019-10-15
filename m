Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C998D8111
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 22:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387642AbfJOUch (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 16:32:37 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39426 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728625AbfJOUch (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 16:32:37 -0400
Received: by mail-ot1-f65.google.com with SMTP id s22so18146071otr.6;
        Tue, 15 Oct 2019 13:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4ebK/ViVZJmUAPI2VAUXML+53ZkCZHJ5Zk+Nhk3slEk=;
        b=qMLDRR6V7LTTBQNUUcLxBSwIaygSeAwwasVaebS+I1xtn81J46b+MGMsdu2eNy/oZ6
         +0/8PQ9lmMtNL8hiLeAtcJvGFxZlNieQaFpNb+lum8pESW50EVybLR7GTjyrPQj2LFjd
         6YJjGUXmR0EoIHxJxe+//2zAU5SDCpsc+hZd40EUCv7Avlc6F1PtrTTiUJYJGnemzk/s
         aPpJJ+B7baQCc0I8/9djzoQARNqsOdouLEFcrxyPlcOYPNuG00R/fNUojijxXhNHxCfa
         a/5aSLkycCGhwkh3BV0kus40+BTK4DzqUt2VvPMVw6FMPrOh1z+ToPSU0SOpdJwPDUYP
         h5bQ==
X-Gm-Message-State: APjAAAWg+Joml55A1DbSGao/L8/RibkBMMF699FZy728YZLx95tELhfb
        6zw/oyDGV6XnPtaBo+z4KoIV6ug=
X-Google-Smtp-Source: APXvYqyxbPCkJ3P7UNWi1SVBPqlwolIl47fIxm3jywgiaOdwWmxANgNnARuix2agaS7iUmR1V9LJ4g==
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr22952028otk.26.1571171556200;
        Tue, 15 Oct 2019 13:32:36 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c19sm6685549oib.21.2019.10.15.13.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 13:32:35 -0700 (PDT)
Date:   Tue, 15 Oct 2019 15:32:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, marijns95@gmail.com,
        kholk11@gmail.com
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add MSM8976 driver bindings
 and documentation
Message-ID: <20191015203235.GA3864@bogus>
References: <20191005105936.31216-1-kholk11@gmail.com>
 <20191005105936.31216-3-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005105936.31216-3-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat,  5 Oct 2019 12:59:36 +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add the documentation for this new driver for pin configuration
> with the pinctrl framework on MSM8976/56 and its APQ variants.
> ---
>  .../bindings/pinctrl/qcom,msm8976-pinctrl.txt | 183 ++++++++++++++++++
>  1 file changed, 183 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
