Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E811D6942
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 20:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732805AbfJNSPz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 14:15:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38077 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731955AbfJNSPz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 14:15:55 -0400
Received: by mail-ot1-f65.google.com with SMTP id e11so14592191otl.5;
        Mon, 14 Oct 2019 11:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TiZbwsrM4/f/r5LoaJ2jEpnL+9g4W53LGZPuPtXJ5LM=;
        b=Qb6WWSFS5xiw72NuHODsUzYvIlK6C3S0EHPdYaZZ4YzeziQOETw74vmIjKKj8XKhYN
         fpTZ3/RzVjHxyZGX/3skROiP7fTheLVNhegS29mdJzX0zC4UtXgWrzP74oGKq1sYdHcT
         xXTdWnojcSkTcEtiHwMAxlf+q9ILEXkk353h2veqYrtYDGZCEcle3PRb8Am962FolkfM
         MxZUCrErm+z4Ga9CzJBjchTKZWGwokLfHuibSyWyvZmQvfosPZ22nKAV2rvIqYSLTo1j
         g6edHEP9HTPI74iIkOE13DybYJpZffIxzlpTmvQ95diC7mwNgFTB0o8LvLsYRSyU2InK
         JojQ==
X-Gm-Message-State: APjAAAUpr0NxIGOosoGnJkobYwniB66OBBz1iWHsjyFo19Wf5F1ldie/
        7mIQYGqGWZUizN1NuHAxnQ==
X-Google-Smtp-Source: APXvYqwwLBpes6pzkDEJ5uGNYvvOO1uZW4E2cZtm+9i7VdKdIHpEhdpbx+gD453w2aQEhuO6bNHFQw==
X-Received: by 2002:a9d:5f0f:: with SMTP id f15mr23799786oti.251.1571076953138;
        Mon, 14 Oct 2019 11:15:53 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d95sm6216527otb.25.2019.10.14.11.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 11:15:52 -0700 (PDT)
Date:   Mon, 14 Oct 2019 13:15:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        heiko@sntech.de, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: rockchip: add rk3308 SoC
 support
Message-ID: <20191014181552.GA12199@bogus>
References: <20191012061528.27821-1-jay.xu@rock-chips.com>
 <20191014030348.18860-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014030348.18860-1-jay.xu@rock-chips.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 14 Oct 2019 11:03:48 +0800, Jianqun Xu wrote:
> Add rk3308 SoC support to rockchip pinctrl.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
> changes since v1:
> - Add Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
