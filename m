Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D6F45FE94
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 13:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354551AbhK0MiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Nov 2021 07:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233937AbhK0MgO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Nov 2021 07:36:14 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBFBC06173E;
        Sat, 27 Nov 2021 04:32:59 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso12645106wml.1;
        Sat, 27 Nov 2021 04:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition:user-agent;
        bh=cym/rhXni262lJDrdSli5f3C7oHJR0/fnsXBXxHnTTs=;
        b=o4HYizWSiV5rx6hMfafIab4dtg7tx7IR2lBwTGzH6v4RX2UX34iHJilrK6tWdxa4gJ
         wi+M/IoWxknuaxjHJeAK2vKHZRDHF4qc5Oq/oq9nosuHNq/IeRqw2rNwFMKGdZXB9OEn
         JZjFYITb4v3oV6alKCLyA2AsgldH3eQr2L4Fu8aU3LGOF5TfLPaWFEtLZihvPK5jXBLn
         XsRHnHA6pXDhyyMdSKcDDX5DdUb4wWWXrX4b8rqnBczAe1pvpMpc77wnjE4YTYrk//Lu
         kMl4HMRLOtYavFXIYgj19xR8d2cyo2svwZQnK5pIeXMpGr7KK3oFpr/iSn5qvLwWWDlX
         3DvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mime-version:content-disposition:user-agent;
        bh=cym/rhXni262lJDrdSli5f3C7oHJR0/fnsXBXxHnTTs=;
        b=EcZHHBEpoB3Wy2kRpRmAF9kA8XTANvCwvRP4ngefxdXTes8GFyh0JUJ1B2XozOJxZP
         KW+LWx+qN9UZoXWU5YvsmxPxN1ycqrKB/xeLJSQ9r+qRlnh7UmtYNPhx5pW+YZKPrzny
         zWy8E2yY54LH39cHzJCp72faE7VqC0lw4sZtBSf8RxoVy4O5CqDGy/wVv8uJKYYT/pOf
         X6yCga1V48uNQ64aOSm0XyilsHzeTe/D+6II0jqdRHFKLnxZs9hjMDpIs12qH96kpcGd
         hFywkftutFhWbUGOckyfGUgzDC2rgMfgCsp5ib7vl6gNrMQIiI2ugr1FrPFok6Rdu7Zv
         C4Xg==
X-Gm-Message-State: AOAM532oQFuXWt2kePNzO8POEU00SGYpte4dxVdG8MiGficMcbHbQlHi
        YfbewoYXYgU7Pvi1nAAnXZA=
X-Google-Smtp-Source: ABdhPJxhBcmHNU7kdzFqDTv20cEQft9Tb2E5xjOWlDYu5QO1xdu74z8xHEP3mxuEfNQlYTeF8/ziXQ==
X-Received: by 2002:a05:600c:3510:: with SMTP id h16mr22236706wmq.144.1638016378333;
        Sat, 27 Nov 2021 04:32:58 -0800 (PST)
Received: from debian.domena ([176.106.33.180])
        by smtp.gmail.com with ESMTPSA id f7sm16986463wmg.6.2021.11.27.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 04:32:58 -0800 (PST)
Date:   Sat, 27 Nov 2021 13:32:56 +0100
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     linus.walleij@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        ivo.ivanov.ivanov1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dominikkobinski314@gmail.com
Subject: Re: [PATCH v2,1/5] pinctrl: qcom: spmi-gpio: Add pm8226 compatibility
Message-ID: <20211127123254.GA4014@debian.domena>
Reply-To: CACRpkda9PkXZugE2vFnw+BhSrN-wJvX0Yu1Nffyd9qqg46ijoA@mail.gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

True. Sorry for the confusion and thank you for applying the patch.

Regards,
Dominik Kobinski

