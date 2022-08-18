Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0560E598A37
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Aug 2022 19:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344949AbiHRRRC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Aug 2022 13:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344929AbiHRRQb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2022 13:16:31 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB7410A3;
        Thu, 18 Aug 2022 10:10:56 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5C441380;
        Thu, 18 Aug 2022 17:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5C441380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1660842656; bh=Q1ZVAe6F+SnZFsnconTKqkmi6I114B8fYAcl8zDe+as=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=q04am70KrC4gEkl3TrVnG/KvuZQ27ZpoHqPoO8zIkuVOEp7eRr4hoKDl4KyAd+nBZ
         uoYDmoRY/IsbduKbEvWcAuQme0IOC0aDoyVRgpIXpNY6lc2nm/v52z/w41ZjnLa5c0
         Z/2MeHiubeWFTGDaO5nYGFhcT2jiwWYkAu2jYCn+VppAUz/DBKWGXGTQQBbwPb6Ra5
         yZkFu691RXPewWNfpx9DINC2DpjPxk2uVNdbAZtuAiCjdYvlH5XfCv1U9sP2nTVLvE
         orb+WNx2M/Ke2NIgAmyONKjXhYuet/ZmcWajsLpuFPIezAJStDljAtKwQCvyCGuIKz
         W4H8roMNmeIUg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, linus.walleij@linaro.org,
        brgl@bgdev.pl, tekkamanninja@gmail.com
Cc:     alexs@kernel.org, wu.xiangcheng@linux.dev,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v3] docs/zh_CN: Update the translation of gpio to 6.0-rc1
In-Reply-To: <20220817020830.799468-1-siyanteng@loongson.cn>
References: <20220817020830.799468-1-siyanteng@loongson.cn>
Date:   Thu, 18 Aug 2022 11:10:55 -0600
Message-ID: <87a681cw9s.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> Update to commit 5513b411ea5b ("Documentation: rename pinctl to
> pin-control")
> Move .../zh_CN/gpio.txt to .../zh_CN/driver-api/gpio/legacy.rst
> Translate .../driver-api/index.rst into Chinese.
> Translate .../driver-api/gpio/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>

Applied, thanks.

jon
