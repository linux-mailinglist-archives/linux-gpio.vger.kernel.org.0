Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00259DEFC2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 16:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfJUOgR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 10:36:17 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:33048 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfJUOgR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 10:36:17 -0400
Received: by mail-io1-f41.google.com with SMTP id z19so16234618ior.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 07:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=zpXAZuT7qy4Ryv1DIVUibkENDC+0ftiPqkaq0qDPxBE=;
        b=e7Kq5dwtN+/E9HkQDgzalSa5I6nuniEm1OAHu9H1sNTL/prTLCvPffCiN8XH8mIFDb
         Gm6MWD9XXFsW8meX1K6tLWVyaWjquV1fN9vqAa245ijrvD2b8r8zqsc7uZTc3IE9XRnm
         NxE4rgkIaD9aXtsN7uRBrFaC/tbZUMpRM0ufncsN5iYHd94S1F1C0e5NJ6dUulMaM5Q9
         9mIrr8bEDQjeDv3sikTuJKkFzPN7snDJQqdDE1FLq6K41t7vMhAzCDF0UuKtYhAl0Qnd
         br0DLEv1x0htqJtYhrjhXm+IfwIaFd4XlGNZTgFrJYB/Enqa+wo9U/dwsHVALE7ph8vQ
         faIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=zpXAZuT7qy4Ryv1DIVUibkENDC+0ftiPqkaq0qDPxBE=;
        b=bNg4v7zncB9MGEahk5DRVUFMDOHC92wJPl4mY+8ZsGhAXreEGV4VHb5eznukkvib1q
         Cz4DSKLKLEswfijOJaBOw8hjgucZEgNCuIM5kC4F4Wd4JTnwVl8U7/3fFTrT4rXLlOQ5
         AaZFRlBwdxwKnVlRgMiD3Ka9NUYWhmn+8dO0dnp42LmwoTk3F07M0ZmDFPdA5enD69JU
         QI8N/R7R3mEqMavTCW0LgaPoi5TtWDnbbOKPeUCmLD8xTFvoNEXChXZDiFR6eFNNt75X
         Eqpo9OMb3NMM1XSqzPBFXZM6oVaPN/UlekS8LDfo6I3sIldZTQDyzou8pWiZioxfnI7H
         RQMg==
X-Gm-Message-State: APjAAAVouDzt08iKPPRpgRZ/c9jZgbJ/0Nzh/MgEERpef7wOUrXhtCi8
        WpwF+EBHrJXz0lpdq6Lby7U7mgf8TlbLdfRFAOVO2eRrWtQ=
X-Google-Smtp-Source: APXvYqwkWjhpv1BcjUn8VrquqL5jz339/MJs3yzg9nyEDES+x53elBoyL8G90EcMlyJeG40Bl3gLxjLw7aIscxG1gaI=
X-Received: by 2002:a5d:8c81:: with SMTP id g1mr19638270ion.70.1571668574664;
 Mon, 21 Oct 2019 07:36:14 -0700 (PDT)
MIME-Version: 1.0
From:   rishi gupta <gupt21@gmail.com>
Date:   Mon, 21 Oct 2019 20:06:03 +0530
Message-ID: <CALUj-gt0iFqWO1wy4CYO_nV8X_fit7DFnZJxg-jc1n3C50MMsA@mail.gmail.com>
Subject: What should be the value of ngpio field for multiplexed GPIO Pins
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,
I am writing driver for USB Based device which has 4 pins which can be
configured for GPIO or alternate functions. 2 pins are configured for
GPIO while other 2 pins for alternate function. In this scenario, what
is correct approach 1 or 2 and why from linux gpio framework
perspective?

1. Register all 4 pins and return -ENODEV in request calback for pins
used for alternate function.
struct gpio_chip *gc;
gc.ngpio = 4;

2. Register only 2: gc.ngpio = 2;

Regards,
Rishi
