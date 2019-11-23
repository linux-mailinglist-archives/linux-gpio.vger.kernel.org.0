Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACF2107BD8
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2019 01:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfKWAEV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 19:04:21 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33078 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKWAEU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 19:04:20 -0500
Received: by mail-ot1-f68.google.com with SMTP id q23so1894703otn.0;
        Fri, 22 Nov 2019 16:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mh7ibfrhNKP+OX0OZlKsFx13aIqVgLPbq5iGSYIdzxA=;
        b=jhdIWcJbl60zCS03hk+gChnMlH5SUVmn9yYCBKFcrGQzPKjsCcaqrG56u1cMLMIGw0
         91lKFHZ88A+7UnsBMMxnoCUG9g8UcHv9RasXFHpcI/fPjU4x2C/I3WP6JkzIZhnZxGlz
         1WXVt6nqva4gS/1KXyZggWYjyAmNRNf+l2QQgvMh8XyyjkR7RfbU81HTDVmcDuu97u2r
         UORTVWqfSrELkR+TaL6pjh75wrhiuHEIJB84k1wj4airLzLSlNgtnfWIPwFnD8ee9aXb
         ZTzmUFXm/eJafswEOa4DwHKascXwrJSHGs/KAae+RTobY9VKJIeja0W7ig0pM2ayA87R
         HnNA==
X-Gm-Message-State: APjAAAVgdl2EAjyMnjNCo+VmnaeG/Ykk0dWj0eDzg2X4vnxnmuYzz/4R
        d1vkeiPV0ihA41zrUpGaBA==
X-Google-Smtp-Source: APXvYqwdcuZg6Ci0LUijlWn0ZMT85d8WWT5QI9fVNF6xt5nP6k61iZb1lUjrwcAuJgzF2ivfZniaaQ==
X-Received: by 2002:a05:6830:50:: with SMTP id d16mr12263248otp.132.1574467459915;
        Fri, 22 Nov 2019 16:04:19 -0800 (PST)
Received: from localhost ([2607:fb90:bd7:3743:c9ec:246b:67b7:9768])
        by smtp.gmail.com with ESMTPSA id x11sm2563645oie.25.2019.11.22.16.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 16:04:19 -0800 (PST)
Date:   Fri, 22 Nov 2019 18:04:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 01/12] dt-bindings: SLIMBus: add slim devices optional
 properties
Message-ID: <20191123000417.GA30207@bogus>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
 <20191121170509.10579-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121170509.10579-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Nov 2019 17:04:58 +0000, Srinivas Kandagatla wrote:
> This patch adds an optional SLIMBus Interface device phandle property
> that could be used by some of the SLIMBus devices.
> 
> Interface device is mostly used with devices that are dealing
> with streaming.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/slimbus/bus.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
