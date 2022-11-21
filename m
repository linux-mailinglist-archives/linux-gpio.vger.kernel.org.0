Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14ECB631E38
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 11:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbiKUKYJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 05:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbiKUKX5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 05:23:57 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73898AEBDC
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 02:23:56 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id w23so10145474ply.12
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 02:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zRIaq8WydqQRHZeoqWsu7TxroIHtr/yKl7Q3Bf4MoQ=;
        b=Q7BTHEy0WzwgBpc8XuRjQ9HWJ6vCkN5WCDzvrd/kUZf8H3VRPmALlCF2xfOK4PXzdh
         a5TnQySsH2zkpRGk/SwP/o6PfiJCz8OptYN+ko7ZYZaii0XTb6r4fnbEbP/iLWDg34FW
         34NMNkI+LORTAheFSoAPdKawYiOaXwyn5ogT7QM5I2CFpl1+N/WtPCfFr5Cvt2AyyXcq
         69xryFyk6wk5yNdOsxQ16C9XOGB8bKSLMDwG0rWOqZyGdUksZmDoEw5+gN2mslw3Zmxq
         QY/LZe8ugy3cqUOn7KlVMpzN+p6Jln/RmQxRUQo//wZwZ3VUp0nD9CcXB7SZHsdodgbt
         ha8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zRIaq8WydqQRHZeoqWsu7TxroIHtr/yKl7Q3Bf4MoQ=;
        b=A5L7xStdOAZsiMhsq4EA0kjGVE50IeiDfpkBgeyxY0+sGE3WiEuwzW8CIDO2a9GQj4
         u7XOTT8J0wB5LLLyP7rXUeQQQjHrtXk8DlPGQLxKK0pGNnpxoTmOCNn5TUr0u/MTv7F8
         PzlJKkPk+IhnVpntpbtPXy38EUIDPzJZlOP6jWx+S7zge1+saiQ7rYP2/XxImHAoBqQm
         UTzoyClVSwm4702DP9Pjvrtsk9IDa3ZkgzdSmw/l2QOWFM7UZBh01JI9rsZJW3VVpF3Q
         KimPtnqZ4FHvRzu4ZQVxoPPYE4qTyO1KpwAVO2V0z27yshJ+SdZ6XE40zMu/ebUcDGUK
         JO2w==
X-Gm-Message-State: ANoB5plhFQjne0bAYysxUgEJ8tmxjPDgXw/mr7bB3XJYxsGWFFZlzOxk
        JP5qjOAmx+yPYWUFBEkpzka9U7E6rBw=
X-Google-Smtp-Source: AA0mqf5hRz3T74q+Hoyk29bXpwMAt6bi7FUGt+UvFJMC2xQYeoL/2+O/EZyixhF993QnZJKYL5P4pw==
X-Received: by 2002:a17:902:ca14:b0:188:dcfb:f2dc with SMTP id w20-20020a170902ca1400b00188dcfbf2dcmr6360287pld.5.1669026235689;
        Mon, 21 Nov 2022 02:23:55 -0800 (PST)
Received: from sol.home.arpa (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id s184-20020a625ec1000000b0056ba7ce4d5asm8347419pfb.52.2022.11.21.02.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 02:23:55 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v5 6/6] README: update Tools section for v2 tools
Date:   Mon, 21 Nov 2022 18:22:53 +0800
Message-Id: <20221121102253.38306-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121102253.38306-1-warthog618@gmail.com>
References: <20221121102253.38306-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the Tools section to reflect the changes to the tools for v2.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 README | 176 ++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 132 insertions(+), 44 deletions(-)

diff --git a/README b/README
index 814a0f1..e6edf8b 100644
--- a/README
+++ b/README
@@ -59,62 +59,150 @@ There are currently six command-line tools available:
 * gpiodetect - list all gpiochips present on the system, their names, labels
                and number of GPIO lines
 
-* gpioinfo   - list all lines of specified gpiochips, their names, consumers,
-               direction, active state and additional flags
+* gpioinfo   - list lines, their gpiochip, offset, name, and direction, and
+               if in use then the consumer name and any other configured
+               attributes, such as active state, bias, drive, edge detection
+               and debounce period
 
 * gpioget    - read values of specified GPIO lines
 
-* gpioset    - set values of specified GPIO lines, potentially keep the lines
-               exported and wait until timeout, user input or signal
+* gpioset    - set values of specified GPIO lines, holding the lines until the
+               process is killed or otherwise exits
 
-* gpiofind   - find the gpiochip name and line offset given the line name
-
-* gpiomon    - wait for events on GPIO lines, specify which events to watch,
-               how many events to process before exiting or if the events
+* gpiomon    - wait for edge events on GPIO lines, specify which edges to watch
+               for, how many events to process before exiting, or if the events
                should be reported to the console
 
+* gpionotify - wait for changed to the info for GPIO lines, specify which
+               changes to watch for, how many events to process before exiting,
+               or if the events should be reported to the console
+
 Examples:
 
-    # Read the value of a single GPIO line.
-    $ gpioget gpiochip1 23
-    0
+    (using a Raspberry Pi 4B)
+
+    # Detect the available gpiochips.
+    $ gpiodetect
+    gpiochip0 [pinctrl-bcm2711] (58 lines)
+    gpiochip1 [raspberrypi-exp-gpio] (8 lines)
+
+    # Read the info for all the lines on a gpiochip.
+    $ gpioinfo -c 1
+    gpiochip1 - 8 lines:
+     line   0: "BT_ON"          output
+     line   1: "WL_ON"          output
+     line   2: "PWR_LED_OFF"    output active-low consumer="led1"
+     line   3: "GLOBAL_RESET"   output
+     line   4: "VDD_SD_IO_SEL"  output consumer="vdd-sd-io"
+     line   5: "CAM_GPIO"       output consumer="cam1_regulator"
+     line   6: "SD_PWR_ON"      output consumer="sd_vcc_reg"
+     line   7: "SD_OC_N"        input
+
+    # Read the info for particular lines.
+    $ ./gpioinfo PWR_LED_OFF STATUS_LED_G_CLK GLOBAL_RESET
+    gpiochip0 42 "STATUS_LED_G_CLK" output consumer="led0"
+    gpiochip1 2 "PWR_LED_OFF"    output active-low consumer="led1"
+    gpiochip1 3 "GLOBAL_RESET"   output
+
+    # Read the value of a single GPIO line by name.
+    $ gpioget RXD1
+    "RXD1"=active
+
+    # Read the value of a single GPIO line by chip and offset.
+    $ gpioget -c 0 15
+    "15"=active
+
+    # Read the value of a single GPIO line as a numeric value.
+    $ gpioget --numeric RXD1
+    1
 
     # Read two values at the same time. Set the active state of the lines
-    # to low.
-    $ gpioget --active-low gpiochip1 23 24
-    1 1
-
-    # Set values of two lines, then daemonize and wait for a signal (SIGINT or
-    # SIGTERM) before releasing them.
-    $ gpioset --mode=signal --background gpiochip1 23=1 24=0
-
-    # Set the value of a single line, then exit immediately. This is useful
-    # for floating pins.
-    $ gpioset gpiochip1 23=1
-
-    # Find a GPIO line by name.
-    $ gpiofind "USR-LED-2"
-    gpiochip1 23
-
-    # Toggle a GPIO by name, then wait for the user to press ENTER.
-    $ gpioset --mode=wait `gpiofind "USR-LED-2"`=1
+    # to low and without quoted names.
+    $ gpioget --active-low --unquoted GPIO23 GPIO24
+    GPIO23=active GPIO24=active
+
+    # Set the value of a line and hold the line until killed.
+    $ gpioset GPIO23=1
+
+    # Set values of two lines, then daemonize and hold the lines.
+    $ gpioset --daemonize GPIO23=1 GPIO24=0
+
+    # Set the value of a single line, hold it for 20ms, then exit.
+    $ gpioset --hold-period 20ms -t0 GPIO23=1
+
+    # Blink an LED on GPIO22 at 1Hz
+    $ gpioset -t500ms GPIO22=1
+
+    # Blink an LED on GPIO22 at 1Hz with a 20% duty cycle
+    $ gpioset -t200ms,800ms GPIO22=1
+
+    # Set some lines interactively (requires --enable-gpioset-interative)
+    $ gpioset --interactive --unquoted GPIO23=inactive GPIO24=active
+    gpioset> get
+    GPIO23=inactive GPIO24=active
+    gpioset> toggle
+    gpioset> get
+    GPIO23=active GPIO24=inactive
+    gpioset> set GPIO24=1
+    gpioset> get
+    GPIO23=active GPIO24=active
+    gpioset> toggle
+    gpioset> get
+    GPIO23=inactive GPIO24=inactive
+    gpioset> toggle GPIO23
+    gpioset> get
+    GPIO23=active GPIO24=inactive
+    gpioset> exit
 
     # Wait for three rising edge events on a single GPIO line, then exit.
-    $ gpiomon --num-events=3 --rising-edge gpiochip2 3
-    event:  RISING EDGE offset: 3 timestamp: [    1151.814356387]
-    event:  RISING EDGE offset: 3 timestamp: [    1151.815449803]
-    event:  RISING EDGE offset: 3 timestamp: [    1152.091556803]
-
-    # Wait for a single falling edge event. Specify a custom output format.
-    $ gpiomon --format="%e %o %s %n" --falling-edge gpiochip1 4
-    0 4 1156 615459801
-
-    # Pause execution until a single event of any type occurs. Don't print
-    # anything. Find the line by name.
-    $ gpiomon --num-events=1 --silent `gpiofind "USR-IN"`
-
-    # Monitor multiple lines, exit after the first event.
-    $ gpiomon --silent --num-events=1 gpiochip0 2 3 5
+    $ gpiomon --num-events=3 --edges=rising GPIO22
+    10002.907638045	rising	"GPIO22"
+    10037.132562259	rising	"GPIO22"
+    10047.179790748	rising	"GPIO22"
+
+    # Wait for three edge events on a single GPIO line, with time in local time
+    # and with unquoted line name, then exit.
+    $ gpiomon --num-events=3 --edges=both --localtime --unquoted GPIO22
+    2022-11-15T10:36:59.109615508	rising	GPIO22
+    2022-11-15T10:36:59.129681898	falling	GPIO22
+    2022-11-15T10:36:59.698971886	rising	GPIO22
+
+    # Wait for falling edge events with a custom output format.
+    $ gpiomon --format="%e %c %o %l %S" --edges=falling -c gpiochip0 22
+    2 gpiochip0 22 GPIO22 10946.693481859
+    2 gpiochip0 22 GPIO22 10947.025347604
+    2 gpiochip0 22 GPIO22 10947.283716669
+    2 gpiochip0 22 GPIO22 10947.570109430
+    ...
+
+    # Block until an edge event occurs. Don't print anything.
+    $ gpiomon --num-events=1 --quiet GPIO22
+
+    # Monitor multiple lines, exit after the first edge event.
+    $ gpiomon --quiet --num-events=1 GPIO5 GPIO6 GPIO12 GPIO17
+
+    # Monitor a line for changes to info.
+    $ gpionotify GPIO23
+    11571.816473718	requested	"GPIO23"
+    11571.816535124	released	"GPIO23"
+    11572.722894029	requested	"GPIO23"
+    11572.722932843	released	"GPIO23"
+    11573.222998598	requested	"GPIO23"
+    ...
+
+    # Monitor a line for requests, reporting UTC time and unquoted line name.
+     $ gpionotify --utc --unquoted GPIO23
+    2022-11-15T03:05:23.807090687Z	requested	GPIO23
+    2022-11-15T03:05:23.807151390Z	released	GPIO23
+    2022-11-15T03:05:24.784984280Z	requested	GPIO23
+    2022-11-15T03:05:24.785023873Z	released	GPIO23
+    ...
+
+    # Monitor multiple lines, exit after the first is requested.
+    $ gpionotify --quiet --num-events=1 --event=requested GPIO5 GPIO6 GPIO12 GPIO17
+
+    # Block until a line is released.
+    $ gpionotify --quiet --num-events=1 --event=released GPIO6
 
 BINDINGS
 --------
-- 
2.38.1

