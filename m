Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1CB61B1AC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 10:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbfEMIEk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 04:04:40 -0400
Received: from smtpout-52.fbg1.glesys.net ([185.39.145.52]:24202 "EHLO
        smtpout-52.fbg1.glesys.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725928AbfEMIEk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 May 2019 04:04:40 -0400
Received: from [10.161.4.101] (unknown [193.15.208.200])
        by mail-halon-02.fbg1.glesys.net (Halon) with ESMTPSA
        id c080fbd9-7555-11e9-bc54-2f60bddcfa2d;
        Mon, 13 May 2019 10:04:37 +0200 (CEST)
To:     linux-gpio@vger.kernel.org
From:   Magnus Olsson <magnus@minimum.se>
Subject: gpio-dwapb: reason for storing & restoring registers on
 suspend/resume
Message-ID: <59fdf7d4-d0cc-4def-f6a7-dea636e24758@minimum.se>
Date:   Mon, 13 May 2019 10:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

During PM suspend(), the gpio-dwapb.c driver store registers for each 
port into a context. For Port A it also stores IRQ settings, since it 
can act as a wake-up source. During resume(), the registers are restored 
from the context.

What is the purpose of these store & restore? Because the GPIO 
controller also is a wake-up source, it will never sleep and AFAIK the 
registers remain untouched throughout a suspend/resume cycle.

When port A is used to wake up the system (e.g enable_irq_wake() has 
enabled wake_en bits in the driver), I sometimes see calls to gpio-dwapb 
irq_mask() before the driver is resumed(). When resume() later on 
occurs, any changes made to the registers (in my case IRQ mask) while 
the driver is suspended are therefore lost.

This race between resume() and irq_mask() (called by threaded wake-up 
IRQ handler) sometime causes IRQ to remain masked indefinitely, 
depending on when the wake-up IRQ arrives.

Is this intentional? Can anyone shed light on why the store & restore 
mechanism exists in the first place?

BR,
  Magnus Olsson.

