Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F2F17042D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2020 17:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgBZQVa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Feb 2020 11:21:30 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37380 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgBZQV3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Feb 2020 11:21:29 -0500
Received: by mail-oi1-f194.google.com with SMTP id q84so65582oic.4;
        Wed, 26 Feb 2020 08:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R8CgB5ofq/CEo+Bbd71eYLol0DUjIXGKdAp6HQA/9d8=;
        b=WXUtLvmQ3u/1TZxpMpTPUKrE/KEAeqbJczz5ZuaPKROK2TppNbJdB5WBS6dvKU3svD
         f281IGiL8cWwhLtAiLtKn+BAGb7dKZzXuAgkAUhAfkZxBMj/y/pRtnTlTpsEbvIOJ7r7
         I5d7LfzHL78FRqa9AbYMpbxFPIL4Y9HA+B/a1G50j2GcWwJkVX8xAWF9IKBg9XbALjZT
         go52ZrackJPT1akPP7Y63RvqL8Lsc5k0wvUenX9y1Dkix3N6xlgzNa8H7YOimif9DBFQ
         cPFKvdQYsVoDBYFN21W7kq4MbwJk+1ArEdBiZhHR+fSEx2K8/UKoY3PWtVmBwYu+uF4v
         fIGQ==
X-Gm-Message-State: APjAAAXB/apQltBC1HX0D8Dh4inbdcRinHjx+yQeBYsrlUWR78Ll41nG
        LuvG/IizKgbxCBwr2D+9pw==
X-Google-Smtp-Source: APXvYqx4y3t8f8l9YMHa0dnaCosRY7xiR2vi0DCieSBpahLqPG+tzB/Y2iH6dVgGLzxAw9q3lrEIRA==
X-Received: by 2002:aca:ab53:: with SMTP id u80mr3693789oie.94.1582734089012;
        Wed, 26 Feb 2020 08:21:29 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t20sm939037oij.19.2020.02.26.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 08:21:26 -0800 (PST)
Received: (nullmailer pid 13405 invoked by uid 1000);
        Wed, 26 Feb 2020 16:21:25 -0000
Date:   Wed, 26 Feb 2020 10:21:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.co,
        alexandre.torgue@st.com, linus.walleij@linaro.org,
        amelie.delaunay@st.com, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to
 json-schema
Message-ID: <20200226162125.GA13349@bogus>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220162246.8334-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 20 Feb 2020 17:22:46 +0100, Benjamin Gaignard wrote:
> Convert stmfx bindings to json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
>  Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
>  .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
>  3 files changed, 124 insertions(+), 144 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stmfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
