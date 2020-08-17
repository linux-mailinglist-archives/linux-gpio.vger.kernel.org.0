Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E612A247825
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 22:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgHQUde (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 16:33:34 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35006 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgHQUdY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 16:33:24 -0400
Received: by mail-io1-f68.google.com with SMTP id s189so19023840iod.2;
        Mon, 17 Aug 2020 13:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kmY7P7AUW2UZPNTSfauoGP81G+wXfi0VijYTYoQ0pXA=;
        b=LRjq1WRZbPAuhf7d4zixD4DMMfBeE4Y37ACuKnGZRzn3+HZTZi6t/hU0ktVydqAEZi
         JL5TtukEJvaPL2msd78NkDAa+VUTDaTQ0J+lwEAoXwh8lZJNR0LDK4zfcLQMQMt89OTV
         JsmPkFbMY9fOamuSjwKSXiijDoxUYWbs4JegBEjed8okX25LBYp2ranTOCmEXrw6dGiG
         rDlz3bwFbujGsJeBYJtVYtQYEbKq2yQd6HSvIudUL7g4L0u6huv27stEe1z5wUNRL4Tr
         REcKjuJoTI51GJZVWG4RsAWr7DR53C/kSkpGY4Q40PJAxZcEclI6mHmN+H2/aWlTFDdm
         aH1Q==
X-Gm-Message-State: AOAM532Vd4ZLwsynyga6oQkCfM0llua/DqtdXfjypx4mrwys6XArH+CQ
        1AUkFHHzJj9CK3Sh3fO22Q==
X-Google-Smtp-Source: ABdhPJzd8mznA89zd4c/ZkeS3e1AYGSPGZRkXccxzr0iv/8k7ed9oh7ozqGpZxIrFSl4oQWkgNCj9Q==
X-Received: by 2002:a05:6638:2653:: with SMTP id n19mr16269855jat.34.1597696403217;
        Mon, 17 Aug 2020 13:33:23 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id i9sm10446205ile.48.2020.08.17.13.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 13:33:22 -0700 (PDT)
Received: (nullmailer pid 1508122 invoked by uid 1000);
        Mon, 17 Aug 2020 20:33:21 -0000
Date:   Mon, 17 Aug 2020 14:33:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     TY Chang <tychang@realtek.com>
Cc:     linux-gpio@vger.kernel.org, linux-realtek-soc@lists.infradead.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, afaerber@suse.de,
        linus.walleij@linaro.org
Subject: Re: [PATCH v3 4/9] dt-bindings: pinctrl: realtek: Add Realtek DHC
 SoC rtd1195
Message-ID: <20200817203321.GA1507754@bogus>
References: <20200813074908.889-1-tychang@realtek.com>
 <20200813074908.889-5-tychang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813074908.889-5-tychang@realtek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 13 Aug 2020 15:49:03 +0800, TY Chang wrote:
> Add device tree binding Documentation for rtd1195
> pinctrl driver.
> 
> Signed-off-by: TY Chang <tychang@realtek.com>
> ---
>  .../pinctrl/realtek,rtd1195-pinctrl.yaml      | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1195-pinctrl.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

