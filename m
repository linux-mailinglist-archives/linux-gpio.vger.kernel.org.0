Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8151B3040A4
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 15:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391308AbhAZOld (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 09:41:33 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:45017 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731937AbhAZOkQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 09:40:16 -0500
Received: by mail-ot1-f53.google.com with SMTP id e70so16321945ote.11;
        Tue, 26 Jan 2021 06:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wo5OioLhRARFUuZ3uDklbIqehPU5MqYOZCCmUSeRzHI=;
        b=BcCRrlRyDATRVebL8o1/vaX0mAMRNpjspaR4Dwu/fvRpgtc0hn9TTph37h4AlRa/MK
         uRT0WwivX/lvem69owbSsn6+UtUKBhx6F8qzYI6U3jl8EoQ9nB89JuCjZKezw1IbuojP
         kjqMbAHcF+QZmwktkWKQVLhLVhCaCQTSVObR/9P/Kpgbdlr9yMS7Ps4xvG81L3XkWfb/
         1kleDVEjkMNhlVOn339FvsKTwHYPrWBqFwTdbFxBp2CYkYXhQMp8TbnEHRZnrYnPwTXr
         WWyh8mg6JNs6+FDYZQECPRN55xWayCFQGhDTcoc0VwBR+DvHvG7paiidvdMvpNtsWAD/
         /PTw==
X-Gm-Message-State: AOAM533gK+canjjboWrJfKuzxk2pcTlCvZAnc1snIEdLIj53PU+9Px+L
        M6kR7f3s3vJ9l7WGw3H+dw==
X-Google-Smtp-Source: ABdhPJybCZz3f/NsOR3Cto6GEj1zUyuNuIScCXiYtXOlPja9QQhHz5JSg58waL37WxiU1/gy5YjoGw==
X-Received: by 2002:a05:6830:1db8:: with SMTP id z24mr4211947oti.50.1611671975663;
        Tue, 26 Jan 2021 06:39:35 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r1sm3890619ooq.16.2021.01.26.06.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:39:34 -0800 (PST)
Received: (nullmailer pid 2943719 invoked by uid 1000);
        Tue, 26 Jan 2021 14:39:33 -0000
Date:   Tue, 26 Jan 2021 08:39:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     marijn.suijten@somainline.org, martin.botka@somainline.org,
        robh+dt@kernel.org, konrad.dybcio@somainline.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: pinctrl: Add bindings for Awinic
 AW9523/AW9523B
Message-ID: <20210126143933.GA2943577@robh.at.kernel.org>
References: <20210125182219.213214-1-angelogioacchino.delregno@somainline.org>
 <20210125182219.213214-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125182219.213214-2-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 25 Jan 2021 19:22:19 +0100, AngeloGioacchino Del Regno wrote:
> Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../pinctrl/awinic,aw9523-pinctrl.yaml        | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
