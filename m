Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74ED47F2EC
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Dec 2021 11:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhLYKSW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Dec 2021 05:18:22 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52596
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229741AbhLYKSV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Dec 2021 05:18:21 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 811E53F163
        for <linux-gpio@vger.kernel.org>; Sat, 25 Dec 2021 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640427500;
        bh=94o5d0o97vug3NAEYaKgCxWAnPubZXlQ072PvpKMaV4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=pO5j6QEpfIuLB+IxR+jeqh7xJdfZassGWHe+A+cXZF+bjFMKYpJf7njac99LdrcG/
         fyJrlN3R0xS8gFRVzSQz4FJu2oztQFtVFVld8yg3clLx1zxfN5Dg04pYVTdrKVdP/s
         Bn/g57yYp1lnBq5jFuBEBhgeR2qVkVpRX3XNYi0kq8d5Fj6pj0hcqmUVeCECPSc2zI
         FuVYD8IWZrOCY2RqhbP30xpUQc+bAYxGBcVLV8ILiX8zTQQpKDzvFhfDGejMy6A7QV
         xY06BreA9Tkx+jweeLuI7Nx5T/V9DzyvXhvjaCP3kQ/8WWXJD+r8WFIwGMl7d9k/07
         +948r+QU6cCGA==
Received: by mail-lj1-f197.google.com with SMTP id n6-20020a2e82c6000000b00221698ffa68so2894287ljh.17
        for <linux-gpio@vger.kernel.org>; Sat, 25 Dec 2021 02:18:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=94o5d0o97vug3NAEYaKgCxWAnPubZXlQ072PvpKMaV4=;
        b=Z8f6Am8L238s7G9MbT33suKdROiSOnWJUJqBGnoOQhfjXbQH14i4+OS/tPfgDM7/Cl
         gE6q3LWQVTiRwJifzXJnPfqOqyudufWgYoTk+yDrN5tOIaEpMOfpucFwFFb+XM+zLtKJ
         r7hhrXbf3uKDnd+pnL6SY5EPhUCOoYmC72Rmj+W9FZ/NJ5/t77VI0MOEuO8FiF+XFwMx
         8pITHjVUmxHlUAe6n2DK2DxkfCHC7EJ+n9Z89efByMAXi5+7E+7168McV1AN7keHVfVl
         pJDJI7ByLcvIjcm5qmeiKpWxEmyMLRAJEfsDGBkIuVSG/nylitjSQswunE8gueHPDKGk
         hKSA==
X-Gm-Message-State: AOAM5339d21ohqckRSR0+7tSUoh5tHhf+ja6LHaHHM6f4a8d4d4gbdx+
        gcDXs0pRA53SFhj25gHnMJDZLHN7tHJQVO6YF1BuojMbmU7Lifo7EOucBkMSNaHthGhyNjzNqCR
        hMPqyCy4cRmdi3m8SEQLPmx2p2PENZqoyGc909F8=
X-Received: by 2002:a05:6512:3988:: with SMTP id j8mr6874758lfu.351.1640427499980;
        Sat, 25 Dec 2021 02:18:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXz+wZ4nuQVsKj6gt9lsiW4qR17i5ihkM9J/CWQwKtfUvupodcrU3sp5EnfGF88NTo+IXSRA==
X-Received: by 2002:a05:6512:3988:: with SMTP id j8mr6874747lfu.351.1640427499838;
        Sat, 25 Dec 2021 02:18:19 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v77sm1072255lfa.68.2021.12.25.02.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Dec 2021 02:18:19 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-gpio@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 1/2] pinctrl: samsung: Use platform_get_irq_optional() to get the interrupt
Date:   Sat, 25 Dec 2021 11:18:17 +0100
Message-Id: <164042749388.4557.7914263989187822148.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211224145748.18754-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211224145748.18754-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211224145748.18754-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 24 Dec 2021 14:57:47 +0000, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq_optional().
> 
> [...]

Applied, thanks!

[1/2] pinctrl: samsung: Use platform_get_irq_optional() to get the interrupt
      commit: a382d568f144b9e533ad210117c6c50d8dbdcaf1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
