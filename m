Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5C383483A4
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 22:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238374AbhCXV3W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 17:29:22 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:40170 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238363AbhCXV3D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 17:29:03 -0400
Received: from [IPv6:2a02:a03f:eaff:9f01:9a93:b6b:1adc:3da7] (unknown [IPv6:2a02:a03f:eaff:9f01:9a93:b6b:1adc:3da7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 988921E4FFE;
        Wed, 24 Mar 2021 22:29:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1616621341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i0CkADBR2Q9UuAMclTubEJ8yRW6YBxtaVYOXu6Qq6/Q=;
        b=B+crK12X9E98G7lDyEtPGdjcaJdkDEkSHjzjiPhlTF03C3j3VkUbttW/cqT7yHqKWEjVC0
        ntjVndY/iSkADgw5p0/At5trvU30t8WKEhku2V+bv1IWNHxsbgOswSaTGNT3YXXHZG2R6n
        4EgeVXKY3b9bMR8BCKt32rte9DL/DGfmtcKAzQeDudTFso55IBuKpmsTQdRrfG1LEawZcG
        W/dyMFZ0MANrTN6xGpTFwqu2ILzcenqZUHHnnGGL3pbjfx0E/2N4RXu/ohQJYbLXnVN3Or
        K0wZkh4PWvjDykdyM7tcbss/y5scmMSUuKVCgQro8gY9OoWZY+CJlyF7k4eOPQ==
Message-ID: <1e3423ddb454c6d6392ce824c794c60a42586ba8.camel@svanheule.net>
Subject: Re: [PATCH v3 2/2] gpio: Add Realtek Otto GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     bert@biot.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, maz@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de
Date:   Wed, 24 Mar 2021 22:29:00 +0100
In-Reply-To: <ffdd72259a5314549cf48a934085ae8efe7c0fc6.1616620884.git.sander@svanheule.net>
References: <cover.1616620884.git.sander@svanheule.net>
         <ffdd72259a5314549cf48a934085ae8efe7c0fc6.1616620884.git.sander@svanheule.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-03-24 at 22:22 +0100, Sander Vanheule wrote:
> +static inline u8 read_u8_reg(void __iomem* reg, unsigned int port)
> +{
> +       return ioread8(reg + port);
> +}
> +
> +static inline void write_u8_reg(void __iomem* reg, unsigned int port,
> u8 value)
> +{
> +       iowrite8(value, reg + port);
> +}
> +
> +static inline u16 read_u16_reg(void __iomem* reg, unsigned int port)
> +{
> +       return ioread16(reg + 2 * port);
> +}
> +
> +static inline void write_u16_reg(void __iomem* reg, unsigned int
> port, u16 value)
> +{
> +       iowrite16(value, reg + 2 * port);
> +}

Of course I only noticed this after sending v3, but these functions
should have "void __iomem *reg" instead. I can fix this in a next
version.

Best,
Sander

