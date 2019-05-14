Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE8091D056
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2019 22:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbfENUOt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 May 2019 16:14:49 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38616 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbfENUOs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 May 2019 16:14:48 -0400
Received: by mail-ot1-f68.google.com with SMTP id s19so92132otq.5;
        Tue, 14 May 2019 13:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qDSk0SZEl2UvCN7TKGAHqgBAUsr16i+lq3jnqkJH6gc=;
        b=M3XLD9eiZqgwiys1v+6sPpcKBn5sYU8eI7tZv/Dm4DHaRvn8F5zaxeSd6HZpJWy+U2
         L8atTqL+weYlBtVc4ADp4n26dhkMvGTpWS7Xr5X6wb+Xkkf2Vuju7kqJC4KlqvkU7GcJ
         cIcFi0ZctgXCB5frxonCtRbog1DMcb+tTsIjVlMmiGzhNgCCox32KZJNhKksI69xq7vf
         gd4giUn/JCZC1w+z0EhUHFN08nwI/5UeucT5qZSx4Xspg5MladoBp590whwz12UK+ZT1
         ikZUq7HxAo12G1MpyI31IgzQV8CRZz10eQU/ypeJ4+xw8cYEUasyZJzvQMv15MWYd4mU
         McVA==
X-Gm-Message-State: APjAAAWMe67vJFZ+BcecV/eJ2i98LjEMqDJAhQiVulMSarjMvbUztYQF
        2luM4wWsWLjbDlPYqTo/tw==
X-Google-Smtp-Source: APXvYqy0DmBg5AVm6UGSATsuf2eDa6AOsOSDM7QYNZcyDwYTVR4/PoV6LpYTKAOotzxVzhxgYi5seA==
X-Received: by 2002:a9d:77c9:: with SMTP id w9mr13586344otl.253.1557864887960;
        Tue, 14 May 2019 13:14:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r205sm4984401oig.0.2019.05.14.13.14.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 13:14:47 -0700 (PDT)
Date:   Tue, 14 May 2019 15:14:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Convert stm32 pinctrl bindings
 to json-schema
Message-ID: <20190514201446.GA29557@bogus>
References: <1557503126-3025-1-git-send-email-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557503126-3025-1-git-send-email-alexandre.torgue@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 10 May 2019 17:45:26 +0200, Alexandre Torgue wrote:
> Convert the STM32 pinctrl binding to DT schema format using json-schema.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> ---
> 
> Hi,
> 
> First pacth to convert DT bindings file (here pinctrl STM32) to json-schema
> in order to take advantage of devicetree validation tool for STM32.
> 
> Changes since v1:
>  - Fix errors reported by Rob.
> 
> 
> regards
> Alex
> 

Reviewed-by: Rob Herring <robh@kernel.org>
