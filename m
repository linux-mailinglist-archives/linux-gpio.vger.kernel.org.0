Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7C227FB25
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 10:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731584AbgJAIN0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 04:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730785AbgJAINZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 04:13:25 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CC7C0613E2
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 01:13:24 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id kk9so1476090pjb.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yWHXn++kRcQbG/MLWQSRUgDAxUjFBToMj9A1ZOoKk8w=;
        b=KyTas28cFWO3JLCzr/Cl68PZnOKbquWDs/ISwZmjeNElBi0qIqAxuWIavAhRLhXvOx
         VSoJIkeeyXn+mBZy6dSkBk/jknKuXRAB2E5Z1LX5meG+qGSjWsCfLLJO3tDUMATrTwkE
         sG/0eJOxRtdcTIWAb6kkq7Iofp50BWjVM72PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yWHXn++kRcQbG/MLWQSRUgDAxUjFBToMj9A1ZOoKk8w=;
        b=qP/1NHfeCkXBK1aHMDENAttMBqJuHMzQA7+0XUTIdcDYG/c2WEd0gSYN+OuwT5wV2L
         7PG3tDTaNnQfzLK4ZeiVOKNtKAEG4dRBdWbzAVOY4jSdFFXgOrZkaZHaBYoPknZjuerC
         hy300fvEWkIwBmhphg0ryjlhuZHXZ4432WpVYKGoN8C5RlyNnI5w6OlG+SL4nDVZEJuX
         ToWstgt1vNpeILXL4LykEn+KDPbGM3k8429j+X3/kHqajPiCX0QgkFfh9wRbLW0kv+sy
         lvfmSZqVPm5XINPQQN7VckAOU5r7mfzWDnqPrX9CBFuT5FZ41ECcNE7oDZ3VSzUbUF+R
         QCjA==
X-Gm-Message-State: AOAM532u8Du39q+Vy7acpl7V72SxDR/rDwi63XKJuqCcTFrZKSCj0QFd
        ACaqXY7TavWA6nm3Kwn2RX5hpg==
X-Google-Smtp-Source: ABdhPJwsxlPhxSu0rIBUZbzwNksYMd+sMigsbyAPGmeVkX1Vxi2ToHev2rt0ZPnuKfWBwejxEcLjuQ==
X-Received: by 2002:a17:90a:b302:: with SMTP id d2mr5841672pjr.150.1601540003379;
        Thu, 01 Oct 2020 01:13:23 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id q190sm5763338pfc.176.2020.10.01.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 01:13:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
References: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v6 0/6] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Thu, 01 Oct 2020 01:13:21 -0700
Message-ID: <160154000142.310579.14473886526667450677@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-09-27 21:31:58)
> Changes in v6:
> - Update commit message more descriptive in v5 patch 1
> - Symmetrically enable/disable wakeirqs during suspend/resume in v5 patch=
 3
> - Include Acked-by and Reviewed-by tags from v5 series
>=20

Thanks. I tested this series and it is working for me.

Tested-by: Stephen Boyd <swboyd@chromium.org>
