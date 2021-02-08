Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF813142D0
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhBHWYt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:24:49 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:42489 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhBHWYs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:24:48 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MeC1p-1ljgCS3lKB-00bN0A; Mon, 08 Feb 2021 23:22:12 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: RFC: oftree based setup of composite board devices
Date:   Mon,  8 Feb 2021 23:21:51 +0100
Message-Id: <20210208222203.22335-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:YGOCpHnsbsGtUlGB7/BvinIydpkYaAdvOutF/AgpVbrM2wKznfV
 U9iKqmh3uBYiyET8bTw6HuViAsU7a2/46bjPr583UuARsy9PdeUdE/sT1/hXHTvOhVBx+e4
 Ediemtnu34I2U7JliOiBL/xSD7AmBuQj0zBO68MWIyKd5F3lR3+Z/GMenVWYbnv0TCsu1g3
 DboH0WgcSg1no8w5B0HGA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hzv4C31OEQw=:Ly6KlmmdeRHiHk6PzwaLQ1
 qHHcmi+WM0fri6LCcuJ1STJoum22XN4zHwAM3dc9xgz+yrjWr/jmvtdc3E7X3x/qjNu3dSlJG
 8iwk+L+tlNUD7Xh2+q/lZ57HIJaI6XimTKr9bdvDJtEbTLmdJ2scGLwwIW7vmecVP0n08KQy0
 JQOl6dlUCLn4khIq7+kyq5eGCnwEY+wtfpMYRSaWBe7AzWEpoVHU/NWC66ooxG9Q6vkQj7kfl
 R5e0dqYCi2a6OHHIbRjrf1MVTFsuj96pG72GWlpymJCL8a8gMMhyhaKLGgKCPU93eG3HGSXiw
 0BSq354rjf2L+oUg5zoLXGPMC1Xb3e6a5/REGMnX8eQX0dHlJXCf45nWdlaA6vSkWD3PXSIcl
 3o6DtA8SS0KgakGNuvhEgdDUEwbZ4R9RzpB2OJC0IaZUAP6B3BcFi9610PPMl
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello folks,

here's an RFC for using compiled-in dtb's for initializing board devices
that can't be probed via bus'es or firmware.

Use cases are boards with non-oftree firmware (ACPI, etc) where certain
platform devices can't be directly enumerated via firmware. Traditionally
we had to write board specific drivers that check for board identification
(DMI strings, etc), then initialize the actual devices and their links
(eg. gpio<->leds/buttons, ...). Often this can be expressed just by DT.

This patch queue does a bunch of preparations in oftree code, so we can
support multiple fully independent DT's (not using DT overlays). And then
adds a generic driver parses compiled-in fdt blobs, checks for mathing
DMI strings and initializes the devices. As an example, the last patch
adds an alternative implementation for the PC engines APU2/3/4 board
family based on device tree.

The approach can be easily be extended to other kinds of composite devices,
eg. PCI cards or USB dongles.


Yet some drawbacks of the current implementation:

 * individual FDT's can't be modularized yet (IMHO, we don't have DMI-based
   modprobing anyways)
 * can't reconfigure or attach to devices outside the individual DT's
   (eg. probed by PCI, etc)


have fun,

--mtx

