Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD5A3AEF10
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 18:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392951AbfIJQBp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 12:01:45 -0400
Received: from dd10532.kasserver.com ([85.13.133.80]:40233 "EHLO
        dd10532.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392160AbfIJQBp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 12:01:45 -0400
Received: from odsus.home.arpa (p57B0B03F.dip0.t-ipconnect.de [87.176.176.63])
        by dd10532.kasserver.com (Postfix) with ESMTPSA id 711D21F422D0;
        Tue, 10 Sep 2019 18:01:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by odsus.home.arpa (Postfix) with ESMTP id 227F73EA6E;
        Tue, 10 Sep 2019 18:01:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at home.arpa
Received: from odsus.home.arpa ([127.0.0.1])
        by localhost (odsus.home.arpa [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id de1pHL-kTbqR; Tue, 10 Sep 2019 18:01:41 +0200 (CEST)
Received: from [192.168.20.240] (vdr.home.arpa [192.168.20.240])
        by odsus.home.arpa (Postfix) with ESMTP id 514183EA6D;
        Tue, 10 Sep 2019 18:01:41 +0200 (CEST)
From:   Otto Meier <gf435@gmx.net>
Subject: Re: [BUG] wrong pinning definition or uart_c in pinctrl-meson-gxbb.c
To:     linux-amlogic@lists.infradead.org
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com
Message-ID: <1cc32a18-464d-5531-7a1c-084390e2ecb1@gmx.net>
Date:   Tue, 10 Sep 2019 18:01:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi i tried to use the uart_C of the the odroid-c2.

I enabled it in the dts file. During boot it crashed when the
the sdcard slot is addressed.

After long search in the net i found this:

https://forum.odroid.com/viewtopic.php?f=139&t=25371&p=194370&hilit=uart_C#p177856

After changing the pin definitions accordingly erverything works.
Uart_c is functioning and sdcard ist working.


Fixes: 6db0f3a8a04e46 ("pinctrl: amlogic: gxbb: add more UART pins")
Signed-off-by: Otto Meiergf435@gmx.net
---


--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c 2019-08-26 
18:24:45.450089334 +0200
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c 2019-09-05 
13:07:38.518637214 +0200
@@ -192,8 +192,8 @@  static const unsigned int uart_rts_b_pin
  
  static const unsigned int uart_tx_c_pins[]     = { GPIOY_13 };
  static const unsigned int uart_rx_c_pins[]     = { GPIOY_14 };
-static const unsigned int uart_cts_c_pins[] = { GPIOX_11 };
-static const unsigned int uart_rts_c_pins[] = { GPIOX_12 };
+static const unsigned int uart_cts_c_pins[] = { GPIOY_11 };
+static const unsigned int uart_rts_c_pins[] = { GPIOY_12 };
  
  static const unsigned int i2c_sck_a_pins[]     = { GPIODV_25 };
  static const unsigned int i2c_sda_a_pins[]     = { GPIODV_24 };
@@ -439,10 +439,10 @@  static struct meson_pmx_group meson_gxbb
         GROUP(pwm_f_x,          3,      18),
  
         /* Bank Y */
- GROUP(uart_cts_c, 1, 19),
- GROUP(uart_rts_c, 1, 18),
- GROUP(uart_tx_c, 1, 17),
- GROUP(uart_rx_c, 1, 16),
+ GROUP(uart_cts_c, 1, 17),
+ GROUP(uart_rts_c, 1, 16),
+ GROUP(uart_tx_c, 1, 19),
+ GROUP(uart_rx_c, 1, 18),
         GROUP(pwm_a_y,          1,      21),
         GROUP(pwm_f_y,          1,      20),
         GROUP(i2s_out_ch23_y,   1,      5),





