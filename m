Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 909C6D44B9
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 17:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbfJKPr5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 11:47:57 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35669 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfJKPr5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 11:47:57 -0400
Received: by mail-pf1-f194.google.com with SMTP id 205so6344230pfw.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jyvL2IPExI5tRBdOvfxpv34Vt/6I153uPSwxRmavEnI=;
        b=PJlPBRGhwrZXdq0Sw8bp07BukcVZwfxgmhQCjrU0pMOXiJJfD4o/EvJ8KEESOjVQWR
         q/Y//j+Ded8U6tBY48fvI4Da0prt948mq4gqwFpiWCZ8wgvAKriZGgpD3MwrTheYOHnm
         hDXaFG4KkUrD+0ZAB0p++vmsmsF/0KOilSiXT33OhqiXZXveRm4X9qV5jFsjhqas/GEV
         0FMiEdNeiQD/2XP2SsgT5Nb0ZI/fdV0R5JVFDDWsqg6PNc6CN9oMtX1IYOk9x8FPjMUj
         aHxro67Ot8hzgaLsu2HhE/4+6WwlpMo0b2LOWDSiYfvyrUEhaLRm/SfQ/lRpGmOUMtrv
         3ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jyvL2IPExI5tRBdOvfxpv34Vt/6I153uPSwxRmavEnI=;
        b=qn+rFu668f73fBj0v0T2mb6kcOeCjbo3FSYZvSy0N5jcIDrjK+3hOT/epKVT3YWLf2
         LUBGRU3oH6zFPg5KXnqzZSZf6Ux7sonxf362GYaDPZ+oXWPsCtt6OkbHTp83cvMlfb/B
         gwo7CPM7lKV2rxoMWFLRSlSzjemJdAx/eKlGnh1Boxtvjs0sg6ZFUfJTPGYTEq2hN1kn
         OrvzOfBmxGPFPBy0UA+OpQi8gSFm4xGkzz0ftaoPcOeCWvHkluEdLqVGrPEEFIa/ecky
         8K5sswzEVCuEh21CK1iSDHPJsdbeGZfLTNl1nsaZjVJ6BFmk5RSd7mU/PJOd9BfstM2r
         J0IA==
X-Gm-Message-State: APjAAAXighchiGv7taN01I7Fr16eEzcEMhMvPeFcPq0hLJCpHS8pDXAx
        edLa6vx6vxl1IIOkZOQKgELMLgE/qYwvuA==
X-Google-Smtp-Source: APXvYqw8GKraNP8Rag076WD2Sn5z9pm39M9c98p2YLEe2JFAKkN+uaRqOz5Z2tKut0RAQZ6cwqsOjw==
X-Received: by 2002:a17:90a:2422:: with SMTP id h31mr18714406pje.100.1570808876356;
        Fri, 11 Oct 2019 08:47:56 -0700 (PDT)
Received: from sol.lan (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id v28sm13755404pgn.17.2019.10.11.08.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 08:47:55 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/5] gpio: expose pull-up/pull-down line flags to userspace
Date:   Fri, 11 Oct 2019 23:46:45 +0800
Message-Id: <20191011154650.1749-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds gross control of pull-up/pull-down to the GPIO uAPI.
Gross control means enabling and disabling of bias functionality,
not finer grained control such as setting biasing impedances.

The support allows both input and output lines to have any one of the
following biases applied as part of the line handle or event request:
 0. As Is - bias is left alone.  This is the default for ABI compatibility.
 1. Pull Up - pull-up bias is enabled.
 2. Pull Down - pull-down bias is enabled.
 3. Pull None - bias is explicitly disabled.

The biases are encoded in two flags, PULL_UP and PULL_DOWN, where
setting both is interpreted as Pull None. So the flags effectively form
a two bit field encoding the values above.

The setting of biases on output lines may seem odd, but is to allow for
utilisation of internal pull-up/pull-down on open drain and open source
outputs, where supported in hardware.

Patches are against:
  github.com/brgl/linux/commit/82fc38f6ab599ee03f7a8ed078de8abb41e6e611
which contains the initial patch from Drew Fustini, with Bartosz Golaszewski,
that adds support for pull-up/down flags in line handle requests.

Patch 1 adds support to line event requests.
Patch 2 adds pull-up/down support to the gpio-mockup for uAPI testing.
Patch 3 rejects biasing changes to lines requested as-is.
Patch 4 adds support for disabling bias (pull none).
Patch 5 adds support for setting bias on output lines.

Kent Gibson (5):
  gpiolib: add support for pull up/down to lineevent_create
  gpio: mockup: add set_config to support pull up/down
  gpiolib: pull requires explicit input mode
  gpiolib: disable bias on inputs when pull up/down are both set
  gpiolib: allow pull up/down on outputs

 drivers/gpio/gpio-mockup.c | 94 ++++++++++++++++++++++++--------------
 drivers/gpio/gpiolib.c     | 55 ++++++++++++++++------
 2 files changed, 100 insertions(+), 49 deletions(-)

-- 
2.23.0

