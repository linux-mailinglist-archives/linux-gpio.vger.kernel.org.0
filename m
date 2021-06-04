Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FA239C328
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 00:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhFDWFQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 18:05:16 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:56681 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFDWFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 18:05:13 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 0F3992224D;
        Sat,  5 Jun 2021 00:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622844205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BHSx/Hq3C6vJsO0OExsFC/bFVv1247347T/UFRoJZLE=;
        b=H1gPUCG+ZhLH+5aNvZGwq5Vm3RINZWOM3vlgHOFECiqwuOMYrIwvtFXxa/gWujEzRmJu0q
        nzx98fpFDd7LXVQvPbM/qcvZaJRaqGvUOLq0QFj6izb3mqpTCFmBjeqykBXDAdXQcULfKR
        14vL4P4uS1hMcV0e9yGfnKuTpoF9ylY=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 05 Jun 2021 00:03:24 +0200
From:   Michael Walle <michael@walle.cc>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH] gpio: regmap: move drvdata to config data
In-Reply-To: <CACRpkdZEytf1WJa4JNJy6o3CBqOJAZLb-D=_rGQb+naH=TKmZA@mail.gmail.com>
References: <20210604110406.11006-1-michael@walle.cc>
 <CACRpkdZEytf1WJa4JNJy6o3CBqOJAZLb-D=_rGQb+naH=TKmZA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <62d131e0c2f16d647c36406ae8f9efba@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-06-05 00:00, schrieb Linus Walleij:

>> Btw, I'm not sure how to handle this "was part of another patch by 
>> another
>> author" thing. Should I leave the Sob and just add mine?
> 
> Ideally just stack Sign-offs it is called the "delivery path".

Even if it is just a subset of the original patch?

-michael
