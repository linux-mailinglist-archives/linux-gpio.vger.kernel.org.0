Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7DE3E5594
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 23:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfJYVBc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 17:01:32 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39234 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfJYVBb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 17:01:31 -0400
Received: by mail-oi1-f196.google.com with SMTP id v138so2508161oif.6;
        Fri, 25 Oct 2019 14:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3GZj/07wyh3a92hj1bd5hj3RDEpvatv0XrhY5uaQn7g=;
        b=P+3qbgMqadNoY6L5YoU8TMyYbuCVQoTmlYY9ObJeO+xwFbOevLnbKg7ydMsKjBYZTl
         JNaawQN3WfzwJW7N9Vp8jkcQMV09uPokRkbnolQQZrLz0M2VLrrJRGa+1PVGXq2oVumd
         ysdkw3dqhe1XkdZwSN+7mTKgvweN0aR2Bph5v7nD9KcFkW+UDPWCYO/8Db1euEdI094e
         Ld922GYLo7/xGRZxWNhrx78Ga0MDxqV1a5OLfkMWoJcrjR1kRR/j+NT/o/FO4KJkhve+
         gGgpiDTLYp78Q/7261HqnPy92GbHit4UY6UWRpbTfLCP3iPnc524/iCUVI0Odogq44jp
         DgGw==
X-Gm-Message-State: APjAAAUk7esV+5AyHWt+gLAJE0bA7L31wpSZZbOf30YyYp31knnp08zJ
        JjiYB226yCKDmBIXeFPTFg==
X-Google-Smtp-Source: APXvYqyweattnE1/2tTLytH55gaAaW+EA9Y+8YXDzO7mVMdzeeqlnIriXwq3vJ1VvxxICllZfVpAUQ==
X-Received: by 2002:aca:e0d5:: with SMTP id x204mr4880654oig.112.1572037290729;
        Fri, 25 Oct 2019 14:01:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q9sm1077094otc.53.2019.10.25.14.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:01:29 -0700 (PDT)
Date:   Fri, 25 Oct 2019 16:01:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        lee.jones@linaro.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 10/11] ASoC: dt-bindings: Add compatible for DB845c
 and Lenovo Yoga
Message-ID: <20191025210128.GA7212@bogus>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-11-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018001849.27205-11-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 18 Oct 2019 01:18:48 +0100, Srinivas Kandagatla wrote:
> This patch adds compatible strings for DB845c and Lenovo Yoga C630
> soundcard. Based on this compatible strings common machine driver
> will be in better position to setup board specific configuration.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sdm845.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
