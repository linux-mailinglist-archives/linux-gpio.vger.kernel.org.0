Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F9823C9B3
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 12:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgHEKAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 06:00:13 -0400
Received: from ms9.eaxlabs.cz ([147.135.177.209]:45494 "EHLO ms9.eaxlabs.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbgHEKAI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 5 Aug 2020 06:00:08 -0400
X-Greylist: delayed 1894 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Aug 2020 06:00:07 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz; s=mail;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To; bh=t+IvbY/JQGlbvRGnvirF9n+itqwG0xol8Zk+qYQz+C0=;
        b=IutxphscpyDm1uPQQxc980NCsxvnVNuaIn7GM8bBHHNa7ij3YY7P8MR/0AqL7wBsoq1Y5uwD/a3TvrJrlO/gnpEFXPETmLdAa3UrLCWafpZQGSOGxDWlmFe8mDLY5Op6xKRfWIhSsZN7QVzIfUXZ6ydF8peyeESio9+4Yq/tR5U=;
Received: from [82.99.129.6] (helo=[10.76.6.116])
        by ms9.eaxlabs.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <devik@eaxlabs.cz>)
        id 1k3Fia-0003zx-MN; Wed, 05 Aug 2020 11:28:18 +0200
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Martin DEVERA <devik@eaxlabs.cz>
Subject: pinctrl: sx150x bug
Message-ID: <f32130bf-cfd4-b1bf-538c-dbc9ee2d947a@eaxlabs.cz>
Date:   Wed, 5 Aug 2020 11:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I encountered bug in SX1502 expander driver in 5.7.7. Here is relevant 
DTS part:

compatible = "semtech,sx1502q";
gpio4_cfg_pins: gpio2-cfg {
                         pins = "gpio5";
                         output-high;
     };

And part of OOPS:

[    0.673996] [<c023cfa6>] (gpiochip_get_data) from [<c023b235>] 
(sx150x_gpio_direction_output+0xd)
[    0.683259] [<c023b235>] (sx150x_gpio_direction_output) from 
[<c023b363>] (sx150x_pinconf_set+0x)
[    0.692796] [<c023b363>] (sx150x_pinconf_set) from [<c0238fef>] 
(pinconf_apply_setting+0x39/0x7e)
[    0.701635] [<c0238fef>] (pinconf_apply_setting) from [<c0236c77>] 
(pinctrl_commit_state+0xa5/0x)
[    0.710648] [<c0236c77>] (pinctrl_commit_state) from [<c0237e03>] 
(pinctrl_enable+0xff/0x1d4)
[    0.719139] [<c0237e03>] (pinctrl_enable) from [<c023b791>] 
(sx150x_probe+0x1a3/0x358)
[    0.727027] [<c023b791>] (sx150x_probe) from [<c02c38bf>] 
(i2c_device_probe+0x1bb/0x1dc)

The problem is that sx150x_pinconf_set uses sx150x_gpio_direction_output 
but gpio is not
setup yet. Patch below fixes it but I'm not sure whether is it correct:

diff --git a/drivers/pinctrl/pinctrl-sx150x.c 
b/drivers/pinctrl/pinctrl-sx150x.c
index 6e74bd87d959..3f5651edd336 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1154,12 +1154,6 @@ static int sx150x_probe(struct i2c_client *client,
                 return ret;
         }

-       ret = pinctrl_enable(pctl->pctldev);
-       if (ret) {
-               dev_err(dev, "Failed to enable pinctrl device\n");
-               return ret;
-       }
-
         /* Register GPIO controller */
         pctl->gpio.base = -1;
         pctl->gpio.ngpio = pctl->data->npins;
@@ -1191,6 +1185,12 @@ static int sx150x_probe(struct i2c_client *client,
         if (ret)
                 return ret;

+       ret = pinctrl_enable(pctl->pctldev);
+       if (ret) {
+               dev_err(dev, "Failed to enable pinctrl device\n");
+               return ret;
+       }
+
         ret = gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
                                      0, 0, pctl->data->npins);
         if (ret)

