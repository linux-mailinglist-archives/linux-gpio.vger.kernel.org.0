Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68EAA125019
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 19:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfLRSHV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 13:07:21 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34599 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbfLRSHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 13:07:21 -0500
Received: by mail-oi1-f196.google.com with SMTP id l136so1565257oig.1;
        Wed, 18 Dec 2019 10:07:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4NsV+0i4sLKWS34I+3p5qC+dqlp/B6BNrXIBm9D5E/4=;
        b=VnhwQGJdzTnR0FEwQdVDEuAOshRrfkJEKEs/vO3qyU5Rt/iwaxK3KGXFokfjziGop+
         rKXF88R8EA2MCLefs77SapPTgLA5atIxLFg5N4c0Ahi+yJQ0dwuon+/1fisebt/bPSRI
         OVXPX2T2lpPsb6TvoCO0sR/8kxheb8okEb2ftf17QdMwMEh4IRk6hH6NGoIbuNcThP/Q
         9S4K0cfYU2cPUfyMpTRc5dASbrBtS4oeJv1nQ7Tt5EspkPbrLsaOm38VneLfqqKwIMTP
         h0lzlw+n1If8q+vv47jpg/k9apdvxJnxzr5aaYtxXPoA+ckwihugSG60JZDZXA+ivA3G
         3/wg==
X-Gm-Message-State: APjAAAXKY6PQGzpnlsWPgTlNO9eILlS5IzG0T3eUNBBIZUgI1DK9hhpn
        1PhqO033+T9NlyCSJTMkNg==
X-Google-Smtp-Source: APXvYqxoWVD8AHiJQbQ2N6vogRNydi3o+JC1XPpaw53Kjs5P5sBy4Aso3UY61GCTHHJ/dNNtST7ksw==
X-Received: by 2002:a05:6808:6cd:: with SMTP id m13mr1194390oih.95.1576692439993;
        Wed, 18 Dec 2019 10:07:19 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m2sm1021880oim.13.2019.12.18.10.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:07:19 -0800 (PST)
Date:   Wed, 18 Dec 2019 12:07:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6 02/15] dt-bindings: leds: ROHM BD71282 PMIC LED driver
Message-ID: <20191218180718.GA4978@bogus>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
 <697ae4380150cbd08a963de0942b8218868d924b.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <697ae4380150cbd08a963de0942b8218868d924b.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 11 Dec 2019 11:36:51 +0200, Matti Vaittinen wrote:
> Document ROHM BD71828 PMIC LED driver device tree bindings.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes since v5:
> - Change SPDX to dual lisence
> - added select: false
> - replace oneOf + const by enum
> 
>  .../bindings/leds/rohm,bd71828-leds.yaml      | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
