Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE5B34E963
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 15:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhC3Njt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 09:39:49 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:46883 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbhC3NjR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 09:39:17 -0400
Received: by mail-ot1-f54.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso15552609ott.13;
        Tue, 30 Mar 2021 06:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lqijnVOuWfbRRkSa+v/huuzx4aTqy+55BzNMNQYQOmw=;
        b=dQLEPjMjkbV/gT+v90b9bqYExX9l5kDJ9Z+p9o7CdC/dagiTdNi765aFDgeQB6kkoe
         0aqLxX71/zvMbuAkR+B2EpTu1eK5IgjE1mV08IHiJC7nploZvO1gdzo0mYtUiI5N5j6S
         q+9s7G5kdzgBIyU9AHQjoy7ISrgY1VsZLnHEks5oWLb4ixLQMtjK+pSt+0gqzQ2HzneA
         sNZKdokpQ/t/HqnGtF355GqmMFGaTa9vhIkPnfcjBZvN75FV4ayheav0TctauDEaqEIn
         WUILp2ofh6b+bzujweWljkyBPS+2uxo2comGVQo0CmXScU+UEFbc0vA1GwDgouj4FveG
         70OQ==
X-Gm-Message-State: AOAM533oxcmGp0HEz4jjueOaM3/LCtbrvqxK72HU8aqIKFHfWUaIc65t
        DU67HIQgVtnwiqsuBD4vEw==
X-Google-Smtp-Source: ABdhPJwxbZu8AQOzk0/3hMyaBD5iHVfWxjEtg8coy9Y5Y7UZGJOiPS0TYB4uByeZgog5mUBaiuue9A==
X-Received: by 2002:a05:6830:4121:: with SMTP id w33mr11854225ott.153.1617111556881;
        Tue, 30 Mar 2021 06:39:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 62sm3360563oto.60.2021.03.30.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 06:39:15 -0700 (PDT)
Received: (nullmailer pid 213349 invoked by uid 1000);
        Tue, 30 Mar 2021 13:39:13 -0000
Date:   Tue, 30 Mar 2021 08:39:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     zhiyong tao <zhiyong.tao@mediatek.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        biao.huang@mediatek.com, linus.walleij@linaro.org,
        hongzhou.yang@mediatek.com, srv_heupstream@mediatek.com,
        jg_poxu@mediatek.com, devicetree@vger.kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com,
        sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
        erin.lo@mediatek.com, hui.liu@mediatek.com, sean.wang@kernel.org,
        sj.huang@mediatek.com, eddie.huang@mediatek.com,
        linux-mediatek@lists.infradead.org, seiya.wang@mediatek.com
Subject: Re: [PATCH Resend v0 2/6] dt-bindings: pinctrl: mt8195: add binding
 document
Message-ID: <20210330133913.GA212608@robh.at.kernel.org>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
 <20210329113103.11003-3-zhiyong.tao@mediatek.com>
 <1617045684.216718.2905695.nullmailer@robh.at.kernel.org>
 <1617095128.10316.14.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617095128.10316.14.camel@mhfsdcap03>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 05:05:28PM +0800, zhiyong tao wrote:
> On Mon, 2021-03-29 at 14:21 -0500, Rob Herring wrote:
> > On Mon, 29 Mar 2021 19:30:59 +0800, Zhiyong Tao wrote:
> > > The commit adds mt8195 compatible node in binding document.
> > > 
> > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > ---
> > >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
> > >  1 file changed, 152 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dts:19:18: fatal error: dt-bindings/pinctrl/mt8195-pinfunc.h: No such file or directory
> >    19 |         #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1380: dt_binding_check] Error 2
> > 
> > See https://patchwork.ozlabs.org/patch/1459558
> > 
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit.
> > 
> 
> ==> I set the patch file "mt8195-pinfunc.h" patch in "4/6". so we should
> add the file "mt8195-pinfunc.h" in this patch ? or we should put it
> before this patch(2/6)?

It is part of the binding, so it belongs in this patch.

Rob
