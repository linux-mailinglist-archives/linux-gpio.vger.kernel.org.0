Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0171FCEF3
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 15:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgFQN7k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 09:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgFQN7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2020 09:59:39 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E6BC061755
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2020 06:59:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c3so2427904wru.12
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2020 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=8bUOsv4bybXC/mQ3Hxos70tmB9QZ6NyHuFcpp79A5zQ=;
        b=Go/+9ZBYINQ9VUzlG0iy74ta2eMH67TuPQd2a+TF/sBt1oDLA9sLMJqB62Ar8RWkxk
         0sMcyp1Z7ffxSVOFPq5o3HwWy/I9Gh59I7ek3lR7TQUAdmVRbMN5vhgLZdSjm7TZVpRc
         TdGlYfUFt0+J7VmicXsaaErvjTwwzLmZuLC32D1hsM6QcsOcTG+TMIZR7FggXwksyxZy
         MHt6K4cZJCrH1l4XidjoTTls8O3VpQMIvnVQniuNSzyuG0wShjvJ5BWHOK6ct3vPBpHs
         s+8qg0dX1W7EV24+vVAci6qja8ItjS68bPV8pFuU4Ro/QYk2MddfUPU6veYTM1dyC3tC
         WiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=8bUOsv4bybXC/mQ3Hxos70tmB9QZ6NyHuFcpp79A5zQ=;
        b=WeDktQj7sHfWMTwOzZzoixMVlkeQP9kzvG4QZY9f3U3Y4wPLwuuaJie+dMqYCSGZ61
         fvhIjABdl37TksoBv2XHAPV19Y7qrB8wStVJyOC8lb5f7rLzWuf/yQH7+1mvA1gw0ha0
         TA0QFuIh21WA3zliX2P7lmASpIaOT6Nj24/4UCazHl9NUv975uSt+DmukcU8DWVVS1Dv
         H1oHfa8f7tOvvbVOQogtn8KMCKXpL8KEsWQV+YOtQt5xtWcfOUEvPhmzoIiifnbTmtoO
         W72spkmb/nmaSmi2onKRVOriqW8UnXFNRcjndFI4yNcI5OmeEgBMZpL3K9BRO/HRh4Tk
         aXrw==
X-Gm-Message-State: AOAM5315OTpse5PkrDpVGQ9/Btz0OfNoIilZx+pagUtorQCP+rqCstak
        zDzUrFwENtypO6hseN9hH5Vi/Q==
X-Google-Smtp-Source: ABdhPJyZoDgBWJusMEybO4nVCF1jKe4N/ywOBHUQE8w7mWB2J38E0OeLsvstMXvxyC+4R8rFG2dxyA==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr8474999wrt.160.1592402377338;
        Wed, 17 Jun 2020 06:59:37 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id y132sm610312wmb.11.2020.06.17.06.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 06:59:36 -0700 (PDT)
References: <20200610041329.12948-1-hhk7734@gmail.com> <1jo8prnk2x.fsf@starbuckisacylon.baylibre.com> <20200611053958.GA3687@home-desktop>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Hyeonki Hong <hhk7734@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>, khilman@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] pinctrl: meson: fix drive strength register and bit calculation
In-reply-to: <20200611053958.GA3687@home-desktop>
Date:   Wed, 17 Jun 2020 15:59:35 +0200
Message-ID: <1jeeqd3i9k.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Thu 11 Jun 2020 at 07:40, Hyeonki Hong <hhk7734@gmail.com> wrote:

> On Wed, Jun 10, 2020 at 03:09:42PM +0200, Jerome Brunet wrote:
>> 
>> On Wed 10 Jun 2020 at 06:13, hhk7734@gmail.com wrote:
>> 
>> > From: Hyeonki Hong <hhk7734@gmail.com>
>> >
>> > If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
>> > registers. However, when register and bit were calculated, the first
>> > register defined in the bank was used, and the bit was calculated based
>> > on the first pin. This causes problems in setting the driving strength.
>> >
>> > Solved the problem by changing the bit using a mask and selecting the
>> > next register when the bit exceeds 15.
>> 
>> This fixes the case of GPIOX on g12 which goes up to 18 yes but the same
>> problem will happen again a if bank ever goes past 31 pins. In such case
>> the problem would apply to all reg types.
>> 
>> I would prefer if it was solved in a more generic fashion, like defining
>> a "stride" table with the values of each reg type. This table can common
>> to all aml SoCs for now but eventually it probably need to be SoC
>> specific.
>> 
>> This would allow to :
>> A) handle the case you are reporting in a generic (future proof) way
>> B) remove the weird "bit = bit << 1;" calc in place in the get/set of
>> the drive strengh pinconf
>
> If all amlogic SoC has same register style, I think the code below is fine.
>
> static const unsigned int meson_bit_strides[] = {
> 	0, 0, 0, 0, 0, 1, 0
> };

 the table above is the shift, not the stride.
 Maybe 'width' is a better description
 I would prefer if it was { 1, 1, 1, 1, 1, 2, 1 } and adjust the caculation

A part from this, your proposition is exactly what I meant :) Thx

>
> static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
> 				   enum meson_reg_type reg_type,
> 				   unsigned int *reg, unsigned int *bit)
> {
> 	struct meson_reg_desc *desc = &bank->regs[reg_type];
>
> 	*bit = (desc->bit + pin - bank->first) << meson_bit_strides[reg_type];
> 	*reg = (desc->reg + (*bit / 32)) * 4;
> 	*bit &= 0x1f;
> }
>
> How about this?
>
>> >
>> > Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
>> > ---
>> >  drivers/pinctrl/meson/pinctrl-meson.c | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >
>> > diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> > index bbc919bef2bf..ef66239b7df5 100644
>> > --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> > +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> > @@ -98,6 +98,13 @@ static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
>> >
>> >  	*reg = desc->reg * 4;
>> >  	*bit = desc->bit + pin - bank->first;
>> > +
>> > +	if (reg_type == REG_DS) {
>> > +		if (*bit > 15) {
>> > +			*bit &= 0xf;
>> > +			*reg += 4;
>> > +		}
>> > +	}
>> >  }
>> >
>> >  static int meson_get_groups_count(struct pinctrl_dev *pcdev)
>> 

