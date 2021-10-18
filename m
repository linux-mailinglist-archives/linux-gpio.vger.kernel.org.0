Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF171432412
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 18:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbhJRQr4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 12:47:56 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:43970 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233507AbhJRQr4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 12:47:56 -0400
Received: by mail-ot1-f45.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so544995otb.10;
        Mon, 18 Oct 2021 09:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v7SIvYsyxTrrhTfqbIcpqFyMaDz24Upct6dezLpWgMA=;
        b=txw2q4nooN+JvDavut05jOsUnTp3+mSZ5lJ51zwie3JfNiSx4BBf7qo3I7UoSvcaBJ
         MvT2ALO0mu3JbEJGJCwzXU/nZTLDtAvWZXqM+bw3l4FR3lxElu7q+Z/S97rW1ZaLJz0L
         aW2gPJl6Ej7s5DFZB4xU3BzX2F+JdTRRvEeioyHZ5vIb4UjaqJDJuO834WfWNu5luiQO
         sFQDd4O8OrGmW54ms0KTAnH1rzyXsyptQ1mRjlS7KC1Oqu5Lf+1vYZzBCBvdTSdNv/9y
         JT0Hm/VPDnC7p5gKUi+0GfiK4SnI61SrMaUYDDdIYvs5D06P0hkonmj54sxNOEtM4hDX
         SPpQ==
X-Gm-Message-State: AOAM532fu0azn6+AsHTBY2WZ174T0958j3L4l06mS5NnyZ5O2FrHJmEF
        phgRMy0fthbE3o4e7A7ZWw==
X-Google-Smtp-Source: ABdhPJzTN6vcyj7UTW/IiMw7/IQYBgBx/ZG1GMXDcGPS9qtqf97y2RanabonT6M91w/bBg4vnfYovg==
X-Received: by 2002:a05:6830:4488:: with SMTP id r8mr777956otv.155.1634575544330;
        Mon, 18 Oct 2021 09:45:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v17sm3056429otk.56.2021.10.18.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 09:45:43 -0700 (PDT)
Received: (nullmailer pid 2535996 invoked by uid 1000);
        Mon, 18 Oct 2021 16:45:41 -0000
Date:   Mon, 18 Oct 2021 11:45:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Ryder Lee <Ryder.Lee@mediatek.com>,
        John Crispin <john@phrozen.org>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v8 1/4] dt-bindings: pinctrl: update bindings for MT7986
 SoC
Message-ID: <YW2ktTdHivBGbkwW@robh.at.kernel.org>
References: <20211018114739.14026-1-sam.shih@mediatek.com>
 <20211018114739.14026-2-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018114739.14026-2-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 18 Oct 2021 19:47:36 +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to
> pin-65 do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v8: fixed uart node in yaml dts example
> v7: updated pinctcl node binding description, and separate pinctrl
>      part into a single patch series
> 
> Original thread:
> https://lore.kernel.org/all/8348ed3e-c561-ad7e-fe9e-a31ed346d8d0@gmail.com/
> 
> v6: fixed yamllint warnings/errors v2
> v5: fixed yamllint warnings/errors v1
> v4: used yaml format instead of txt format document
> v3: make mt7986 pinctrl bindings as a separate file
> v2: deleted the redundant description of mt7986a/mt7986b
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 363 ++++++++++++++++++
>  1 file changed, 363 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
