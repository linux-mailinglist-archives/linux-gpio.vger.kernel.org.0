Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B83E31072C3
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 14:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfKVNIM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 08:08:12 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:35661 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbfKVNIM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 08:08:12 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id C8C842304F;
        Fri, 22 Nov 2019 14:08:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1574428089;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
        bh=//5nPzIuRm2evQRb9acrI4hqDZiiDLIkRjl4f5sxneQ=;
        b=Fyrp8yuJV16DLrKi+FF4jNZLBtL0W4BGrdemubN8pw2rZzEV79OsvUW4elJJos5Ec30Tgk
        OPbn46jipXAN8EWBWg3ocL5WBCURrjYE8vf5JuM5SOnf9Mmny/VBEqBLbXI2qOT25Z7ICJ
        zzAkke/VvecTIFaDsLAXvZTe1oP7MXA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 22 Nov 2019 14:08:08 +0100
From:   Michael Walle <michael@walle.cc>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        hui.song_1@nxp.com, leoyang.li@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, shawnguo@kernel.org
Subject: Re: [PATCH v1] gpio : mpc8xxx : ls1088a/ls1028a edge detection mode
 bug fixs.
In-Reply-To: <CACRpkdYhLoGdGQt_jzj5aFa-EY_kMimoVShi7QFLG3sZbC436w@mail.gmail.com>
Message-ID: <563f2fdf0c32103d95a53fc1e7fd84c0@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: +
X-Spam-Level: *
X-Rspamd-Server: web
X-Spam-Status: No, score=1.40
X-Spam-Score: 1.40
X-Rspamd-Queue-Id: C8C842304F
X-Spamd-Result: default: False [1.40 / 15.00];
         ARC_NA(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         TO_DN_NONE(0.00)[];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[11];
         NEURAL_HAM(-0.00)[-0.923];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         MID_RHS_MATCH_FROM(0.00)[];
         SUSPICIOUS_RECIPS(1.50)[]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

>> From: Song Hui <hui.song_1@nxp.com>
>> 
>> On these boards, the irq_set_type must point one valid function 
>> pointer
>> that can correctly set both edge and falling edge.
>> 
>> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> 
> Patch applied!
> 
> Yours,
> Linus Walleij

mhh.. this bug should already be fixed in a better way with [1]:
   gpio: mpc8xxx: Don't overwrite default irq_set_type callback

-michael

[1] 
https://lore.kernel.org/lkml/CACRpkdZ5eWHEV-oN77QxH9X4DZRUB3zM=gP=+rM=ZLAX6Wxw9w@mail.gmail.com/
