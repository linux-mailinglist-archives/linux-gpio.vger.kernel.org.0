Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 994EC251669
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 12:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbgHYKOx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 06:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729648AbgHYKOv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 06:14:51 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54177C061574
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 03:14:50 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id v15so6491893pgh.6
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 03:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=7rwFpGB0jqzG4o75dmr4EB0rdrd4ZLlpij1Rdr6z7sQ=;
        b=M/PtUB4KjjTHuTdSYpItjttdYYbS28ynKSnqFUSozz3H8OCLStD3jgywui+4gm+wu6
         8tyfb0/nyW04muJVNiqXLIVBNZpSeQIo5xX5zQ3HzHXqO0Ms00OzVOAAq0lz57jI7VNS
         vjUxHHG2zreutCgU9mn1cn7AJFZ26YUixAxo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=7rwFpGB0jqzG4o75dmr4EB0rdrd4ZLlpij1Rdr6z7sQ=;
        b=IZIVScLBavJDQ2/whFBvssWGgR+aZBAcXBrZwmECOGlFeyTx51lebxalNjbuODgL1t
         cv7ceJNpGB4u+0zZWZ93IIo2s704/5FVgbkSK0OV/9fLw+VFE1gJPHqiwt0sTAS6S8dL
         St9Fn93wYUliRGZKWsQYHr6OSaVKyULdea20aVSHohsgrdeiicnCa7NL6BfjwfF+jfb2
         Si8kqvxYbKh01Y2DZVP/xuJlPRnAAOL0VqAo0uR7xt5og4OwWJ71bME8VQG+LCMAAffm
         /K59n27VShMMJP0L1t1DiRWvwk/aj9EzS2TAPSUBui9YPPAhwgmrZFBI9Zh5TTmxhBQl
         m/XA==
X-Gm-Message-State: AOAM533xwIoPz4hqAOEdouqFRR+vYw2MF21DBa+j0RujnT7hGHLInLvd
        5910Iwj3IAdxgwP8KfpmDE2eSg==
X-Google-Smtp-Source: ABdhPJz9AmR1krMoLgXTaINdzVk9Mmj7SkBUNtvH3DTsMz4galYrk+aWROWLBoUMdxiQdSEgiZiRGA==
X-Received: by 2002:a17:902:b087:: with SMTP id p7mr7119096plr.28.1598350489931;
        Tue, 25 Aug 2020 03:14:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 37sm2385284pjo.8.2020.08.25.03.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 03:14:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1598113021-4149-5-git-send-email-mkshah@codeaurora.org>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-5-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v5 4/6] pinctrl: qcom: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Tue, 25 Aug 2020 03:14:48 -0700
Message-ID: <159835048820.334488.6676713863169872150@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-08-22 09:16:59)
> Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag to enable/unmask the
> wakeirqs during suspend entry.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

maybe just squash this with the other patch in this area?
