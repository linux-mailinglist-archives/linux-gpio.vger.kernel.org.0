Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B03F1B31C2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 23:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgDUVQT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 17:16:19 -0400
Received: from mx02.beuth-hochschule.de ([141.64.5.24]:25648 "EHLO
        mx02.beuth-hochschule.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgDUVQT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2020 17:16:19 -0400
X-Greylist: delayed 341 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Apr 2020 17:16:18 EDT
Received: from localhost (localhost [127.0.0.1])
        by mx02.beuth-hochschule.de (Postfix) with ESMTP id D114C20083
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 23:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        beuth-hochschule.de; h=content-transfer-encoding:content-type
        :content-type:mime-version:x-mailer:message-id:subject:subject
        :from:from:date:date:received:received; s=beuth; t=1587503431;
         x=1589317832; bh=oK2OMCjyFwnPynLxYK1HuSmbHL4pm4ygS0Yj52ra5oM=; b=
        QdL6SUo0bLCbnU4s+BBsYa86UNuBH51jf6RnjttT56xJDnXFMtCR2i9Cb8Z/vMj8
        1fNDzP8umvdNbDoha/Y/F2P/bkCWYYowFJnHy5Ft8Z8EdRoKTYxFiaglv+qfPuXl
        cu/u5A3ZjjPqePl3K2gOLWebyRWU6tqSXiJom2uf/w8=
X-Virus-Scanned: amavisd-new at mx02.beuth-hochschule.de
Received: from mailstore1.beuth-hochschule.de ([141.64.12.230])
        by localhost (mx02.beuth-hochschule.de [141.64.5.24]) (amavisd-new, port 10034)
        with ESMTP id BiMyuBg_3sv9 for <linux-gpio@vger.kernel.org>;
        Tue, 21 Apr 2020 23:10:31 +0200 (CEST)
Received: from rechenknecht2k11 (mue-88-130-48-030.dsl.tropolys.de [88.130.48.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailstore1.beuth-hochschule.de (Postfix) with ESMTPSA
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 23:10:31 +0200 (CEST)
Date:   Tue, 21 Apr 2020 23:09:45 +0200
From:   Benjamin Valentin <benjamin.valentin@beuth-hochschule.de>
To:     linux-gpio@vger.kernel.org
Subject: GPIO fd won't generate signal
Message-ID: <20200421230945.11c862e2@rechenknecht2k11>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

AFAIU a GPIO fd will generate a POLLPRI event when an interrupt occurs
on the GPIO.
I can wait for this event using poll() just fine.

fcntl(fd, F_SETOWN, getpid()) should then turn such an event into a
signal that can be caught by the signal handler of the process.

This however does not work. Is this an omission by the GPIO API or am I
understanding the API wrong here?

Attached you find a little program to reproduce this:

When running on a raspberry pi, bridge GPIO20 and GPIO26.
The program will periodically toggle GPIO26, this should generate an
interrupt on GPIO20.
I can poll() GPIO20 but no signal is generated.

#include <fcntl.h>
#include <linux/gpio.h>
#include <poll.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <unistd.h>

#define PIN_IN  (20)
#define PIN_OUT (26)

static int fd_in; /* to be read in the signal handler */

/* configure input pin */
static int setup_pin_int(int fd, int pin, int mode, int flank) {
    struct gpioevent_request req = {
        .lineoffset  = pin,
        .handleflags = mode,
        .eventflags  = flank
    };

    int res = ioctl(fd, GPIO_GET_LINEEVENT_IOCTL, &req);

    if (res < 0) {
        return res;
    }

    return req.fd;
}

/* configure output pin */
static int setup_pin_out(int fd, int pin, int mode) {
    struct gpiohandle_request req = {
        .lineoffsets[0] = pin,
        .flags          = mode,
        .lines          = 1
    };

    int res = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);

    if (res < 0) {
        return res;
    }

    return req.fd;
}

static void pin_set(int fd, uint8_t val) {
    ioctl(fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &val);
}

/* print which edge triggered the event */
static void sigurg_handler(void) {
    struct gpioevent_data event;
    read(fd_in, &event, sizeof(event));

    if (event.id == GPIOEVENT_EVENT_RISING_EDGE) {
        puts("rising");
    }
    if (event.id == GPIOEVENT_EVENT_FALLING_EDGE) {
        puts("falling");
    }
}

static void signal_handler(int signal) {
    printf("got signal: %x\n", signal);

    if (signal == SIGURG) {
        sigurg_handler();
    }
}

static void register_signal(int signal, void (*handler)(int)) {
    struct sigaction sa = {
        .sa_handler = handler
    };

    sigaction(signal, &sa, NULL);
}

/* calling poll() on the fd works as expected */
static void _do_poll(int fd) {

    struct pollfd pfd = {
        .fd = fd,
        .events = POLLIN | POLLPRI
    };

    if (poll(&pfd, 1, 1000) > 0) {
        sigurg_handler();
    }
}

int main(void) {

    int pins[2];

    int fd = open("/dev/gpiochip0", O_RDWR);
    pins[0] = setup_pin_int(fd, PIN_IN, GPIOHANDLE_REQUEST_INPUT,
    GPIOEVENT_REQUEST_BOTH_EDGES); pins[1] = setup_pin_out(fd, PIN_OUT,
    GPIOHANDLE_REQUEST_OUTPUT);

    fd_in = pins[0];

    /* register signal handler */
    register_signal(SIGIO, signal_handler);
    register_signal(SIGURG, signal_handler);

    /* make the fd generate signals */
    fcntl(fd_in, F_SETOWN, getpid());
    fcntl(fd_in, F_SETFL, O_NONBLOCK | O_ASYNC);

    /* toggle the output pin each second */
    int state;
    while (1) {
        state = !state;
        sleep(1);

        printf("set %d\n", state);
        pin_set(pins[1], state);

        /* poll() is working on the fd */
//        _do_poll(fd_in);
    }

    close(fd);

    return 0;
}

I can send signals to the process with kill -23 <pid> just fine and the
signal handler will be caught.
Just not when the GPIO event occurs.

Thank you!
Benjamin
