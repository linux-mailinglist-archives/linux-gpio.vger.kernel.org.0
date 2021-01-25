Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D432303087
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 00:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732056AbhAYXvj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 18:51:39 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:42286 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732511AbhAYVGd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 16:06:33 -0500
Received: by mail-oi1-f178.google.com with SMTP id x71so16251014oia.9;
        Mon, 25 Jan 2021 13:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dIuC2Jcs9vblvD4eWxB2r9t3bytNk9Qzd5mJxage2t8=;
        b=JHMU9wNFESRvCHjmRBqDgCjUs1OJff7ypuOhSVtNpgqwQIq3nW8CKJLTLkXkT/cpHi
         kdLg5gI/2eTI/k9KSfqewdccj4hs2OiR+tiDX7dSPyucxG4jWPRfQrhXQ+ZzDztufYku
         u3sQGNgB5zWIXbS0B7KMJj6aU8XRFwrUT32W146oH5Wqi27qyanlAJYH/4WEFepyGmy8
         b9hfVjhOSx3gBAqGGA87+Zn8a3xnU8BTGOfO1/Qtz9DPrm5zUK2n+e7jn2FZ0AzGcgfr
         Weck4Df9pCmY0MyKWlnnuV9X2ibr2DCqR8YQ+sGd2bkDLailHVR+aeRh6lkkL7UfxWoa
         7TsA==
X-Gm-Message-State: AOAM5326u+RDE4xHqMdCtGmgpEmbZEeWE4aVjZmBXkNuB2P0aIBMseTz
        v4F1wBWW7xgYXwt99j8qTn3uAneV5Q==
X-Google-Smtp-Source: ABdhPJwZMZ2JTTA9VZOfsE5zTCvtgnMq9xQnFkrJ9cqSTdLs9pz2KVd2JF8topCkMnJm82QGFz8uRw==
X-Received: by 2002:aca:d457:: with SMTP id l84mr1230077oig.7.1611608664244;
        Mon, 25 Jan 2021 13:04:24 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d17sm3773583oic.12.2021.01.25.13.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 13:04:22 -0800 (PST)
Received: (nullmailer pid 987629 invoked by uid 1000);
        Mon, 25 Jan 2021 21:04:21 -0000
Date:   Mon, 25 Jan 2021 15:04:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, phone-devel@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@somainline.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: Add bindings for Awinic
 AW9523/AW9523B
Message-ID: <20210125210421.GA987503@robh.at.kernel.org>
References: <20210113184030.448616-1-angelogioacchino.delregno@somainline.org>
 <20210113184030.448616-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113184030.448616-2-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 13 Jan 2021 19:40:30 +0100, AngeloGioacchino Del Regno wrote:
> Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../pinctrl/awinic,aw9523-pinctrl.yaml        | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
