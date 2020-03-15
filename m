Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3C2185C7A
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Mar 2020 13:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbgCOMye (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Mar 2020 08:54:34 -0400
Received: from mx.0dd.nl ([5.2.79.48]:52546 "EHLO mx.0dd.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728522AbgCOMye (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 15 Mar 2020 08:54:34 -0400
X-Greylist: delayed 335 seconds by postgrey-1.27 at vger.kernel.org; Sun, 15 Mar 2020 08:54:33 EDT
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mx.0dd.nl (Postfix) with ESMTPS id 32AD15FB19;
        Sun, 15 Mar 2020 13:48:57 +0100 (CET)
Authentication-Results: mx.0dd.nl;
        dkim=pass (2048-bit key; secure) header.d=vdorst.com header.i=@vdorst.com header.b="kOzIRY1m";
        dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.vdorst.com (Postfix) with ESMTPSA id CF07623728F;
        Sun, 15 Mar 2020 13:48:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com CF07623728F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
        s=default; t=1584276536;
        bh=Is7T8gsczbAflMtpH86ZF4mhjtkMOqN5/wzv7KlnGtc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=kOzIRY1mr32lMxMDQcEn9401DmXj1RngdTgPhdC+quRwdtSfJ4U9O8lOjpq7cE/2p
         3V43c43Hpew1vvNU0ooQIx5MDF7VELEPayVuSnXqjBLjRtpHy/9N+nlKPDUh9VVRgk
         eZPdhvkogRf2Hjz6awee9vdt7z6RJ/KGoezDN1ZijC2tHT8c8zRdxTRzc7d5R9K8YY
         EhhEMi9vHxETmH647fVSacigU5IL+PU6QCUbctesRtssqCY0IzWriFcibaVS+X2E28
         ghyEbNG5m1BKMQWjDRu7bG+199F5/HTim2CqP/t6UP3IwVwdhP/iEGEcM0YTxAOnyY
         or8/9Rj35zovA==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Sun, 15 Mar 2020 12:48:56 +0000
Date:   Sun, 15 Mar 2020 12:48:56 +0000
Message-ID: <20200315124856.Horde.FggCAOBKhyXcJ0kuGBpqX_l@www.vdorst.com>
From:   =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: mmio: introduce BGPIOF_NO_SET_ON_INPUT
In-Reply-To: <20200315121338.251362-1-gch981213@gmail.com>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Chuanhong Guo <gch981213@gmail.com>:

> Currently gpio-hog doesn't work on gpio-mt7621 driver. On further
> debugging, I noticed that set/clear register on this controller
> only works on output pins. We need to setup pin direction before
> writing values in bgpio_dir_out for a correct gpio-hog behavior.
> This patchset introduces a new flag BGPIOF_NO_SET_ON_INPUT for
> these kind of controller and set this flag for gpio-mt7621.
>
> Chuanhong Guo (2):
>   gpio: mmio: introduce BGPIOF_NO_SET_ON_INPUT
>   gpio: mt7621: add BGPIOF_NO_SET_ON_INPUT flag
>
>  drivers/gpio/gpio-mmio.c    | 23 +++++++++++++++++++----
>  drivers/gpio/gpio-mt7621.c  |  4 ++--
>  include/linux/gpio/driver.h |  1 +
>  3 files changed, 22 insertions(+), 6 deletions(-)
>
> --
> 2.24.1
Thanks Chuanhong for debugging the problem!

With this patch gpio-hog works again.

For the series:

Tested-by: René van Dorst <opensource@vdorst.com>

Greats,

René

