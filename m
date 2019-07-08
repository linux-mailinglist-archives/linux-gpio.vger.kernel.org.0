Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C7A61CD4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 12:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbfGHKSo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 06:18:44 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.131]:50831 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728766AbfGHKSn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 06:18:43 -0400
Received: from [46.226.53.55] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-c.eu-west-1.aws.symcld.net id 1C/5E-11076-088132D5; Mon, 08 Jul 2019 10:18:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRWlGSWpSXmKPExsUyo1hfUrdeQjn
  W4PNXa4svc0+xWOx6sI3NYsqf5UwWm+f/YbS4vGsOmwOrx/sbrewei6/dZvW4c20Pm8fnTXIB
  LFGsmXlJ+RUJrBn77/5nLLjPWXHhTB9TA+NMji5GLg4hgTWMEl8u/mbtYuTk4BUwlph8+SmYL
  SzgI/H66wT2LkYODjYBXYmuO6YgYRGBIInL/xpYQMLMAiUSt2+5gIRZBFQk3ixeyARicwJNub
  j0EdgUIQEjiYtPdoDFmQU0JVq3/2YHsSUENCQ23DzGBLFVUOLkzCcsEDXyEs1bZzODjBcSkJU
  4eikWolxB4uyWiYwQdpLEub4rbBMYBWYhmToLyaRZSCYtYGRexWiRVJSZnlGSm5iZo2toYKBr
  aGika2RgCGQb6iVW6SbrpZbqlqcWl+gCueXFesWVuck5KXp5qSWbGIHBn1JwMnUH4/1Zb/QOM
  UpyMCmJ8oakyscK8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCdI64cKyRYlJqeWpGWmQOMRJi0BA
  ePkgjvbZA0b3FBYm5xZjpE6hSjopQ47wyQhABIIqM0D64NFv2XGGWlhHkZGRgYhHgKUotyM0t
  Q5V8xinMwKgnzKoBM4cnMK4Gb/gpoMRPQ4rpIJZDFJYkIKakGJj0GLd/aTT8zJxmEFQQu2BQX
  q6N2XHLCzRnLqk++7HX5Jqx/M58/sfOExeqpEr/lJiaYe+ob3N399pPQ66gin2u/FBy9/dWlW
  4J8Bc7XOO5yOXB4T7nJBAWRzqRNob/Fjk3vufKn2+bJlD175q+5dOKl4HRltR9fkj36XbMzG2
  v8p+mznckS1lMzLvfu+dC91XD9goPOjeHX+HdYxs86V7LJJPMYi9eOH/tnCHevyPW4xXVo+s+
  uBYxvzM5aP6l/um7vKrVdCXHXElvV1YqSCy9Ile3o+rXl48f3h2eEV7fMKKhevDKZnVN905uj
  m6Uns1V5dMk+Or6Z9xR//jLlCbv9ueQf3Z8T9X8CR9RLJiWW4oxEQy3mouJEAORXjy15AwAA
X-Env-Sender: cst@phaseone.com
X-Msg-Ref: server-3.tower-307.messagelabs.com!1562581119!941159!1
X-Originating-IP: [152.115.47.25]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2385 invoked from network); 8 Jul 2019 10:18:39 -0000
Received: from unknown (HELO Exchange2.phaseone.com) (152.115.47.25)
  by server-3.tower-307.messagelabs.com with AES256-SHA encrypted SMTP; 8 Jul 2019 10:18:39 -0000
Received: from cstu16.phaseone.com (172.16.2.207) by Exchange2.phaseone.com
 (172.16.1.180) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 8 Jul
 2019 12:18:38 +0200
Message-ID: <1562581119.10420.8.camel@phaseone.com>
Subject: Re: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
From:   "Claus H. Stovgaard" <cst@phaseone.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>
Date:   Mon, 8 Jul 2019 12:18:39 +0200
In-Reply-To: <20190708082343.30726-1-brgl@bgdev.pl>
References: <20190708082343.30726-1-brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.2.207]
X-ClientProxiedBy: Exchange3.phaseone.com (172.16.1.184) To
 Exchange2.phaseone.com (172.16.1.180)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2019-07-08 at 10:23 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> If gpiolib is disabled, we use the inline stubs from gpio/consumer.h
> instead of regular definitions of GPIO API. The stubs for 'optional'
> variants of gpiod_get routines return NULL in this case as if the
> relevant GPIO wasn't found. This is correct so far.
> 
> Calling other (non-gpio_get) stubs from this header triggers a
> warning
> because the GPIO descriptor couldn't have been requested. The warning
> however is unconditional (WARN_ON(1)) and is emitted even if the
> passed
> descriptor pointer is NULL.
> 
> We don't want to force the users of 'optional' gpio_get to check the
> returned pointer before calling e.g. gpiod_set_value() so let's only
> WARN on non-NULL descriptors.
> 
> Reported-by: Claus H. Stovgaard <cst@phaseone.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  include/linux/gpio/consumer.h | 64 +++++++++++++++++--------------
> ----
>  1 file changed, 32 insertions(+), 32 deletions(-)

Have tested it on my setup (ZynqMP with AT24 EEPROM), where it works
great. This have removed the warnings in the log regarding settting
wp_gpio for AT24.

Thanks
Claus
