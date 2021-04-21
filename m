Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E60A4366B38
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 14:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239988AbhDUMwa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 08:52:30 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:35779 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239981AbhDUMwa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 08:52:30 -0400
Received: by mail-ot1-f53.google.com with SMTP id 35-20020a9d05260000b029029c82502d7bso7413604otw.2;
        Wed, 21 Apr 2021 05:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=kzUnia443FDp3cfEpVSUaMEUxbjwIzwp2k+x6o1CFGs=;
        b=NoO8URHb2TfbcDVRf6ADSjFtl64hSe4JiWJfJyyxU+4mZ1dZfG4a/Cd9now4j/AnWJ
         +XpZmTDJ6XTkiUR2djn5X2wHiyhifFqAoJaNJ1hbA/CI9HubvXptw6/VB/P7rRajRe3c
         +0c1eKhZSr1cOBxxFbbZztWk874rxousxMsGotAHwir8tHNA/e7p2eLYU5P3MAZYkkt5
         oNbrAYTYN418Y2o6rT8e5gWZCH9op0Jqv7jVY5bgR48+jHFwxDwpNiDA+1OfAw4LO/YM
         ftv9zoOWfn1rAsHNUIrqeLvFrqRoE44duW46BYb1xlMkPj5bpfLNiy6qSfDZxElyx4/B
         TEqA==
X-Gm-Message-State: AOAM5311wCPfkEypCHkAosGNSuWfQnnZQqTCa/K8Sz6Q+qqHph83li0L
        B6goMMz442i7xlzwtNRZDQ==
X-Google-Smtp-Source: ABdhPJy7u0Na1Gm17gGUotWoc87lsCS2jMB18HY7U6qv2ub6C2qYplKSuDIf2TVhkPBN+CVB/uD/Gg==
X-Received: by 2002:a05:6830:1bf6:: with SMTP id k22mr2522066otb.112.1619009515853;
        Wed, 21 Apr 2021 05:51:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u195sm440184oif.55.2021.04.21.05.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 05:51:54 -0700 (PDT)
Received: (nullmailer pid 967212 invoked by uid 1000);
        Wed, 21 Apr 2021 12:51:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20210421082928.26869-1-zajec5@gmail.com>
References: <20210421082928.26869-1-zajec5@gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: convert Broadcom Northstar to the json-schema
Date:   Wed, 21 Apr 2021 07:51:48 -0500
Message-Id: <1619009508.524210.967211.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 21 Apr 2021 10:29:28 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Important: this change converts the binding as it is. It includes
> dependency on undocumented CRU that must be refactored. That will be
> handled once every CRU MFD subdevice gets documented properly (including
> pinmux).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/pinctrl/brcm,bcm4708-pinmux.txt  | 55 -----------
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 98 +++++++++++++++++++
>  2 files changed, 98 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.example.dt.yaml: dmu@1800c000: $nodename:0: 'dmu@1800c000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/simple-bus.yaml

See https://patchwork.ozlabs.org/patch/1468632

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

