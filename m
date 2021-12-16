Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B080477602
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 16:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235261AbhLPPc5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 10:32:57 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:40743 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235182AbhLPPc5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 10:32:57 -0500
Received: by mail-ot1-f53.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so29378567otj.7;
        Thu, 16 Dec 2021 07:32:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZDdEZm+dnq7PEy7CfxdMwVmTaEo1tXhLnzcbyE3V3B4=;
        b=k1E37mQ0baiKeuNAUbo2RfDGeukKgKazXbuCf/phNEAIdnerwK9O9gW/gVxRK3RdX8
         96nOAA6anPm7uJzNl2st1XTRfvNTglidHrBq4/u0olx3msC5aMieL5AXuYyz8fdiYouw
         dhgZZBxlXI+7tk2w/b+8RBCIuCcYPkN7NZvA27vjHTOSn0HfCE8cXevfrSEOmzhGOhF7
         Edb4nnFngVPZu4HD2YJ5bG9L7hGzYEmfOG55vs5UH6hc1VPk1jmfGZ4FIugWwrvD1Fag
         Q5g4hSB9yyZZtBIuX98TnEFi+sEYfQV4WpbXG2Ayf8YG09nqwaTSGKXFtXllsf+pwcTM
         rRmA==
X-Gm-Message-State: AOAM532ay62ll7c9FEjmcmCOQK0Of0Gplffbf9J/B8zwt1VPUeh7Goet
        bxYfdJhGxsFfm9N/oooqYQ==
X-Google-Smtp-Source: ABdhPJwiINEHDjGlZWCruywrRRuqHrX0VLDR1TSWxHnMWTfZet8WD1x0OiX/OddCBivyMhT9jLbk4Q==
X-Received: by 2002:a05:6830:25c4:: with SMTP id d4mr12763997otu.138.1639668776617;
        Thu, 16 Dec 2021 07:32:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bh12sm1033064oib.25.2021.12.16.07.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:32:55 -0800 (PST)
Received: (nullmailer pid 256641 invoked by uid 1000);
        Thu, 16 Dec 2021 15:32:54 -0000
Date:   Thu, 16 Dec 2021 09:32:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add binding for BCM4908 pinctrl
Message-ID: <YbtcJrTpbVVjqbkD@robh.at.kernel.org>
References: <20211215204753.5956-1-zajec5@gmail.com>
 <1639607248.075072.1954724.nullmailer@robh.at.kernel.org>
 <e97e3795-b468-8334-7c12-bfd52e22f363@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e97e3795-b468-8334-7c12-bfd52e22f363@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 15, 2021 at 11:35:01PM +0100, Rafał Miłecki wrote:
> Hi Rob,
> 
> On 15.12.2021 23:27, Rob Herring wrote:
> > On Wed, 15 Dec 2021 21:47:52 +0100, Rafał Miłecki wrote:
> > > From: Rafał Miłecki <rafal@milecki.pl>
> > > 
> > > It's hardware block that is part of every SoC from BCM4908 family.
> > > 
> > > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > > ---
> > >   .../pinctrl/brcm,bcm4908-pinctrl.yaml         | 72 +++++++++++++++++++
> > >   MAINTAINERS                                   |  7 ++
> > >   2 files changed, 79 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl.yaml'
> > xargs: dt-doc-validate: exited with status 255; aborting
> > make[1]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.example.dt.yaml'
> > Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl.yaml'
> > make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.example.dt.yaml] Error 255
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1413: dt_binding_check] Error 2
> 
> this patch targets Linus's git tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=for-next
> 
> Above tree contains 896568e5b9c8 ("dt-bindings: pinctrl: convert
> controller description to the json-schema") which provides pinctrl.yaml.

Please note that in the patch if you don't want to get this message. 
Otherwise, this is the alert that there's some dependency.

Rob
