Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAEB8314D3D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 11:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhBIKgR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 05:36:17 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:60565 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbhBIKdu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 05:33:50 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 312FF22FAD;
        Tue,  9 Feb 2021 11:33:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1612866786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jv1bhrDsB1NiAoYta58omHwHYYl/ioOR0GVcWdl1cmA=;
        b=SsgoM0r4lJEDhzBId4UMoIsnCyL40H2bBQelyA5JtfIymcesC+Iq2rwz5GVLfxYkyCWK9j
        gBP3TPjdHuwBQmR+BsxwEC5Ahgx1KzXPH8YSWdkrLdJMeUT8iQ2nAwMw5BimDVRP4uDl5x
        N7ehmRiCHkphQl3UCP7q/s2kbRqg9lA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Feb 2021 11:33:05 +0100
From:   Michael Walle <michael@walle.cc>
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        git@xilinx.com, saikrishna12468@gmail.com
Subject: Re: [PATCH v2 0/3] Added ZynqMP pinctrl driver
In-Reply-To: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <a20b19edd605154eb1a620a3e78a9737@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 2021-01-19 06:27, schrieb Sai Krishna Potthuri:
> Sai Krishna Potthuri (3):
>   firmware: xilinx: Added pinctrl support
>   dt-bindings: pinctrl: Added binding for ZynqMP pinctrl driver
>   pinctrl: Added Xilinx ZynqMP pinctrl driver support

There is mixed present and past tense in the subject and in the
description. Please just use present tense.

-michael
