Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE13475084
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 02:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235260AbhLOBaX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Dec 2021 20:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233511AbhLOBaX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Dec 2021 20:30:23 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1E5C061574
        for <linux-gpio@vger.kernel.org>; Tue, 14 Dec 2021 17:30:22 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id k9so17608892wrd.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Dec 2021 17:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ssImNAp25VSfpjtWIa6nzdRJnou4SLqvIgmNzKI3Ps8=;
        b=qydlwCrFMmktBUYxvY5tXGUsd2Ig/GOL2jM1OdBRqZoyXmiVcpR5pagBVHD03wkAFm
         zUtiW7nUvWS5OyhX3HY9a19PdDYBmrJTaAZhXxjtAk12t7q1ohm3/VDZibA6rlrFz4Ec
         l/PnpyOmevBH4Z/DSXcJZrYb7ms5A0kqP9qV6C4tWTp+7+irH23kOMpi7y2+LqcQOY6P
         LE3GNep6Uc6kAOauIeJoszvyV37B2IzGk3crkH6WER57f/5CqtywGg3DSzOHdqHDdwPg
         WfQVyKmfaaE3bPv/4+6Y967fU1Tk52Oyy/25MVbOZtQOIbdUwtknv88l8C1b/8qMoe13
         9Rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:user-agent:mime-version
         :content-transfer-encoding;
        bh=ssImNAp25VSfpjtWIa6nzdRJnou4SLqvIgmNzKI3Ps8=;
        b=p5lm/JA990YPgmcCuWYdPBwHgCfvQYSFpZJm4pXhFRlhJKEwlTGQvzbceoJJ7zYqh3
         V04ew3Dc+jR+kceyw/vcGfATrtK4Lro3uRSqrXkPz2AQntwHdM5PMGGI5zCKeWIrEBQk
         HuRRXUcMNH+BvSwX6lHHGWn+iI2AXlkaeVmmxfSbQwNsZGw26DdNB9xP53gZuXU31AYI
         Ndky9Nd8Il7r5+rASa1j0quLUMFqw9/9q0sr5pbVcv2JZPWDKM/eGsTWwHlQI3BTlvI0
         Y1D3AwTLNrtX5Nd9DM5YqGYKIhygUwHlyM9glpHlDjjiG7q1J6+X+8i3Z3s0CkpglXZQ
         Rk2Q==
X-Gm-Message-State: AOAM532nFZrLPiSEGRRIG/00/ryEn2dcexlrSsX/HTjPUuofORP3L8ST
        F0Ob8xad8TBlGiXcXXgdGB0=
X-Google-Smtp-Source: ABdhPJypix1kagUzDsn4lpHSfEOLbPLySXi8Ej51HQIsQO0pv/fgBwdDpn3W3hTQqsB9xdvXPM9oMQ==
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr2159648wrn.423.1639531821452;
        Tue, 14 Dec 2021 17:30:21 -0800 (PST)
Received: from mars.fritz.box ([2a02:8070:bb0:8700:3e7c:3fff:fe20:2cae])
        by smtp.gmail.com with ESMTPSA id e7sm524323wrg.31.2021.12.14.17.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 17:30:20 -0800 (PST)
Message-ID: <4204e95bc2306796fb834e74a01d75a47d45ecbc.camel@googlemail.com>
Subject: Re: [PATCH] Revert "pinctrl: stm32: fix the reported number of GPIO
 lines per bank"
From:   Christoph Fritz <chf.fritz@googlemail.com>
Reply-To: chf.fritz@googlemail.com
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Date:   Wed, 15 Dec 2021 02:30:19 +0100
In-Reply-To: <46f07510-b6aa-4619-9c54-048464bfbaf3@foss.st.com>
References: <a5b8e3ea13de0b2976bb9622dd410dd110f3f66c.camel@googlemail.com>
         <46f07510-b6aa-4619-9c54-048464bfbaf3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2021-12-14 at 15:17 +0100, Fabien DESSENNE wrote:
> I have been able to reproduce the issue you reported.
> Instead of reverting the guilty patch, I am working to fix it.
> I am currently testing a candidate patch, and will share it in the 
> coming days.

FYI, the regression was also merged into most of the stable and
longterm stable releases: 5.15, 5.10, 5.4 and 4.19.
> 

