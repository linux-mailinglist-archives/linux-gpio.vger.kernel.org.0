Return-Path: <linux-gpio+bounces-7091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A638FA608
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 00:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18C9DB22373
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 22:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCDA13C9C9;
	Mon,  3 Jun 2024 22:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAqLfiT6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB5135A46
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 22:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717454889; cv=none; b=PjR+RbS7BqrsucNH0KknlHIrKg/FAYyEpnhETxpHTkbQhP1IOksq1MbRxbyy7h0d8gPTw4v8E9S0qxIV+AT7tgdk65y4BfM/yq5Ud2x3LIPSIgF0bY0G/EK4tvEecQ9QBdZrOTQh+1R37gINPE0+hWPqKStq/zoDl1ne5R7iIOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717454889; c=relaxed/simple;
	bh=1Yu1xxIQHb6rFjdM0Wiq4Q+vgdF+kCEc9dWTLnj2qlY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Xt0tBJMLfUHquDwvRsFS9JrdkKPsQUWhudtcHS4Uiq11iAd52zKq5Cv5LkXxgWlVjolGROLHpGGwouiAF5eodg2C41W840DQJb0ajZs2t/pG4y8NiGpiGpvrbRpBx1i2p0yvL1XVHx9HNXYOmfgGGzy6EQHfuci7HrS/yNaZ3nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAqLfiT6; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2508320e62dso1866565fac.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717454887; x=1718059687; darn=vger.kernel.org;
        h=content-transfer-encoding:disposition-notification-to:subject:from
         :content-language:to:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsS54hqwzPnYlBGCDoQf1upjUKAeqKwaL1FX0n56hLs=;
        b=bAqLfiT6PREZcHdmwKax9P52zIIf2Fx2UdSTpntwDQCSTGj60LTySIt2jfLzzOv7dG
         Kq+yahvPwfMBzNfO5uXEUCLdFJb5ihCRxU3XIYaglA889aoNYOUmEZXxEBg3qus3NOkN
         8EZnPjxIY+2vGh+TFCkaNEP5z7w2JL0T00Rr9STYsIOYtWij1LKyD3kiCByOOgrrL34G
         iujH9IOcH9gJw4x7krmFRI0Je+VghqDZ5QRqM2Y0wbgFMTISdLGO9xc4A8YpoBiIefil
         9MnnXTEZdzndXX1KDi7PEM+03zTJeOQCVUAAV89dIYN3TQcOlaBR3hoOu0a5Y8l1wz+x
         yueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717454887; x=1718059687;
        h=content-transfer-encoding:disposition-notification-to:subject:from
         :content-language:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CsS54hqwzPnYlBGCDoQf1upjUKAeqKwaL1FX0n56hLs=;
        b=XWqBxNt871ADafaWXmak8oYSHVimctZl/6sFRd4C9FaayHXmks034VcOdRYL2y5Jz5
         RDLXZJ5XeMmb2McVdzyX/c13fmo/3W/FASmZKsYLUlrYRW5WmQ5k5t25NekCNIKQg8Jm
         crGtIMWBWfIVdUpiRh6cT1KnQnGz2fV4Iq3Tx/u2uPeQ2f1A9LncAm56noc3pqxYq/Bs
         rAaC8hrmNz0qZBNBbW8/MZPyeZfiqHBMv30mDbD79PSKiVfLFxNPNF0K83V4CYD0WU0M
         HET4gTpBHiJYLmZFLvb8qelnlIISfaU/MXKiEhZNjtP3Imgw8mPiLt4MgUIk/w2Fo65V
         PKLg==
X-Gm-Message-State: AOJu0YzzD3m8Tj2JLOLvWEJ7Q6C0fz9fUG24HHKtj0EUZP26BnEDT/rl
	lLJIs4pUSDiDlRNNSSbS/YBHlwhuOOKKxPAhbjOcSlo56Nt5+DW5ICI2ZqR7
X-Google-Smtp-Source: AGHT+IFzNWv4G49+oIKF+9ylCRW1PB0ysos53uJy0aREJVj04SJsVCNEY5tWMR+qFZCas6dLHhTOiA==
X-Received: by 2002:a05:6870:e40f:b0:24f:c241:4d16 with SMTP id 586e51a60fabf-2508bc2ba99mr12028231fac.50.1717454886450;
        Mon, 03 Jun 2024 15:48:06 -0700 (PDT)
Received: from [192.168.6.104] (mail.3111skyline.com. [66.76.46.195])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25085023811sm2767815fac.32.2024.06.03.15.48.05
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 15:48:05 -0700 (PDT)
Message-ID: <d82c276f-fade-4b23-9617-206c4cf0796e@gmail.com>
Date: Mon, 3 Jun 2024 17:48:05 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-gpio@vger.kernel.org
Content-Language: en-US
From: "David C. Rankin" <drankinatty@gmail.com>
Subject: Documentation for line_config PULL_UP, effect on line_event edges and
 line_request values?
Disposition-Notification-To: "David C. Rankin" <drankinatty@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

All,

   First post, so only shoot me once if the rational is documented somewhere. 
I've been working with the gpio_v2 uABI (fantastic piece of work), but I've 
run into a very confusing combination using gpio_line_get_values where the 
line is PULL_UP makes going down "RISING" and going up "FALLING" and a .bits 
value of 1 is for zero voltage and a value of 0 for normal line voltage. I 
think I've digested it correctly, but I'm wondering if there is a better way 
to handle this and whether the chardev.html doc should be updated to further 
explain this behavior?

   The confusing part comes from what is defined as "active" and what is 
defined as "inactive" when the line is active low, e.g.

  /* gpio_v2 line config, line request and line values, read defaults set */
   struct gpio_v2_line_config linecfg = {
                               .flags =  GPIO_V2_LINE_FLAG_ACTIVE_LOW      |
                                         GPIO_V2_LINE_FLAG_INPUT           |
                                         GPIO_V2_LINE_FLAG_EDGE_RISING     |
                                         GPIO_V2_LINE_FLAG_EDGE_FALLING    |
                                         GPIO_V2_LINE_FLAG_BIAS_PULL_UP,
                               .num_attrs = 1 };

   In this case the configured line_request is passed to a thread for reading 
where the interest is in both the edges and the line_values.

   The documentation at 
https://docs.kernel.org/userspace-api/gpio/chardev.html is helpful, but it is 
silent on how the ...FLAG_ACTIVE_LOW/...PULL_UP basically inverts everything 
so that catching the ...FLAG_EDGE_RISING is actually the edge going from 
normal line voltage to zero (normally the falling edge of a waveform), how the 
value retrieved by gpio_line_get_values() then reports bit Hi (1) for the zero 
voltage state. The ...FLAG_EDGE_FALLING is then triggered when voltage goes 
from zero back to normal line voltage (normally the rising edge) and the value 
reported by gpio_line_get_values() is then Lo (0) at line voltage.

   The header gpio.h does provide more help. There the description of the 
attribute flags does indicate that rising will trigger on transition from 
(inactive to active) edges and falling will trigger on (active to inactive) 
edges, e.g.

/**
  * enum gpio_v2_line_flag - &struct gpio_v2_line_attribute.flags values
  ...
  * @GPIO_V2_LINE_FLAG_ACTIVE_LOW: line active state is physical low
  ...

  * @GPIO_V2_LINE_FLAG_EDGE_RISING: line detects rising (inactive to active)
  * edges
  * @GPIO_V2_LINE_FLAG_EDGE_FALLING: line detects falling (active to
  * inactive) edges
  ...

   Where there is a little ambiguity is in the comment for gpio_v2_line_values 
related to active/inactive .bits values. Taken together with the flags comment 
it's reasonably clear that active/inactive are as used in flags and not as 
commonly used (e.g. inactive - zero - low, active - non-zero - high). The 
comment reads:

/**
  * struct gpio_v2_line_values - Values of GPIO lines
  * @bits: a bitmap containing the value of the lines, set to 1 for active
  * and 0 for inactive.
  ...

   To make sure I was interpreting "active"/"inactive" and the effect on what 
is RISING and FALLING edge and .bits values I wrote a short program for the 
Raspberry Pi to catch the edges and values on button press and release and 
display the results. The results were indeed that the active RISING edge was 
the transition from line-voltage to zero, with a .bits value of 1 (Hi) for 
voltage zero, and on button release the inactive FALLING edge was the 
transition from zero to line-voltage with a .bits value of 0 (Lo) for line 
voltage.

   (if interested the short test program and Makefile for the Pi are at 
https://github.com/drankinatty/pi-wo-root/tree/master/tst/gpio_v2_button_value)

   My questions are:

  1. is there any thread or document squirreled away that contains a 
discussion of how this rational was arrived at?

  2. should the documentation at 
https://docs.kernel.org/userspace-api/gpio/chardev.html be updated to add the 
behavior for "active"/"inactive" and what flag this is dependent on (PULL_UP, 
ACTIVE_LOW or BOTH?) If so, I'd be glad to take a crack at the write-up and 
pass it to whoever for review and revision. (just let me know who the right 
person is to send it to if interested) The chardev.html seems like the right 
place for it rather than having to also locate and read gpio.h to find 
"active" and "inactive" (especially for newer users using latest libgpio for 
Pi, etc.. based on gpio_v2)

  3. is the expected programming approach to query the line config so that the 
.bits values can be interpreted as either 1 (Hi or Lo), or 0 (Lo or Hi)?

  (I guess that was where the biggest confusion was -- that a .bits value 0 
didn't mean no voltage, and vice-versa)

   Don't take this as a knock on the implementation, I think gpio_v2 is a 
stroke of genius, especially the debounce, but rather these were the parts 
that really were a bit difficult to suss out of the documentation and it may 
be helpful to include further explanation in the chardev.html pages explaining 
this a bit further.

NOTE Also:

   Links for the lists in 
https://docs.kernel.org/process/submitting-patches.html under the "Select the 
recipients for your patch" heading still point to 
http://vger.kernel.org/vger-lists.html (Majordomo)

-- 
David C. Rankin, J.D.,P.E.

