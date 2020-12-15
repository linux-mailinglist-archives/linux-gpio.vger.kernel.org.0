Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C4B2DB220
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 18:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730358AbgLORD0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 12:03:26 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33569 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730346AbgLORDS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 12:03:18 -0500
Received: by mail-ot1-f65.google.com with SMTP id b24so2554296otj.0;
        Tue, 15 Dec 2020 09:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bt+H5jotseL1AMdWInj5OVTGOVxIaxj288Kg6674s+0=;
        b=JAOCZLi/GBvfeG2Tl96rE9LEDT6UiiQFQITN8BpH3U4FbFvwqmUjRCYA17NxvfOjDM
         E0M4+Lx1ElHRZfHFTrdSIuv3gDW7rkW0rRYDRUK5LyfBrbwBc3YUa54qOODrCiEeZQH1
         xlRHEi4AwybQH15LJ8mYmwfJOcKCdzAAqAd33jbCzn1BE/UwKbladEEOI5kRUzCqwOaA
         I9rC7wx1wL4TOgD17ZToxn7lxAuUF+NMaib1iKCxOIiMPKusSNzQrwvn+GnnWNWaRaPF
         xi0PIiB90oYtgQJPSbs0OD74xQWee5gaPoGMFvyyNIjijeB63MCtWtw31cF495tthTIQ
         NGkg==
X-Gm-Message-State: AOAM531QckImphE3ZA77kTuiNfotvvyHh/p7sgsqqzLQXCRZ7/aKYRtt
        ftKe6OiGk8oGFXqmfjRbzw==
X-Google-Smtp-Source: ABdhPJyxCd7bd9Gq18Mbbvm1/TAg7/UUpYW0JRnqRHkfgcbPovkbKGBBqx/OLXC/5bbU0V+ADwhFtg==
X-Received: by 2002:a05:6830:1bc6:: with SMTP id v6mr23482893ota.33.1608051756044;
        Tue, 15 Dec 2020 09:02:36 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m47sm4712650ooi.12.2020.12.15.09.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 09:02:35 -0800 (PST)
Received: (nullmailer pid 4027620 invoked by uid 1000);
        Tue, 15 Dec 2020 17:02:34 -0000
Date:   Tue, 15 Dec 2020 11:02:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, devel@driverdev.osuosl.org,
        linux-gpio@vger.kernel.org, yanaijie@huawei.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: rt2880: properly redo bindings
Message-ID: <20201215170234.GA4027561@robh.at.kernel.org>
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
 <20201213161721.6514-2-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201213161721.6514-2-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 13 Dec 2020 17:17:14 +0100, Sergio Paracuellos wrote:
> When this bindings where applied there weren't already
> reviewed and some old hacks was being used to properly
> pass the schemas checks. This commits fix them up:
>  - Instead of using 'if-then' clause use '-pins$'.
>  - 'groups' and 'function' are included inside a new
>    '^(.*-)?pinmux$' node.
>  - compatible string is not an 'enum' but a 'const'.
>  - 'pinctrl-0' and 'pinctrl-names' removed since they are
>     used in consumer nodes.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../pinctrl/ralink,rt2880-pinmux.yaml         | 62 +++++++++----------
>  1 file changed, 28 insertions(+), 34 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
