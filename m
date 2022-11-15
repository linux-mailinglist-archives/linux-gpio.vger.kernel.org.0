Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF296290F0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 04:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiKODph (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 22:45:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiKODpg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 22:45:36 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95EF18B0D
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 19:45:35 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id k15so12969388pfg.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 19:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jne4RM3t+15+p7JByLBbM5CkDwh3bokzl6+7YW+ynEQ=;
        b=JpbZ19z1h7TNipI5s3XS92pvH/3aqWOMa1k+LOhjg7Nt7fZgVdqJ/mYag3pcYlxDpM
         YnSqS1NXdGCk3Qx8cyzkllZRstHO7xnccWSbMdn9x9NVanS82uNKIuaENVdxnxMjk3yc
         1WbnzAucJrojJ/EJiVguHaSj8CXF0KolRsxSu4tjQSSS1RXYbilcRi4aj7yubT8RQSa/
         PUzOD7f/UtPXuVgWZmsdUhC/QRoXhUj+IMqVoJObHrYIN87lvaFrnxoWBMsM6uBUvEJH
         7IamPTHYEWggfs7OYwIGHEGJ8AdbB/qCswqMRmqF+8iMSUO4NSHYcGm8cIRKsN7GrtH5
         02JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jne4RM3t+15+p7JByLBbM5CkDwh3bokzl6+7YW+ynEQ=;
        b=wQ2MMhhNBs1s2VVrbZn1TEBrRvcCxsrqIjnwjKyTaYtRxy9ImmoNP6zhYZfdB+MqVv
         UE5WDPTH7V+K7FJtrLg9pTldJSr+NuAu/V9oz4p6Khj03yRK+IA/DJP1plIQkxfCRKZZ
         N2VZ+sTO8fM9z9bLImUwUfJcXLtGR00BXObUXwTvMgTziXqkE4nMQA9LE7H+0URSFDjM
         XqpMeHTtbUqxWJnw/kq4V8+tOvCB30hrvEvd6Ngr2ccuRMlAVUDM6XB+B4GWi8uSw/xL
         O5/FkyVhVGEnOxR/YGBm9dWjDSZNmtvFhOousvA4SSyHtWLxujHjcTwlbmeZNDeiub/X
         2QOg==
X-Gm-Message-State: ANoB5pnB5eqzWyQ0LyAP+3b8AJiZAsWnhJEYQ+zXNo3SLP3zGXzIqTmE
        V5U0SXKcWGaSKKWViYlI5T45ueF4jBU=
X-Google-Smtp-Source: AA0mqf4gkrNjiG3GQ/BkTjqPVU4Mrhe8qUtEZk4IrFVfyL/X+gc3edz6zaz9NQvOGoVPAS0vvEoePg==
X-Received: by 2002:a65:6945:0:b0:476:91d6:e15e with SMTP id w5-20020a656945000000b0047691d6e15emr5456880pgq.455.1668483934931;
        Mon, 14 Nov 2022 19:45:34 -0800 (PST)
Received: from sol.home.arpa (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902bd8900b00180daa59314sm8366277pls.125.2022.11.14.19.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 19:45:34 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] README: update Tools section for v2 tools
Date:   Tue, 15 Nov 2022 11:45:20 +0800
Message-Id: <20221115034520.22456-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.1
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

A first draft of changes for the README.
If you want to wait for a v5 of the tools series I can add it on to the
end of that.

Cheers,
Kent.

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

