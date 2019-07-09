Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEC063E13
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 00:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfGIW5q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 18:57:46 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35552 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbfGIW5q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 18:57:46 -0400
Received: by mail-io1-f68.google.com with SMTP id m24so604570ioo.2;
        Tue, 09 Jul 2019 15:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0HhbqTghHejLe1IY3m94WTWIBE7MbWIJpDPEeXowAHc=;
        b=tizoNsD60YhGXtNHmNU3uOq7hMCWRdwyPXSVNnUxr1LYHlLOzPCDhF2kdJteNdhayc
         Rhbn1U3wZiAVotRcDu+5h/rVMHiCtJmM7b/+Veitwmv1PF3uJj+Hwni5+fJ2j/3X7fEO
         boUP3uYgSSVSLArKAUQoiSCKAWYMwn3wlnIP7DbxntIZ1Jx1m5ETBosfzIpUbpCDrDxs
         f7yCBPNhyoOXmQBNfzGKidqNFkISSJMMFzSQZDZeT2iPVQdDlinvsVdQ9hCjr8kd52l3
         YIDWL4iMkjKzv+jYjkdkckURi+MfZMgI0lnKUfoOIpU4A9/6VaGKuxAOs0aqZhe8S/2u
         uYpA==
X-Gm-Message-State: APjAAAVuxEA1qlvxvzievjJ+8uFkYeFCi9fTFkqwo12umSsaZyL46qE7
        Ughl8mCQMvpdmTyoss9D5EfcFRTIWw==
X-Google-Smtp-Source: APXvYqyapzttXsRNBkAiCzkE5cycXATjK8Ppd4rWGXk1+uAUTMH/Jp0hgxaeXExotfHxwMiG3rpOrQ==
X-Received: by 2002:a5d:8451:: with SMTP id w17mr29707761ior.226.1562713065527;
        Tue, 09 Jul 2019 15:57:45 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b20sm120313ios.44.2019.07.09.15.57.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 15:57:44 -0700 (PDT)
Date:   Tue, 9 Jul 2019 16:57:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v3 7/9] dt-bindings: vendor-prefixes: add Sipeed
Message-ID: <20190709225744.GA25215@bogus>
References: <20190623043801.14040-1-icenowy@aosc.io>
 <20190623043801.14040-8-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190623043801.14040-8-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 23 Jun 2019 12:37:59 +0800, Icenowy Zheng wrote:
> Shenzhen Sipeed Technology Co., Ltd. is a company focused on development
> kits, which also contains rebranded Lichee Pi series.
> 
> Add its vendor prefix binding.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v3:
> - Rebased because of the addition of sinlinx and sinovoip.
> 
> Patch introduced in v2.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
