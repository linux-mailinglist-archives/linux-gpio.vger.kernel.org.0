Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC41A32D3B1
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 13:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240606AbhCDMyK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 07:54:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240434AbhCDMxu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 07:53:50 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 117DFC06175F;
        Thu,  4 Mar 2021 04:53:10 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 14BE522234;
        Thu,  4 Mar 2021 13:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614862388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hzVNHoTq4Zh/BPxJFlD6HgbdvDSkHjG47AZ/A9uRXCo=;
        b=JzQZxKUbxPngrAV5UlIGF3hJ6BeQQX6jtdjLaIW8IpU6imrUUXNwLthVTr7gqmOz6LxL6e
        QWTnoR4F4ZppEnfvrNaKec5af1A1wK5nBiGMOjq6ouZy2rQAB05JNr/UMQHvbfZmXu90+V
        TV8YNX/FDGBWk1p87EcCt/SaU/t0Vv8=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 04 Mar 2021 13:53:07 +0100
From:   Michael Walle <michael@walle.cc>
To:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 04/15] Documentation: add BCM6328 pincontroller binding
 documentation
In-Reply-To: <20210304085710.7128-5-noltari@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-5-noltari@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <46c75d8e769980d46869025580f3484f@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-04 09:56, schrieb Álvaro Fernández Rojas:
> Add binding documentation for the pincontrol core found in BCM6328 
> SoCs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

btw. the subject should (preferably) be prefixed with "dt-bindings:".

See Documentation/devicetree/bindings/submitting-patches.rst

-michael
