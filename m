Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB9929306B
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 23:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732889AbgJSVXZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 17:23:25 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44399 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbgJSVXZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 17:23:25 -0400
Received: by mail-ot1-f65.google.com with SMTP id e20so1148065otj.11;
        Mon, 19 Oct 2020 14:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0dU5/9mAkqLpmCuExt9yVKc4c7IiOnGr081wApHauuY=;
        b=VRdNfgPt6iMvE/zzruNtdjS1MBpTZQfqhTxOYzPXf2m43Rk08wYqFwGKH/bVQg+q/Z
         4JzzErqAc24IIuI1JmovqbZHz8cmwkd2BInCg3KLt3UdRin6ohpUMynDGoRZKlbU93ug
         jiB6q9ry4D9oMstL7QksTINxHLQD/9qd6M1OkmADva4hfbWPJIzYWeDL0I5EQafgjQVS
         fP521391IZEUCwzeMsbanqFRQmdVmuuTzZv/CkOVLBPRH7Pe0iNi8IT0IVFAYqvgExI5
         Y3y7L+MPpdUPXLBQ5oaj6A/PNNgffmHFCuPTt0OniVnID6QXatRsLFS2pfWsf6jA7YaI
         QGzA==
X-Gm-Message-State: AOAM530kpj9McigBlQyk8/gTpzvMCHFyImRG7WrzaFc57DpevOuvaWB2
        24MVPnmVAEg//31zVT8/78XS3xpzLg==
X-Google-Smtp-Source: ABdhPJxYl1vReA8dUaqNDNYPJWIfCXfUMV3QZUzoWpmgQYzc2efPZF05Pf7n+kTrhuiYQwjD7hCwQQ==
X-Received: by 2002:a05:6830:144c:: with SMTP id w12mr1379789otp.197.1603142603468;
        Mon, 19 Oct 2020 14:23:23 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u26sm277048oic.12.2020.10.19.14.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 14:23:22 -0700 (PDT)
Received: (nullmailer pid 3625482 invoked by uid 1000);
        Mon, 19 Oct 2020 21:23:21 -0000
Date:   Mon, 19 Oct 2020 16:23:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sc7280 pinctrl
 bindings
Message-ID: <20201019212321.GA3625429@bogus>
References: <1602831532-24818-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602831532-24818-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 16 Oct 2020 12:28:51 +0530, Rajendra Nayak wrote:
> Add device tree binding Documentation details for Qualcomm SC7280
> TLMM block.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml      | 170 +++++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
