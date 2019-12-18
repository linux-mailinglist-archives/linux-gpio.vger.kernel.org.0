Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D71211253B6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 21:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbfLRUl0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 15:41:26 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37100 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfLRUl0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 15:41:26 -0500
Received: by mail-ot1-f67.google.com with SMTP id k14so4049763otn.4;
        Wed, 18 Dec 2019 12:41:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vjAWgj8LPRVBBw4YOgmZJNGJyNN6iEbkQXZFrIxWMd0=;
        b=f/o6m4kkdrseDeko1cTkyQ3A0Er94juvAd+hgIjUj5gyOia3cWFoK8oaRVIkbCdSON
         um3AcstN7D9XBtPrGe7s9hnrn/G7EEWRDjRXNmLt7geaIHU375vdUTuqA6dI5dJnA9+6
         oRJWZpLq7j90hA3/qZa8yb7Z7HHJa7/3fR+2JtFOP5r2i0rRPjjCmdsN1ivDQen0wwP8
         rNfJGF2IKNwCzl6lws75QEzbN2lLHxhJ1+ccPutXRO9NJ/kFQeFWYuEBMZ0EAFHWDogv
         UyjhJ06xj5PNdlg8DpQei8jL20rVi69KvUiP0ZeBvNulKdnRPW7/50dPeyAgSPbkT8tt
         JJOw==
X-Gm-Message-State: APjAAAWn/TkzYR2R6OM1GD9DshP3OPjPBsSj3mo07UAVI+yd1ZQq6y/u
        /gucl76KxikixfWg1uFT2uSiXhE=
X-Google-Smtp-Source: APXvYqzQqGo/mhAS3tDmnfbWxDRBX1it8whjpDyON36SIKPZWsEZwe6SklGflwoLOyGplD0lHy7Kkw==
X-Received: by 2002:a9d:7a88:: with SMTP id l8mr4842838otn.187.1576701685257;
        Wed, 18 Dec 2019 12:41:25 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s9sm1180127oic.15.2019.12.18.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 12:41:24 -0800 (PST)
Date:   Wed, 18 Dec 2019 14:41:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
Message-ID: <20191218204123.GA18202@bogus>
References: <20191217121642.28534-1-srinivas.kandagatla@linaro.org>
 <20191217121642.28534-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217121642.28534-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 17 Dec 2019 12:16:32 +0000, Srinivas Kandagatla wrote:
> This patch adds bindings for wcd9340/wcd9341 audio codec which can
> support both SLIMbus and I2S/I2C interface.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd934x.yaml          | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
